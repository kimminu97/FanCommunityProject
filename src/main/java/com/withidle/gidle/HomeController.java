package com.withidle.gidle;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.withidle.gidle.mapper.UsersMapper;
import com.withidle.gidle.vo.Admin;
import com.withidle.gidle.vo.Users;

@Controller
@SessionAttributes({"users","admin"})	//Model 저장소에 저장된 애트리뷰트 중에 member는 세션 scope 값이라는 설정
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired(required = true)
	UsersMapper mapper;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, String success) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("success",success);
		
		return "home";
	}
	
	
	
	
	@GetMapping("profile")
	public void profile() {
		
	}
	@GetMapping("albumList")
	public void albumList() {
	}
	
	@GetMapping("home")
	public void home() {
	}
	
	@GetMapping("/login.do")
	public String login(@ModelAttribute("success") String success) { 
		
		return "login";	
	}
	
	@PostMapping("adminlogin.do")
	public String AdminloginProc(@RequestParam  Map<String,String> map, Model model) {
		logger.info("[my]"+map);
		Admin admin= mapper.adminlogin(map);	//로그인 성공하면 null 아닌값 반환
		String url;
		if(admin !=null) {
			//성공 : 메인 화면으로, session 객체에 로그인 정보를 저장했습니다.(세션 애트리뷰트로 저장)
			model.addAttribute("admin",admin);	//@SessionAttributes로 설정하기
			url = "/?success=y";	//로그인 성공메시지 alert띄우기
		}else {	//실패 : 다시 로그인 하러가기. ((미션))alert 메시지 띄우기 "로그인 정보가 옳바르지 않습니다."
			url="adminlogin.do?success=n";
			//요청방식이 post일대만 RedirectAttributes 객체에 url에 표시되지 않도록 파라미터
			//값을 전달할 수 있습니다 -> 여기서는 사용을 못합니다.
		}
		return "redirect:"+url;
	}
	@GetMapping("/adminlogin.do")
	public String adminlogin(@ModelAttribute("success") String success) { 
		
		return "adminlogin";	
	}
	
	@PostMapping("login.do")
	public String loginProc(@RequestParam  Map<String,String> map, Model model) {
		logger.info("[my]"+map);
		Users users= mapper.login(map);	//로그인 성공하면 null 아닌값 반환
		String url;
		if(users !=null) {
			//성공 : 메인 화면으로, session 객체에 로그인 정보를 저장했습니다.(세션 애트리뷰트로 저장)
			model.addAttribute("users",users);	//@SessionAttributes로 설정하기
			url = "/?success=y";	//로그인 성공메시지 alert띄우기
		}else {	//실패 : 다시 로그인 하러가기. ((미션))alert 메시지 띄우기 "로그인 정보가 옳바르지 않습니다."
			url="login.do?success=n";
			//요청방식이 post일대만 RedirectAttributes 객체에 url에 표시되지 않도록 파라미터
			//값을 전달할 수 있습니다 -> 여기서는 사용을 못합니다.
		}
		return "redirect:"+url;
	}
	
	@GetMapping("/logout.do")
	public String logout(SessionStatus status) {	//현재세션상태 객체
		status.setComplete();	// @SessionAttributes 로 설정된 애트리뷰트 값을 clear 한다.
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout2(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		//서버가 JSESSIONID는 새로 부여해주지만 @SessionAttributes로 설정된 값은 남아있다.
		return "redirect:/";
	}
	@GetMapping("/join.do")
	public String join() {
		return "signup";
	}
	
	@PostMapping("/join.do")
	public String insert(Users users) { 
		logger.info("[My]"+users);
		mapper.addUsers(users);
		return "redirect:/";
	}  //회원가입 
	
	@ResponseBody
	@RequestMapping(value="/asyncUser_id/{user_id}",method=RequestMethod.GET
			,produces = "application/json;charset=utf-8")
	public String getOne(@PathVariable String user_id) {
		int cnt = mapper.idcheck(user_id); 
		
		Map<String,Object> map = new HashMap<>();
		map.put("cnt",cnt);
		ObjectMapper objmapper = new ObjectMapper();
		String json_result=null;
		try {
			json_result = objmapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return json_result;
	}
	
	@ResponseBody
	@RequestMapping(value="/asyncUser_name/{user_name}",method=RequestMethod.GET
			,produces = "application/json;charset=utf-8")
	public String getOne1(@PathVariable String user_name) {
		int cnt = mapper.namecheck(user_name); 
		
		Map<String,Object> map = new HashMap<>();
		map.put("cnt",cnt);
		ObjectMapper objmapper = new ObjectMapper();
		String json_result=null;
		try {
			json_result = objmapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		return json_result;
	}
 
	
}
