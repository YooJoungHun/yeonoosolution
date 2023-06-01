package com.choongang.yeonsolution.product.is.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.product.is.domain.IsBomDto;
import com.choongang.yeonsolution.product.is.domain.IsPaginationDto;
import com.choongang.yeonsolution.product.is.domain.IsWhDto;
import com.choongang.yeonsolution.product.is.domain.IsWhStockDetailDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

//@Repository
@Slf4j
@RequiredArgsConstructor
public class ISDaoImpl implements ISDao {
	private final SqlSession sqlSession;

	@Override
	public List<IsWhStockDetailDto> selectIsItemListByItemCode(IsWhStockDetailDto whStockDetailDto) {
		log.info("is item Dao selectIsItemListByItemCode() start");
		List<IsWhStockDetailDto> whStockDetailDtoList = null;
		
		try {
			whStockDetailDtoList = sqlSession.selectList("selectIsItemListByItemCode", whStockDetailDto);
			
		} catch (Exception e) {
			log.debug("is item Dao selectIsItemListByItemCode() Exception : "+e.getMessage());
			e.printStackTrace();
		}
		
		return whStockDetailDtoList;
	}
	

	@Override
	public List<IsBomDto> selectIsBomListByItemNameAndItemType(IsBomDto isBomDto) {
		log.info("is bom Dao selectIsBomListByItemNameAndItemType() start");
		List<IsBomDto> isBomDtoList = null;
		
		try {
			isBomDtoList = sqlSession.selectList("selectIsBomListByItemNameAndItemType", isBomDto);
			
		} catch(Exception e) {
			log.debug("is bom selectIsBomListByItemNameAndItemType() Exception : " + e.getMessage());
			e.printStackTrace();
		}
		
		return isBomDtoList;
	}

	@Override
	public List<IsWhDto> selectIsWhDtoWhList() {
		List<IsWhDto> whDtoList = null;
		
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
	public List<IsWhDto> selectWhListByPagination(IsPaginationDto paginationDto) {
		log.info("is wh Dao selectWhListByPagination() start");
		List<IsWhDto> whDtoList = null;
		
		try {
			whDtoList = sqlSession.selectList("selectWhListByPagination", paginationDto);
			
		} catch(Exception e) {
			log.debug("is wh Dao selectWhListByPagination() Exception : " + e.getMessage());
			e.printStackTrace();
		}
		
		return whDtoList;
	}

	@Override
	public int selectWhItemTotalCount(String whCode) {
		log.info("is wh Dao selectWhItemTotalCount() start");
		int totalCount = 0;
		
		try {
			totalCount = sqlSession.selectOne("selectWhItemTotalCount", whCode);			
		} catch(Exception e) {
			log.debug("is wh Dao selectWhItemTotalCount() Exception : " + e.getMessage());
			e.printStackTrace();
		}
		
		return totalCount;
	}

	@Override
	public List<IsWhDto> selectISItemListByWhCode(IsWhDto paramWhDto) {
		log.info("is wh Dao selectIsItemListByWhCode() start");
		List<IsWhDto> whDtoList = null;
		
		try {
			whDtoList = sqlSession.selectList("selectISItemListByWhCode", paramWhDto);
		} catch(Exception e) {
			log.info("is wh Dao selectIsItemListByWhCode() Exception : " + e.getMessage());
			e.printStackTrace();
		}
		
		return whDtoList;
	}

	
}
