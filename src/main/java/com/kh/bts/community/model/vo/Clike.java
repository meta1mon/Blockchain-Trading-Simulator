package com.kh.bts.community.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Clike {
	private String cno;
	private String nickname;
	
	public Clike() {
	}
	
	public Clike(String cno, String nickname) {
		super();
		this.cno = cno;
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Clike [cno=" + cno + ", nickname=" + nickname + "]";
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
