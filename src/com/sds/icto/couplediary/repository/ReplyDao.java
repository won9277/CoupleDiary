package com.sds.icto.couplediary.repository;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.stereotype.Repository;
import com.sds.icto.couplediary.domain.ReplyVo;

@Repository
public class ReplyDao {
	
	@Autowired
	SqlMapClientTemplate sqlMapClientTemplate;
	
	public void insert(ReplyVo vo) {
		sqlMapClientTemplate.insert("reply.insert", vo);

	}
	
	public List<ReplyVo> fetchList(Long no){
		List<ReplyVo> list = sqlMapClientTemplate.queryForList("reply.list",no);
		return list;
	}
	

}
