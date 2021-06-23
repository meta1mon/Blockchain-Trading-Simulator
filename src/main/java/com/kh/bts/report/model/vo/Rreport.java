package com.kh.bts.report.model.vo;

public class Rreport {
	private String rrno;
	private String rreporter;
	private int rrreason;
	private String rcontent;
	private String rrespondent;
	private String rrdate;
	private String cno;
	private String rno;
	
	public Rreport() {}
	
	public Rreport(String rrno, String rreporter, int rrreason, String rcontent, String rrespondent, String rrdate,
			String cno, String rno) {
		super();
		this.rrno = rrno;
		this.rreporter = rreporter;
		this.rrreason = rrreason;
		this.rcontent = rcontent;
		this.rrespondent = rrespondent;
		this.rrdate = rrdate;
		this.cno = cno;
		this.rno = rno;
	}

	public String getRrno() {
		return rrno;
	}

	public void setRrno(String rrno) {
		this.rrno = rrno;
	}

	public String getRreporter() {
		return rreporter;
	}

	public void setRreporter(String rreporter) {
		this.rreporter = rreporter;
	}

	public int getRrreason() {
		return rrreason;
	}

	public void setRrreason(int rrreason) {
		this.rrreason = rrreason;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getRrespondent() {
		return rrespondent;
	}

	public void setRrespondent(String rrespondent) {
		this.rrespondent = rrespondent;
	}

	public String getRrdate() {
		return rrdate;
	}

	public void setRrdate(String rrdate) {
		this.rrdate = rrdate;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getRno() {
		return rno;
	}

	public void setRno(String rno) {
		this.rno = rno;
	}
	
	
}
