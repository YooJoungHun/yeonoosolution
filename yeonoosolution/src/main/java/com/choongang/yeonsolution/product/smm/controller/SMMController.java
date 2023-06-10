package com.choongang.yeonsolution.product.smm.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.product.smm.domain.ItemDto;
import com.choongang.yeonsolution.product.smm.domain.StMoveDetailDto;
import com.choongang.yeonsolution.product.smm.domain.StMoveDto;
import com.choongang.yeonsolution.product.smm.domain.WhDto;
import com.choongang.yeonsolution.product.smm.service.SMMService;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;
import com.choongang.yeonsolution.standard.am.security.UserDetailsDto;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class SMMController {
	private final SMMService smmService;
	
	// 이동상세 현황 페이지
	@GetMapping("/product/stockMoveStatus")
	public String stockMoveStatusList(Model model) {
		
		List<StMoveDetailDto> stockMoveStatus = smmService.findStockMoveStatusList();
		
		model.addAttribute("stockMoveStatus", stockMoveStatus);
		return "product/smm/stock-move-status.layout";
	}
	
	// 이동상세 현황 페이지 검색결과
	@ResponseBody
	@GetMapping("/product/stockMoveSearch")
	public List<StMoveDetailDto> stockMoveSearchList(String keyword, String startDate, String endDate) {
		
		List<StMoveDetailDto> stockMoveSearch = smmService.findStockMoveSearchListByKeywordAndDate(keyword, startDate, endDate);
		return stockMoveSearch;
	}
	
	//이동등록 페이지
	@GetMapping("/product/stockMoveRegistration") 
	public String stockMoveRegistrationList(Model model) {
		
		List<StMoveDto> stockMoveRegistration = smmService.findStockMoveRegistrationList();
		
		model.addAttribute("stockMoveRegistration", stockMoveRegistration);
		return "product/smm/stock-move-registration.layout";
	}
	
	// "저장" -> "확정" move_type 변경
	@ResponseBody
	@PatchMapping("/product/stockMoveConfirmation/{moveCode}")
	public void stockMoveConfirmationModify(@PathVariable String moveCode, @AuthenticationPrincipal UserDetailsDto userDetailsDto, MemberDto memberDto) {
		
		String memberName = userDetailsDto.getMemberDto().getMemberName();
		smmService.modifyStockMoveConfirmationBymoveCode(moveCode, memberName);
	}
	
	//이동등록 세부내역 List
	@ResponseBody
	@GetMapping("/product/stockMoveDetailList/{moveCode}")
	 public List<StMoveDetailDto> stockMoveDetailList(@PathVariable String moveCode) {
		
		List<StMoveDetailDto> stockMoveDetail = smmService.findStockMoveDetailListByMoveCode(moveCode);
		return stockMoveDetail;
	}
	 
	 //이동등록 insert
	 @ResponseBody
	 @PostMapping("/product/stockMoveRegistrationAdd") 
	 public void stockMoveRegistrationAdd(@AuthenticationPrincipal UserDetailsDto userDetailsDto, MemberDto memberDto , String moveDate, String moveMemo) {
		
		 String memberUid = userDetailsDto.getMemberDto().getMemberUid();
		 smmService.addStockMoveRegistrationByMemberUidAndMoveDateAndMoveMemo(memberUid, moveDate, moveMemo);
	 }
	
	 // 제품코드 모달 List
	 @ResponseBody
	 @GetMapping("/product/itemCodeList")
	 public List<ItemDto> itemCodeList(){
		 
		 List<ItemDto> itemCodeList = smmService.findItemCodeList();
		 return itemCodeList;
	 }
	
	 // 입고창고 모달 List
	 @ResponseBody
	 @GetMapping("/product/whCodeList")
	 public List<WhDto> whCodeList(){
		 
		 List<WhDto> whCodeList = smmService.findWhCodeList();
		 return whCodeList;
	 }
	 
	 // 제품코드 모달 클릭했을때 행 기입
	 @ResponseBody
	 @GetMapping("product/itemCodeRowDataList")
	 public List<ItemDto> itemCodeRowDataList(String itemCode){
		 
		 List<ItemDto> itemCodeRowDataList = smmService.findItemCodeRowDataListByItemCode(itemCode);
		 return itemCodeRowDataList;
	 }
	 
	 // 세부내역 등록
	 @ResponseBody
	 @PostMapping("/product/stockMoveDetailAdd")
	 public void stockMoveDetailAdd(@RequestBody StMoveDetailDto stMoveDetailDto){
		 
		 smmService.addStockMoveDetailByStMoveDetailDto(stMoveDetailDto);
	 }
	 
	 // 이동등록 비고수정
	 @ResponseBody
	 @PatchMapping("/product/stockMoveRegistrationModify")
	 public void stockMoveRegistrationModify(String moveCode, String moveMemo){
		 
		 smmService.modifyStockMoveRegistrationByMoveCodeAndMoveMemo(moveCode, moveMemo);
	 }
	 
	 // 이동등록 삭제 ( COLUMN delete_status = "N" -> "Y") 
	 @ResponseBody
	 @PatchMapping("/product/stockMoveRegistrationDeleteStatusModify")
	 public void stockMoveRegistrationDeleteStatusModify(String moveCode) {
		 
		 smmService.modifyStockMoveRegistrationDeleteStatusByMoveCode(moveCode);
	 }
	 
	 // 세부내역 수정
	 @ResponseBody
	 @PatchMapping("/product/stockMoveDetailModify")
	 public void stockMoveDetailModify(String moveCode, String sorder, String moveMemo) {
		 
		 smmService.modifyStockMoveDetailByMoveCodeAndSorderAndMoveMemo(moveCode, sorder, moveMemo);
	 }
	 
	 // 세부내역 삭제
	 @ResponseBody
	 @DeleteMapping("/product/stockMoveDetailRemove")
	 public void stockMoveDetailRemove(String moveCode, String sorder) {
		 
		 smmService.removeStockMoveDetailByMoveCodeAndSorder(moveCode,sorder);
	 }
	 
	 // 세부내역 등록,수정,삭제 시 이동등록에 수정일자 및 수정자 변경
	 @ResponseBody
	 @PatchMapping("/product/stockMoveRegistrationDateAndUserModify")
	 public void stockMoveRegistrationDateAndUserModify(@AuthenticationPrincipal UserDetailsDto userDetailsDto, MemberDto memberDto, String moveCode) {
		 
		 String memberUid = userDetailsDto.getMemberDto().getMemberUid();
		 smmService.modifyStockMoveRegistrationDateAndUserByMemberUidAndMoveCode(memberUid, moveCode);
	 }
}
