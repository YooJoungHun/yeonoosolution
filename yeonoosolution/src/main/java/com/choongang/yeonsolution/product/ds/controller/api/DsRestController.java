package com.choongang.yeonsolution.product.ds.controller.api;

import com.choongang.yeonsolution.product.ds.controller.dto.LossViewApiDto;
import com.choongang.yeonsolution.product.ds.service.DsService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class DsRestController {
    private final DsService dsService;

    @GetMapping("/api/product/status/defect")
    public List<LossViewApiDto> dsList(@RequestParam String start, @RequestParam String end,
                                        @RequestParam(required = false) String name, @RequestParam(required = false) String code) {
        LocalDate startDate = LocalDate.parse(start, DateTimeFormatter.ISO_DATE);
        LocalDate endDate = LocalDate.parse(end, DateTimeFormatter.ISO_DATE);

        if (name == null && code == null) {
            return dsService.findDsAll(startDate, endDate, null, null);
        } else if (name == null) {
            return dsService.findDsAll(startDate, endDate, null, code);
        } else if (code == null) {
            return dsService.findDsAll(startDate, endDate, name, null);
        } else {
            return dsService.findDsAll(startDate, endDate, name, code);
        }
    }
}

