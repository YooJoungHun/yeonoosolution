package com.choongang.yeonsolution.product.is.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.product.is.domain.PaginationDto;
import com.choongang.yeonsolution.product.is.domain.WhDto;
import com.choongang.yeonsolution.product.is.domain.WhStockDetailDto;
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
	
	@GetMapping(value = "/product/is/item/{itemCode}")
	@ResponseBody
	public WhStockDetailDto isItemListByItemCode(@PathVariable String itemCode, WhStockDetailDto whStockDetailDto) {
		log.info("is Controller isItemListByItemCode() start");
		log.info("WhStockDetailDto : " + whStockDetailDto.toString());
		
		WhStockDetailDto returnWhStockDetailDto = isService.findIsItemListByItemCode(whStockDetailDto);
		log.info("returnWhStockDetailDto : " + returnWhStockDetailDto.toString());
		
		return returnWhStockDetailDto;
	}
	
	
	@GetMapping(value = "/product/is/bom")
	public String isBomList() {
		
		return "/product/inventory-status-bom";
	}
	
	@GetMapping(value = "/product/is/wh")
	public String isWhListByPagination(Model model, PaginationDto paginationDto) {
		log.info("is wh Controller isWhListByPagination() start");
		//창고 정보 조회용도 변수
		List<WhDto> whDtoWhList = isService.findIsWhDtoWhList();
		
		//페이징 처리를 한 창고별 품목 정보 변수
		Map<String, Object> whDtoMap = isService.findIsWhListByPagination(paginationDto);
		log.info("whDtoMap : " + whDtoMap.toString());
		
		model.addAttribute("whDtoWhList", whDtoWhList);
		model.addAttribute("whDtoMap", whDtoMap);
		
		return "/product/inventory-status-wh";
	}
	
	/*
	 * @GetMapping(value = "/product/is/wh/{whCode}") public List<WhDto>
	 * isWhListByWhCode(@PathVariable String whCode) { List<WhDto> whDtoList =
	 * isService.findIsWhListByWhCode(whCode);
	 * 
	 * return whDtoList; }
	 */
	
}
