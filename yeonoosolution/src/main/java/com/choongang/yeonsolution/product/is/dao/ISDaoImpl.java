package com.choongang.yeonsolution.product.is.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.is.domain.PaginationDto;
import com.choongang.yeonsolution.product.is.domain.WhDto;
import com.choongang.yeonsolution.product.is.domain.WhStockDetailDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class ISDaoImpl implements ISDao {
	private final SqlSession sqlSession;

	@Override
	public WhStockDetailDto selectIsItemListByItemCode(WhStockDetailDto whStockDetailDto) {
		log.info("is item Dao selectIsItemListByItemCode() start");
		WhStockDetailDto returnWhStockDetailDto = null;
		
		try {
			returnWhStockDetailDto = sqlSession.selectOne("selectIsItemListByItemCode", whStockDetailDto);
			
		} catch (Exception e) {
			log.debug("is item Dao selectIsItemListByItemCode() Exception : "+e.getMessage());
			e.printStackTrace();
		}
		
		return returnWhStockDetailDto;
	}

	@Override
	public List<WhDto> selectIsWhDtoWhList() {
		List<WhDto> whDtoList = null;
		
		try {
			whDtoList = sqlSession.selectList("selectIsWhDtoWhList");
			
		} catch(Exception e) {
			log.debug("is wh Dao selectIsWhDtoWhList() Exception : " + e.getMessage());
			e.printStackTrace();
		}
		
		return whDtoList;
	}

	@Override
	public int selectWhTotalCount() {
		log.info("is wh Dao selectWhTotalCount() start");
		int totalCount = 0;
		
		try {
			totalCount = sqlSession.selectOne("selectWhTotalCount");
			
		} catch(Exception e) {
			log.debug("is wh Dao selectWhTotalCount() Exception : " + e.getMessage());
			e.printStackTrace();
		}
		
		return totalCount;
	}

	@Override
	public List<WhDto> selectWhListByPagination(PaginationDto paginationDto) {
		log.info("is wh Dao selectWhListByPagination() start");
		List<WhDto> whDtoList = null;
		
		try {
			whDtoList = sqlSession.selectList("selectWhListByPagination", paginationDto);
			
		} catch(Exception e) {
			log.debug("is wh Dao selectWhListByPagination() Exception : " + e.getMessage());
			e.printStackTrace();
		}
		
		return whDtoList;
	}
	
}
