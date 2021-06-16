package com.kh.bts.investmentpage.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Sold {
	private int usno;
	private String coin;
	private float sellcnt;
	private float sellprice;
	private String sdate;
	private String acntno;

	public Sold() {
	}
	public Sold(int usno,String coin,float sellcnt,float sellprice,String sdate,String acntno) {
		super();
		this.usno = usno;
		this.coin = coin;
		this.sellcnt = sellcnt;
		this.sellprice = sellprice;
		this.sdate = sdate;
		this.acntno = acntno;
	}

	public int getUsno() {
		return usno;
	}

	public void setUsno(int usno) {
		this.usno = usno;
	}

	public String getCoin() {
		return coin;
	}

	public void setCoin(String coin) {
		this.coin = coin;
	}

	public float getSellcnt() {
		return sellcnt;
	}

	public void setSellcnt(float sellcnt) {
		this.sellcnt = sellcnt;
	}

	public float getSellprice() {
		return sellprice;
	}

	public void setSellprice(float sellprice) {
		this.sellprice = sellprice;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getAcntno() {
		return acntno;
	}

	public void setAcntno(String acntno) {
		this.acntno = acntno;
	}

	@Override
	public String toString() {
		return "Sold [usno=" + usno + ", coin=" + coin + ", sellcnt=" + sellcnt + ", sellprice=" + sellprice
				+ ", sdate=" + sdate + ", acntno=" + acntno + "]";
	}

}
