package com.choongang.yeonsolution.product.pr.controller;

import java.util.AbstractMap;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
	public String productResult(Model model) {
		
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
		Date date = (Date)data.get("date");
		if ((String)data.get("type") == "start") wo.setStartDate(date);
		else wo.setEndDate(date);
		int result = woService.modifyWoStartEndDate(wo);
		return String.format("{ \"result\" : %d }", result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkBomForWork")
	public String checkBomForWork(@RequestBody Map<String, Object> data) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		String workOrderCode = (String)data.get("workOrderCode");
		List<WoDetail> woDetailList = woDetailService.findWoDetail(workOrderCode);
		WoDetail forBOM = new WoDetail();
		forBOM.setItem(woService.findOneWo(workOrderCode).getItem());
		Integer qtt = 0;
		for (WoDetail wod : woDetailList) qtt += wod.getWorkOrderQuantity();
		forBOM.setWorkOrderQuantity(qtt);
		List<Bom> bomList = bomService.findBomWithQuantity(forBOM);
		boolean isAllowed = true;
		for (Bom bom : bomList) {
			isAllowed &= (whStockDetailService.findWhStockDetail(bom.getLowItemCode()).getGoodQuantity() >= bom.getMaterialQuantity());
			if (!isAllowed) break;
		}
		return String.format("{ \"result\" : %b }", isAllowed);
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertResult")
	public String insertResult(@RequestBody Map<String, Object> data) {
		ObjectMapper mapper = new ObjectMapper();
		mapper.configure(DeserializationFeature.FAIL_ON_IGNORED_PROPERTIES, false);
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		String workOrderCode = (String)data.get("workOrderCode");
		Wo wo = woService.findOneWo(workOrderCode);
		WoDetail woDetail = new WoDetail();
		woDetail.setWo(wo);
		woDetail.setWorker(amService.findMemberByMemberId((String)data.get("workerUid")).getMemberName());
		woDetail.setWorkOrderQuantity((Integer)data.get("workOrderQuantity"));
		woDetail.setGoodYn((String)data.get("goodYn"));
		//woDetail.setWorker(workOrderCode)
		//재고 불출 부분 제외하고 추가적으로 작성... 재고 현황에서 수량 감산...
		int[] result = { 0, 0 };
		woDetail.setItem(wo.getItem());
		List<Bom> bomList = bomService.findBomWithQuantity(woDetail);
		result[0] = 1;
		for (Bom bom : bomList) {
			result[0] *= whStockDetailService.modifyWhStockDetailWithWoDetail(bom);
		}
		//result[0] = whStockDetailService.modifyWhStockDetailWithWoDetail(woDetail);
		// productResult.js의 양품/불량 등록 부분임
		System.out.println(woDetail);
		result[1] = woDetailService.addWoDetailWithResult(woDetail);
		return String.format("{ \"result\" : [%d,%d] }", result[0], result[1]);
	}
}
