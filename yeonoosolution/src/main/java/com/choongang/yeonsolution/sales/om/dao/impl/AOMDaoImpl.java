package com.choongang.yeonsolution.sales.om.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.sales.om.dao.AOMDao;
import com.choongang.yeonsolution.sales.om.domain.OMOrdersAOMDto;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class AOMDaoImpl implements AOMDao {

	private final SqlSession sqlSession;
	
	@Autowired
	public AOMDaoImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<OMOrdersAOMDto> selectReceiveOrderListByCompanyCode() {
		List<OMOrdersAOMDto> receiveOrderList = null;
		
		try {
			receiveOrderList = sqlSession.selectList("selectReceiveOrderListByCompanyCode");
		} catch (Exception e) {
			log.info("[selectReceiveOrderListByCompanyCode] receiveOrderList Exception -> {}", e.getMessage());
		}
		log.info("[selectReceiveOrderListByCompanyCode] receiveOrderList.size() -> {}", receiveOrderList.size());
		return receiveOrderList;
	}

	@Override
	public List<OMOrdersAOMDto> selectSemiManufacturesListByCompanyCode(String orderCode) {
		List<OMOrdersAOMDto> semiManufacturesList = null;
		
		try {
			semiManufacturesList = sqlSession.selectList("selectSemiManufacturesListByCompanyCode", orderCode);
		} catch (Exception e) {
			log.info("[selectSemiManufacturesListByCompanyCode] semiManufacturesList Exception -> {}", e.getMessage());
		}
		log.info("[selectSemiManufacturesListByCompanyCode] semiManufacturesList.size() -> {}", semiManufacturesList.size());
		return semiManufacturesList;	}
	
	}
