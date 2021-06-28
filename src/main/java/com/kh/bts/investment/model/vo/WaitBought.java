package com.kh.bts.investment.model.vo;

import org.springframework.stereotype.Component;

@Component
public class WaitBought {
	private int ubno;
	private String coin;
	private double buycnt;
	private double buyprice;
	private String wbdate;
	private String acntno;

	public WaitBought() {

	}

	public WaitBought(int ubno, String coin, double buycnt, double buyprice, String wbdate, String acntno) {
		super();
		this.ubno = ubno;
		this.coin = coin;
		this.buycnt = buycnt;
		this.buyprice = buyprice;
		this.wbdate = wbdate;
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

	public String getWbdate() {
		return wbdate;
	}

	public void setWbdate(String wbdate) {
		this.wbdate = wbdate;
	}

	public String getAcntno() {
		return acntno;
	}

	public void setAcntno(String acntno) {
		this.acntno = acntno;
	}

	@Override
	public String toString() {
		return "Waitbought [ubno=" + ubno + ", coin=" + coin + ", buycnt=" + buycnt + ", buyprice=" + buyprice
				+ ", wbdate=" + wbdate + ", acntno=" + acntno + "]";
	}

}
