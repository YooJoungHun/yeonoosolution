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
			e.printStackTrace();
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
		System.out.println("daoImpl modifyOutType error -> "+e.getMessage());
			e.printStackTrace();
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
		System.out.println("daoImpl modifyOutType2 error -> "+e.getMessage());
			e.printStackTrace();
		}		
	}

	@Override
	public String findOutTypeCCYN(SDMStOutDto stout) {
		return session.selectOne("JHOutTypeCCYN",stout);

	}

	@Override
	public void insertStOut(SDMStOutDto stout) {
		try {
			session.insert("sdmInsertStOut",stout);
		} catch (Exception e) {
			System.out.println("daoImpl insertStOut error -> "+e.getMessage());
		}
	}

	@Override
	public void deleteStOutByOutCode(String outCode) {
		try {
			session.update("sdmDeleteStOut",outCode);
		} catch (Exception e) {
			System.out.println("daoImpl removeStOut error -> "+e.getMessage());
		}
	}

	@Override
	public void updateStOutByOutCode(SDMStOutDto stout) {
		try {
			session.update("sdmUpdateStOut",stout);
		} catch (Exception e) {
			System.out.println("daoImpl modifyStOut error -> "+e.getMessage());
		}
	}

	@Override
	public void updateStOutItemByOutCodeAndSorder(SDMStOutDto stout) {
		try {
			session.update("sdmUpdateStOutItemByOutCodeAndSorder",stout);
		} catch (Exception e) {
			System.out.println("daoImpl modifyStOutItem error -> "+e.getMessage());
		}
	}
	
	@Override
	public List<SDMStOutDto> selectCompanyCodeList() {
		List<SDMStOutDto> findCompanyCodeList = null;
		try {
			findCompanyCodeList = session.selectList("sdmCompanyCodeList");
		} catch (Exception e) {
			System.out.println("daoImpl findCompanyCodeList error -> "+e.getMessage());
		}
		return findCompanyCodeList;
	}
	
	@Override
	public List<SDMStOutDto> selectfindOutCodeList() {
		List<SDMStOutDto> findOutCodeList = null;
		try {
			findOutCodeList = session.selectList("sdmOutCodeList");
		} catch (Exception e) {
			System.out.println("daoImpl findCompanyCodeList error -> "+e.getMessage());
		}
		return findOutCodeList;
	}

	@Override
	public List<SDMStOutDto> selectfindWhCodeList() {
		List<SDMStOutDto> findWhCodeList = null;
		try {
			findWhCodeList = session.selectList("sdmWhCodeList");
		} catch (Exception e) {
			System.out.println("daoImpl findWhCodeList error -> "+e.getMessage());
		}
		return findWhCodeList;
	}
	
	@Override
	public List<SDMStOutDto>  selectfindItemCodeList() { 
		List<SDMStOutDto> findItemCodeList = null;
		try {
			findItemCodeList = session.selectList("sdmItemCodeList");
		} catch (Exception e) {
			System.out.println("daoImpl findItemCodeList error -> "+e.getMessage());
		}
		return findItemCodeList;
	}

	@Override
	public void deleteStOutItemByOutCodeAndSorder(SDMStOutDto stout) {
		try {
			session.update("sdmDeleteStOutItemByOutCodeAndSorder",stout);
		} catch (Exception e) {
			System.out.println("daoImpl removeStOutItem error -> "+e.getMessage());
		}		
	}



	@Override
	public void insertStOutItem(SDMStOutDto stout) {
		try {
			session.insert("sdmInsertStOutItem",stout);
		} catch (Exception e) {
			System.out.println("daoImpl addInsertStOutDetail error -> "+e.getMessage());
		}
	}



	@Override
	public List<SDMStOutDto> selectStOutWithDetailByCustomerCode(String customerCode) {
		List<SDMStOutDto> findOutListWithDetail = null;
		try {
			findOutListWithDetail = session.selectList("sdmSelectStOutWithDetailByCustomerCode",customerCode);
		} catch (Exception e) {
			System.out.println("daoImpl findOutListWithDetailByCustomerCode error -> "+e.getMessage());
		}
		return findOutListWithDetail;
	}



	@Override
	public List<SDMStOutDto> selectCompanyCodeList2() {
		List<SDMStOutDto> findCompanyCodeList2 = null;
		try {
			findCompanyCodeList2 = session.selectList("sdmSelectCompanyCodeList2");
		} catch (Exception e) {
			System.out.println("daoImpl findCompanyCodeList2 error -> "+e.getMessage());
		}
		return findCompanyCodeList2;
	}

	
	





	



}
