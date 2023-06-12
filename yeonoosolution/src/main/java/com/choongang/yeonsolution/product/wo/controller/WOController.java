package com.choongang.yeonsolution.product.wo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.product.wo.domain.Item;
import com.choongang.yeonsolution.product.wo.domain.Orders;
import com.choongang.yeonsolution.product.wo.domain.Wh;
import com.choongang.yeonsolution.product.wo.domain.Wo;
import com.choongang.yeonsolution.product.wo.service.ItemService;
import com.choongang.yeonsolution.product.wo.service.WhService;
import com.choongang.yeonsolution.product.wo.service.WoDetailService;
import com.choongang.yeonsolution.product.wo.service.WoService;
import com.choongang.yeonsolution.standard.am.security.UserDetailsDto;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/product")
public class WOController {
	private final WoService woService;
	private final WoDetailService woDetailService;
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
		return "product/wo/wo.layout";
	}
	
	@RequestMapping(value = "/currentWo")
	public String currentWo(Model model) {
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
		return "product/wo/currentWo.layout";
	}
	
	@ResponseBody
	@RequestMapping(value = "/wo/search")
	public String woSearch(@RequestBody Map<String, Object> data) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		Wh wh = new Wh();
		Item item = new Item();
		if (data.containsKey("wh.whCode")) wh.setWhCode((String)data.get("wh.whCode"));
		if (data.containsKey("wh.whName")) wh.setWhName((String)data.get("wh.whName"));
		if (data.containsKey("item.itemName")) item.setItemName((String)data.get("item.itemName"));
		Wo searcher = mapper.convertValue(data, Wo.class);
		searcher.setWh(wh);
		searcher.setItem(item);
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
			if (woDetailService.findWoDetail(workOrderCode).size() > 0) continue;
			result += woService.modifyWoCancel(workOrderCode);
		}
		return String.format("{ \"result\": %d }", result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/wo/insertWoList")
	public String insertWoList(@AuthenticationPrincipal UserDetailsDto userDetailsDto,
									 @RequestBody Map<String, Object> data) {
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> items = (List<Map<String, Object>>)data.get("data");
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		List<Wo> woList = items.stream().map(item -> {
			Wo wo = mapper.convertValue(item, Wo.class);
			Item it = new Item();
			String itemCode = (String)((Map<String, Object>)item.get("item")).get("itemCode");
			it.setItemCode(itemCode);
			Wh wh = new Wh();
			//String whCode = (String)((Map<String, Object>)item.get("wh")).get("whCode");
			String whCode = itemService.findItem(itemCode).getWh().getWhCode();
			wh.setWhCode(whCode);
			Orders orders = new Orders();
			String orderCode = (Map<String, Object>)item.get("orders") == null ? null : (String)((Map<String, Object>)item.get("wh")).get("orderCode");
			orders.setOrderCode(orderCode);
			wo.setItem(it);
			wo.setWh(wh);
			wo.setOrders(orders);
			wo.setRegUser(userDetailsDto.getMemberDto().getMemberName());
			return wo;
		}).collect(Collectors.toList());
		int result = 0;
		for (Wo wo : woList) result += woService.addWo(wo);
		return String.format("{ \"result\":%d }", result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/wo/updateWoList")
	public String updateWoList(@AuthenticationPrincipal UserDetailsDto userDetailsDto,
			 						   @RequestBody Map<String, Object> data) {
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> items = (List<Map<String, Object>>)data.get("data");
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		List<Wo> woList = items.stream().map(item -> {
			Wo wo = mapper.convertValue(item, Wo.class);
			Item it = new Item();
			String itemCode = (String)((Map<String, Object>)item.get("item")).get("itemCode");
			it.setItemCode(itemCode);
			Wh wh = new Wh();
			String whCode = (String)((Map<String, Object>)item.get("wh")).get("whCode");
			wh.setWhCode(whCode);
			Orders orders = new Orders();
			String orderCode = (Map<String, Object>)item.get("orders") == null ? null : (String)((Map<String, Object>)item.get("wh")).get("orderCode");
			orders.setOrderCode(orderCode);
			wo.setItem(it);
			wo.setWh(wh);
			wo.setOrders(orders);
			wo.setUpdateUser(userDetailsDto.getMemberDto().getMemberName());
			return wo;
		}).collect(Collectors.toList());
		int result = 0;
		for (Wo wo : woList) result += woService.modifyWo(wo);
		return String.format("{ \"result\":%d }", result);
	}

	// currentWo Methods
	@ResponseBody
	@RequestMapping(value = "/wo/woClose")
	public String woClose(@RequestBody Map<String, Object> data) {
		@SuppressWarnings("unchecked")
		List<String> codeList = (List<String>)data.get("workOrderCode");
		int result = 0;
		for (String workOrderCode : codeList) {
			result += woService.modifyWoClose(workOrderCode);
		}
		return String.format("{ \"result\": %d }", result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/wo/searchFixed")
	public String woSearchFixed(@RequestBody Map<String, Object> data) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		Wh wh = new Wh();
		Item item = new Item();
		if (data.containsKey("wh.whCode")) wh.setWhCode((String)data.get("wh.whCode"));
		if (data.containsKey("wh.whName")) wh.setWhName((String)data.get("wh.whName"));
		if (data.containsKey("item.itemName")) item.setItemName((String)data.get("item.itemName"));
		Wo searcher = mapper.convertValue(data, Wo.class);
		searcher.setWh(wh);
		searcher.setItem(item);
		List<Wo> woSearchList = woService.findWoSearchFixed(searcher);//검색 결과를 내뱉음
		List<String> woStringList = woSearchList.stream().map(wo -> {
			try { return mapper.writeValueAsString(wo); }
			catch (JsonProcessingException e) { return null; }
		}).collect(Collectors.toList());
		return String.format("[%s]", String.join(",", woStringList));
	}
}
