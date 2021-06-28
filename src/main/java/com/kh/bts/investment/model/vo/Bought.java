package com.kh.bts.investment.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Bought {
	private int ubno;
	private String coin;
	private double buycnt;
	private double buyprice;
	private String bdate;
	private String acntno;

	public Bought() {
	}

	public Bought(int ubno, String coin, double buycnt, double buyprice, String bdate, String acntno) {
		super();
		this.ubno = ubno;
		this.coin = coin;
		this.buycnt = buycnt;
		this.buyprice = buyprice;
		this.bdate = bdate;
		this.acntno = acntno;
	}

	public int getUbno() {
		return ubno;
	}

	public void setUbno(int ubno) {
		this.ubno = ubno;
	}

	public String getCoin() {
		return coin;
	}

	public void setCoin(String coin) {
		this.coin = coin;
	}

	public double getBuycnt() {
		return buycnt;
	}

	public void setBuycnt(double buycnt) {
		this.buycnt = buycnt;
	}

	public double getBuyprice() {
		return buyprice;
	}

	public void setBuyprice(double buyprice) {
		this.buyprice = buyprice;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public String getAcntno() {
		return acntno;
	}

	public void setAcntno(String acntno) {
		this.acntno = acntno;
	}

	@Override
	public String toString() {
		return "Bought [ubno=" + ubno + ", coin=" + coin + ", buycnt=" + buycnt + ", buyprice=" + buyprice + ", bdate="
				+ bdate + ", acntno=" + acntno + "]";
	}

}
