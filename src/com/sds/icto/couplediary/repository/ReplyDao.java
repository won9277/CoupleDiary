package com.sds.icto.couplediary.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;

import com.sds.icto.couplediary.domain.GuestbookVo;

@Repository
public class ReplyDao {
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void add(GuestbookVo vo) {
		sqlMapClientTemplate.insert("reply.insert", vo);

	}
	

}
