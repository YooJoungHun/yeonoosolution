package com.choongang.yeonsolution.standard.pmi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;
import com.choongang.yeonsolution.standard.pmi.domain.BomDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PMIDaoImpl implements PMIDao {
	
	private final SqlSession sqlSession;

	@Override
	public List<ItemDto> selectProductItemList() {
		
		return sqlSession.selectList("selectProductItemList");
	}

	@Override
	public List<ItemDto> selectSemiProductItemList() {
		
		return sqlSession.selectList("selectSemiProductItemList");
	}

	@Override
	public List<BomDto> selectBomListByItemCode(String itemCode) {

		return sqlSession.selectList("selectBomListBy", itemCode);
	}

	@Override
	public int insertBomByBomDto(BomDto bomDto) {
		
		return sqlSession.insert("insertBomByBomDto", bomDto);
	}

	@Override
	public int deleteBomByBomDto(BomDto bomDto) {
		
		return sqlSession.delete("deleteBomByBomDto", bomDto);
	}
	
}
