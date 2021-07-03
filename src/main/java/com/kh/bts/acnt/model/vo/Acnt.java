package com.kh.bts.acnt.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Acnt {
	private String acntno;
	private String email;
	private long cybcash;
	private int bankPw;

	public Acnt() {
	}


	public Acnt(String acntno, String email, long cybcash, int bankPw) {
		super();
		this.acntno = acntno;
		this.email = email;
		this.cybcash = cybcash;
		this.bankPw = bankPw;
	}


	public String getAcntno() {
		return acntno;
	}

	public void setAcntno(String acntno) {
		this.acntno = acntno;
	}

	public long getCybcash() {
		return cybcash;
	}

	public void setCybcash(long cybcash) {
		this.cybcash = cybcash;
	}

	public int getBankPw() {
		return bankPw;
	}

	public void setBankPw(int bankPw) {
		this.bankPw = bankPw;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

}
