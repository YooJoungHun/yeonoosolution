package com.choongang.yeonsolution.product.sim.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choongang.yeonsolution.product.sim.domain.StInDto;
import com.choongang.yeonsolution.product.sim.service.SIMService;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SIMController {
	private final SIMService simService;

	@GetMapping(value = "/product/sim")
	public String StIn(StInDto stInDto, Model model) {
		List<StInDto> stInList = simService.stInList(stInDto);
		model.addAttribute("stInList", stInList);
		return "product/st-in";
	}

	@RequestMapping(value = "/product/sim/{action}")
	public String find(	@PathVariable(name = "action")String action,
						@RequestParam(required = false)Map<String, Object> data,
						RedirectAttributes redirectAttributes) {
		ObjectMapper om = new ObjectMapper();
		om.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		om.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
		StInDto stInDto = null;
		stInDto = om.convertValue(data, StInDto.class);
		String inDate = stInDto.getInDate();
		stInDto.setInDate(inDate.replace("-", "/"));
		
		switch (action) {
		case "find":
			redirectAttributes.addFlashAttribute("stInDto", stInDto); break;
		case "save":
			simService.modifyStIn(stInDto); break;
		case "delete":
			simService.removeStIn(stInDto); break;
		case "fix":
			simService.modifyStInFix(stInDto); break;
		case "cancel":
			simService.modifyStInCancel(stInDto); break;
		}
		return "redirect:/product/sim";
	}
}
