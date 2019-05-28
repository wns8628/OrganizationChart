package com.douzone.config.app;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.StringRedisTemplate;

import com.douzone.quicksilver.repository.AutocompleteKeyRepository;
import com.douzone.quicksilver.repository.AutocompleteRepository;
import com.douzone.quicksilver.service.AutocompleteKeyServiceImpl;
import com.douzone.quicksilver.service.AutocompleteServiceImpl;


@Configuration
public class AutocompleteConfig {

	@Autowired
	private StringRedisTemplate stringRedisTemplate;

	@Bean(name = {"autocompleteKeyRepository", "keyRepository"})
	public AutocompleteKeyRepository keyRepository() {
		// auto-complete custom key implements for test
		AutocompleteKeyRepository keyRepository = new AutocompleteKeyServiceImpl(stringRedisTemplate);
		return keyRepository;
	}

	@Bean(name = {"autocompleteRepository"})
	public AutocompleteRepository autocompleteRepository(AutocompleteKeyRepository autocompleteKeyRepository) {
		AutocompleteRepository autocompleteRepository = new AutocompleteServiceImpl(stringRedisTemplate, autocompleteKeyRepository);
		return autocompleteRepository;
	}

}
