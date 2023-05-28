package com.choongang.yeonsolution.sales.pm.service;

import java.util.List;

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
	public String modifyOrdersByorderCode(String orderCode) {
		int result = pmDao.updateOrdersByOrderCode(orderCode);
		log.info("result -> {}",result);
		if(result > 0) {
			return "삭제 성공";
		}else {
			return "삭제 실패";
		}
	}

}
