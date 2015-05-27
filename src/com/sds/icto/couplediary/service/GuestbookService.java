package com.sds.icto.couplediary.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sds.icto.couplediary.domain.GuestbookVo;
import com.sds.icto.couplediary.repository.GuestbookDao;


public class GuestbookService {

	GuestbookDao guestbookDao;

	public void addBook(GuestbookVo vo) {

		guestbookDao.add(vo);

	}

	public List<GuestbookVo> showBook() {
		return guestbookDao.fetchList();

	}
	
	
	public void deleteBook(GuestbookVo vo){
		guestbookDao.delete(vo);
	}

}
