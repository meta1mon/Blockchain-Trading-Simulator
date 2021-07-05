package com.kh.bts;

import java.util.Calendar;
import java.util.Date;

public class DailyRank extends Thread {

	private int mYear, mMonth, mDay, mHour, mMinute;

	public DailyRank(int year, int month, int day, int hour, int minute) {

		mYear = year;

		mMonth = month;

		mDay = day;

		mHour = hour;

		mMinute = minute;

	}

	@Override
	public void run() {
		try {
			sleep(timeUntil(2021, 7, 5, 22, 50));
			// 작업을 수행한다.

			work();

		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	public void work() {
		System.out.println("i'm working!");

	}

	public long timeUntil(int year, int month, int day, int hour, int minute) {

		Date now = new Date();

		Calendar calUntil = Calendar.getInstance();

		calUntil.set(Calendar.YEAR, year);

		calUntil.set(Calendar.MONTH, month - 1);

		calUntil.set(Calendar.DAY_OF_WEEK, day);

		calUntil.set(Calendar.HOUR_OF_DAY, hour);

		calUntil.set(Calendar.MINUTE, minute);

		calUntil.set(Calendar.SECOND, 0);

		Date until = calUntil.getTime();

		long sleep = until.getTime() - now.getTime();

		return sleep;

	}
	

}