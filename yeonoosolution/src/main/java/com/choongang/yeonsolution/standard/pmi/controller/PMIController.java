package com.choongang.yeonsolution.standard.pmi.controller;

import org.springframework.stereotype.Controller;

import com.choongang.yeonsolution.standard.pmi.service.PMIService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class PMIController {
	
	private final PMIService pmiService;
	
}
