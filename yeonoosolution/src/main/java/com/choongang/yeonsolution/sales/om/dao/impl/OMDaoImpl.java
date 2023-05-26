package com.choongang.yeonsolution.sales.om.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.sales.om.dao.OMDao;
import com.choongang.yeonsolution.sales.om.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class OMDaoImpl implements OMDao {

	private final SqlSession sqlSession;
	
	@Autowired
	public OMDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<OrdersDto> selectPlaceOrderListByCompanyCode() {
		// log.info("[selectPlaceOrderListByCompanyCode] companyCode -> {}", companyCode);
		
		List<OrdersDto> placeOrderList = null;
		
		try {
			placeOrderList = sqlSession.selectList("selectPlaceOrderListByCompanyCode");
		} catch (Exception e) {
			log.info("[selectPlaceOrderListByCompanyCode] placeOrderList Exception -> {}", e.getMessage());
		}
		
		return placeOrderList;
	}

	@Override
	public int updateStatusToConfirmByorderCode(String orderCode) {

		int orderStatus = 0;
		
		try {
			orderStatus = sqlSession.update("updateStatusToConfirmByorderCode", orderCode);
		} catch (Exception e) {
			log.info("[updateorderStatusByorderCode] orderStatus Exception -> {}", e.getMessage());
		}
		return orderStatus;
	}

	@Override
	public int updateStatusToCancelByorderCode(String orderCode) {
		int orderStatus = 0;
		
		try {
			orderStatus = sqlSession.update("updateStatusToCancelByorderCode", orderCode);
		} catch (Exception e) {
			log.info("[updateStatusToCancelByorderCode] orderStatus Exception -> {}", e.getMessage());
		}
		return orderStatus;
	}

	@Override
	public int updateOrderTypeByorderCode(String orderCode, OrdersDto ordersDto) {
		int orderType = 0;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orderCode", orderCode);
		params.put("ordersDto", ordersDto);
		
		try {
			orderType = sqlSession.update("updateOrderTypeByorderCode", params);
		} catch (Exception e) {
			log.info("[updateOrderTypeByorderCode] orderStatus Exception -> {}", e.getMessage());
		}
		return orderType;
	}
	
	@Override
	public void insertReceiveOrder(OrdersDto ordersDto) {
		// TODO Auto-generated method stub
		try {
			sqlSession.insert("insertReceiveOrder", ordersDto);
		} catch (Exception e) {
			log.info("[insertReceiveOrder] void Exception -> {}", e.getMessage());
		}
	}
	
	
	
	
	
	
	
	////
	
	@Override
	public List<OrdersDetailDto> selectPlaceOrderDetailListByCompanyCode(String orderCode) {
		log.info("[selectPlaceOrderDetailListByCompanyCode] orderCode -> {}", orderCode);
		
		List<OrdersDetailDto> placeOrderDetailList = null;
		
		try {
			placeOrderDetailList = sqlSession.selectList("selectPlaceOrderDetailListByCompanyCode", orderCode);
			log.info("[selectPlaceOrderListByCompanyCode] placeOrderDetailList.size() -> {}", placeOrderDetailList.size());
		} catch (Exception e) {
			log.info("[selectPlaceOrderListByCompanyCode] placeOrderDetailList Exception -> {}", e.getMessage());
		}
		
		return placeOrderDetailList;
	}

	

	

}
