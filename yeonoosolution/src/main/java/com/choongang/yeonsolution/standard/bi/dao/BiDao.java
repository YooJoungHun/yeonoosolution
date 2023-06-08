package com.choongang.yeonsolution.standard.bi.dao;

import java.util.List;

import com.choongang.yeonsolution.standard.bi.domain.CompanyDto;

public interface BiDao {

	List<CompanyDto> selectCompanyInfoByCompanyCode(String companyCode);

	String selectCompanyImgByCompanyCode(String companyCode);

	int updateCompanyInfoByCompanyCode(CompanyDto companyDto);

	int updateCompanyLogoImgByCompanyCode(CompanyDto companyDto);

	List<CompanyDto> selectCustomerInfoByCompanyCode(String companyCode);

	int insertCustomerInfo(CompanyDto companyDto);

	int updateCustomerInfoByCompanyCode(CompanyDto companyDto);

	List<CompanyDto> selectCustomerInfoByCompanyNameAndOrderType(CompanyDto companyDto);

	String selectCompanyLogoImgByCompanyCode(String companyCode);

}
