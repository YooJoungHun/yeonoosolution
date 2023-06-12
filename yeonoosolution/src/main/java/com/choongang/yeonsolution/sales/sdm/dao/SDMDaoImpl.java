package com.choongang.yeonsolution.sales.sdm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.choongang.yeonsolution.sales.sdm.domain.SDMStOutDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Transactional
@RequiredArgsConstructor
@Slf4j
public class SDMDaoImpl implements SDMDao {
	private final SqlSession session;

	@Override
	public List<SDMStOutDto> selectOutList(String customerCode) {
		List<SDMStOutDto> findOut = null;
		try {
			findOut = session.selectList("sdmSelectOutList",customerCode);
		} catch (Exception e) {
			log.error("daoimpl selectOutList -> {} ",e.getMessage());
			e.printStackTrace();
		}
		return findOut;
	}
	


	@Override
	public List<SDMStOutDto> selectStOutDetailDtoListByOutCode(String outCode) {
		List<SDMStOutDto> findDetailOut = null;
		try {
			findDetailOut = session.selectList("sdmSelectStOutDetailDtoListByOutCode",outCode);
		} catch (Exception e) {
			log.error("daoimpl selectStOutDetailDtoListByOutCode -> {} ",e.getMessage());
		}
		return findDetailOut;
	}

	@Override
	public void updateOutTypeConfirm(String outCode) {
		List<SDMStOutDto> findDetailOut = null;
		try {
			session.update("sdmUpdateOutTypeConfirm",outCode);
			findDetailOut = session.selectList("sdmSelectStOutDetailDtoListByOutCode",outCode);
			for(SDMStOutDto ssd: findDetailOut) {
				session.update("sdmUpdateWhStockDatilMiu",ssd);
			}
		} catch (Exception e) {
			log.error("daoimpl updateOutTypeConfirm -> {} ",e.getMessage());
		}
		
		
		
	}

	@Override
	public void updateOutTypeConfirmCancel(String outCode) {
		List<SDMStOutDto> findDetailOut = null;
		try {
			session.update("sdmUpdateOutTypeConfirmCancel",outCode);
			findDetailOut = session.selectList("sdmSelectStOutDetailDtoListByOutCode",outCode);
			for(SDMStOutDto ssd: findDetailOut) {
				session.update("sdmUpdateWhStockDatilPlus",ssd);
			}
		} catch (Exception e) {
			log.error("daoimpl updateOutTypeConfirmCancel -> {} ",e.getMessage());
		}		
	}

	@Override
	public String findOutTypeCCYN(String outCode) {
		return session.selectOne("JHOutTypeCCYN",outCode);

	}

	@Override
	public void insertStOut(SDMStOutDto stout) {
		try {
			session.insert("sdmInsertStOut",stout);
		} catch (Exception e) {
			log.error("daoimpl insertStOut -> {} ",e.getMessage());
		}
	}

	@Override
	public void deleteStOutByOutCode(String outCode) {
		try {
			session.update("sdmDeleteStOut",outCode);
		} catch (Exception e) {
			log.error("daoimpl deleteStOutByOutCode -> {} ",e.getMessage());
		}
	}

	@Override
	public void updateStOutByOutCode(SDMStOutDto stout) {
		try {
			session.update("sdmUpdateStOut",stout);
		} catch (Exception e) {
			log.error("daoimpl updateStOutByOutCode -> {} ",e.getMessage());
		}
	}

	@Override
	public void updateStOutItemByOutCodeAndSorder(SDMStOutDto stout) {
		try {
			session.update("sdmUpdateStOutItemByOutCodeAndSorder",stout);
		} catch (Exception e) {
			log.error("daoimpl updateStOutItemByOutCodeAndSorder -> {} ",e.getMessage());
		}
	}
	
	@Override
	public List<SDMStOutDto> selectCompanyCodeList() {
		List<SDMStOutDto> findCompanyCodeList = null;
		try {
			findCompanyCodeList = session.selectList("sdmCompanyCodeList");
		} catch (Exception e) {
			log.error("daoimpl selectCompanyCodeList -> {} ",e.getMessage());
		}
		return findCompanyCodeList;
	}
	
	@Override
	public List<SDMStOutDto> selectfindOutCodeList() {
		List<SDMStOutDto> findOutCodeList = null;
		try {
			findOutCodeList = session.selectList("sdmOutCodeList");
		} catch (Exception e) {
			log.error("daoimpl selectfindOutCodeList -> {} ",e.getMessage());
		}
		return findOutCodeList;
	}

	@Override
	public List<SDMStOutDto> selectfindWhCodeList() {
		List<SDMStOutDto> findWhCodeList = null;
		try {
			findWhCodeList = session.selectList("sdmWhCodeList");
		} catch (Exception e) {
			log.error("daoimpl selectfindWhCodeList -> {} ",e.getMessage());
		}
		return findWhCodeList;
	}
	
	@Override
	public List<SDMStOutDto>  selectfindItemCodeList() { 
		List<SDMStOutDto> findItemCodeList = null;
		try {
			findItemCodeList = session.selectList("sdmItemCodeList");
		} catch (Exception e) {
			log.error("daoimpl selectfindItemCodeList -> {} ",e.getMessage());
		}
		return findItemCodeList;
	}

	@Override
	public void deleteStOutItemByOutCodeAndSorder(SDMStOutDto stout) {
		try {
			session.update("sdmDeleteStOutItemByOutCodeAndSorder",stout);
		} catch (Exception e) {
			log.error("daoimpl deleteStOutItemByOutCodeAndSorder -> {} ",e.getMessage());
		}		
	}



	@Override
	public void insertStOutItem(SDMStOutDto stout) {
		try {
			session.selectOne("sdmInsertStOutItem",stout);
		} catch (Exception e) {
			log.error("daoimpl insertStOutItem -> {} ",e.getMessage());
		}
	}


	@Override
	public List<SDMStOutDto> selectStOutWithDetailByCustomerCode(String customerCode) {
		List<SDMStOutDto> findOutListWithDetail = null;
		try {
			findOutListWithDetail = session.selectList("sdmSelectStOutWithDetailByCustomerCode",customerCode);
		} catch (Exception e) {
			log.error("daoimpl selectStOutWithDetailByCustomerCode -> {} ",e.getMessage());
		}
		return findOutListWithDetail;
	}


	@Override
	public List<SDMStOutDto> selectCompanyCodeList2() {
		List<SDMStOutDto> findCompanyCodeList2 = null;
		try {
			findCompanyCodeList2 = session.selectList("sdmSelectCompanyCodeList2");
		} catch (Exception e) {
			log.error("daoimpl selectCompanyCodeList2 -> {} ",e.getMessage());
		}
		return findCompanyCodeList2;
	}


	
	





	



}
