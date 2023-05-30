package com.choongang.yeonsolution.product.wo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.product.wo.domain.Item;
import com.choongang.yeonsolution.product.wo.domain.Wh;
import com.choongang.yeonsolution.product.wo.domain.Wo;
import com.choongang.yeonsolution.product.wo.service.ItemService;
import com.choongang.yeonsolution.product.wo.service.WhService;
import com.choongang.yeonsolution.product.wo.service.WoService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class WOController {
	private final WoService woService;
	private final ItemService itemService;
	private final WhService whService;
	
	@RequestMapping(value = "/wo")
	public String wo(Model model) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		List<Wo> woList = woService.findWo();
		List<String> woJsonList = woList.stream().map(wo -> {
			try { return mapper.writeValueAsString(wo); }
			catch (JsonProcessingException e) { return null; }
		}).collect(Collectors.toList());
		model.addAttribute("woList", woList);
		model.addAttribute("jsonWoList", String.format("[%s]", String.join(",", woJsonList)));
		return "product/wo";
	}
	
	@ResponseBody
	@RequestMapping(value = "/wo/search")
	public String woSearch(@RequestBody Map<String, Object> data) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		Wh wh = new Wh();
		if (data.containsKey("wh.whCode")) wh.setWhCode((String)data.get("wh.whCode"));
		if (data.containsKey("wh.whName")) wh.setWhName((String)data.get("wh.whName"));
		Wo searcher = mapper.convertValue(data, Wo.class);
		searcher.setWh(wh);
		System.out.println(searcher);
		List<Wo> woSearchList = woService.findWoSearch(searcher);//검색 결과를 내뱉음
		List<String> woStringList = woSearchList.stream().map(wo -> {
			try { return mapper.writeValueAsString(wo); }
			catch (JsonProcessingException e) { return null; }
		}).collect(Collectors.toList());
		return String.format("[%s]", String.join(",", woStringList));
	}
	
	@ResponseBody
	@RequestMapping(value = "/wo/getItem")
	public String woGetItem(@RequestBody Map<String, Object> data) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		String itemCode = (String)data.get("itemCode");
		Item item = itemService.findItem(itemCode);
		try { return mapper.writeValueAsString(item); }
		catch (JsonProcessingException e) { return null; }
	}
	
	@ResponseBody
	@RequestMapping(value = "/wo/getWh")
	public String woGetWh(@RequestBody Map<String, Object> data) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		String whCode = (String)data.get("whCode");
		Wh wh = whService.findWh(whCode);
		try { return mapper.writeValueAsString(wh); }
		catch (JsonProcessingException e) { return null; }
	}
	
	@ResponseBody
	@RequestMapping(value = "/wo/removeWos")
	public String woRemoveWo(@RequestBody Map<String, Object> data) {
		@SuppressWarnings("unchecked")
		List<String> codeList = (List<String>)data.get("workOrderCode");
		int result = 0;
		for (String workOrderCode : codeList) {
			result += woService.modifyWoDelete(workOrderCode);
		}
		return String.format("{ \"result\": %d }", result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/wo/woConfirm")
	public String woConfirm(@RequestBody Map<String, Object> data) {
		@SuppressWarnings("unchecked")
		List<String> codeList = (List<String>)data.get("workOrderCode");
		int result = 0;
		for (String workOrderCode : codeList) {
			result += woService.modifyWoConfirm(workOrderCode);
		}
		return String.format("{ \"result\": %d }", result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/wo/woCancel")
	public String woCancel(@RequestBody Map<String, Object> data) {
		@SuppressWarnings("unchecked")
		List<String> codeList = (List<String>)data.get("workOrderCode");
		int result = 0;
		for (String workOrderCode : codeList) {
			result += woService.modifyWoCancel(workOrderCode);
		}
		return String.format("{ \"result\": %d }", result);
	}
}
