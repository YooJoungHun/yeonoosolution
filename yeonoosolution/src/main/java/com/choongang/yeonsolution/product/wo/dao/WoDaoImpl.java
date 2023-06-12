package com.choongang.yeonsolution.product.wo.dao;

import lombok.RequiredArgsConstructor;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.wo.domain.Wo;

@Repository
@RequiredArgsConstructor
public class WoDaoImpl implements WoDao {
	private final SqlSession session;
	
	@Override
	public List<Wo> selectWo() {
		return session.selectList("selectWo");
	}
	@Override
	public List<Wo> selectWoSearch(Wo searcher) {
		return session.selectList("selectWoSearch", searcher);
	}
	@Override
	public int updateWoDelete(String workOrderCode) {
		return session.update("updateWoDelete", workOrderCode);
	}
	@Override
	public int updateWoConfirm(String workOrderCode) {
		return session.update("updateWoConfirm", workOrderCode);
	}
	@Override
	public int updateWoCancel(String workOrderCode) {
		return session.update("updateWoCancel", workOrderCode);
	}
	@Override
	public int insertWo(Wo wo) {
		return session.insert("insertWo", wo);
	}
	@Override
	public int updateWo(Wo wo) {
		return session.update("updateWo", wo);
	}
	@Override
	public Wo selectOneWo(String workOrderCode) {
		return session.selectOne("selectOneWo", workOrderCode);
	}
	@Override
	public int updateWoClose(String workOrderCode) {
		return session.update("updateWoClose", workOrderCode);
	}
	@Override
	public int updateWoStartEndDate(Wo wo) {
		return session.update("updateWoStartEndDate", wo);
	}
	@Override
	public List<Wo> selectWoSearchFixed(Wo searcher) {
		return session.selectList("selectWoSearchFixed", searcher);
	}
}
