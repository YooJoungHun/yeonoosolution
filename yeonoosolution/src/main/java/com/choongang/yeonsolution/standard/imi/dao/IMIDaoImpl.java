package com.choongang.yeonsolution.standard.imi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.standard.imi.domain.IMIItemDto;
import com.choongang.yeonsolution.standard.imi.domain.IMICompanyDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class IMIDaoImpl implements IMIDao {
	
	private final SqlSession sqlSession;

	@Override
	public List<IMIItemDto> selectItemList() {
		return sqlSession.selectList("imiSelectItemList");
	}

	@Override
	public int insertItem(IMIItemDto itemInfo) {
		return sqlSession.insert("insertItem", itemInfo);
	}

	@Override
	public List<IMIItemDto> selectWhList() {
		return sqlSession.selectList("selectWhList");
	}

	@Override
	public int updateItemByItemCode(String itemCode) {
		return sqlSession.update("updateItemByItemCode", itemCode);
	}

	@Override
	public int updateItemByItemDto(IMIItemDto itemDto) {
		return sqlSession.update("updateItemByItemDto", itemDto);
	}

	@Override
	public List<IMICompanyDto> selectCompanyList() {
		return sqlSession.selectList("selectCompanyList");
	}

}
