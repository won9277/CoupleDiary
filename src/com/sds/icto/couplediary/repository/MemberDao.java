package com.sds.icto.couplediary.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sds.icto.couplediary.domain.MemberVo;

@Repository
public class MemberDao {

	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;

	public void insert(MemberVo vo) {
		sqlMapClientTemplate.insert("member.insert", vo);
	}

	public MemberVo getMember(MemberVo vo) {

		MemberVo memberVo = new MemberVo();
		memberVo = (MemberVo) sqlMapClientTemplate.queryForObject(
				"member.getInfo", vo);

		return memberVo;
	}

	public MemberVo View(Long no) {

		MemberVo vo2 = (MemberVo) sqlMapClientTemplate.queryForObject(
				"member.view", no);
		return vo2;

	}

	public void Update(MemberVo vo) {

		sqlMapClientTemplate.update("member.couplejoin", vo);
	}

	public boolean checkid(String member_id) {

		MemberVo memberVo = null;
		memberVo = (MemberVo) sqlMapClientTemplate.queryForObject(
				"member.check", member_id);
		if (memberVo == null) {
			return false;
		} else {
			return true;
		}
	}

}
