package com.choongang.yeonsolution.standard.ipi.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.standard.imi.domain.ItemDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class IPIDaoImpl implements IPIDao {
	
	private final SqlSession sqlSession;

	@Override
	public int updateItemByItemDto(ItemDto itemDto) {
		return sqlSession.update("updateIpiByItemDto", itemDto);
	}
	
}
