package com.choongang.yeonsolution.product.wo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.product.wo.domain.Wo;
import com.choongang.yeonsolution.product.wo.service.WoService;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

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
	
	@ResponseBody
	@RequestMapping(value = "/wo/search")
	public String woSearch(@RequestBody Map<String, Object> data) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		Wo searcher = mapper.convertValue(data, Wo.class);
		List<Wo> woSearchList = wos.findWoSearch(searcher);//검색 결과를 내뱉음
		// startDate 와 endDate가 검색용 컬럼인걸 알아챘다!!!
		
	}
}
