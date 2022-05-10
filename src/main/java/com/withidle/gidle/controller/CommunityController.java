package com.withidle.gidle.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.withidle.gidle.mapper.UsersMapper;
import com.withidle.gidle.vo.Board;
import com.withidle.gidle.vo.Comment;
import com.withidle.gidle.vo.PageDto;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/community")
public class CommunityController {
	private static final Logger logger =
			LoggerFactory.getLogger(CommunityController.class);
	@Autowired
	UsersMapper user_mapper;
	
	@Autowired
	BoardMapper mapper;
	
	@Autowired
	CommentMapper cmt_mapper;
	
	@RequestMapping(value = "list",params = "action=1")
	public String list(@RequestParam(required=false , defaultValue="1") int pageNo,Model model) {  
		int board_cat=1;
		PageDto page = new PageDto(pageNo, 10, mapper.getCount());
		model.addAttribute("board_cat", 1);
		logger.info("board_cat:",board_cat);
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNo", page.getStartNo());
		map.put("endNo", page.getEndNo());
		map.put("board_cat", board_cat);
		logger.info("map:",map);
		List<Board> list = mapper.getPageList(map);
		logger.info("map:",map);
		model.addAttribute("page",page);
		model.addAttribute("list",list);
		//저건 SQL 오류 

		return "community/list";
//		return "community/list2";	//pageNo 를 form data로 전달하는 예시
	}
	
	@GetMapping("community")
	public void community() {
		
	}
	
	@RequestMapping(value = "/insert",params = "action=1",method=RequestMethod.GET)
	public String insert(int pageNo, Model model) {
		model.addAttribute("board_cat", 1);
		model.addAttribute("page",pageNo);
		return "community/insert";
	}
	@PostMapping("/insert")
	public String save(Board dto, RedirectAttributes rda) {	
		mapper.insert(dto);
		rda.addFlashAttribute("message","글 쓰기가 완료되었습니다.");
		// ->list.jsp로 바로 전달 됩니다. 특징: url에 표시되지 않습니다.(model은 보임)
		user_mapper.boardCountUp(dto.getBoard_name());
		return "redirect:list?action=1";	//1페이지로 이동
	}
	@RequestMapping(value = "/detail",params = "action=1",method=RequestMethod.GET)
	public String detail(int board_idx,int pageNo, Model model) {
		logger.info("idx:{}",board_idx);
		int board_cat=1;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_idx", board_idx);
		map.put("board_cat", board_cat);
		//조회수 증가 먼저
		mapper.readCount(map);
		Board dto =  mapper.getOne(map);
		model.addAttribute("page",pageNo);
		model.addAttribute("bean",dto);
		model.addAttribute("board_cat", board_cat);
		logger.info("bean:",dto);
		//댓글 목록을 detail.jsp에 출력해야합니다.
		map.put("comment_board", board_idx);
		map.put("comment_boardcat", board_cat);
		List<Comment> cmtlist= cmt_mapper.list(map);
		model.addAttribute("cmtlist",cmtlist);
		return "community/detail";
	}
	@PostMapping("update")	//글수정 처리 -> 완료 alert
//	public String update(Freeboard vo,int pageNo, Model model) {
	public String update(Board vo,int pageNo, RedirectAttributes rda) {
		logger.info("vo:",vo);
		mapper.update(vo);
//		model.addAttribute("idx",vo.getIdx());
//		model.addAttribute("pageNo",pageNo);
		rda.addAttribute("board_idx",vo.getBoard_idx());
		rda.addAttribute("pageNo",pageNo);
//		model.addAttribute("message","글수정 완료되었습니다.");
//		->대신에 사용하는 RedirectAttributes addFlashAttribute()메소드로 값을 저장
		rda.addFlashAttribute("message","글수정 완료되었습니다.");
		return "redirect:detail?action=1";	
		//-> rda 애트리뷰트는 리다이렉트 url의 view(detail.jsp)까지 바로 전달
		//중요: RedirectAttributes는 model과는 충동합니다.
		//		@postMapping이고 redirect 할때만 사용합니다.
	}
//	@GetMapping("delete")	//글 삭제 처리 -> 완료 alert
	@PostMapping("delete")
//	public String deleteFreeboard(int idx,int pageNo,Model model) {
	public String deleteFreeboard(int idx,int board_cat,int pageNo,
			String user_name,RedirectAttributes rda) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_idx", idx);
		map.put("board_cat", board_cat);
		mapper.delete(map);
//		model.addAttribute("pageNo",pageNo);
		user_mapper.boardCountDown(user_name);
		rda.addAttribute("pageNo",pageNo);
		rda.addFlashAttribute("message","글이 삭제 되었습니다.");
		return "redirect:list?action=1";
	}
	
	//여기서부터는 댓글 처리
	@Transactional
	@PostMapping("comment")
	public String comment_save(Comment dto,int pageNo, Model model) {
		//댓글 입력요소 값들 db에 저장 -> detail(글 상세보기)
		cmt_mapper.insert(dto);
		cmt_mapper.commentCountUp(dto.getComment_board());
		user_mapper.cmtCountUp(dto.getComment_mname());
		model.addAttribute("board_idx",dto.getComment_board());
		model.addAttribute("pageNo",pageNo);
		return "redirect:detail?action=1";
	}
	@Transactional
	@GetMapping("comment")	//idx: 댓글 , mref: 메인글 idx
	public String delete(int idx,int pageNo,int mref,String user_name, Model model) {
		cmt_mapper.delete(idx);
		cmt_mapper.commentCountDown(mref);
		user_mapper.cmtCountDown(user_name);
		model.addAttribute("board_idx",mref);
		model.addAttribute("pageNo",pageNo);
		return "redirect:detail?action=1";
	}
	
	
	
	
	
}
