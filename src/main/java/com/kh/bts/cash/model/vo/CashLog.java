package com.kh.bts.cash.model.vo;

public class CashLog {
	private int clno;
	private String cashdate;
	private int cashno;
	private String acntno;

	public CashLog() {
	}

	public CashLog(int clno, String cashdate, int cashno, String acntno) {
		super();
		this.clno = clno;
		this.cashdate = cashdate;
		this.cashno = cashno;
		this.acntno = acntno;
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

	public int getCashno() {
		return cashno;
	}

	public void setCashno(int cashno) {
		this.cashno = cashno;
	}

	public String getAcntno() {
		return acntno;
	}

	public void setAcntno(String acntno) {
		this.acntno = acntno;
	}

}
