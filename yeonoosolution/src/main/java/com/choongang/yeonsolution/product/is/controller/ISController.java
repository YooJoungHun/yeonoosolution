package com.choongang.yeonsolution.product.is.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.product.is.domain.IsBomDto;
import com.choongang.yeonsolution.product.is.domain.IsPaginationDto;
import com.choongang.yeonsolution.product.is.domain.IsWhDto;
import com.choongang.yeonsolution.product.is.domain.IsWhStockDetailDto;
import com.choongang.yeonsolution.product.is.service.ISService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ISController {
	private final ISService isService;
	
	@GetMapping(value = "/product/is/item")
	public String isItemList() {
		
		return "/product/inventory-status-item";
	}
	
	@GetMapping(value = "/product/is/item/{itemName}")
	@ResponseBody
	public List<IsWhStockDetailDto> isItemListByItemCode(@PathVariable String itemName, IsWhStockDetailDto whStockDetailDto) {
		log.info("is Controller isItemListByItemCode() start");
		log.info("WhStockDetailDto : " + whStockDetailDto.toString());
		
		List<IsWhStockDetailDto> whStockDetailDtoList= isService.findIsItemListByItemCode(whStockDetailDto);
		log.info("whStockDetailDtoList : " + whStockDetailDtoList.toString());
		
		return whStockDetailDtoList;
	}
	
	
	@GetMapping(value = "/product/is/bom")
	public String isBomList() {
		
		return "/product/inventory-status-bom";
	}
	
	@GetMapping(value = "/product/is/bom/{itemName}")
	@ResponseBody
	public List<IsBomDto> isBomListByItemNameAndItemType(@PathVariable String itemName, IsBomDto isBomDto){
		log.info("is bom Controller isBomListByItemNameAndItemType() start");
		log.info("isBomDto parameters : " + isBomDto);
		
		List<IsBomDto> isBomDtoList = isService.findIsBomListByItemNameAndItemType(isBomDto);
		log.info("controller isBomDtoList : " + isBomDtoList.toString());
		
		return isBomDtoList;
	}
	
	@GetMapping(value = "/product/is/wh")
	public String isWhListByPagination(Model model, IsPaginationDto paginationDto) {
		log.info("is wh Controller isWhListByPagination() start");
		//창고 정보 조회용도 변수
		List<IsWhDto> whDtoWhList = isService.findIsWhDtoWhList();
		
		//페이징 처리를 한 창고별 품목 정보 변수
		Map<String, Object> whDtoMap = isService.findIsWhListByPagination(paginationDto);
		log.info("whDtoMap : " + whDtoMap.toString());
		
		model.addAttribute("whDtoWhList", whDtoWhList);
		model.addAttribute("whDtoMap", whDtoMap);
		
		return "/product/inventory-status-wh";
	}
		
	@GetMapping(value = "/product/is/wh/{whCode}")
	public String isWhListByWhCode(@PathVariable String whCode, IsPaginationDto paginationDto, Model model) {
		log.info("is wh Controller isWhListByWhCode() start");
		List<IsWhDto> whDtoWhList = isService.findIsWhDtoWhList();
		
		Map<String, Object> whDtoMap = isService.findIsWhListByWhCode(whCode, paginationDto);
		log.info("whDtoMap : " + whDtoMap.toString());
		
		model.addAttribute("whDtoMap", whDtoMap);
		model.addAttribute("whDtoWhList", whDtoWhList);
	  
		return "/product/inventory-status-wh-detail";
	}
	
	@GetMapping(value = "/main")
	public String main(HttpSession session, Model model) {
		log.info("main page start");
		
		Map<String, Object> mainPageMap = isService.findInfoForMainPage(session);
		model.addAttribute("mainPageMap", mainPageMap);
		log.info("mainPageMap : " + mainPageMap);
		
		return "/product/main";
	}
}
