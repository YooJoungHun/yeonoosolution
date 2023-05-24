package com.choongang.yeonsolution.standard.imi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.choongang.yeonsolution.standard.imi.service.IMIService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class IMIController {
	
	private final IMIService imiService;
	
	@GetMapping("/standard/imi")
	public String imiDetails() {
		log.info("ImiDetails Controller Start");
		
		return "/standard/item-management-info";
	}
}
