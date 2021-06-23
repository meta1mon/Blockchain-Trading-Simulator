package com.kh.bts.acnt.model.vo;

import org.springframework.stereotype.Component;

@Component
public class CoinAcnt {
	private int cano;
	private String coin;
	private float coincnt;
	private float buyprice;
	private String acntno;

	public CoinAcnt() {}

	public CoinAcnt(int cano, String coin, float coincnt, float buyprice, String acntno) {
		super();
		this.cano = cano;
		this.coin = coin;
		this.coincnt = coincnt;
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

	public float getCoincnt() {
		return coincnt;
	}

	public void setCoincnt(float coincnt) {
		this.coincnt = coincnt;
	}

	public float getBuyprice() {
		return buyprice;
	}

	public void setBuyprice(float buyprice) {
		this.buyprice = buyprice;
	}

	public String getAcntno() {
		return acntno;
	}

	public void setAcntno(String acntno) {
		this.acntno = acntno;
	}

}
