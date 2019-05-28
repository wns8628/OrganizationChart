package com.douzone.quicksilver.vo;

public class RedisVo {
	
	private String value;
	private Integer score;
	
	public RedisVo(String value, Integer score) {
		this.value = value;
		this.score = score;
	}

	public String getValue() {
		return value;
	}

	public Integer getScore() {
		return score;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "RedisVo [value=" + value + ", score=" + score + "]";
	}



}
