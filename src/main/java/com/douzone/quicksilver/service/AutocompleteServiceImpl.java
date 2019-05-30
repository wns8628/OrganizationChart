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

import com.douzone.quicksilver.interfaces.AutocompleteKeyRepository;
import com.douzone.quicksilver.interfaces.AutocompleteRepository;
import com.douzone.quicksilver.vo.AutocompleteVo;

@Service
public class AutocompleteServiceImpl implements AutocompleteRepository {

	private final double min = 0;
	private final double max = 1000000;
	private final int offset = 10;

	private StringRedisTemplate stringRedisTemplate;
	
	private AutocompleteKeyRepository keyRepository;


	 public AutocompleteServiceImpl(StringRedisTemplate stringRedisTemplate, AutocompleteKeyRepository keyRepository) { 
		 this.stringRedisTemplate = stringRedisTemplate; 
		 this.keyRepository = keyRepository; 
	 }
	 

	@Override
	public List<AutocompleteVo> complete(String word, boolean enter) {
		return complete(word, min, max, offset, enter);
	}

	@Override
	public List<AutocompleteVo> complete(String word, double min, double max, int offset, boolean enter) {
		Assert.hasLength(word, "Word cannot be empty or null");
	
		String trimedWord = word.trim();
		int trimedWordLength = trimedWord.length();

		String key = keyRepository.getKey(trimedWord);
		
		
		//엔터쳤을때만 키워드 score가 올라가고 레디스에 키워드가 저장된다.
		if(enter) {
			add(trimedWord);
			incr(trimedWord);			
		}
		
		List<AutocompleteVo> autocompletes = new ArrayList<>();
		for (int i = trimedWordLength; i < (offset+10); i++) {
			System.out.println("trimedWordLength:" + trimedWordLength);
			if (autocompletes.size() == offset) break;

			System.out.println("key: " + key + i);
			Set<TypedTuple<String>> rangeResultsWithScore = stringRedisTemplate
					.opsForZSet()
					.reverseRangeByScoreWithScores(key + i, min, max, 0, 100000);
			if (rangeResultsWithScore.isEmpty()) continue;

			for (TypedTuple<String> typedTuple : rangeResultsWithScore) {
				if (autocompletes.size() == offset) break;

				String value = typedTuple.getValue();
				int minLength = Math.min(value.length(), trimedWordLength);
				if (!value.endsWith(DEFAULT_DELIMITER) || !value.startsWith(trimedWord.substring(0, minLength))) continue;
				autocompletes.add(new AutocompleteVo(value.replace(DEFAULT_DELIMITER, ""), typedTuple.getScore().intValue()));
			}
		}
		Collections.sort(autocompletes);
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
