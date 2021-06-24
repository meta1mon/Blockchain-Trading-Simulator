package com.kh.bts.admin.model.service;

import com.kh.bts.cash.model.vo.Cash;
import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

public interface AdminService {
	public int insertCreport(Creport vo);
	public int insertRreport(Rreport vo);
	public int registerCash(Cash vo);
}
