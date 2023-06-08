package com.choongang.yeonsolution.product.som.service;

import java.util.List;

import com.choongang.yeonsolution.product.som.domain.SOMStOutDto;

public interface SOMService {

	List<SOMStOutDto>	findStOutLists();
	List<SOMStOutDto>	findStOutDetailListsByOutCode(String outCode);
	List<SOMStOutDto> 	findStOutDtoWhLists();
	List<SOMStOutDto> 	findStOutDtoItemLists();
	int					addStOutBySOMStOutDto(SOMStOutDto stOutDto);
	int					removeStOutByOutCode(String outCode);
	

}
