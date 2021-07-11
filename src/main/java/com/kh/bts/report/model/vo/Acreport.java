package com.kh.bts.report.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Acreport {

	private String crno;
	private String creporter;
	private int crreason;
	private String ccontent;
	private String crespondent;
	private String crdate;
	private String cstatus;
	private String creason;
	private String acrdate;
	private String cno;

	public Acreport() {
	}

	public Acreport(String crno, String creporter, int crreason, String ccontent, String crespondent,
			String crdate, String cstatus, String creason) {
		super();
		this.crno = crno;
		this.creporter = creporter;
		this.crreason = crreason;
		this.ccontent = ccontent;
		this.crespondent = crespondent;
		this.crdate = crdate;
		this.cstatus = cstatus;
		this.creason = creason;
	}

	public String getCrno() {
		return crno;
	}

	public void setCrno(String crno) {
		this.crno = crno;
	}

	public String getCreporter() {
		return creporter;
	}

	public void setCreporter(String creporter) {
		this.creporter = creporter;
	}

	public int getCrreason() {
		return crreason;
	}

	public void setCrreason(int crreason) {
		this.crreason = crreason;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getCrespondent() {
		return crespondent;
	}

	public void setCrespondent(String crespondent) {
		this.crespondent = crespondent;
	}

	public String getCrdate() {
		return crdate;
	}

	public void setCrdate(String crdate) {
		this.crdate = crdate;
	}

	public String getCstatus() {
		return cstatus;
	}

	public void setCstatus(String cstatus) {
		this.cstatus = cstatus;
	}

	public String getCreason() {
		return creason;
	}

	public void setCreason(String creason) {
		this.creason = creason;
	}

	public String getAcrdate() {
		return acrdate;
	}

	public void setAcrdate(String acrdate) {
		this.acrdate = acrdate;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}


}
