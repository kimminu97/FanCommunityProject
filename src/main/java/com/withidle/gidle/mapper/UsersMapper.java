package com.withidle.gidle.mapper;

import java.util.List;
import java.util.Map;

import com.withidle.gidle.vo.Admin;
import com.withidle.gidle.vo.Users;

public interface UsersMapper {
	void addUsers(Users users);
	int updateUsers(Users users);
	Users login(Map<String, String> map);
	Admin adminlogin(Map<String, String> map);
	int idcheck(String user_id);
	int namecheck(String user_name);
	List<Users> selectAll();
	void update(Users users);
	void allupdate(Users user_id);
	String checkid(String user_id);
	void delete(String user_id);
	void boardCountUp(String user_name);
	void cmtCountUp(String user_name);
	void boardCountDown(String user_name);
	void cmtCountDown(String user_name);
	Users selectByUserid(String user_id);
	void board_name_update(Users users);
	void comment_name_update(Users users);
	
}
