package com.douzone.config.app;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.jedis.JedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

@Configuration
public class RedisConfig {

 @Bean
 public JedisConnectionFactory jedisConnectionFactory() {
  
  JedisConnectionFactory jedisConnectionFactory = new JedisConnectionFactory();
  
  jedisConnectionFactory.setHostName("218.39.221.97");
  jedisConnectionFactory.setPort(6379);
  jedisConnectionFactory.setTimeout(0);
  jedisConnectionFactory.setUsePool(true);
  
  return jedisConnectionFactory;
 }

 @Bean
 public StringRedisTemplate redisTemplate() {
	StringRedisTemplate redisTemplate = new StringRedisTemplate();
	redisTemplate.setConnectionFactory(jedisConnectionFactory());
	redisTemplate.setKeySerializer(new StringRedisSerializer());
	redisTemplate.setValueSerializer(new StringRedisSerializer());
	return redisTemplate;
 }
 
}
