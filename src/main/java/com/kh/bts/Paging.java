package com.kh.bts;

import org.springframework.stereotype.Component;

@Component
public class Paging {
	private int start;
	private int plus;

	public Paging() {
	}

	public Paging(int start, int plus) {
		super();
		this.start = start;
		this.plus = plus;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getPlus() {
		return plus;
	}

	public void setPlus(int plus) {
		this.plus = plus;
	}

	@Override
	public String toString() {
		return "Paging [start=" + start + ", plus=" + plus + "]";
	}

}
