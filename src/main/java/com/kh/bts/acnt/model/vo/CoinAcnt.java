package com.kh.bts.acnt.model.vo;

import org.springframework.stereotype.Component;

@Component
public class CoinAcnt {
	private int cano;
	private String coin;
	private double buycnt;
	private double buyprice;
	private String acntno;

	public CoinAcnt() {}

	public CoinAcnt(int cano, String coin, double buycnt, double buyprice, String acntno) {
		super();
		this.cano = cano;
		this.coin = coin;
		this.buycnt = buycnt;
		this.buyprice = buyprice;
		this.acntno = acntno;
	}

	public int getCano() {
		return cano;
	}

	public void setCano(int cano) {
		this.cano = cano;
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

	public String getAcntno() {
		return acntno;
	}

	public void setAcntno(String acntno) {
		this.acntno = acntno;
	}

}
