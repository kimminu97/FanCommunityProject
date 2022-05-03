package com.withidle.gidle.mapper;

import java.util.Map;

import com.withidle.gidle.vo.Users;

public interface UsersMapper {
	
	void addUsers(Users users);
	int updateUsers(Users users);
	Users login(Map<String, String> map);
	int idcheck(String user_id);
	int namecheck(String user_name);
}