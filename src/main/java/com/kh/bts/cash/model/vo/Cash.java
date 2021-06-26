package com.kh.bts.cash.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Cash {

	private int cashno;
	private int price;             // 원가
	private int discountrate;    // 할인률
	private int sellprice;         // 할인가
	private int won;               // 충전금
	private String startdate;
	private String enddate;
	private int issale;            // 0이면 판매끝, 1이면 판매중
	
	public Cash() {}
	
	public Cash(int cashno, int price, int discountrate, int sellprice, int won, String startdate, String enddate,
			int issale) {
		super();
		this.cashno = cashno;
		this.price = price;
		this.discountrate = discountrate;
		this.sellprice = sellprice;
		this.won = won;
		this.startdate = startdate;
		this.enddate = enddate;
		this.issale = issale;
	}

	public int getCashno() {
		return cashno;
	}

	public void setCashno(int cashno) {
		this.cashno = cashno;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscountrate() {
		return discountrate;
	}

	public void setDiscountrate(int discountrate) {
		this.discountrate = discountrate;
	}

	public int getSellprice() {
		return sellprice;
	}

	public void setSellprice(int sellprice) {
		this.sellprice = sellprice;
	}

	public int getWon() {
		return won;
	}

	public void setWon(int won) {
		this.won = won;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public int getIssale() {
		return issale;
	}

	public void setIssale(int issale) {
		this.issale = issale;
	}
	
	
}
