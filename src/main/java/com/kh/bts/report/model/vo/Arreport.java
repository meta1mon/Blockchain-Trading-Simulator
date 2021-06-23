package com.kh.bts.report.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Arreport {

	private String rrno;
	private String rreporter;
	private int rrreason;
	private String rcontent;
	private String rrespondent;
	private String rrdate;
	private String rstatus;
	private String rreason;

	public Arreport() {
	}

	public Arreport(String rrno, String rreporter, int rrreason, String rcontent, String rrespondent, String rrdate,
			String rstatus, String rreason) {
		super();
		this.rrno = rrno;
		this.rreporter = rreporter;
		this.rrreason = rrreason;
		this.rcontent = rcontent;
		this.rrespondent = rrespondent;
		this.rrdate = rrdate;
		this.rstatus = rstatus;
		this.rreason = rreason;
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

	public String getRstatus() {
		return rstatus;
	}

	public void setRstatus(String rstatus) {
		this.rstatus = rstatus;
	}

	public String getRreason() {
		return rreason;
	}

	public void setRreason(String rreason) {
		this.rreason = rreason;
	}

}
