package com.choongang.yeonsolution.product.sim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.sim.domain.CompanyDto;
import com.choongang.yeonsolution.product.sim.domain.ItemDto;
import com.choongang.yeonsolution.product.sim.domain.OrdersDto;
import com.choongang.yeonsolution.product.sim.domain.StInDetailDto;
import com.choongang.yeonsolution.product.sim.domain.StInDto;
import com.choongang.yeonsolution.product.sim.domain.WhDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SIMDaoImpl implements SIMDao {
	private final SqlSession session;

	// 양동균
	/** 입고 목록 조회 */
	@Override
	public List<StInDto> selectStIn(StInDto stInDto) {
		List<StInDto> findStIn = null;
		findStIn = session.selectList("selectStIn", stInDto);
		return findStIn;
	}
	/** 입고 수정 */
	@Override
	public void updateStIn(StInDto stInDto) {session.update("updateStIn", stInDto);	}
	/** 입고 삭제 */
	@Override
	public void deleteStIn(StInDto stInDto) {session.update("deleteStIn", stInDto);	}
	/** 입고 확정 */
	@Override
	public void updateStInFix(StInDto stInDto) {session.update("updateStInFix", stInDto);	}
	/** 입고 확정 취소 */
	@Override
	public void updateStInCancel(StInDto stInDto) {session.update("updateStInCancel", stInDto);	}
	/** 입고 등록 */
	@Override
	public void insertStIn(StInDto stInDto) {session.insert("insertStIn", stInDto);}
	/** 회사 목록 조회 */
	@Override
	public List<CompanyDto> selectCompany() {return session.selectList("selectStInCompany");}
	/** 회사 목록 조회 */
	@Override
	public List<WhDto> selectWh() {return session.selectList("selectStInWh");}
	/** 회사 목록 조회 */
	@Override
	public List<ItemDto> selectItem() {return session.selectList("selectStInItem");}
	/** 입고 상세 추가 */
	@Override
	public void insertStInDetail(List<StInDetailDto> sidList) {session.insert("insertStInDetail", sidList);}
	/** 입고 상세 삭제 */
	@Override
	public void deleteStInDetail(List<StInDetailDto> sidList) {
		for(StInDetailDto sid : sidList) {
			session.insert("deleteStInDetail", sid);
		}
	}
	/** 입고 상세 삭제 */
	@Override
	public List<OrdersDto> selectOrders() {return session.selectList("selectOrders");}

}
