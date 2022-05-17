package com.withidle.gidle.mapper;

import java.util.Map;

import com.withidle.gidle.vo.Heart;

public interface HeartMapper {
	public void insert(Heart dto);
	public void delete(Heart dto);
	public int selectNum(Map<String, Integer> map);
	public int checkLike(Map<String, Object> map);
	public void likeCntDown(Map<String, Integer> map);
	public void likeCntUp(Map<String, Integer> map);
	public String idCheck(String user_name);
}