package com.sds.icto.couplediary.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sds.icto.couplediary.domain.MemberVo;
import com.sds.icto.couplediary.repository.MemberDao;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;

	public void joinUser(MemberVo vo) {

		memberDao.insert(vo);

	}

	public MemberVo authUser(MemberVo vo) {
		MemberVo membervo = memberDao.getMember(vo);
		return membervo;
	}

	public MemberVo memberView(Long no) {
		MemberVo vo2 = memberDao.View(no);
		return vo2;
	}

	public void memberUpdate(MemberVo vo) {
		memberDao.Update(vo);
	}

	public boolean checkid(String member_id) {
		return memberDao.checkid(member_id);
	}
}
