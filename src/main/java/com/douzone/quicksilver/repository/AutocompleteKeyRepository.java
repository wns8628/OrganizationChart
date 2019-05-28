package com.douzone.quicksilver.repository;

import org.springframework.stereotype.Repository;

@Repository
public interface AutocompleteKeyRepository {

	String create(String word, String identifier);

	double incr(String word, String identifier);

	String getKey(String firstLetter);

}
