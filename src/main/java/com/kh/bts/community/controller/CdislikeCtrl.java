package com.kh.bts.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.bts.community.model.service.CdislikeService;

@Controller
public class CdislikeCtrl {
	@Autowired
	private CdislikeService dlService;
	public static final int LIMIT = 10;


}
