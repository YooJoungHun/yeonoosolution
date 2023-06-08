package com.choongang.yeonsolution.sales.pm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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
@RequestMapping("/sales")
public class PmController {
	private final PmService pmService;
	
	@GetMapping("/order")
	public String orderForm() {
		return "sales/order.layout";
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
	public String ordersModifyByorderCode(PmOrdersDto pmOrdersDto, HttpSession session){
		String msg = pmService.modifyOrdersByOrderCode(pmOrdersDto, session);
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
    public String orderAdd(@RequestBody PmOrdersDataDto orderData, HttpSession session) {
		System.out.println(orderData.getOrder());
        String resultMsg = pmService.addOrder(orderData, session);
        return resultMsg;
    }
    @PostMapping("/order-modify")
    @ResponseBody
    public String OrderSave(@RequestBody PmOrdersDataDto orderData, HttpSession session) {
    	String resultMsg = pmService.modifyOrder(orderData, session);
    	return resultMsg;
    }
    
    
    @GetMapping("/stock-in")
    String stockInForm() {
    	return "sales/stock-in.layout";
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
    public String stockInModifyByorderCode(PmStockInDto pmStockInDto, HttpSession session){
    	String msg = pmService.modifyStockInByInCode(pmStockInDto, session);
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
    public String stInAdd(@RequestBody PmStInDataDto stInData, HttpSession session) {
        String resultMsg = pmService.addStIn(stInData, session);
        return resultMsg;
    }
    @PostMapping("/st-in-modify")
    @ResponseBody
    public String stInSave(@RequestBody PmStInDataDto stInData, HttpSession session) {
    	String resultMsg = pmService.modifyStIn(stInData, session);
    	return resultMsg;
    }
}
