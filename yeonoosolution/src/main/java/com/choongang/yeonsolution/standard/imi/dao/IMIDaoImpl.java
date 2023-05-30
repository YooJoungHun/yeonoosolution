package com.choongang.yeonsolution.standard.imi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;
import com.choongang.yeonsolution.standard.imi.domain.CompanyDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class IMIDaoImpl implements IMIDao {
	
	private final SqlSession sqlSession;

	@Override
	public List<ItemDto> selectItemList() {
		return sqlSession.selectList("selectItemList");
	}

	@Override
	public int insertItem(ItemDto itemInfo) {
		return sqlSession.insert("insertItem", itemInfo);
	}

	@Override
	public List<ItemDto> selectWhList() {
		return sqlSession.selectList("selectWhList");
	}

	@Override
	public int updateItemByItemCode(String itemCode) {
		return sqlSession.update("updateItemByItemCode", itemCode);
	}

	@Override
	public int updateItemByItemDto(ItemDto itemDto) {
		return sqlSession.update("updateItemByItemDto", itemDto);
	}

	@Override
	public List<CompanyDto> selectCompanyList() {
		return sqlSession.selectList("selectCompanyList");
	}

}
