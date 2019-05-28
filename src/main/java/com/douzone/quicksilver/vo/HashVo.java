package com.douzone.quicksilver.vo;

import org.springframework.data.redis.core.ZSetOperations.TypedTuple;

public class HashVo {

	private String value;
	private long score;
	
	public HashVo(String value, long score) {
		this.value = value;
		this.score = score;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public long getScore() {
		return score;
	}

	public void setScore(long score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "HashVo [value=" + value + ", score=" + score + "]";
	}
	
	
	
}
