package com.choongang.yeonsolution.sales.sdm.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.choongang.yeonsolution.sales.sdm.domain.StOutDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class SDMDaoImpl implements SDMDao {
	private final SqlSession session;

	@Override
	public List<StOutDto> findOut(String customerCode) {
		List<StOutDto> findOut = null;
		try {
			findOut = session.selectList("JHOutList",customerCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findOut;
	}
	


	@Override
	public List<StOutDto> findDetailOut(String outCode) {
		List<StOutDto> findDetailOut = null;
		try {
			findDetailOut = session.selectList("JHOutDetailList",outCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return findDetailOut;
	}

	@Override
	public void modifyOutTypeC(String outCode) {
		try {
			session.update("JHConfirm",outCode);
		} catch (Exception e) {
		System.out.println("daoImpl modifyOutType error -> "+e.getMessage());
			e.printStackTrace();
		}
	}

	@Override
	public void modifyOutTypeCC(String outCode) {
		try {
			session.update("JHConfirmCancle",outCode);
		} catch (Exception e) {
		System.out.println("daoImpl modifyOutType2 error -> "+e.getMessage());
			e.printStackTrace();
		}		
	}

	@Override
	public String findOutTypeCCYN(StOutDto stout) {
		return session.selectOne("JHOutTypeCCYN",stout);

	}

	@Override
	public void addInsertStOut(StOutDto stout) {
		try {
			session.insert("JHInsertStOut",stout);
		} catch (Exception e) {
			System.out.println("daoImpl addInsertStOut error -> "+e.getMessage());
		}
	}

	@Override
	public void removeStOut(String outCode) {
		try {
			session.update("JHDeleteStOut",outCode);
		} catch (Exception e) {
			System.out.println("daoImpl removeStOut error -> "+e.getMessage());
		}
	}

	@Override
	public void modifyStOut(StOutDto stout) {
		try {
			session.update("JHUpdateStOut",stout);
		} catch (Exception e) {
			System.out.println("daoImpl modifyStOut error -> "+e.getMessage());
		}
	}

	@Override
	public void modifyStOutItem(StOutDto stout) {
		try {
			session.update("JHUpdateStOutItem",stout);
		} catch (Exception e) {
			System.out.println("daoImpl modifyStOutItem error -> "+e.getMessage());
		}
	}
	
	@Override
	public List<StOutDto> findCompanyCodeList() {
		List<StOutDto> findCompanyCodeList = null;
		try {
			findCompanyCodeList = session.selectList("JHCompanyCodeList");
		} catch (Exception e) {
			System.out.println("daoImpl findCompanyCodeList error -> "+e.getMessage());
		}
		return findCompanyCodeList;
	}
	
	@Override
	public List<StOutDto> findOutCodeList() {
		List<StOutDto> findOutCodeList = null;
		try {
			findOutCodeList = session.selectList("JHOutCodeList");
		} catch (Exception e) {
			System.out.println("daoImpl findCompanyCodeList error -> "+e.getMessage());
		}
		return findOutCodeList;
	}

	@Override
	public List<StOutDto> findWhCodeList() {
		List<StOutDto> findWhCodeList = null;
		try {
			findWhCodeList = session.selectList("JHWhCodeList");
		} catch (Exception e) {
			System.out.println("daoImpl findWhCodeList error -> "+e.getMessage());
		}
		return findWhCodeList;
	}
	
	@Override
	public List<StOutDto> findItemCodeList() { 
		List<StOutDto> findItemCodeList = null;
		try {
			findItemCodeList = session.selectList("JHItemCodeList");
		} catch (Exception e) {
			System.out.println("daoImpl findItemCodeList error -> "+e.getMessage());
		}
		return findItemCodeList;
	}

	@Override
	public void removeStOutItem(StOutDto stout) {
		try {
			session.update("JHDeleteStOutItem",stout);
		} catch (Exception e) {
			System.out.println("daoImpl removeStOutItem error -> "+e.getMessage());
		}		
	}



	@Override
	public void addInsertStOutDetail(StOutDto stout) {
		try {
			session.insert("JHInsertStOutDetail",stout);
		} catch (Exception e) {
			System.out.println("daoImpl addInsertStOutDetail error -> "+e.getMessage());
		}
	}



	@Override
	public List<StOutDto> findOutListWithDetailByCustomerCode(String customerCode) {
		List<StOutDto> findOutListWithDetail = null;
		try {
			findOutListWithDetail = session.selectList("JHOutListWithDetail",customerCode);
		} catch (Exception e) {
			System.out.println("daoImpl findOutListWithDetailByCustomerCode error -> "+e.getMessage());
		}
		return findOutListWithDetail;
	}



	@Override
	public List<StOutDto> findCompanyCodeList2() {
		List<StOutDto> findCompanyCodeList2 = null;
		try {
			findCompanyCodeList2 = session.selectList("JHCompanyCodeList2");
		} catch (Exception e) {
			System.out.println("daoImpl findCompanyCodeList2 error -> "+e.getMessage());
		}
		return findCompanyCodeList2;
	}

	
	





	



}
