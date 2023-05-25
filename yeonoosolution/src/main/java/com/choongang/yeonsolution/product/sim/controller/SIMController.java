package com.choongang.yeonsolution.product.sim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.choongang.yeonsolution.product.sim.service.SIMService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SIMController {
	private final SIMService simService;

	@GetMapping(value = "/")
	public String StIn(){
		simService.st();
		return "product/st-in";
	}
}
