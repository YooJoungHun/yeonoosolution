package com.choongang.yeonsolution.product.wo.service;

import java.util.List;

import com.choongang.yeonsolution.product.wo.domain.Wo;

public interface WoService {
	public List<Wo> findWo();
	public List<Wo> findWoSearch(Wo searcher);
	public int modifyWoDelete(String workOrderCode);
	public int modifyWoConfirm(String workOrderCode);
	public int modifyWoCancel(String workOrderCode);
	public int addWo(Wo wo);
	public int modifyWo(Wo wo);
	public Wo findOneWo(String workOrderCode);
	public int modifyWoClose(String workOrderCode);
	public int modifyWoStartEndDate(Wo wo);
	public List<Wo> findWoSearchFixed(Wo searcher);
	
}
