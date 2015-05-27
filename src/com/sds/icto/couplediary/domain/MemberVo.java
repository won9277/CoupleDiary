package com.sds.icto.couplediary.domain;

public class MemberVo {
	private Long no;
	private String name;
	private String member_id;
	private String password;
	private String gender;
	private String couple_id;
	public Long getNo() {
		return no;
	}
	
	public void setNo(Long no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCouple_id() {
		return couple_id;
	}
	public void setCouple_id(String couple_id) {
		this.couple_id = couple_id;
	}
}
