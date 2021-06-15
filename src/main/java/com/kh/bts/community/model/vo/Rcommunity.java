package com.kh.bts.community.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Rcommunity {
	private int rno;
	private String rwriter;
	private String rcontent;
	private String rdate;
	private int cno;

	public Rcommunity() {
	}

	public Rcommunity(int rno, String rwriter, String rcontent, String rdate, int cno) {
		super();
		this.rno = rno;
		this.rwriter = rwriter;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.cno = cno;
	}

	@Override
	public String toString() {
		return "Rcommunity [rno=" + rno + ", rwriter=" + rwriter + ", rcontent=" + rcontent + ", rdate=" + rdate
				+ ", cno=" + cno + "]";
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
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

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

}
