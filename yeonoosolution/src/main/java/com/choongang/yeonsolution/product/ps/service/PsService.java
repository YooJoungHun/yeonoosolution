package com.choongang.yeonsolution.product.ps.service;

import com.choongang.yeonsolution.product.ps.controller.dto.PsViewApiDto;
import com.choongang.yeonsolution.product.ps.repository.PsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PsService {
    private final PsRepository psRepository;
    public List<PsViewApiDto> findPsAll(LocalDate start, LocalDate end, String name, String code) {
        return psRepository.selectPsAll(start,end,name,code);
    }
}
