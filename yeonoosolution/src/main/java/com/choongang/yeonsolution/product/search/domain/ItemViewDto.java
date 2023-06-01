package com.choongang.yeonsolution.product.search.domain;

import lombok.Getter;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ITEM_SIMPLE")
@Getter
public class ItemViewDto {
    @Id
    private String item_code;

    private String item_name;
}
