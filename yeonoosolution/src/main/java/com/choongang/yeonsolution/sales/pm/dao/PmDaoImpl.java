package com.choongang.yeonsolution.sales.pm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.sales.pm.domain.CompanyDto;
import com.choongang.yeonsolution.sales.pm.domain.ItemDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.OrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.Search;
import com.choongang.yeonsolution.sales.pm.domain.StInDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.StockInDto;
import com.choongang.yeonsolution.sales.pm.domain.WhDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class PmDaoImpl implements PmDao{
	private final SqlSession session;

	@Override
	public List<OrdersDto> selectOrdersBySearch(Search search) {
		
		List<OrdersDto> orderList = session.selectList("selectOrdersBySearch", search);
		log.info("orderList.size() -> {}",orderList.size());
		return orderList;
	}

	@Override
	public List<OrdersDetailDto> selectOrdersDetailByOrderCode(String orderCode) {
		log.info("orderCode -> {}", orderCode);
		List<OrdersDetailDto> ordersDetailList = session.selectList("selectOrdersDetailByOrderCode", orderCode);
		log.info("ordersDetailList.size() -> {}",ordersDetailList.size());
		return ordersDetailList;
	}

	@Override
	public int updateOrdersByOrderCode(Map<String, String> map) {
		log.info("updateOrdersByOrderCode map -> {}", map);
		int result = session.update("updateOrdersByOrderCode", map);
		return result;
	}

	@Override
	public List<CompanyDto> selectCompanyBySearch(String search) {
		List<CompanyDto> companyList = session.selectList("selectCompanyBySearch", search);
		return companyList;
	}

	@Override
	public List<ItemDto> selectItemyBySearch(String search) {
		List<ItemDto> itemList = session.selectList("selectItemBySearch", search);
		return itemList;
	}

	@Override
	public String insertOrder(OrdersDto order) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("companyCode", order.getCompanyCode());
		parameters.put("customerCode", order.getCustomerCode());
		parameters.put("receiveOrderType", order.getReceiveOrderType());
		parameters.put("orderDate", order.getOrderDate());
		parameters.put("orderEmpid", order.getOrderEmpid());
		parameters.put("deliveryPlan", order.getDeliveryPlan());
		parameters.put("dueDate", order.getDueDate());
		parameters.put("memo", order.getMemo());
		parameters.put("regUser", order.getRegUser());
		parameters.put("updateUser", order.getUpdateUser());
		
		session.selectOne("orders.insertOrder", parameters);

		String orderCode = (String) parameters.get("orderCode");
		
		System.out.println("orderCode -> " +orderCode);
		return orderCode;
	}

	@Override
	public int insertOrdersDetail(OrdersDetailDto orderDetail) {
		int result = session.insert("insertOrdersDetail", orderDetail);
		return result;
	}

	@Override
	public int updateOrder(OrdersDto order) {
		int result = session.update("updateOrder", order);
		return result;
	}

	@Override
	public int deleteOrderDetailByOrderCode(String orderCode) {
		int result = session.delete("deleteOrderDetailByOrderCode", orderCode);
		return result;
	}

	/////////////////////////////////////////////////////////////////////////////
	
	@Override
	public List<StockInDto> selectStockInListBySearch(Search search) {
		List<StockInDto> stockInList = session.selectList("selectStockInListBySearch", search);
		log.info("stockInList.size() -> {}",stockInList.size());
		return stockInList;
	}

	@Override
	public List<StInDetailDto> selectStockInDetailByInCode(String inCode) {
		log.info("inCode -> {}", inCode);
		List<StInDetailDto> stockInDetailList = session.selectList("selectStockInDetailByInCode", inCode);
		log.info("stockInDetailList.size() -> {}",stockInDetailList.size());
		return stockInDetailList;
	}

	@Override
	public int updateStockInByInCode(Map<String, Object> map) {
		log.info("updateStockInByInCode map -> {}", map);
		int result = session.update("updateStockInByInCode", map);
		return result;
	}

	@Override
	public List<WhDto> selectWh() {
		List<WhDto> whList = session.selectList("selectWh");
		log.info("whList -> {}", whList);
		return whList;
	}
	// 재고 추가
	@Override
	public void updateWhStockDetailBystInDetail(Map<String, Object> map) {
		session.selectOne("orders.updateWhStockDetailBystInDetail", map);
	}
	// 재고 빼기
	@Override
	public void updateWhStockDetailBystInDetail(StInDetailDto stInDetail) {
		session.update("updateWhStockDetailBystInDetailmius", stInDetail);
		
	}

	@Override
	public String insertStIn(StockInDto stIn) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("orderCode", stIn.getOrderCode());
		parameters.put("companyCode", stIn.getCompanyCode());
		parameters.put("customerCode", stIn.getCustomerCode());
		parameters.put("inDate", stIn.getInDate());
		parameters.put("regUser", stIn.getRegUser());
		parameters.put("updateUser", stIn.getUpdateUser());
		parameters.put("memo", stIn.getMemo());
		
		session.selectOne("orders.insertStIn", parameters);

		String inCode = (String) parameters.get("inCode");
		
		System.out.println("inCode -> " + inCode);
		return inCode;
	
	}

	@Override
	public int insertStInDetail(StInDetailDto stInDetail) {
		int result = session.insert("insertStInDetail", stInDetail);
		return result;
	}

	@Override
	public int updateStIn(StockInDto stIn) {
		int result = session.update("updateStIn", stIn);
		return result;
	}

	@Override
	public int deleteStInDetailByInCode(String inCode) {
		int result = session.delete("deleteStInDetailByOrderCode", inCode);
		return result;
	}

}
