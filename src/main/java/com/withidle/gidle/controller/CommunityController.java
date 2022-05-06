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
		//���� SQL ���� 

		return "community/list";
//		return "community/list2";	//pageNo �� form data�� �����ϴ� ����
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
		rda.addFlashAttribute("message","�� ���Ⱑ �Ϸ�Ǿ����ϴ�.");
		// ->list.jsp�� �ٷ� ���� �˴ϴ�. Ư¡: url�� ǥ�õ��� �ʽ��ϴ�.(model�� ����)
		return "redirect:list?action=1";	//1�������� �̵�
	}
	@RequestMapping(value = "/detail",params = "action=1",method=RequestMethod.GET)
	public String detail(int board_idx,int pageNo, Model model) {
		logger.info("idx:{}",board_idx);
		int board_cat=1;
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_idx", board_idx);
		map.put("board_cat", board_cat);
		//��ȸ�� ���� ����
		mapper.readCount(map);
		Board dto =  mapper.getOne(map);
		model.addAttribute("page",pageNo);
		model.addAttribute("bean",dto);
		model.addAttribute("board_cat", board_cat);
		logger.info("bean:",dto);
		//��� ����� detail.jsp�� ����ؾ��մϴ�.
		map.put("comment_board", board_idx);
		map.put("comment_boardcat", board_cat);
		List<Comment> cmtlist= cmt_mapper.list(map);
		model.addAttribute("cmtlist",cmtlist);
		return "community/detail";
	}
	@PostMapping("update")	//�ۼ��� ó�� -> �Ϸ� alert
//	public String update(Freeboard vo,int pageNo, Model model) {
	public String update(Board vo,int pageNo, RedirectAttributes rda) {
		logger.info("vo:",vo);
		mapper.update(vo);
//		model.addAttribute("idx",vo.getIdx());
//		model.addAttribute("pageNo",pageNo);
		rda.addAttribute("board_idx",vo.getBoard_idx());
		rda.addAttribute("pageNo",pageNo);
//		model.addAttribute("message","�ۼ��� �Ϸ�Ǿ����ϴ�.");
//		->��ſ� ����ϴ� RedirectAttributes addFlashAttribute()�޼ҵ�� ���� ����
		rda.addFlashAttribute("message","�ۼ��� �Ϸ�Ǿ����ϴ�.");
		return "redirect:detail?action=1";	
		//-> rda ��Ʈ����Ʈ�� �����̷�Ʈ url�� view(detail.jsp)���� �ٷ� ����
		//�߿�: RedirectAttributes�� model���� �浿�մϴ�.
		//		@postMapping�̰� redirect �Ҷ��� ����մϴ�.
	}
//	@GetMapping("delete")	//�� ���� ó�� -> �Ϸ� alert
	@PostMapping("delete")
//	public String deleteFreeboard(int idx,int pageNo,Model model) {
	public String deleteFreeboard(int idx,int board_cat,int pageNo,RedirectAttributes rda) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_idx", idx);
		map.put("board_cat", board_cat);
		mapper.delete(map);
//		model.addAttribute("pageNo",pageNo);
		rda.addAttribute("pageNo",pageNo);
		rda.addFlashAttribute("message","���� ���� �Ǿ����ϴ�.");
		return "redirect:list?action=1";
	}
	
	//���⼭���ʹ� ��� ó��
	@Transactional
	@PostMapping("comment")
	public String comment_save(Comment dto,int pageNo, Model model) {
		//��� �Է¿�� ���� db�� ���� -> detail(�� �󼼺���)
		cmt_mapper.insert(dto);
		cmt_mapper.commentCountUp(dto.getComment_board());
		model.addAttribute("board_idx",dto.getComment_board());
		model.addAttribute("pageNo",pageNo);
		return "redirect:detail?action=1";
	}
	@Transactional
	@GetMapping("comment")	//idx: ��� , mref: ���α� idx
	public String delete(int idx,int pageNo,int mref, Model model) {
		cmt_mapper.delete(idx);
		cmt_mapper.commentCountDown(mref);
		model.addAttribute("board_idx",mref);
		model.addAttribute("pageNo",pageNo);
		return "redirect:detail?action=1";
	}
	
	
	
	
	
}
