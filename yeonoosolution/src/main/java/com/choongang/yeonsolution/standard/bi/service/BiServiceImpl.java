package com.choongang.yeonsolution.standard.bi.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.choongang.yeonsolution.standard.bi.dao.BiDao;
import com.choongang.yeonsolution.standard.bi.domain.CompanyDto;
import com.choongang.yeonsolution.standard.bi.domain.MemberDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Transactional
@RequiredArgsConstructor
@Slf4j
public class BiServiceImpl implements BiService {
	private final BiDao biDao;
	
	@Override
	public List<CompanyDto> findCompanyInfoByCompanyCode(String companyCode) {
		
		return biDao.selectCompanyInfoByCompanyCode(companyCode);
	}

	@Override
	public int modifyCompanyInfoByCompanyCode(CompanyDto companyDto) throws Exception {
		
		int result = 0;
		
		result = biDao.updateCompanyInfoByCompanyCode(companyDto);
		
		return result;
	}

	@Override
	public int modifyCompanyLogoImgByCompanyCode(String companyCode, MultipartFile file, HttpServletRequest request) throws IOException {
		CompanyDto companyDto = new CompanyDto();
		
		// 이미지가 저장될 경로
		// C:\Users\User\git\yeonoosolution\src\main\webapp\\upload\logo\COMPANY1\
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/logo/"+companyCode+"/");
		log.info("uploadPath -> {} ", uploadPath);
		
		// 디비에 경로까지 저장하기 위해 contextPath까지만 분리시키고 \\upload부터는 파일 명에 붙일 예정
		// C:\Users\User\git\yeonoosolution\src\main\webapp
		String paramUploadPath = uploadPath.substring(0, uploadPath.lastIndexOf("\\upload"));
		log.info("paramUploadPath -> {} ", paramUploadPath);
		
		String extension 		= null; // 확장자
		String savedName 		= null;	// 저장될 파일 이름
		File   convertFile	 	= null;	// 최종 변환 파일
		String deleteName		= null; // 이미지를 교체하면 삭제할 기존 이미지
		
		deleteName = paramUploadPath+biDao.selectCompanyLogoImgByCompanyCode(companyCode);
		
		// db에 이미지 경로가 저장되어 있다면 파일 삭제.
		if(deleteName != null) {
			int delResult = imgDelete(deleteName);
			if(delResult == 1) {
				log.info("삭제 성공");
			}else {
				log.info("삭제 실패");
			}
		}
		
		
		// 저장할 파일이 있다면 실행.
		if(file != null && !file.isEmpty()) {
			extension = FilenameUtils.getExtension(file.getOriginalFilename());
			savedName = uploadFile(file.getBytes(), uploadPath, companyDto, extension);
			convertFile = new File(paramUploadPath+savedName);
			FileCopyUtils.copy(file.getBytes(), convertFile);;
		}
		companyDto.setCompanyCode(companyCode);
		companyDto.setCompanyLogo(savedName);
		int result = biDao.updateCompanyLogoImgByCompanyCode(companyDto);
		
		return result;
	}

	private int imgDelete(String deleteName) {
		int result = 0;
		
		File file = new File(deleteName);
		// 파일이 존재한다면
		if(file.exists()) {
			file.delete();
			log.info("삭제 성공");
			result = 1;
		}
		return result;
	
	}

	private String uploadFile(byte[] fileData, String uploadPath, CompanyDto companyDto, String extension) {
		
		// \\upload\logo\COMPANY1\
		String extractedPath = uploadPath.substring(uploadPath.lastIndexOf("\\upload"));
		log.info("extractedPath -> {} ", extractedPath);
		
		// 폴더 없으면 폴더 생성
		File fileDirectory = new File(uploadPath);
		if(!fileDirectory.exists()) {
			fileDirectory.mkdirs();
		}
		
		// 이미지 랜덤이름 값 설정
		UUID uuid = UUID.randomUUID();
		
		// 혹시 겹칠 수도 있으니 타임스탬프까지.
		LocalDateTime currentTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
		String formattedTime = currentTime.format(formatter);
		
		// 이렇게 하면 jsp에서 pageContext를 부를 필요가 없음.
		// \\upload\logo\COMPANY1\ + 11fdddac-8bcc-4dbf-a3e7-3dd3da5e2fd1 + 20230531214216162 + . + jpg
		// => \\upload\logo\COMPANY1\11fdddac-8bcc-4dbf-a3e7-3dd3da5e2fd120230531214216162.jpg
		String savedName = extractedPath+uuid +formattedTime + "." + extension;
		log.info("완성된 이미지 이름 -> {} ", savedName);

		return savedName;
	}

	@Override
	public List<CompanyDto> findCustomerInfoByCompanyCode(String companyCode) {
		
		return biDao.selectCustomerInfoByCompanyCode(companyCode);
	}


	@Override
	public int addCustomerInfo(CompanyDto companyDto) {
		
		return biDao.insertCustomerInfo(companyDto);
	}

	@Override
	public int modifyCustomerInfoByCompanyCode(CompanyDto companyDto) {
		
		return biDao.updateCustomerInfoByCompanyCode(companyDto);
	}

	@Override
	public List<CompanyDto> findCustomerInfoByCompanyNameAndOrderType(CompanyDto companyDto) {
		
		return biDao.selectCustomerInfoByCompanyNameAndOrderType(companyDto);
	}

	


}
