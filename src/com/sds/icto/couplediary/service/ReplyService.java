package com.sds.icto.couplediary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sds.icto.couplediary.domain.ReplyVo;
import com.sds.icto.couplediary.repository.ReplyDao;

@Service
public class ReplyService {
	
	@Autowired
	ReplyDao replyDao;
	
	public List<ReplyVo> replyList(Long no){
		
		return replyDao.fetchList(no);
	}

}
