package com.withidle.gidle.mapper;

import java.util.List;
import java.util.Map;

import com.withidle.gidle.vo.Comment;

public interface CommentMapper {
	public void insert(Comment dto);
	public List<Comment> list(Map<String, Integer> map);
	public void commentCountUp(int idx);
	public void delete(int idx);
	public void commentCountDown(int idx);
	public void updateCmtCount(int idx);
}
