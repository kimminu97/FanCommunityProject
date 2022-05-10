package com.withidle.gidle.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.withidle.gidle.mapper.AdminMapper;


@Controller
@SessionAttributes("users")	//Model 저장소에 저장된 애트리뷰트 중에 member는 세션 scope 값이라는 설정
public class adminController {
	
	@Autowired
	AdminMapper mapper;
}
