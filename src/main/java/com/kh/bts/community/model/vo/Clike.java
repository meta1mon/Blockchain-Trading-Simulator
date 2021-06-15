package com.kh.bts.community.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Clike {
	private int cno;
	private String nickname;
	
	public Clike() {
	}
	
	public Clike(int cno, String nickname) {
		super();
		this.cno = cno;
		this.nickname = nickname;
	}

	@Override
	public String toString() {
		return "Clike [cno=" + cno + ", nickname=" + nickname + "]";
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
