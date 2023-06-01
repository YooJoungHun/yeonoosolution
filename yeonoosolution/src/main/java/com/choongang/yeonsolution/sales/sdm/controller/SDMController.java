package com.choongang.yeonsolution.sales.sdm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.choongang.yeonsolution.sales.sdm.domain.SDMStOutDto;
import com.choongang.yeonsolution.sales.sdm.service.SDMService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class SDMController {
	private final SDMService ss;
	
	
	
	@GetMapping("/sales/stock/") // 전체 행 조회 및 검색
	public String outListBycustomerCode (SDMStOutDto stout, String customerCode,
										 String outCode, Model model) {
		
		
		// 출고리스트 조회
		List<SDMStOutDto> outList = ss.findOutListByCustomerCode(customerCode);
		model.addAttribute("outList", outList);
		
		System.out.println("전체조회 -> "+outList);
		System.out.println("customerCode -> "+stout.getCustomerCode());
		
		
		List<SDMStOutDto> companyCodeList = ss.findCompanyCodeList() ;
//		for (StOutDto sod : companyCodeList) System.out.println(sod.getCompanyCode());
		List<SDMStOutDto> outCodeList = ss.findOutCodeList() ;
		List<SDMStOutDto> whCodeList = ss.findWhCodeList() ;
		List<SDMStOutDto> itemCodeList = ss.findItemCodeList() ;
		
		
		model.addAttribute("companyCodeList", companyCodeList);
		model.addAttribute("outCodeList", outCodeList);
		model.addAttribute("whCodeList", whCodeList);
		model.addAttribute("itemCodeList", itemCodeList);

		
		return "/sales/stock-search";
	}
	
	@ResponseBody
	@GetMapping(value = "/sales/stock/{outCode}") // 품목리스트 조회
	public Map<String, Object>  outListByOutCode (SDMStOutDto stout, 
									@PathVariable("outCode") String outCode) {

		
		List<SDMStOutDto> stOutDetailDtoList = ss.findStOutDetailDtoListByOutCode(outCode);
		
		Map<String , Object> outDetailList2 = new HashMap<String, Object>();
		
		System.out.println("outCode -> "+outCode);
		System.out.println("품목조회 -> "+stOutDetailDtoList);
		
		outDetailList2.put("outDetailList", stOutDetailDtoList);
		
		return outDetailList2;
		}
	
	@ResponseBody
	@PatchMapping(value = "/sales/stock/confrim/{outCode}") // 출고확정 버튼
	public String stockConfirmByOutCode (@PathVariable String outCode) {
		
		ss.outTypeConfirmModify(outCode);
		System.out.println("확정outCode -> "+outCode);
		
		return "";
	}
	
	@ResponseBody
	@PatchMapping(value = "/sales/stock/cancel/{outCode}") // 출고확정 취소 버튼
	public String stockConfirmCancleByOutCode (@PathVariable String outCode) {
		
		ss.outTypeConfirmCancelModify(outCode);
		System.out.println("확정취소outCode -> "+outCode);
		
		return "";
	}
	
	@ResponseBody
	@GetMapping(value = "/confirmCancleYN") // 출고상태가 확정인지 아닌지 체크
	public String confirmCancleYNByOutCode (SDMStOutDto stout, String outCode, Model model) {
		
		// 일단 없다는 가정하에 진행	
		String resultStr = "";
				
//		System.out.println("confirmCancleYNByOutCode outType -> "+stout.getOutType());
				 
		String outTypeYN = ss.outTypeCCYNDetails(stout); 
		System.out.println("해당 행의 출고유형 -> "+outTypeYN);
		model.addAttribute("outTypeYN", outTypeYN);
				
		//저장일 경우 1을 리턴 아니면 0을 리턴
		if(outTypeYN == "저장" ) {
				resultStr = "1";
			} else {
				resultStr = "0"; 
			}
		
		return resultStr;
	}
	
	@PostMapping(value = "/sales/stock") // 출고 저장(insert) 버튼
	public String StOutAdd(SDMStOutDto stout) {
		ss.addStOut(stout);
		
		
		return "redirect:/sales/stock/";
	}
	
	@ResponseBody
	@DeleteMapping(value = "/sales/stock/{outCode}") // 출고 행 삭제(delete) 버튼
	public String stOutRemoveByOutCode (@PathVariable String outCode) {
		
		ss.removeStOutByOutCode(outCode);
		System.out.println("행 삭제 버튼 outCode -> "+outCode);
		
		return "";
	}
	
	@ResponseBody
	@PatchMapping(value = "/sales/stock/stout/{outCode}") // 출고리스트 열 수정 
	public String stOutModifyByOutCode (@PathVariable String outCode, SDMStOutDto stout){
		
		ss.modifyStOutByOutCode(stout);
		System.out.println("출고리스트 수정 된 값들 -> "+stout);
		
		return "";
	}
	
	@ResponseBody
	@PatchMapping(value = "/sales/stock/item/{outCode}") // 출고리스트 열 수정 
	public String stOutItemModifyByOutCodeAndSorder (SDMStOutDto stout) {
		
		ss.modifyStOutItemByOutCodeAndSorder(stout);
		System.out.println("품목리스트 수정 된 값들 -> "+stout);
		
		return "";
	}
	
	@ResponseBody
	@PatchMapping(value = "/sales/stock/deletion/{outCode}") // 출고리스트 열 삭제
	public String stOutItemRemoveByOutCodeAndSorder (SDMStOutDto stout) {
		
		ss.removeStOutItemByOutCodeAndSorder(stout);
		System.out.println("품목리스트 삭제 된 outCode, sorder -> "+stout.getOutCode()+stout.getSorder());
		
		return "";
	}
	
	@PostMapping(value = "/sales/stock/item") // 품목 저장(insert) 버튼
	public String StOutItemAdd(SDMStOutDto stout) {
		
		ss.addStOutItem(stout);
		
		return "redirect:/sales/stock/";
	}
	
	
//--------------------------------
	@GetMapping(value = "/sales/stock/detail/") // 전체 행 조회 및 검색
	public String outListWithDetailByCustomerCode (SDMStOutDto stout, String customerCode, Model model) {
		
		// 출고리스트 조회
		List<SDMStOutDto> outListWithDetailByCustomerCode = ss.findStOutListWithDetailByCustomerCode(customerCode);
		model.addAttribute("outListWithDetail", outListWithDetailByCustomerCode);
		
		
		List<SDMStOutDto> companyCodeList2 = ss.findCompanyCodeList2() ;
		model.addAttribute("companyCodeList",companyCodeList2);
		
		System.out.println("조회페이지 -> "+outListWithDetailByCustomerCode);
		System.out.println("조회페이지 customerCode -> "+stout.getCustomerCode());
		
		return "/sales/stock-detail-search";
	}
	
	
}
