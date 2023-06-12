package com.choongang.yeonsolution.product.pr.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.product.wo.domain.Bom;
import com.choongang.yeonsolution.product.wo.domain.Item;
import com.choongang.yeonsolution.product.wo.domain.Wo;
import com.choongang.yeonsolution.product.wo.domain.WoDetail;
import com.choongang.yeonsolution.product.wo.service.BomService;
import com.choongang.yeonsolution.product.wo.service.WhStockDetailService;
import com.choongang.yeonsolution.product.wo.service.WoDetailService;
import com.choongang.yeonsolution.product.wo.service.WoService;
import com.choongang.yeonsolution.standard.am.domain.AMDto;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;
import com.choongang.yeonsolution.standard.am.security.UserDetailsDto;
import com.choongang.yeonsolution.standard.am.service.AMService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping(value = "/product")
@RequiredArgsConstructor
public class PrController {
	private final WoService woService;
	private final WoDetailService woDetailService;
	private final BomService bomService;
	private final WhStockDetailService whStockDetailService;
	private final AMService amService;
	
	@RequestMapping(value = "/productResult")
	public String productResult(@AuthenticationPrincipal UserDetailsDto userDetailsDto, Model model) {
		List<AMDto> memberList = amService.findMemberListByCompanyCode(userDetailsDto.getMemberDto().getCompanyCode());
		model.addAttribute("memberList", memberList);
		return "product/pr/productResult.layout";
	}
	
	@ResponseBody
	@RequestMapping(value = "/getWoDetails")
	public String getWoDetails(@RequestBody Map<String, Object> data) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		String workOrderCode = (String)data.get("workOrderCode");
		List<WoDetail> woDetailList = woDetailService.findWoDetail(workOrderCode);
		List<String> resultWoDetailList = woDetailList.stream().map(wod -> {
			String str = null;
			try { str = mapper.writeValueAsString(wod); }
			catch (JsonProcessingException e) { e.printStackTrace(); }
			return str;
		}).collect(Collectors.toList());
		WoDetail forBOM = new WoDetail();
		forBOM.setItem(woService.findOneWo(workOrderCode).getItem());
		Integer qtt = 0;
		for (WoDetail wod : woDetailList) qtt += wod.getWorkOrderQuantity();
		forBOM.setWorkOrderQuantity(qtt);
		List<Bom> bomList = bomService.findBomWithQuantity(forBOM);
		List<String> resultBomList = bomList.stream().map(bom -> {
			String str = null;
			try { str = mapper.writeValueAsString(bom); }
			catch (JsonProcessingException e) { e.printStackTrace(); }
			return str;
		}).collect(Collectors.toList());
		return String.format("{ \"detail\" : [%s], \"bom\" : [%s] }", String.join(",", resultWoDetailList), String.join(",", resultBomList));
	}
	
	@ResponseBody
	@RequestMapping(value = "/setStartEndDate")
	public String setStartEndDate(@RequestBody Map<String, Object> data) {
		Wo wo = new Wo();
		String workOrderCode = (String)data.get("workOrderCode");
		wo.setWorkOrderCode(workOrderCode);
		SimpleDateFormat dt = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		Date date = null;
		try { date = dt.parse(((String)data.get("date")).replace('T', ' ')); }
		catch (ParseException e) { }
		if (((String)data.get("type")).equals("start")) wo.setStartDate(date);
		else wo.setEndDate(date);
		int result = woService.modifyWoStartEndDate(wo);
		return String.format("{ \"result\" : %d }", result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkAndInsertWoDetail")
	public String checkAndInsert(@RequestBody Map<String, Object> data) {
		Integer result = 0; // 프로시저 결과 값으로 넣어야함
		MemberDto memberDto = woDetailService.findMemberByUid((String)data.get("workerUid"));
		if (memberDto == null) return String.format("{ \"result\" : %d }", result);
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("data", data);
		param.put("result", result);
		woDetailService.addWoDetailWithCheck(param);
		return String.format("{ \"result\" : %d }", (Integer)param.get("result"));
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/cancelResult")
	public String cancelResult(@RequestBody Map<String, Object> data) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("workOrderCode", (String)data.get("workOrderCode"));
		List<Integer> sorders = (ArrayList<Integer>)data.get("sorders");
		int result = 0;
		for (Integer sorder : sorders) {
			Integer partResult = 0;
			param.put("sorder", sorder);
			param.put("partResult", partResult);
			result = woDetailService.removeWoDetailWithId(param);
			result += (Integer)param.get("partResult");
		}
		return String.format("{ \"result\": %d }", result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/productResult/getMemberName")
	public String getMemberName(@RequestBody Map<String, Object> data) {
		MemberDto memberDto = woDetailService.findMemberByUid((String)data.get("memberUid"));
		if (memberDto == null) return "{ \"memberName\" : null }";
		return String.format("{ \"memberName\" : \"%s\" }", memberDto.getMemberName());
	}
}
