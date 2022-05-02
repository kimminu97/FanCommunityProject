package com.withidle.gidle;

import java.lang.ProcessBuilder.Redirect;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.withidle.gidle.mapper.UsersMapper;
import com.withidle.gidle.vo.Users;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("users")	//Model ����ҿ� ����� ��Ʈ����Ʈ �߿� member�� ���� scope ���̶�� ����
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
	
	@PostMapping("login.do")
	public String loginProc(@RequestParam  Map<String,String> map, Model model) {
		logger.info("[my]"+map);
		Users users= mapper.login(map);	//�α��� �����ϸ� null �ƴѰ� ��ȯ
		String url;
		if(users !=null) {
			//���� : ���� ȭ������, session ��ü�� �α��� ������ �����߽��ϴ�.(���� ��Ʈ����Ʈ�� ����)
			model.addAttribute("users",users);	//@SessionAttributes�� �����ϱ�
			url = "/?success=y";	//�α��� �����޽��� alert����
		}else {	//���� : �ٽ� �α��� �Ϸ�����. ((�̼�))alert �޽��� ���� "�α��� ������ �ǹٸ��� �ʽ��ϴ�."
			url="login.do?success=n";
			//��û����� post�ϴ븸 RedirectAttributes ��ü�� url�� ǥ�õ��� �ʵ��� �Ķ����
			//���� ������ �� �ֽ��ϴ� -> ���⼭�� ����� ���մϴ�.
		}
		return "redirect:"+url;
	}
	
	@GetMapping("/logout.do")
	public String logout(SessionStatus status) {	//���缼�ǻ��� ��ü
		status.setComplete();	// @SessionAttributes �� ������ ��Ʈ����Ʈ ���� clear �Ѵ�.
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout2(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		//������ JSESSIONID�� ���� �ο��������� @SessionAttributes�� ������ ���� �����ִ�.
		return "redirect:/";
	}
//@SessionAttributes�� �����Ȱ��� SessionStatus �� �����.	
//status.setComplete();   
//	- JSESSIONID �� ������ �ʰ� @SessionAttributes �� ������ ��Ʈ����Ʈ ���� clear �Ѵ�.
//  - HttpSession�� removeAttribute() �޼ҵ� ���۰� ����

//jsp���� �α׾ƿ� : session.invalidate();	- JSESSIONID���� ���ο� ������ �մϴ�.
//				session.removeAttribute("member");	- JSESSIONID�� �������ʰ� �� ����
	
}
