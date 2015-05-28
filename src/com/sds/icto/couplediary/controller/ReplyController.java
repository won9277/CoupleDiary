package com.sds.icto.couplediary.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sds.icto.couplediary.domain.ReplyVo;
import com.sds.icto.couplediary.repository.ReplyDao;

@Controller
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	ReplyDao replyDao;
	
	@RequestMapping("/insert")
	public String insert(Long no, @ModelAttribute ReplyVo vo){
	
		replyDao.insert(vo);
		return "/board/view/"+vo.getBoard_no();
	}
	
	

}
