package com.douzone.quicksilver.interfaces;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.douzone.quicksilver.vo.AutocompleteVo; 

@Repository
public interface AutocompleteRepository {

	String DEFAULT_DELIMITER = "§";

	List<AutocompleteVo> complete(final String word, boolean enter);

	List<AutocompleteVo> complete(final String word, final double min, final double max, final int offset, boolean enter);

	void add(final String word);

	double incr(final String word);

	void clear(final String key);

}
