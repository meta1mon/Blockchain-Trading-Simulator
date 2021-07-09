package com.kh.bts.mypage.model.vo;

public class MyRcommunity {
	private String cno;
	private String csubject;
	private String rwriter;
	private String rcontent;
	private String rdate;
	private int viewcnt;
	private int likecnt;

	public MyRcommunity() {}
	
	public MyRcommunity(String cno, String csubject, String rwriter, String rcontent, String rdate, int viewcnt,
			int likecnt) {
		super();
		this.csubject = csubject;
		this.rwriter = rwriter;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.viewcnt = viewcnt;
		this.likecnt = likecnt;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getCsubject() {
		return csubject;
	}

	public void setCsubject(String csubject) {
		this.csubject = csubject;
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

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public int getLikecnt() {
		return likecnt;
	}

	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
	}

}
