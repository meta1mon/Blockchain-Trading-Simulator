package com.kh.bts.admin.model.service;

import com.kh.bts.report.model.vo.Creport;
import com.kh.bts.report.model.vo.Rreport;

public interface AdminService {
	public int insertCreport(Creport vo);
	public int insertRreport(Rreport vo);
}
