package com.withidle.gidle.mapper;

import java.util.List;
import java.util.Map;

import com.withidle.gidle.vo.Admin;
import com.withidle.gidle.vo.Users;

public interface UsersMapper {
	
	void addUsers(Users users);
	int updateUsers(Users users);
	Users login(Map<String, String> map);
	int idcheck(String user_id);
	int namecheck(String user_name);
	List<Users> selectAll();		//회원목록
	void update(Users users);		//회원정보수정
	void allupdate(Users user_id);	//관리자 정보수정
	String checkid(String user_id);
	void delete(String user_id);
	void boardCountUp(String user_name);
	void cmtCountUp(String user_name);
	void boardCountDown(String user_name);
	void cmtCountDown(String user_name);
	Users selectByUserid(String user_id);
	Admin adminlogin(Map<String, String> map);
	void board_name_update(Users users);
	void comment_name_update(Users users);
}