package com.choongang.yeonsolution.sales.pm.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.sales.pm.dao.PmDao;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.OrderSearch;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class PmServiceImpl implements PmService{
	private final PmDao pmDao;

	@Override
	public List<OrdersDto> findOrders(OrderSearch search) {
		return pmDao.selectOrders(search);
	}

	@Override
	public List<OrdersDetailDto> findOrdersDetailByOrderCode(String orderCode) {
		// TODO Auto-generated method stub
		return pmDao.selectOrdersDetailByOrderCode(orderCode);
	}

}
