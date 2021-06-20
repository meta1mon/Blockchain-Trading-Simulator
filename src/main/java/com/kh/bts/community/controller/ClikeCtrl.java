package com.kh.bts.community.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.bts.community.model.service.ClikeService;

@Controller
public class ClikeCtrl {
	@Autowired
	private ClikeService lService;
	public static final int LIMIT = 10;


}
