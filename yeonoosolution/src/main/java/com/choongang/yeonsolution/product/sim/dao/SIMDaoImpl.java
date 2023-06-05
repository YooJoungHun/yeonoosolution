package com.choongang.yeonsolution.product.sim.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.sim.domain.CompanyDto;
import com.choongang.yeonsolution.product.sim.domain.StInDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class SIMDaoImpl implements SIMDao {
	private final SqlSession session;

	
	// 양동균
	@Override
	public List<StInDto> findStIn() {
		List<StInDto> findStIn = null;
		findStIn = session.selectList("selectStIn");
		return findStIn;
	}
	@Override
	public List<StInDto> findStIn(StInDto stInDto) {
		List<StInDto> findStIn = null;
		findStIn = session.selectList("selectStIn", stInDto);
		return findStIn;
	}
	@Override
	public void updateStIn(StInDto stInDto) {session.update("updateStIn", stInDto);	}
	@Override
	public void deleteStIn(StInDto stInDto) {session.update("deleteStIn", stInDto);	}
	@Override
	public void updateStInFix(StInDto stInDto) {session.update("updateStInFix", stInDto);	}
	@Override
	public void updateStInCancel(StInDto stInDto) {session.update("updateStInCancel", stInDto);	}
	@Override
	public List<CompanyDto> findCompany() {return session.selectList("selectCompany");}

}
