package com.withidle.gidle.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityMainController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@GetMapping("announcement")
	public String announcement() {
		return "community/announcement";
	}
	
	@GetMapping("freeboard")
	public String freeboard() {
		return "community/freeboard";
	}
	
	@GetMapping("letter")
	public String letter() {
		return "community/letter";
	}
	
	@GetMapping("levelrequest")
	public String levelrequest() {
		return "community/levelrequest";
	}
}
