package com.sds.icto.couplediary.exception;

public class GuestbookDaoException extends RuntimeException {

	private static final long serialVersionUID = 1L;
	
	public GuestbookDaoException(){
		super("GuestbookDao Exception");
	}
	
	public GuestbookDaoException(String msg){
		super(msg);
	}

	
	

}
