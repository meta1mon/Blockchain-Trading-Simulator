package com.kh.bts.report.model.vo;

public class Creport {
	private String crno;
	private String creporter;
	private int crreason;
	private String csubject;
	private String ccontent;
	private String crespondent;
	private String crdate;
	private String cno;

	public Creport() {
	}

	public Creport(String crno, String creporter, int crreason, String csubject, String ccontent, String crespondent,
			String crdate, String cno) {
		super();
		this.crno = crno;
		this.creporter = creporter;
		this.crreason = crreason;
		this.csubject = csubject;
		this.ccontent = ccontent;
		this.crespondent = crespondent;
		this.crdate = crdate;
		this.cno = cno;
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

	public String getCsubject() {
		return csubject;
	}

	public void setCsubject(String csubject) {
		this.csubject = csubject;
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

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

}
