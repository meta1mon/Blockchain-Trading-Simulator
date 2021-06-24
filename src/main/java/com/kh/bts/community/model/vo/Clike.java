package com.kh.bts.community.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Clike {
	private String cno;
	private String email;
	
	public Clike() {
	}
	
	public Clike(String cno, String email) {
		super();
		this.cno = cno;
		this.email = email;
	}

	@Override
	public String toString() {
		return "Clike [cno=" + cno + ", email=" + email + "]";
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
