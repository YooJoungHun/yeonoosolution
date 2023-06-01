package com.choongang.yeonsolution.product.ds.service;

import com.choongang.yeonsolution.product.ds.controller.dto.LossViewApiDto;
import com.choongang.yeonsolution.product.ds.repository.DsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class DsService {
    private final DsRepository dsRepository;

    public List<LossViewApiDto> findDsAll(LocalDate start, LocalDate end, String name, String code) {
        return dsRepository.selectDsAll(start, end,name,code);
    }
}
