package com.douzone.quicksilver.service;

import java.util.ArrayList;  
import java.util.Collections;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ZSetOperations.TypedTuple;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.douzone.quicksilver.repository.AutocompleteKeyRepository;
import com.douzone.quicksilver.repository.AutocompleteRepository;
import com.douzone.quicksilver.vo.AutocompleteData;

@Service
public class AutocompleteServiceImpl implements AutocompleteRepository {

	private final double min = 0;
	private final double max = 5;
	private final int offset = 30;

	private StringRedisTemplate stringRedisTemplate;
	
	private AutocompleteKeyRepository keyRepository;


	 public AutocompleteServiceImpl(StringRedisTemplate stringRedisTemplate, AutocompleteKeyRepository keyRepository) { 
		 this.stringRedisTemplate = stringRedisTemplate; 
		 this.keyRepository = keyRepository; 
	 }
	 

	@Override
	public List<AutocompleteData> complete(String word) {
		return complete(word, min, max, offset);
	}

	@Override
	public List<AutocompleteData> complete(String word, double min, double max, int offset) {
		Assert.hasLength(word, "Word cannot be empty or null");

		String trimedWord = word.trim();
		int trimedWordLength = trimedWord.length();

		String key = keyRepository.getKey(trimedWord);
		
	
		add(trimedWord);
		incr(trimedWord);
		
		
		List<AutocompleteData> autocompletes = new ArrayList<>();
		for (int i = trimedWordLength; i < offset; i++) {
			if (autocompletes.size() == offset) break;

			Set<TypedTuple<String>> rangeResultsWithScore = stringRedisTemplate
					.opsForZSet()
					.reverseRangeByScoreWithScores(key + i, min, max, 0, offset);
			if (rangeResultsWithScore.isEmpty()) continue;

			for (TypedTuple<String> typedTuple : rangeResultsWithScore) {
				if (autocompletes.size() == offset) break;

				String value = typedTuple.getValue();
				int minLength = Math.min(value.length(), trimedWordLength);
				if (!value.endsWith(DEFAULT_DELIMITER) || !value.startsWith(trimedWord.substring(0, minLength))) continue;
				autocompletes.add(new AutocompleteData(value.replace(DEFAULT_DELIMITER, ""), typedTuple.getScore().intValue()));
			}
		}
		Collections.sort(autocompletes);
		for(int i = 0; i < autocompletes.size(); i++)
			System.out.println(autocompletes.get(i).getValue());
		return autocompletes;
	}

	@Override
	public void add(String word) {
		keyRepository.create(word, DEFAULT_DELIMITER);
	}

	@Override
	public double incr(String word) {
		return keyRepository.incr(word, DEFAULT_DELIMITER);
	}

	@Override
	public void clear(String key) {
		stringRedisTemplate.delete(key);
	}

}
