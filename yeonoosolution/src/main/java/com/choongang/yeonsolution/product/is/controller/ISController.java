package com.choongang.yeonsolution.product.is.controller;

import org.springframework.stereotype.Controller;

import com.choongang.yeonsolution.product.is.service.ISService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ISController {
	private final ISService isService;
	
}
