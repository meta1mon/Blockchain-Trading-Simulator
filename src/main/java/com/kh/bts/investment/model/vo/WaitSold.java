package com.kh.bts.investment.model.vo;

public class WaitSold {
	private int usno;
	private String coin;
	private float sellcnt;
	private float sellprice;
	private String wsdate;
	private String acntno;

	public WaitSold() {
	}

	public WaitSold(int usno, String coin, float sellcnt, float sellprice, String wsdate, String acntno) {
		super();
		this.usno = usno;
		this.coin = coin;
		this.sellcnt = sellcnt;
		this.sellprice = sellprice;
		this.wsdate = wsdate;
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

	public String getWsdate() {
		return wsdate;
	}

	public void setWsdate(String wsdate) {
		this.wsdate = wsdate;
	}

	public String getAcntno() {
		return acntno;
	}

	public void setAcntno(String acntno) {
		this.acntno = acntno;
	}

	@Override
	public String toString() {
		return "Waitsold [usno=" + usno + ", coin=" + coin + ", sellcnt=" + sellcnt + ", sellprice=" + sellprice
				+ ", wsdate=" + wsdate + ", acntno=" + acntno + "]";
	}

}
