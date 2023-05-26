package com.choongang.yeonsolution.standard.imi.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
		log.info("dao whList -> " );
		return sqlSession.selectList("selectWhList");
	}

}
