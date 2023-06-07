package com.choongang.yeonsolution.product.wo.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.wo.domain.WoDetail;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class WoDetailDaoImpl implements WoDetailDao {
	private final SqlSession session;
	
	@Override
	public List<WoDetail> selectWoDetail(String workOrderCode) {
		return session.selectList("selectWoDetail", workOrderCode);
	}
}
