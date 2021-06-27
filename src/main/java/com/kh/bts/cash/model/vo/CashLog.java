package com.kh.bts.cash.model.vo;

import org.springframework.stereotype.Component;

@Component
public class CashLog {
	private int clno;
	private String cashdate;
	private String acntno;
	private String email;
	private int won;
	private int sellprice;

	public CashLog() {
	}

	public CashLog(int clno, String cashdate, String acntno, String email, int won, int sellprice) {
		super();
		this.clno = clno;
		this.cashdate = cashdate;
		this.acntno = acntno;
		this.email = email;
		this.won = won;
		this.sellprice = sellprice;
	}

	public int getClno() {
		return clno;
	}

	public void setClno(int clno) {
		this.clno = clno;
	}

	public String getCashdate() {
		return cashdate;
	}

	public void setCashdate(String cashdate) {
		this.cashdate = cashdate;
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

	public int getWon() {
		return won;
	}

	public void setWon(int won) {
		this.won = won;
	}

	public int getSellprice() {
		return sellprice;
	}

	public void setSellprice(int sellprice) {
		this.sellprice = sellprice;
	}

	@Override
	public String toString() {
		return "CashLog [clno=" + clno + ", cashdate=" + cashdate + ", acnto=" + acntno + ", email=" + email + ", won="
				+ won + ", sellprice=" + sellprice + "]";
	}

}
