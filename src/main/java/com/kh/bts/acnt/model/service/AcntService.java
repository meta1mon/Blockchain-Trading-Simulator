package com.kh.bts.acnt.model.service;

import java.util.List;

import com.kh.bts.acnt.model.vo.Acnt;

public interface AcntService {
	List<Acnt> selectListAcnt(String email);
}
