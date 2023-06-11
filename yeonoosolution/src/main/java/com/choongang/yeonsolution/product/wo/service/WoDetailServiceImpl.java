package com.choongang.yeonsolution.product.wo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.choongang.yeonsolution.product.wo.dao.WoDetailDao;
import com.choongang.yeonsolution.product.wo.domain.WoDetail;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WoDetailServiceImpl implements WoDetailService {
	private final WoDetailDao woDetailDao;
	
	@Override
	public List<WoDetail> findWoDetail(String workOrderCode) {
		return woDetailDao.selectWoDetail(workOrderCode);
	}
	@Override
	public int addWoDetailWithResult(WoDetail woDetail) {
		return woDetailDao.insertWoDetailWithResult(woDetail);
	}
	@Override
	public void addWoDetailWithCheck(Map<String, Object> param) {
		woDetailDao.insertWoDetailWithCheck(param);
	}
	@Override
	public int removeWoDetailWithId(Map<String, Object> data) {
		return woDetailDao.deleteWoDetailWithId(data);
	}
	
	//for just search
	@Override
	public MemberDto findMemberByUid(String memberUid) {
		return woDetailDao.selectMember(memberUid);
	}
}
