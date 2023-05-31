package com.choongang.yeonsolution.sales.sdm.dao;

import java.util.List;

import com.choongang.yeonsolution.sales.sdm.domain.StOutDto;

public interface SDMDao {

	List<StOutDto>      findOut(String customerCode);
	List<StOutDto> 		findDetailOut(String outCode);
	void                modifyOutTypeC(String outCode);
	void                modifyOutTypeCC(String outCode);
	String              findOutTypeCCYN(StOutDto stout);
	void                addInsertStOut(StOutDto stout);
	void                removeStOut(String outCode);
	void                modifyStOut(StOutDto stout);
	void                modifyStOutItem(StOutDto stout);
	List<StOutDto>      findCompanyCodeList();
	List<StOutDto>		findOutCodeList();
	List<StOutDto>      findWhCodeList();
	List<StOutDto>      findItemCodeList();
	void                removeStOutItem(StOutDto stout);
	void                addInsertStOutDetail(StOutDto stout);
	List<StOutDto>      findOutListWithDetailByCustomerCode(String customerCode);
	List<StOutDto>      findCompanyCodeList2();
}
