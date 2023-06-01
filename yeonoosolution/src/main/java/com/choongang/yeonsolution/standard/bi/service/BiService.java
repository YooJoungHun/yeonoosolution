package com.choongang.yeonsolution.standard.bi.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.choongang.yeonsolution.standard.bi.domain.CompanyDto;
import com.choongang.yeonsolution.standard.bi.domain.MemberDto;

public interface BiService {

	List<CompanyDto> findCompanyInfoByCompanyCode(String companyCode);

	int modifyCompanyInfoByCompanyCode(CompanyDto companyDto) throws Exception;

	int modifyCompanyLogoImgByCompanyCode(String companyCode, MultipartFile file, HttpServletRequest request) throws IOException;

	List<CompanyDto> findCustomerInfoByCompanyCode(String companyCode);

	int addCustomerInfo(CompanyDto companyDto);

	int modifyCustomerInfoByCompanyCode(CompanyDto companyDto);

	List<CompanyDto> findCustomerInfoByCompanyNameAndOrderType(CompanyDto companyDto);


	
	

}
