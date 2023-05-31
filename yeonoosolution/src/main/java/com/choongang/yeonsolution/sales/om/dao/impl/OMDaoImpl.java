package com.choongang.yeonsolution.sales.om.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.sales.om.dao.OMDao;
import com.choongang.yeonsolution.sales.om.domain.OrdersCompanyDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersDto;
import com.choongang.yeonsolution.sales.om.domain.OrdersItemDto;

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
	public int updateOrderDateByorderCode(OrdersDto ordersDto) {
		log.info("[updateOrderDateByorderCode] ordersDto.getOrderDate() -> {}", ordersDto.getOrderDate());
		log.info("[updateOrderDateByorderCode] ordersDto.getOrderDate() -> {}", ordersDto.getOrderCode());

		int updatedOrderDate = 0;
		
		try {
			updatedOrderDate = sqlSession.update("updateOrderDateByOrderCode", ordersDto);
		} catch (Exception e) {
			log.info("[updateOrderDateByorderCode] updatedOrderDate Exception -> {}", e.getMessage());
		}
		return updatedOrderDate;
	}
	
	@Override
	public int updateDueDateByorderCode(OrdersDto ordersDto) {
		log.info("[updateDueDateByorderCode] ordersDto.getDueDate() -> {}", ordersDto.getDueDate());
		log.info("[updateDueDateByorderCode] ordersDto.getOrderCode() -> {}", ordersDto.getOrderCode());

		int updatedDueDate = 0;
		
		try {
			updatedDueDate = sqlSession.update("updateDueDateByOrderCode", ordersDto);
		} catch (Exception e) {
			log.info("[updateDueDateByorderCode] updatedDueDate Exception -> {}", e.getMessage());
		}
		return updatedDueDate;
	}
	
	@Override
	public int updateEmpidByOrderCode(OrdersDto ordersDto) {
		log.info("[updateEmpidByOrderCode] ordersDto.getOrderCode() -> {}", ordersDto.getOrderCode());
		log.info("[updateEmpidByOrderCode] ordersDto.getOrderEmpid() -> {}", ordersDto.getOrderEmpid());

		int updatedEmpid = 0;
		
		try {
			updatedEmpid = sqlSession.update("updateEmpidByOrderCode", ordersDto);
		} catch (Exception e) {
			log.info("[updateEmpidByOrderCode] updatedEmpid Exception -> {}", e.getMessage());
		}
		return updatedEmpid;
	}
	
	@Override
	public void insertReceiveOrder(OrdersDto ordersDto) {
		log.info("[insertReceiveOrder] ordersDto.toString() -> {}", ordersDto.toString());
		try {
			sqlSession.insert("insertReceiveOrder", ordersDto);
		} catch (Exception e) {
			log.info("[insertReceiveOrder] void Exception -> {}", e.getMessage());
		}
	}
	
	@Override
	public int deleteReceiveOrderByOrderCode(String orderCode) {
		log.info("[deleteReceiveOrderByOrderCode] ordersDto.toString() -> {}", orderCode);
		int receiveOrderDelete = 0;
		
		try {
			receiveOrderDelete = sqlSession.delete("deleteReceiveOrderByOrderCode", orderCode);
			log.info("[deleteReceiveOrderByOrderCode] receiveOrderDelete -> {}", receiveOrderDelete);
		} catch (Exception e) {
			log.info("[deleteReceiveOrderByOrderCode] receiveOrderDelete Exception -> {}", e.getMessage());
		}
		
		return receiveOrderDelete;
	}
	
	@Override
	public int deleteReceiveOrderDetailByOrderCode(String orderCode) {
		int receiveOrderDetailDelete = 0;
		
		try {
			receiveOrderDetailDelete = sqlSession.delete("deleteReceiveOrderDetailByOrderCode", orderCode);
			log.info("[deleteReceiveOrderByOrderCode] receiveOrderDelete -> {}", receiveOrderDetailDelete);
		} catch (Exception e) {
			log.info("[deleteReceiveOrderDetailByOrderCode] receiveOrderDelete Exception -> {}", e.getMessage());
		}
		
		return receiveOrderDetailDelete;
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

	@Override
	public void insertReceiveOrderDetail(OrdersDetailDto ordersDetailDto) {
		log.info("[insertReceiveOrderDetail] ordersDto.toString() -> {}", ordersDetailDto.toString());
		try {
			sqlSession.insert("insertReceiveOrderDetail", ordersDetailDto);
		} catch (Exception e) {
			log.info("[insertReceiveOrderDetail] void Exception -> {}", e.getMessage());
		}
		
	}

	@Override
	public int updateAmountByordersDetailDto(OrdersDetailDto ordersDetailDto) {
		log.info("[updateAmountByordersDetailDto] ordersDetailDto.toString() -> {}", ordersDetailDto.toString());

		int updatedAmount = 0;
		
		try {
			updatedAmount = sqlSession.update("updateAmountByordersDetailDto", ordersDetailDto);
		} catch (Exception e) {
			log.info("[updateAmountByordersDetailDto] updatedDueDate Exception -> {}", e.getMessage());
		}
		return updatedAmount;
	}

	@Override
	public int updateItemStockUnitByorderCode(OrdersDetailDto ordersDetailDto) {
		log.info("[updateItemStockUnitByorderCode] ordersDetailDto.toString() -> {}", ordersDetailDto.toString());

		int modifiedUnit = 0;
		
		try {
			modifiedUnit = sqlSession.update("updateItemStockUnitByorderCode", ordersDetailDto);
		} catch (Exception e) {
			log.info("[updateItemStockUnitByorderCode] modifiedUnit Exception -> {}", e.getMessage());
		}
		return modifiedUnit;
	}

	@Override
	public int updateEndYnByOrderDetailCode(OrdersDetailDto ordersDetailDto) {
		log.info("[updateEndYnByOrderDetailCode] ordersDetailDto.toString() -> {}", ordersDetailDto.toString());

		int modifiedEndYn = 0;
		
		try {
			modifiedEndYn = sqlSession.update("updateEndYnByOrderDetailCode", ordersDetailDto);
		} catch (Exception e) {
			log.info("[updateEndYnByOrderDetailCode] modifiedEndYn Exception -> {}", e.getMessage());
		}
		return modifiedEndYn;
	}
	
	@Override
	public String selectOrderStatusByOrderCode(String orderCode) {

		String OrderStatus = null;
		
		try {
			OrderStatus = sqlSession.selectOne("selectOrderStatusByOrderCode", orderCode);
		} catch (Exception e) {
			log.info("[selectOrderStatusByOrderCode] OrderStatus Exception -> {}", e.getMessage());
		}
		
		return OrderStatus;
	}

	@Override
	public int insertOdersToStOutByOrderCod(String orderCode) {
		log.info("[insertOdersToStOutByOrderCod] orderCode -> {}", orderCode);
		int stockOutReg = 0;
		try {
			stockOutReg = sqlSession.insert("insertOdersToStOutByOrderCod", orderCode);
		} catch (Exception e) {
			log.info("[insertOdersToStOutByOrderCod] void Exception -> {}", e.getMessage());
		}
		log.info("[insertOdersToStOutByOrderCod] stockOutReg -> {}", stockOutReg);
		
		return stockOutReg;
	}

	@Override
	public int insertOdersDetailToStOutDetailByOrderCod(String orderCode) {
		log.info("[insertOdersDetailToStOutDetailByOrderCod] orderCode -> {}", orderCode);
		int stockOutDetailReg = 0;
		try {
			stockOutDetailReg = sqlSession.insert("insertOdersDetailToStOutDetailByOrderCod", orderCode);
		} catch (Exception e) {
			log.info("[insertOdersDetailToStOutDetailByOrderCod] void Exception -> {}", e.getMessage());
		}
		
		log.info("[insertOdersDetailToStOutDetailByOrderCod] stockOutReg -> {}", stockOutDetailReg);
		
		return stockOutDetailReg;
	}

	@Override
	public int insertOdersToWOByOrderCode(String orderCode) {
		log.info("[insertOdersToWOByOrderCode] orderCode -> {}", orderCode);
		int WOReg = 0;
		try {
			WOReg = sqlSession.insert("insertOdersToWOByOrderCode", orderCode);
			
		} catch (Exception e) {
			log.info("[insertOdersToWOByOrderCode] void Exception -> {}", e.getMessage());
		}
		
		log.info("[insertOdersToWOByOrderCode] WOReg -> {}", WOReg);
		
		return WOReg;
	}

	@Override
	public List<OrdersCompanyDto> selectCustomerList() {
		List<OrdersCompanyDto> customerList = null;
		
		try {
			customerList = sqlSession.selectList("selectCustomerList");
		} catch (Exception e) {
			log.info("[selectCustomerList] customerList Exception -> {}", e.getMessage());
		}
		
		return customerList;
	}

	@Override
	public List<OrdersItemDto> selectItemList() {
		List<OrdersItemDto> itemList = null;
		
		try {
			itemList = sqlSession.selectList("selectItemList");
			log.info("[selectItemList] itemList.size() -> {}", itemList.size());
		} catch (Exception e) {
			log.info("[selectItemList] customerList Exception -> {}", e.getMessage());
		}
		
		return itemList;
	}

	@Override
	public int updateItemByordersDetailDto(OrdersItemDto ordersItemDto) {
		log.info("[updateItemByordersDetailDto] ordersItemDto.toString() -> {}", ordersItemDto.toString());

		int updatedItem = 0;
		
		try {
			updatedItem = sqlSession.update("updateItemByordersDetailDto", ordersItemDto);
		} catch (Exception e) {
			log.info("[updateAmountByordersDetailDto] updatedDueDate Exception -> {}", e.getMessage());
		}
		return updatedItem;
	}

	@Override
	public int updateMemoByOrdersDetailDto(OrdersDetailDto ordersDetailDto) {
		log.info("[updateMemoByOrdersDetailDto] ordersItemDto.toString() -> {}", ordersDetailDto.toString());

		int updatedMemo = 0;
		
		try {
			updatedMemo = sqlSession.update("updateMemoByOrdersDetailDto", ordersDetailDto);
		} catch (Exception e) {
			log.info("[updateMemoByOrdersDetailDto] updatedMemo Exception -> {}", e.getMessage());
		}
		return updatedMemo;
	}

	


}
