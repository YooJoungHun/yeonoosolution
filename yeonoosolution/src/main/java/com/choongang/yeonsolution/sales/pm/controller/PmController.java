package com.choongang.yeonsolution.sales.pm.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.choongang.yeonsolution.sales.pm.domain.PmCompanyDto;
import com.choongang.yeonsolution.sales.pm.domain.PmItemDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDataDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.PmSearch;
import com.choongang.yeonsolution.sales.pm.domain.PmStInDataDto;
import com.choongang.yeonsolution.sales.pm.domain.PmStInDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.PmStockInDto;
import com.choongang.yeonsolution.sales.pm.domain.PmWhDto;
import com.choongang.yeonsolution.sales.pm.service.PmService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/pm")
public class PmController {
	private final PmService pmService;
	
	@GetMapping("/order")
	public String orderForm() {
		return "sales/order";
	}
	
	@GetMapping("/order-list")
	@ResponseBody
	public List<PmOrdersDto> OrdersListBySearch(PmSearch search){
		log.info("search Data -> {}", search);
		List<PmOrdersDto> orderList = pmService.findOrdersBySearch(search);
		log.info("orderList -> {}", orderList.size());
		return orderList;
		
	}
	
	@GetMapping("/order/{orderCode}/details")
	@ResponseBody
	public List<PmOrdersDetailDto> ordersDetailListByOrderCode(@PathVariable String orderCode){
		
		List<PmOrdersDetailDto> ordersDetailList = pmService.findOrdersDetailByOrderCode(orderCode);
		return ordersDetailList;
	}
	
	@PatchMapping ("/order/{orderCode}")
	@ResponseBody
	public String ordersModifyByorderCode(@PathVariable String orderCode, @RequestParam String column, @RequestParam String data){
		String msg = pmService.modifyOrdersByOrderCode(orderCode, column, data);
		log.info("msg -> {}", msg);
		return msg;
	}
	
	@GetMapping("/customer-list")
	@ResponseBody
	public List<PmCompanyDto> companyListBySearch(@RequestParam String search){
		log.info("search -> {}", search);
		List<PmCompanyDto> companyList = pmService.findCompanyBySearch(search);
		return companyList;
	}
	@GetMapping("/item-list")
	@ResponseBody
	public List<PmItemDto> itemListBySearch(@RequestParam String search){
		log.info("search -> {}", search);
		List<PmItemDto> itemList = pmService.findItemBySearch(search);
		return itemList;
	}
	@PostMapping("/order-add")
	@ResponseBody
    public String orderAdd(@RequestBody PmOrdersDataDto orderData) {
        String resultMsg = pmService.addOrder(orderData);
        return resultMsg;
    }
    @PostMapping("/order-modify")
    @ResponseBody
    public String OrderSave(@RequestBody PmOrdersDataDto orderData) {
    	String resultMsg = pmService.modifyOrder(orderData);
    	return resultMsg;
    }
    
    
    @GetMapping("/stock-in")
    String stockInForm() {
    	return "sales/stock-in";
    }
    @GetMapping("/stock-in-list")
    @ResponseBody
    public List<PmStockInDto> stockInListBySearch(PmSearch search){
    	log.info("search Data -> {}", search);
    	List<PmStockInDto> stockinList = pmService.findStockInListBySearch(search);
    	return stockinList;
    	
    }
    
    @GetMapping("/stock-in/{inCode}/details")
    @ResponseBody
    public List<PmStInDetailDto> stockInDetailListByOrderCode(@PathVariable String inCode){
    	List<PmStInDetailDto> stockInDetailList = pmService.findStockInDetailByInCode(inCode);
    	return stockInDetailList;
    }
    
    @PatchMapping ("st-in/{inCode}")
    @ResponseBody
    public String stockInModifyByorderCode(@PathVariable String inCode, @RequestParam String column, @RequestParam String data){
    	String msg = pmService.modifyStockInByInCode(inCode, column, data);
    	log.info("msg -> {}", msg);
    	return msg;
    }
    @GetMapping("/wh-list")
    @ResponseBody
    public List<PmWhDto> whList() {
        List<PmWhDto> whList = pmService.findWhList();
        return whList;
    }
    
    @PostMapping("/st-in-add")
	@ResponseBody
    public String stInAdd(@RequestBody PmStInDataDto stInData) {
        String resultMsg = pmService.addStIn(stInData);
        return resultMsg;
    }
    
    @PostMapping("/st-in-modify")
    @ResponseBody
    public String stInSave(@RequestBody PmStInDataDto stInData) {
    	String resultMsg = pmService.modifyStIn(stInData);
    	return resultMsg;
    }
}
