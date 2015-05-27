package com.sds.icto.couplediary.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sds.icto.couplediary.domain.BoardVo;
import com.sds.icto.couplediary.domain.MemberVo;
import com.sds.icto.couplediary.repository.MemberDao;
import com.sds.icto.couplediary.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MemberDao memberDao;

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinForm() {

		return "member/joinform";
	}

	// Service 호출
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute MemberVo vo) {
		memberDao.insert(vo);
		return "redirect:/index";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginForm() {

		return "member/loginform";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute MemberVo vo, HttpSession session) {
		MemberVo membervo = null;
		membervo = memberDao.getMember(vo);

		// 로그인 실패
		if (membervo == null) {
			return "redirect:/member/login?result=fail";
		} else {

			session.setAttribute("authMember", membervo);
			return "redirect:/index";
		}
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("authMember");
		session.invalidate();
		return "redirect:/index";

	}
/*
	@RequestMapping(value = "/edit/{no}", method = RequestMethod.GET)
	public String EditForm(@PathVariable Long no, Model model) {
		model.addAttribute("no", no);
		return "member/editform";
	}*/

	@RequestMapping(value = { "/editform/{no}" }, method = RequestMethod.GET)
	public String couplejoinform(@PathVariable Long no, Model model) {
		model.addAttribute("no", no);
		MemberVo vo= memberService.memberView(no);
		model.addAttribute("vo",vo);
		return "member/editform";
	}

	@RequestMapping(value = { "/editform" }, method = RequestMethod.POST)
	public String couplejoin(@ModelAttribute MemberVo vo, Model model) {

		memberService.memberUpdate(vo);
		MemberVo vo2 = memberService.memberView(vo.getNo());
		model.addAttribute("vo2",vo2);
		return "redirect:/index";
	}
	

	@RequestMapping("/checkid")
	@ResponseBody
	public Object checkid(String member_id) {
			
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(memberService.checkid(member_id)) {
			map.put("result", true );
			map.put("data", "이미 사용 중인 Id입니다." );
		} else  {
			map.put("result", false );
			map.put("data", "Id를 사용할 수 있습니다." );	
		}
		
		return map;
	}


}
