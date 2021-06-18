package com.kh.bts.investment.model.vo;

import org.springframework.stereotype.Component;

@Component
public class WaitBought {
	private int ubno;
	private String coin;
	private float buycnt;
	private float buyprice;
	private String wbdate;
	private String acntno;

	public WaitBought() {

	}

	public WaitBought(int ubno, String coin, float buycnt, float buyprice, String wbdate, String acntno) {
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

	public float getBuycnt() {
		return buycnt;
	}

	public void setBuycnt(float buycnt) {
		this.buycnt = buycnt;
	}

	public float getBuyprice() {
		return buyprice;
	}

	public void setBuyprice(float buyprice) {
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
