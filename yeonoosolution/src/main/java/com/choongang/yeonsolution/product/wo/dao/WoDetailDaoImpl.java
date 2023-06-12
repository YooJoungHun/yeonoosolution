package com.choongang.yeonsolution.product.wo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.wo.domain.WoDetail;
import com.choongang.yeonsolution.standard.am.domain.MemberDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class WoDetailDaoImpl implements WoDetailDao {
	private final SqlSession session;
	
	@Override
	public List<WoDetail> selectWoDetail(String workOrderCode) {
		return session.selectList("selectWoDetail", workOrderCode);
	}
	@Override
	public int insertWoDetailWithResult(WoDetail woDetail) {
		return session.insert("insertWoDetailWithResult", woDetail);
	}
	@Override
	public void insertWoDetailWithCheck(Map<String, Object> param) {
		session.selectOne("insertWoDetailWithCheck", param);
	}
	@Override
	public int deleteWoDetailWithId(Map<String, Object> data) {
		return session.delete("deleteWoDetailWithId", data);
	}
	
	// just for search
	@Override
	public MemberDto selectMember(String memberUid) {
		return session.selectOne("amSelectMember", memberUid);
	}
}
