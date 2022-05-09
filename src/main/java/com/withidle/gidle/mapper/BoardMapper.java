package com.withidle.gidle.mapper;

import java.util.List;
import java.util.Map;

import com.withidle.gidle.vo.Board;

public interface BoardMapper {
	List<Board> getPageList(Map<String, Integer> map);
	int getCount(int board_cat);
	void insert(Board dto);
	void insert2(Board dto);
	void update(Board dto);
	Board getOne(Map<String, Integer> map);
	void readCount(Map<String, Integer> map);
	void delete(Map<String, Integer> map);
}
