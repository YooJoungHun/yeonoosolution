package com.choongang.yeonsolution.product.ps.controller.api;

import com.choongang.yeonsolution.product.ps.controller.dto.PsViewApiDto;
import com.choongang.yeonsolution.product.ps.service.PsService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class PsRestController {
    private final PsService psService;

    @GetMapping("/api/product/status/production")
    public List<PsViewApiDto> psList(@RequestParam String start, @RequestParam String end,
                                     @RequestParam(required = false) String name, @RequestParam(required = false) String code) {
        LocalDate startDate = LocalDate.parse(start, DateTimeFormatter.ISO_DATE);
        LocalDate endDate = LocalDate.parse(end, DateTimeFormatter.ISO_DATE);

        if (name == null && code == null) {
            return psService.findPsAll(startDate, endDate, null, null);
        } else if (name == null) {
            return psService.findPsAll(startDate, endDate, null, code);
        } else if (code == null) {
            return psService.findPsAll(startDate, endDate, name, null);
        } else {
            return psService.findPsAll(startDate, endDate, name, code);
        }
    }
}

