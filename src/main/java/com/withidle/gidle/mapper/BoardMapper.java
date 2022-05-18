package com.withidle.gidle.mapper;

import java.util.List;
import java.util.Map;

import com.withidle.gidle.vo.Board;

public interface BoardMapper {
	List<Board> getPageList(Map<String, Integer> map);
	int getCount(int board_cat);
	void insert(Board dto);
	void insert2(Board dto);
	void insert3(Board dto);
	void insert4(Board dto);
	void update(Board dto);
	Board getOne(Map<String, Integer> map);
	void readCount(Map<String, Integer> map);
	void delete(Map<String, Integer> map);
	List<Board> getThree1(int board_cat);
	List<Board> getByTitle(Map<String, Object> map);
	List<Board> getByWriter(Map<String, Object> map);
	int getNumByTitle(Map<String, Object> map);
	int getNumByWriter(Map<String, Object> map);
}