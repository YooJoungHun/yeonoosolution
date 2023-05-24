package com.choongang.yeonsolution.standard.ipi.controller;

import org.springframework.stereotype.Controller;

import com.choongang.yeonsolution.standard.ipi.service.IPIService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class IPIController {
	
	private final IPIService ipiService;
	
}
