package com.choongang.yeonsolution.product.ps.controller;

import com.choongang.yeonsolution.product.ps.service.PsService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class PsController {
    private final PsService psService;

    @GetMapping("/product/status/production")
    public String psList() {
        return "product/ps/status.layout";
    }
}
