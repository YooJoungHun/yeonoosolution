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

import com.choongang.yeonsolution.sales.pm.domain.CompanyDto;
import com.choongang.yeonsolution.sales.pm.domain.ItemDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDataDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.Search;
import com.choongang.yeonsolution.sales.pm.domain.StInDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.StockInDto;
import com.choongang.yeonsolution.sales.pm.domain.WhDto;
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
	public List<OrdersDto> OrdersListBySearch(Search search){
		log.info("search Data -> {}", search);
		List<OrdersDto> orderList = pmService.findOrdersBySearch(search);
		log.info("orderList -> {}", orderList.size());
		return orderList;
		
	}
	
	@GetMapping("/order/{orderCode}/details")
	@ResponseBody
	public List<OrdersDetailDto> ordersDetailListByOrderCode(@PathVariable String orderCode){
		
		List<OrdersDetailDto> ordersDetailList = pmService.findOrdersDetailByOrderCode(orderCode);
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
	public List<CompanyDto> companyListBySearch(@RequestParam String search){
		log.info("search -> {}", search);
		List<CompanyDto> companyList = pmService.findCompanyBySearch(search);
		return companyList;
	}
	@GetMapping("/item-list")
	@ResponseBody
	public List<ItemDto> itemListBySearch(@RequestParam String search){
		log.info("search -> {}", search);
		List<ItemDto> itemList = pmService.findItemBySearch(search);
		return itemList;
	}
	@PostMapping("/order-add")
	@ResponseBody
    public String orderAdd(@RequestBody OrdersDataDto orderData) {
        String resultMsg = pmService.addOrder(orderData);
        return resultMsg;
    }
    @PostMapping("/order-modify")
    @ResponseBody
    public String OrderSave(@RequestBody OrdersDataDto orderData) {
    	String resultMsg = pmService.modifyOrder(orderData);
    	return resultMsg;
    }
    
    
    @GetMapping("/stock-in")
    String stockInForm() {
    	return "sales/stock-in";
    }
    @GetMapping("/stock-in-list")
    @ResponseBody
    public List<StockInDto> stockInListBySearch(Search search){
    	log.info("search Data -> {}", search);
    	List<StockInDto> stockinList = pmService.findStockInListBySearch(search);
    	return stockinList;
    	
    }
    
    @GetMapping("/stock-in/{inCode}/details")
    @ResponseBody
    public List<StInDetailDto> stockInDetailListByOrderCode(@PathVariable String inCode){
    	///////////////////////////////
    	List<StInDetailDto> stockInDetailList = pmService.findStockInDetailByInCode(inCode);
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
    public List<WhDto> whList() {
        List<WhDto> whList = pmService.findWhList();
        return whList;
    }
}
