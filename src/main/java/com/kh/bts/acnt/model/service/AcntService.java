package com.kh.bts.acnt.model.service;


import com.kh.bts.acnt.model.vo.Acnt;

public interface AcntService {
	Acnt selectMyAcnt(String email);
	public int cntAcnt(Acnt vo) throws Exception;
	public int updateAcnt(Acnt vo) throws Exception;
}
