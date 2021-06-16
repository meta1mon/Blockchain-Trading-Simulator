package com.kh.bts.community.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Community implements java.io.Serializable {
	private static final long serialVersionUID = 20001L;
	private String cno;
	private String csubject;
	private String ccontent;
	private String cdate;
	private String filepath;
	private int viewcnt;
	private int likecnt;
	private int dislikecnt;
	private int replycnt;
	private String cwriter;

	public Community() {
	}

	public Community(String cno, String csubject, String ccontent, String cdate, String filepath, int viewcnt, int likecnt,
			int dislikecnt, int replycnt, String cwriter) {
		this.cno = cno;
		this.csubject = csubject;
		this.ccontent = ccontent;
		this.cdate = cdate;
		this.filepath = filepath;
		this.viewcnt = viewcnt;
		this.likecnt = likecnt;
		this.dislikecnt = dislikecnt;
		this.replycnt = replycnt;
		this.cwriter = cwriter;
	}

	@Override
	public String toString() {
		return "CommunityVO [cno=" + cno + ", csubject=" + csubject + ", ccontent=" + ccontent + ", cdate=" + cdate
				+ ", filepath=" + filepath + ", viewcnt=" + viewcnt + ", likecnt=" + likecnt + ", dislikecnt="
				+ dislikecnt + ", replycnt=" + replycnt + ", cwriter=" + cwriter + "]";
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

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
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

	public int getDislikecnt() {
		return dislikecnt;
	}

	public void setDislikecnt(int dislikecnt) {
		this.dislikecnt = dislikecnt;
	}

	public int getReplycnt() {
		return replycnt;
	}

	public void setReplycnt(int replycnt) {
		this.replycnt = replycnt;
	}

	public String getCwriter() {
		return cwriter;
	}

	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}

}
