package com.choongang.yeonsolution.product.wo.service;

import java.util.List;

import com.choongang.yeonsolution.product.wo.domain.Wo;

public interface WoService {
	public List<Wo> findWo();
	public List<Wo> findWoSearch(Wo searcher);
	public int modifyWoDelete(String workOrderCode);
	public int modifyWoConfirm(String workOrderCode);
	public int modifyWoCancel(String workOrderCode);
	
}
