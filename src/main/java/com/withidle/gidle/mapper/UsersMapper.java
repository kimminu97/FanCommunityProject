package com.withidle.gidle.mapper;

import java.util.Map;

import com.withidle.gidle.vo.Users;

public interface UsersMapper {
	Users login(Map<String, String> map);
}
