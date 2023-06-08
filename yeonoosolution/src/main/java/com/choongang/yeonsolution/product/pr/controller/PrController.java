package com.choongang.yeonsolution.product.pr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/product")
public class PrController {
	
	
	@RequestMapping(value = "/productResult")
	public String productResult(Model model) {
		
		return "product/pr/productResult.layout";
	}
}
