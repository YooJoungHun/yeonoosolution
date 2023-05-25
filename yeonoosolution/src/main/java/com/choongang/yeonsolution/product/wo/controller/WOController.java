package com.choongang.yeonsolution.product.wo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.choongang.yeonsolution.product.wo.domain.Wo;
import com.choongang.yeonsolution.product.wo.service.WoService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class WOController {
	private final WoService wos;
	
	@RequestMapping(value = "/wo")
	public String wo(Model model) {
		List<Wo> woList = wos.findWo();
		model.addAttribute("woList", woList);
		return "product/wo";
	}
}
