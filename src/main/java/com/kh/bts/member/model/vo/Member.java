package com.kh.bts.member.model.vo;

public class Member {

	private String email;

	private String nickname;

	private String authkey;
	private String auth;

	private String pw;

	private String gender;
	private String birthdate;

	private String phone;

	private String mailing;
	private String reqAgr;
	
	private long cybcash;
	private String acntno;
	private long newesset;
	private double yield;

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
	
	public String getAuthkey() {
		return authkey;
	}



	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}



	public String getAuth() {
		return auth;
	}



	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getPw() {
		return pw;
	}



	public void setPw(String pw) {
		this.pw = pw;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getBirthdate() {
		return birthdate;
	}



	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}



	public String getPhone() {
		return phone;
	}



	public void setPhone(String phone) {
		this.phone = phone;
	}



	public String getMailing() {
		return mailing;
	}



	public void setMailing(String mailing) {
		this.mailing = mailing;
	}



	public String getReqAgr() {
		return reqAgr;
	}



	public void setReqAgr(String reqAgr) {
		this.reqAgr = reqAgr;
	}


	public long getCybcash() {
		return cybcash;
	}



	public void setCybcash(long cybcash) {
		this.cybcash = cybcash;
	}



	public String getAcntno() {
		return acntno;
	}



	public void setAcntno(String acntno) {
		this.acntno = acntno;
	}



	public long getNewesset() {
		return newesset;
	}



	public void setNewesset(long newesset) {
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
		return "Member [email=" + email + ", nickname=" + nickname + ", authkey=" + authkey + ", auth=" + auth + ", pw="
				+ pw + ", gender=" + gender + ", birthdate=" + birthdate + ", phone=" + phone + ", mailing=" + mailing
				+ ", reqAgr=" + reqAgr + ", cybcash=" + cybcash + ", acntno=" + acntno + ", newesset=" + newesset
				+ ", yield=" + yield + "]";
	}
}
