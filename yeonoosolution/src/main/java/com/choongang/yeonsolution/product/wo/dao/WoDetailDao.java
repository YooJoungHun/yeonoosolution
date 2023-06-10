package com.choongang.yeonsolution.product.wo.dao;

import java.util.List;
import java.util.Map;

import com.choongang.yeonsolution.product.wo.domain.WoDetail;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;

public interface WoDetailDao {
	public List<WoDetail> selectWoDetail(String workOrderCode);
	public int insertWoDetailWithResult(WoDetail woDetail);
	public void insertWoDetailWithCheck(Map<String, Object> param);
	public int deleteWoDetailWithId(Map<String, Object> data);
	
	// just for search
	public MemberDto selectMember(String memberUid);
}
