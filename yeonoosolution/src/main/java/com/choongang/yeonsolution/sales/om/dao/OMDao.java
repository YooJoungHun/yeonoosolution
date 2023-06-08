package com.choongang.yeonsolution.sales.om.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.sales.om.domain.OMOrdersCompanyDto;
import com.choongang.yeonsolution.sales.om.domain.OMOrdersDetailDto;
import com.choongang.yeonsolution.sales.om.domain.OMOrdersDto;
import com.choongang.yeonsolution.sales.om.domain.OMOrdersItemDto;

@Repository
public interface OMDao {

	List<OMOrdersDto> selectPlaceOrderListByCompanyCode();

	int updateStatusToConfirmByOrderCode(OMOrdersDto ordersDto);

	int updateStatusToCancelByOrderCode(OMOrdersDto ordersDto);

	List<OMOrdersDetailDto> selectPlaceOrderDetailListByCompanyCode(String orderCode);

	int updateOrderTypeByorderCode(OMOrdersDto ordersDto);

	void insertReceiveOrder(OMOrdersDto ordersDto);

	int deleteReceiveOrderByOrderCode(String orderCode);

	int deleteReceiveOrderDetailByOrderCode(String orderCode);
	
	void insertReceiveOrderDetail(OMOrdersDetailDto ordersDetailDto);

	int updateOrderDateByorderCode(OMOrdersDto ordersDto);

	int updateDueDateByorderCode(OMOrdersDto ordersDto);

	int updateAmountByordersDetailDto(OMOrdersDetailDto ordersDetailDto);

	int updateItemStockUnitByorderCode(OMOrdersDetailDto ordersDetailDto);

	int updateEndYnByOrderDetailCode(OMOrdersDetailDto ordersDetailDto);

	int insertOdersToStOutByOrderCod(String orderCode);

	int insertOdersDetailToStOutDetailByOrderCod(String orderCode);

	int insertOdersToWOByOrderCode(String orderCode);

	String selectOrderStatusByOrderCode(String orderCode);

	List<OMOrdersCompanyDto> selectCustomerList();

	List<OMOrdersItemDto> selectItemList();

	int updateItemByordersDetailDto(OMOrdersItemDto ordersItemDto);

	int updateEmpidByOrderCode(OMOrdersDto ordersDto);

	int updateMemoByOrdersDetailDto(OMOrdersDetailDto ordersDetailDto);


}