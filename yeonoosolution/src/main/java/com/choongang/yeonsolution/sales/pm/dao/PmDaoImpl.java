package com.choongang.yeonsolution.sales.pm.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.sales.pm.domain.PmCompanyDto;
import com.choongang.yeonsolution.sales.pm.domain.PmItemDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.PmOrdersDto;
import com.choongang.yeonsolution.sales.pm.domain.PmSearch;
import com.choongang.yeonsolution.sales.pm.domain.PmStInDetailDto;
import com.choongang.yeonsolution.sales.pm.domain.PmStockInDto;
import com.choongang.yeonsolution.sales.pm.domain.PmWhDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class PmDaoImpl implements PmDao{
	private final SqlSession session;

	@Override
	public List<PmOrdersDto> selectOrdersBySearch(PmSearch search) {
		
		List<PmOrdersDto> orderList = session.selectList("selectPmOrdersBySearch", search);
		log.info("orderList.size() -> {}",orderList.size());
		return orderList;
	}

	@Override
	public List<PmOrdersDetailDto> selectOrdersDetailByOrderCode(String orderCode) {
		log.info("orderCode -> {}", orderCode);
		List<PmOrdersDetailDto> ordersDetailList = session.selectList("selectPmOrdersDetailByOrderCode", orderCode);
		log.info("ordersDetailList.size() -> {}",ordersDetailList.size());
		return ordersDetailList;
	}

	@Override
	public int updateOrdersByOrderCode(PmOrdersDto pmOrdersDto) {
		log.info("updateOrdersByOrderCode pmOrdersDto -> {}", pmOrdersDto);
		int result = session.update("updatePmOrdersByOrderCode", pmOrdersDto);
		return result;
	}

	@Override
	public List<PmCompanyDto> selectCompanyBySearch(String search) {
		List<PmCompanyDto> companyList = session.selectList("selectPmCompanyBySearch", search);
		return companyList;
	}

	@Override
	public List<PmItemDto> selectItemyBySearch(String search) {
		List<PmItemDto> itemList = session.selectList("selectPmItemBySearch", search);
		return itemList;
	}

	@Override
	public String insertOrder(PmOrdersDto order) {
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
		
		session.selectOne("orders.insertPmOrder", parameters);

		String orderCode = (String) parameters.get("orderCode");
		
		System.out.println("orderCode -> " +orderCode);
		return orderCode;
	}

	@Override
	public int insertOrdersDetail(PmOrdersDetailDto orderDetail) {
		int result = session.insert("insertPmOrdersDetail", orderDetail);
		return result;
	}

	@Override
	public int updateOrder(PmOrdersDto order) {
		int result = session.update("updatePmOrder", order);
		return result;
	}

	@Override
	public int deleteOrderDetailByOrderCode(String orderCode) {
		int result = session.delete("deletePmOrderDetailByOrderCode", orderCode);
		return result;
	}

	@Override
	public List<PmStockInDto> selectStockInListBySearch(PmSearch search) {
		List<PmStockInDto> stockInList = session.selectList("selectPmStockInListBySearch", search);
		log.info("stockInList.size() -> {}",stockInList.size());
		return stockInList;
	}

	@Override
	public List<PmStInDetailDto> selectStockInDetailByInCode(String inCode) {
		log.info("inCode -> {}", inCode);
		List<PmStInDetailDto> stockInDetailList = session.selectList("selectPmStockInDetailByInCode", inCode);
		log.info("stockInDetailList.size() -> {}",stockInDetailList.size());
		return stockInDetailList;
	}

	@Override
	public int updateStockInByInCode(PmStockInDto pmStockInDto) {
		log.info("updateStockInByInCode pmStockInDto -> {}", pmStockInDto);
		int result = session.update("updatePmStockInByInCode", pmStockInDto);
		return result;
	}

	@Override
	public List<PmWhDto> selectWh() {
		List<PmWhDto> whList = session.selectList("selectPmWh");
		log.info("whList -> {}", whList);
		return whList;
	}
	// 재고 추가
	@Override
	public void updateWhStockDetailBystInDetail(Map<String, Object> map) {
		session.selectOne("orders.updatePmWhStockDetailBystInDetail", map);
	}
	// 재고 빼기
	@Override
	public void updateWhStockDetailBystInDetail(PmStInDetailDto stInDetail) {
		session.update("updatePmWhStockDetailBystInDetailmius", stInDetail);
		
	}

	@Override
	public String insertStIn(PmStockInDto stIn) {
		Map<String, Object> parameters = new HashMap<>();
		parameters.put("orderCode", stIn.getOrderCode());
		parameters.put("companyCode", stIn.getCompanyCode());
		parameters.put("customerCode", stIn.getCustomerCode());
		parameters.put("inDate", stIn.getInDate());
		parameters.put("regUser", stIn.getRegUser());
		parameters.put("updateUser", stIn.getUpdateUser());
		parameters.put("memo", stIn.getMemo());
		
		session.selectOne("orders.insertPmStIn", parameters);

		String inCode = (String) parameters.get("inCode");
		
		System.out.println("inCode -> " + inCode);
		return inCode;
	
	}

	@Override
	public int insertStInDetail(PmStInDetailDto stInDetail) {
		int result = session.insert("insertPmStInDetail", stInDetail);
		return result;
	}

	@Override
	public int updateStIn(PmStockInDto stIn) {
		int result = session.update("updatePmStIn", stIn);
		return result;
	}

	@Override
	public int deleteStInDetailByInCode(String inCode) {
		int result = session.delete("deletePmStInDetailByOrderCode", inCode);
		return result;
	}

}
