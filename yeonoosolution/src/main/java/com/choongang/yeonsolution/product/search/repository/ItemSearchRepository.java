package com.choongang.yeonsolution.product.search.repository;

import com.choongang.yeonsolution.product.search.controller.dto.ItemViewApiDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class ItemSearchRepository {
    private final EntityManager em;
    public List<ItemViewApiDto> selectItem(String name, String code) {
        if (name == null && code == null) {
            return em.createQuery("select new com.choongang.yeonsolution.product.search.controller.dto.ItemViewApiDto(" +
                            "i.item_code, i.item_name) " +
                            "from ItemViewDto i", ItemViewApiDto.class)
                    .getResultList();
        } else if (name == null) {
            return em.createQuery("select new com.choongang.yeonsolution.product.search.controller.dto.ItemViewApiDto(" +
                            "i.item_code, i.item_name) " +
                            "from ItemViewDto i " +
                            "WHERE i.item_code LIKE CONCAT('%', :code, '%')", ItemViewApiDto.class)
                    .setParameter("code", code)
                    .getResultList();
        } else if (code == null) {
            return em.createQuery("select new com.choongang.yeonsolution.product.search.controller.dto.ItemViewApiDto(" +
                            "i.item_code, i.item_name) " +
                            "from ItemViewDto i " +
                            "WHERE i.item_name LIKE CONCAT('%', :name, '%')", ItemViewApiDto.class)
                    .setParameter("name", name)
                    .getResultList();
        } else {
            return em.createQuery("select new com.choongang.yeonsolution.product.search.controller.dto.ItemViewApiDto(" +
                            "i.item_code, i.item_name) " +
                            "from ItemViewDto i " +
                            "WHERE i.item_name LIKE CONCAT('%', :name, '%')" +
                            "and i.item_code LIKE CONCAT('%', :code, '%') ", ItemViewApiDto.class)
                    .setParameter("name", name)
                    .setParameter("code", code)
                    .getResultList();
        }
    }
}
