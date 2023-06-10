package com.choongang.yeonsolution.product.wo.service;

import java.util.List;
import java.util.Map;

import com.choongang.yeonsolution.product.wo.domain.WoDetail;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;

public interface WoDetailService {
	public List<WoDetail> findWoDetail(String workOrderCode);
	public int addWoDetailWithResult(WoDetail woDetail);
	public void addWoDetailWithCheck(Map<String, Object> param);
	public int removeWoDetailWithId(Map<String, Object> data);
	
	// for just search
	public MemberDto findMemberByUid(String memberUid);
}
