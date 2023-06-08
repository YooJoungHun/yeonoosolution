package com.choongang.yeonsolution.product.ds.controller;

import com.choongang.yeonsolution.product.ds.service.DsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class DsController {
    private final DsService dsService;

    @GetMapping("/product/status/defect")
    public String dsList() {
        return "product/ds/status.layout";
    }
}
