package com.douzone.quicksilver.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.core.ZSetOperations.TypedTuple;
import org.springframework.stereotype.Service;

import com.douzone.config.app.RedisConfig;
import com.douzone.quicksilver.vo.RedisVo;

@Service
public class RedisService<rangeResultsWithScore> {

	//예제 
	public void exam() {
		ConfigurableApplicationContext ctx = new AnnotationConfigApplicationContext(RedisConfig.class);
		try {
			@SuppressWarnings("unchecked")
			RedisTemplate<String, Object> redisTemplate = (RedisTemplate<String, Object>)ctx.getBean("redisTemplate");
			// value operation
			ValueOperations<String, Object> values = redisTemplate.opsForValue();
			
			redisTemplate.opsForZSet().add("77", "fucking redis sibal",0);
			
			// set
			values.set("victolee", new RedisVo("01", 1));
			
			// get
			System.out.println("Employee added : " + values.get("victolee"));
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			ctx.close();
		}
		
	}
	

	
	
	public static final String AUTO_COMPLETE_NAMESPACE = "testRedis";

	//단어자르기
	public void addWord(final String word) {
		ConfigurableApplicationContext ctx = new AnnotationConfigApplicationContext(RedisConfig.class);
		
		@SuppressWarnings("unchecked")
		RedisTemplate<String, Object> redisTemplate = (RedisTemplate<String, Object>)ctx.getBean("redisTemplate");
		
		redisTemplate.opsForZSet().add(AUTO_COMPLETE_NAMESPACE, word + "*", 0);
		for (int index = 1; index < word.length(); index++) {
			redisTemplate.opsForZSet().add(AUTO_COMPLETE_NAMESPACE, word.substring(0, index - 1), 0);
		}
	}

	//json가져와서 보내기
	public List complete(final String prefix, final int count) {
		
		ConfigurableApplicationContext ctx = new AnnotationConfigApplicationContext(RedisConfig.class);
		@SuppressWarnings("unchecked")
		RedisTemplate<String, Object> redisTemplate = (RedisTemplate<String, Object>)ctx.getBean("redisTemplate");
		
		
		List<RedisVo> results = new ArrayList();
		
		int prefixLength = prefix.length();
		if (null == prefix || prefixLength == 0) return results;
		
		long start = redisTemplate.opsForZSet().rank(AUTO_COMPLETE_NAMESPACE, prefix);
		if (start < 0) return results;
		

		Set<TypedTuple<Object>> rangeResultsWithScore = redisTemplate.opsForZSet().rangeWithScores(AUTO_COMPLETE_NAMESPACE, start, -1);
		if (rangeResultsWithScore.isEmpty()) return results;

		for (TypedTuple typedTuple : rangeResultsWithScore) {
			
			  Object value = typedTuple.getValue();	
			
			System.out.println(value);
			int minLength = Math.min(((String) value).length(), prefixLength);
			System.out.println("minLength:"+minLength);
			System.out.println("prefixLength:"+prefixLength);
			System.out.println("((String) value).endsWith(\"*\")" + ((String) value).endsWith("*"));
			if (((String) value).endsWith("*") && ((String) value).startsWith(prefix.substring(0, minLength))) {
				results.add(new RedisVo(((String) value).replace("*", ""), typedTuple.getScore().intValue()));
				System.out.println(results.toString());
				System.out.println("오잉?");
				
			} 
		}
		return results;
	}
	
}
