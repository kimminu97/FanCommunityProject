

import java.lang.ProcessBuilder.Redirect;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	@GetMapping("/join.do")
	public String join() {
		return "signup";
	}
	
	@PostMapping("/join.do")
	public String insert(Users users) { 
		logger.info("[My]"+users);
		mapper.addUsers(users);
		return "redirect:/";
	}  //ȸ������ 
	
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
