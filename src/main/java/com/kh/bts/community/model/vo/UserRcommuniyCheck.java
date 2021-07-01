package com.kh.bts.community.model.vo;

import org.springframework.stereotype.Component;

@Component
public class UserRcommuniyCheck {
	private String rno;
	private String rwriter;
	private String rcontent;
	private String rdate;
	private String cno;
	private String email;

	public UserRcommuniyCheck() {
	}

	public UserRcommuniyCheck(String rno, String rwriter, String rcontent, String rdate, String cno, String email) {
		super();
		this.rno = rno;
		this.rwriter = rwriter;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.cno = cno;
		this.email = email;
	}

	public String getRno() {
		return rno;
	}

	public void setRno(String rno) {
		this.rno = rno;
	}

	public String getRwriter() {
		return rwriter;
	}

	public void setRwriter(String rwriter) {
		this.rwriter = rwriter;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
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

	@Override
	public String toString() {
		return "UserRcommuniyCheck [rno=" + rno + ", rwriter=" + rwriter + ", rcontent=" + rcontent + ", rdate=" + rdate
				+ ", cno=" + cno + ", email=" + email + "]";
	}

}
