package com.kh.bts.ranking.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Dayli {
	private String acntno;
	private String email;
	private String nickname;
	private int oldesset;
	private int newesset;
	private double yield;

	public Dayli() {
	}

	public Dayli(String acntno, String email, String nickname, int oldesset, int newesset, double yield) {
		super();
		this.acntno = acntno;
		this.email = email;
		this.nickname = nickname;
		this.oldesset = oldesset;
		this.newesset = newesset;
		this.yield = yield;
	}

	public String getAcntno() {
		return acntno;
	}

	public void setAcntno(String acntno) {
		this.acntno = acntno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getOldesset() {
		return oldesset;
	}

	public void setOldesset(int oldesset) {
		this.oldesset = oldesset;
	}

	public int getNewesset() {
		return newesset;
	}

	public void setNewesset(int newesset) {
		this.newesset = newesset;
	}

	public double getYield() {
		return yield;
	}

	public void setYield(double yield) {
		this.yield = yield;
	}

	@Override
	public String toString() {
		return "Dayli [acntno=" + acntno + ", email=" + email + ", nickname=" + nickname + ", oldesset=" + oldesset
				+ ", newesset=" + newesset + ", yield=" + yield + "]";
	}

}
