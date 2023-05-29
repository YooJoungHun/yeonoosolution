package com.choongang.yeonsolution.sales.pm.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.sales.pm.dao.PmDao;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.Search;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class PmServiceImpl implements PmService{
	private final PmDao pmDao;

	@Override
	public List<OrdersDto> findOrdersBySearch(Search search) {
		List<OrdersDto> orderList = pmDao.selectOrdersBySearch(search);
		for(int i = 0; i < orderList.size(); i++) {
			orderList.get(i).setOrderDate(orderList.get(i).getOrderDate().substring(0, 10));
			orderList.get(i).setDueDate(orderList.get(i).getDueDate().substring(0, 10));
		}
		return orderList;
	}

	@Override
	public List<OrdersDetailDto> findOrdersDetailByOrderCode(String orderCode) {
		// TODO Auto-generated method stub
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

}
