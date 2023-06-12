package com.choongang.yeonsolution.product.wo.dao;

import java.util.List;

import com.choongang.yeonsolution.product.wo.domain.Wo;

public interface WoDao {
	public List<Wo> selectWo();
	public List<Wo> selectWoSearch(Wo searcher);
	public int updateWoDelete(String workOrderCode);
	public int updateWoConfirm(String workOrderCode);
	public int updateWoCancel(String workOrderCode);
	public int insertWo(Wo wo);
	public int updateWo(Wo wo);
	public Wo selectOneWo(String workOrderCode);
	public int updateWoClose(String workOrderCode);
	public int updateWoStartEndDate(Wo wo);
	public List<Wo> selectWoSearchFixed(Wo searcher);
	
}
