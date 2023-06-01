package com.choongang.yeonsolution.product.smm.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.product.smm.domain.itemDto;
import com.choongang.yeonsolution.product.smm.domain.stMoveDetailDto;
import com.choongang.yeonsolution.product.smm.domain.stMoveDto;
import com.choongang.yeonsolution.product.smm.service.SMMService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SMMController {
	private final SMMService smmService;
	
	// 이동상세 현황 페이지
	@GetMapping("/product/stockMoveStatus")
	public String stockMoveStatusList(Model model) {
		
		List<stMoveDetailDto> stockMoveStatus = smmService.findStockMoveStatusList();
		
		model.addAttribute("stockMoveStatus", stockMoveStatus);
		
		return "product/stock-move-status";
	}
	
	// 이동상세 현황 페이지 검색결과
	@ResponseBody
	@GetMapping("/product/stockMoveSearch")
	public List<stMoveDetailDto> stockMoveSearchList(String keyword, String startDate, String endDate) {
		List<stMoveDetailDto> stockMoveSearch = smmService.findStockMoveSearchListByKeywordAndDate(keyword, startDate, endDate);
		
		return stockMoveSearch;
	}
	
	//이동등록 페이지
	@GetMapping("/product/stockMoveRegistration") 
	public String stockMoveRegistrationList(Model model) {
		
		List<stMoveDto> stockMoveRegistration = smmService.findStockMoveRegistrationList();
		
		model.addAttribute("stockMoveRegistration", stockMoveRegistration);
		
		return "product/stock-move-registration";
	}
	
	// "저장" -> "확정" move_type 변경
	@ResponseBody
	@PatchMapping("/product/stockMoveConfirmation/{moveCode}")
	public void stockMoveConfirmationModify(@PathVariable String moveCode) {
		System.out.println("stockMoveConfirmation moveCode->" + moveCode);
		smmService.modifyStockMoveConfirmationBymoveCodes(moveCode);
		
	}
	
	//이동등록 세부내역 List
	@ResponseBody
	@GetMapping("/product/stockMoveDetailList/{moveCode}")
	 public List<stMoveDetailDto> stockMoveDetailList(@PathVariable String moveCode) {
		
		System.out.println("stockMoveDetailList moveCode->" + moveCode);
		List<stMoveDetailDto> stockMoveDetail = smmService.findStockMoveDetailListByMoveCode(moveCode);
		
		return stockMoveDetail;
	}
	 
	 //이동등록 추가
	 @ResponseBody
	 @PostMapping("/product/stockMoveRegistrationAdd") 
	 public void stockMoveRegistrationAdd(String moveDate, String moveMemo) {
		 
		 System.out.println("재고이동 insert 컨트롤러 스타트");
		 smmService.addStockMoveRegistrationByMoveDateAndMoveMemo(moveDate, moveMemo);
	 }
	
	 // 제품코드 모달 List
	 @ResponseBody
	 @GetMapping("/product/itemCodeList")
	 public List<itemDto> itemCodeList(){
		 
		 List<itemDto> itemCodeList = smmService.findItemCodeList();
		 System.out.println(itemCodeList);
		 return itemCodeList;
	 }
	
	 // 제품코드 모달 클릭했을때 행 기입
	 @ResponseBody
	 @GetMapping("product/itemCodeRowDataList")
	 public List<itemDto> itemCodeRowDataList(String itemCode){
		 
		 List<itemDto> itemCodeRowDataList = smmService.findItemCodeRowDataListByItemCode(itemCode);
		 System.out.println(itemCodeRowDataList);
		 return itemCodeRowDataList;
	 }
}
