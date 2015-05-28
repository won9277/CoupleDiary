package com.sds.icto.couplediary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sds.icto.couplediary.domain.BoardVo;
import com.sds.icto.couplediary.domain.ReplyVo;
import com.sds.icto.couplediary.repository.BoardDao;
import com.sds.icto.couplediary.repository.ReplyDao;
import com.sds.icto.couplediary.service.BoardService;
import com.sds.icto.couplediary.service.ReplyService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	BoardDao boardDao; ///

	@Autowired
	BoardService boardService;
	
	@Autowired
	ReplyDao replyDao;
	
	@Autowired
	ReplyService replyService;

	@RequestMapping("/index")
	public String index(Model model, @ModelAttribute BoardVo vo) {
		List<BoardVo> list = boardDao.fetchList();
		model.addAttribute("list", list);
		System.out.println();
		return "/board/index";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String insertForm() {
		return "/board/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String insert(@ModelAttribute BoardVo vo) {
		boardDao.insert(vo);
		return "redirect:/board/index";
	}

	@RequestMapping(value = "/view/{no}", method = RequestMethod.GET)
	public String showBoard(@PathVariable Long no, Model model) {
		model.addAttribute("no", no);
		
		//댓글 불러오기
		List<ReplyVo> list = replyService.replyList(no); 
		model.addAttribute("list", list);
		
		BoardVo boardvo = boardService.showBoard(no);
		model.addAttribute("boardvo", boardvo);
		boardService.boardUpdateViewcnt(boardvo);

		return "/board/view";

	}

	@RequestMapping(value = "/modify/{no}", method = RequestMethod.GET)
	public String modifyForm(@PathVariable Long no, Model model) {
		model.addAttribute("no", no);
		BoardVo vo = boardService.boardView(no);
		model.addAttribute("vo", vo);
		return "/board/modify";

	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyBoard(Long no, @ModelAttribute BoardVo vo, Model model) {
		model.addAttribute("no", no);
		boardService.boardUpdate(vo);
		BoardVo vo2 = boardService.boardView(vo.getNo());
		model.addAttribute("vo2", vo2);
		return "redirect:/board/view/" + no;

	}

	@RequestMapping("/delete/{no}")
	public String deleteForm(@PathVariable Long no, Model model) {
		model.addAttribute("no", no);
		return "/board/deleteform";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@ModelAttribute BoardVo vo) {
		boardService.deleteBoard(vo);
		return "redirect:/board/index";
	}

	@RequestMapping(value = { "/find" }, method = RequestMethod.POST)
	public String findlist(@RequestParam String keyword, Model model) {

		List<BoardVo> findlist = boardService.boardFind(keyword);
		model.addAttribute("list", findlist);
		return "board/index";
	}
	
	@RequestMapping("/insert")
	public String insert(Long no, @ModelAttribute ReplyVo vo){
	
		replyDao.insert(vo);
		return "redirect:/board/view/"+vo.getBoard_no();
	}

}
