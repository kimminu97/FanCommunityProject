package com.withidle.gidle.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.withidle.gidle.mapper.BoardMapper;
import com.withidle.gidle.mapper.CommentMapper;
import com.withidle.gidle.mapper.HeartMapper;
import com.withidle.gidle.mapper.UsersMapper;
import com.withidle.gidle.vo.Board;
import com.withidle.gidle.vo.Comment;
import com.withidle.gidle.vo.Heart;
import com.withidle.gidle.vo.PageDto;
import com.withidle.gidle.vo.Users;

@Controller
@RequestMapping("/community")
public class CommunityController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	UsersMapper user_mapper;

	@Autowired
	BoardMapper mapper;

	@Autowired
	CommentMapper cmt_mapper;

	@Autowired
	HeartMapper hrt_mapper;

	@RequestMapping(value = "list")
	public String list(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model,
			@RequestParam(required = true) int action) {
		int board_cat = action;
		PageDto page = new PageDto(pageNo, 10, mapper.getCount(board_cat));
		model.addAttribute("board_cat", action);
		logger.info("board_cat:", board_cat);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		map.put("board_cat", board_cat);
		logger.info("map:", map);
		List<Board> list = mapper.getPageList(map);
		logger.info("map:", map);
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		// 저건 SQL 오류

		if (map.get("board_cat") == 1) {
			return "community/list";
		} else if (map.get("board_cat") == 2) {
			return "community/list2";
		} else if (map.get("board_cat") == 3) {
			return "community/list3";
		} else if (map.get("board_cat") == 4) {
			return "community/list4";
		} else {
			// 에러메세지 출력?
			return "redirect:community";
		}
//		return "community/list2";	//pageNo 를 form data로 전달하는 예시
	}

	@GetMapping("community")
	public void community() {

	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(int pageNo, Model model, @RequestParam(required = true) int action) {
		model.addAttribute("board_cat", action);
		model.addAttribute("page", pageNo);
		return "community/insert";
	}

	@PostMapping("/insert")
	public String save(Board dto, RedirectAttributes rda) {
		if (dto.getBoard_cat() == 1)
			mapper.insert(dto);
		else if (dto.getBoard_cat() == 2)
			mapper.insert2(dto);
		else if (dto.getBoard_cat() == 3)
			mapper.insert3(dto);
		else
			mapper.insert4(dto);

		rda.addFlashAttribute("message", "글 쓰기가 완료되었습니다.");
		// ->list.jsp로 바로 전달 됩니다. 특징: url에 표시되지 않습니다.(model은 보임)
		user_mapper.boardCountUp(dto.getBoard_name());
		return "redirect:list?action=" + dto.getBoard_cat(); // 1페이지로 이동
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(int board_idx, int pageNo, Model model, @RequestParam(required = true) int action,
			String userId, HttpServletRequest request) {
		logger.info("idx:{}", board_idx);
		int board_cat = action;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_idx", board_idx);
		map.put("board_cat", board_cat);
		// 조회수 증가 먼저
		mapper.readCount(map);
		Board dto = mapper.getOne(map);
		model.addAttribute("page", pageNo);
		model.addAttribute("bean", dto);
		model.addAttribute("board_cat", board_cat);
		logger.info("bean:", dto.toString());
		// 댓글 목록을 detail.jsp에 출력해야합니다.
		map.put("comment_board", board_idx);
		map.put("comment_boardcat", board_cat);
		logger.info(map.toString());
		List<Comment> cmtlist = cmt_mapper.list(map);
		model.addAttribute("cmtlist", cmtlist);

		// 좋아요 개수 확인
		int heart_num = hrt_mapper.selectNum(map);
		model.addAttribute("heart_num", heart_num);

		// 회원이 게시물에 좋아요 했는지 확인
		Map<String, Object> hrtMap = new HashMap<>();
		hrtMap.put("heart_memid", "'" + userId + "'");
		hrtMap.put("heart_boardid", board_idx);
		hrtMap.put("heart_boardcat", action);

		int checkHrt = hrt_mapper.checkLike(hrtMap);
		model.addAttribute("checkHrt", checkHrt);
		logger.info("[hrt]" + hrtMap);
		logger.info("hrtcheck: " + Integer.toString(checkHrt));

		/*
		 * Heart hrtDto = new Heart(id, board_idx, board_cat); int checkLike =
		 * hrt_mapper.checkLike(hrtDto); model.addAttribute("checkLike", checkLike);
		 */

		return "community/detail";
	}

	@PostMapping("update") // 글수정 처리 -> 완료 alert
//	public String update(Freeboard vo,int pageNo, Model model) {
	public String update(Board vo, int pageNo, RedirectAttributes rda) {
		logger.info("vo:", vo);
		mapper.update(vo);
//		model.addAttribute("idx",vo.getIdx());
//		model.addAttribute("pageNo",pageNo);
		rda.addAttribute("board_idx", vo.getBoard_idx());
		rda.addAttribute("pageNo", pageNo);
//		model.addAttribute("message","글수정 완료되었습니다.");
//		->대신에 사용하는 RedirectAttributes addFlashAttribute()메소드로 값을 저장
		rda.addFlashAttribute("message", "글수정 완료되었습니다.");
		return "redirect:detail?action=" + vo.getBoard_cat();
		// -> rda 애트리뷰트는 리다이렉트 url의 view(detail.jsp)까지 바로 전달
		// 중요: RedirectAttributes는 model과는 충동합니다.
		// @postMapping이고 redirect 할때만 사용합니다.
	}

//	@GetMapping("delete")	//글 삭제 처리 -> 완료 alert
	@PostMapping("delete")
//	public String deleteFreeboard(int idx,int pageNo,Model model) {
	public String deleteFreeboard(int idx, int board_cat, int pageNo, String user_name, RedirectAttributes rda) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_idx", idx);
		map.put("board_cat", board_cat);
		mapper.delete(map);
//		model.addAttribute("pageNo",pageNo);
		user_mapper.boardCountDown(user_name);
		rda.addAttribute("pageNo", pageNo);
		rda.addFlashAttribute("message", "글이 삭제 되었습니다.");
		return "redirect:list?action=" + board_cat;
	}

	// 여기서부터는 댓글 처리
	@Transactional
	@PostMapping("comment")
	public String comment_save(Comment dto, int pageNo, Model model) {
		// 댓글 입력요소 값들 db에 저장 -> detail(글 상세보기)
		cmt_mapper.insert(dto);
		cmt_mapper.commentCountUp(dto.getComment_board());
		user_mapper.cmtCountUp(dto.getComment_mname());
		model.addAttribute("board_idx", dto.getComment_board());
		model.addAttribute("pageNo", pageNo);
		return "redirect:detail?action=" + dto.getComment_boardcat();
	}

	@Transactional
	@GetMapping("comment") // idx: 댓글 , mref: 메인글 idx
	public String delete(int idx, int pageNo, int mref, int action, String user_name, Model model) {
		cmt_mapper.delete(idx);
		cmt_mapper.commentCountDown(mref);
		user_mapper.cmtCountDown(user_name);
		model.addAttribute("board_idx", mref);
		model.addAttribute("pageNo", pageNo);
		return "redirect:detail?action=" + action;
	}

	@GetMapping("/list.do")
	public String list(Model model) {
		List<Users> list = user_mapper.selectAll();
		model.addAttribute("list", list);
		return "admin/adminlist";
	}

	// 회원이 하는 회원정보수정
	@GetMapping("update.do")
	public String update() {
		return "update";
	}

	@GetMapping("/adminupdate.do")
	public String adminupdate(String user_id, Model model) {
		Users u = user_mapper.selectByUserid(user_id);
		model.addAttribute("users", u);
		return "admin/adminupdate";
	}

	// 관리자가 하는 회원정보수정
	@Transactional
	@PostMapping("/adminsave.do")
	public void allupdate(Users users, Model model, HttpServletResponse response) throws IOException {
		user_mapper.allupdate(users);
		user_mapper.board_name_update(users);
		user_mapper.comment_name_update(users);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String url = "list.do";
		String message = "회원정보 수정되었습니다.";
		out.print("<script>alert('" + message + "');location.href='" + url + "'");
		out.print("</script>");
	}

	@Transactional
	@PostMapping("/save.do")
	public void update(Users users, Model model, HttpServletResponse response) throws IOException {
		user_mapper.board_name_update(users);
		user_mapper.update(users);
		user_mapper.comment_name_update(users);

		model.addAttribute("users", users);
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String url = "home";
		String message = "회원정보 수정되었습니다.";
		out.print("<script>alert('" + message + "');location.href='" + url + "'");
		out.print("</script>");
	}

	@GetMapping("/delete.do")
	public void delete(String user_id, Users users, HttpServletResponse response) throws IOException {
		String message;
		if (users != null) {
			message = "삭제 완료되었습니다.";
			user_mapper.delete(user_id);
		} else {
			message = "삭제 오류입니다.";
		}

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String url = "./list.do";
		out.print("<script>alert('" + message + "');location.href='" + url + "'");
		out.print("</script>");
	}

	@PostMapping("heart")
	public String hrtInsert(Heart dto, int checkHrt, int pageNo, HttpServletRequest request) {

		Map<String, Integer> likecnt = new HashMap<>();
		likecnt.put("board_idx", dto.getHeart_boardid());
		likecnt.put("board_cat", dto.getHeart_boardcat());
		HttpSession session = request.getSession();
        Users userVO = (Users)session.getAttribute("users");
        logger.info("user: " + userVO.toString());
        
		hrt_mapper.insert(dto);
		hrt_mapper.likeCntUp(likecnt);
		return "redirect:detail?board_idx=" + dto.getHeart_boardid() + "&pageNo=" + pageNo + "&action="
				+ dto.getHeart_boardcat() + "&userId=" + userVO.getUser_id();

	}

	@PostMapping("removehrt")
	public String removehrt(Heart dto, int checkHrt, int pageNo, HttpServletRequest request) {
		Map<String, Integer> likecnt = new HashMap<>();
		likecnt.put("board_idx", dto.getHeart_boardid());
		likecnt.put("board_cat", dto.getHeart_boardcat());
		HttpSession session = request.getSession();
        Users userVO = (Users)session.getAttribute("users");
        
		hrt_mapper.delete(dto);
		hrt_mapper.likeCntDown(likecnt);
		logger.info("id:" + dto.getHeart_memid());
		return "redirect:detail?board_idx=" + dto.getHeart_boardid() + "&pageNo=" + pageNo + "&action="
				+ dto.getHeart_boardcat()  + "&userId=" + userVO.getUser_id();
	}

	
	@GetMapping("announce")
	public void announcement() {
	}

	@GetMapping("letter")
	public void letter() {
	}

	@GetMapping("levelrequest")
	public void levelrequest() {
	}

	@GetMapping("home")
	public String home() {
		return "redirect:../";
	}

	@GetMapping("profile")
	public String profile() {
		return "redirect:../profile";
	}

	@GetMapping("album")
	public String album() {
		return "redirect:../album";
	}
}
