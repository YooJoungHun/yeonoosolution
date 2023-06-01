package com.choongang.yeonsolution.standard.pmi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.standard.imi.domain.IMIItemDto;
import com.choongang.yeonsolution.standard.pmi.domain.PMIBomDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PMIDaoImpl implements PMIDao {
	
	private final SqlSession sqlSession;

	@Override
	public List<IMIItemDto> selectProductItemList() {
		
		return sqlSession.selectList("selectProductItemList");
	}

	@Override
	public List<IMIItemDto> selectSemiProductItemList() {
		
		return sqlSession.selectList("selectSemiProductItemList");
	}

	@Override
	public List<PMIBomDto> selectBomListByItemCode(String itemCode) {

		return sqlSession.selectList("selectBomListBy", itemCode);
	}

	@Override
	public int insertBomByBomDto(PMIBomDto bomDto) {
		
		return sqlSession.insert("insertBomByBomDto", bomDto);
	}

	@Override
	public int deleteBomByBomDto(PMIBomDto bomDto) {
		
		return sqlSession.delete("deleteBomByBomDto", bomDto);
	}
	
}
