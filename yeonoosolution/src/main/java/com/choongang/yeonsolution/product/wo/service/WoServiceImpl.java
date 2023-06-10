package com.choongang.yeonsolution.product.wo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.wo.dao.WoDao;
import com.choongang.yeonsolution.product.wo.domain.Wo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WoServiceImpl implements WoService {
	private final WoDao wod;
	
	@Override
	public List<Wo> findWo() {
		return wod.selectWo();
	}
	@Override
	public List<Wo> findWoSearch(Wo searcher) {
		return wod.selectWoSearch(searcher);
	}
	@Override
	public int modifyWoDelete(String workOrderCode) {
		return wod.updateWoDelete(workOrderCode);
	}
	@Override
	public int modifyWoConfirm(String workOrderCode) {
		return wod.updateWoConfirm(workOrderCode);
	}
	@Override
	public int modifyWoCancel(String workOrderCode) {
		return wod.updateWoCancel(workOrderCode);
	}
	@Override
	public int addWo(Wo wo) {
		return wod.insertWo(wo);
	}
	@Override
	public int modifyWo(Wo wo) {
		return wod.updateWo(wo);
	}
	@Override
	public Wo findOneWo(String workOrderCode) {
		return wod.selectOneWo(workOrderCode);
	}
	@Override
	public int modifyWoClose(String workOrderCode) {
		return wod.updateWoClose(workOrderCode);
	}
	@Override
	public int modifyWoStartEndDate(Wo wo) {
		return wod.updateWoStartEndDate(wo);
	}
	@Override
	public List<Wo> findWoSearchFixed(Wo searcher) {
		return wod.selectWoSearchFixed(searcher);
	}
}
