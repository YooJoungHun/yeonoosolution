package com.choongang.yeonsolution.sales.pm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.choongang.yeonsolution.sales.pm.dao.PmDao;
import com.choongang.yeonsolution.sales.pm.domain.CompanyDto;
import com.choongang.yeonsolution.sales.pm.domain.ItemDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDataDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.Search;
import com.choongang.yeonsolution.sales.pm.domain.StInDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.StockInDto;
import com.choongang.yeonsolution.sales.pm.domain.WhDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@Transactional
@RequiredArgsConstructor
public class PmServiceImpl implements PmService{
	private final PmDao pmDao;

	@Override
	public List<OrdersDto> findOrdersBySearch(Search search) {
		List<OrdersDto> orderList = pmDao.selectOrdersBySearch(search);
		for(int i = 0; i < orderList.size(); i++) {
			if(orderList.get(i).getOrderDate() != null || !orderList.get(i).getOrderDate().equals("")) {
				orderList.get(i).setOrderDate(orderList.get(i).getOrderDate().substring(0, 10));
			}
			if(orderList.get(i).getDueDate() != null || !orderList.get(i).getDueDate().equals("")) {
				orderList.get(i).setDueDate(orderList.get(i).getDueDate().substring(0, 10));
			}
		}
		return orderList;
	}

	@Override
	public List<OrdersDetailDto> findOrdersDetailByOrderCode(String orderCode) {
		return pmDao.selectOrdersDetailByOrderCode(orderCode);
	}

	@Override
	public String modifyOrdersByOrderCode(String orderCode, String column, String data) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("orderCode", orderCode);
		map.put("column", column);
		map.put("data", data);
		int result = pmDao.updateOrdersByOrderCode(map);
		String msg = "";
		log.info("result -> {}",result);
		if(column.equals("deleteStatus")) {
			msg += "삭제 ";
		}else if(column.equals("orderStatus")) {
			if(data.equals("확정")) {
				msg += "발주확정 ";
			}else if(data.equals("저장")) {
				msg += "확정취소 ";
			}else {
				msg += "발주마감 ";
			}
		}
		if(result > 0 ) {
			msg += "되었습니다.";
		}else {
			msg = "되지 못했습니다. 잠시후 다시 시도해 주세요.";
		}
		return msg;
	}

	@Override
	public List<CompanyDto> findCompanyBySearch(String search) {
		return pmDao.selectCompanyBySearch(search);
	}

	@Override
	public List<ItemDto> findItemBySearch(String search) {
		return pmDao.selectItemyBySearch(search);
	}

	@Override
	public String addOrder(OrdersDataDto orderData) {
		OrdersDto order = orderData.getOrder();
        List<OrdersDetailDto> orderDetails = orderData.getOrderDetails();
        String orderCode = pmDao.insertOrder(order);
        int insertRow = 0;
        for(OrdersDetailDto orderDetail : orderDetails) {
        	orderDetail.setOrderDetailCode(orderCode);
        	insertRow += pmDao.insertOrdersDetail(orderDetail);
        }
        if(orderCode != null && insertRow == orderDetails.size()) {
        	return "저장 성공";
        }else {
        	return "저장 실패";
        }
	}

	@Override
	public String modifyOrder(OrdersDataDto orderData) {
		OrdersDto order = orderData.getOrder();
        List<OrdersDetailDto> orderDetails = orderData.getOrderDetails();
        int insertRow = 0;
		int orderUpdateResult = pmDao.updateOrder(order);
		if(orderUpdateResult > 0) {
			int orderDetailDel = pmDao.deleteOrderDetailByOrderCode(order.getOrderCode());
			for(OrdersDetailDto orderDetail : orderDetails) {
				insertRow += pmDao.insertOrdersDetail(orderDetail);
			}
		}if(insertRow == orderDetails.size()) {
        	return "수정 성공";
        }else {
        	return "수정 실패";
        }
	}

	
	
	/////////////////////////////////////////////////////////////////////////////
	// 입고
	
	
	@Override
	public List<StockInDto> findStockInListBySearch(Search search) {
		List<StockInDto> stockInList = pmDao.selectStockInListBySearch(search);
		for(int i = 0; i < stockInList.size(); i++) {
			if(stockInList.get(i).getInDate() != null || !stockInList.get(i).getInDate().equals("")) {
				stockInList.get(i).setInDate(stockInList.get(i).getInDate().substring(0, 10).replaceAll("/", "-"));
			}
		}
		return stockInList;
	}

	@Override
	public List<StInDetailDto> findStockInDetailByInCode(String inCode) {
		return pmDao.selectStockInDetailByInCode(inCode);
	}

	@Override
	public String modifyStockInByInCode(String inCode, String column, String data) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("inCode", inCode);
		map.put("column", column);
		map.put("data", data);
		int result = pmDao.updateStockInByInCode(map);
		String msg = "";
		log.info("result -> {}",result);
		if(column.equals("deleteStatus")) {
			msg += "삭제 ";
		}else if(column.equals("orderStatus")) {
			if(data.equals("확정")) {
				msg += "입고확정 ";
			}else if(data.equals("저장")) {
				msg += "확정취소 ";
			}else {
				msg += "발주마감 ";
			}
		}
		if(result > 0 ) {
			msg += "되었습니다.";
		}else {
			msg = "되지 못했습니다. 잠시후 다시 시도해 주세요.";
		}
		return msg;
	}

	@Override
	public List<WhDto> findWhList() {
		return pmDao.selectWh();
	}
}
