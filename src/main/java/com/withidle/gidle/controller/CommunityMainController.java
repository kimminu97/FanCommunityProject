package com.withidle.gidle.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.withidle.gidle.HomeController;

@Controller
public class CommunityMainController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@GetMapping("announce")
	public String announcement() {
		return "community/announce";
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
