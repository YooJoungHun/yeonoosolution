package com.choongang.yeonsolution.product.is.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.choongang.yeonsolution.product.is.service.ISService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//@Controller
@Slf4j
@RequiredArgsConstructor
public class ISController {
	private final ISService isService;
	
	@GetMapping(value = "/product/is")
	public String isList() {
		
		return "/product/inventory-status";
	}
	
}
