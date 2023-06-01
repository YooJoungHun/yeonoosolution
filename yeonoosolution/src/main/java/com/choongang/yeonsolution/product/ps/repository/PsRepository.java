package com.choongang.yeonsolution.product.ps.repository;

import com.choongang.yeonsolution.product.ps.controller.dto.PsViewApiDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.time.LocalDate;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class PsRepository {
    private final EntityManager em;

    public List<PsViewApiDto> selectPsAll(LocalDate start, LocalDate end, String name, String code) {
        if (name == null && code == null) {
            return em.createQuery("SELECT NEW com.choongang.yeonsolution.product.ps.controller.dto.PsViewApiDto(" +
                            "v.item_code, v.item_name, v.item_quantity, " +
                            "SUM(CASE WHEN v.good_yn = 'Y' THEN v.work_order_quantity ELSE 0 END), " +
                            "SUM(CASE WHEN v.good_yn = 'N' THEN v.work_order_quantity ELSE 0 END)) " +
                            "FROM PsViewDto v " +
                            "WHERE v.work_date BETWEEN :startDate AND :endDate " +
                            "GROUP BY v.item_code, v.item_name, v.item_quantity", PsViewApiDto.class)
                    .setParameter("startDate", start)
                    .setParameter("endDate", end)
                    .getResultList();
        } else if (code == null) {
            return em.createQuery("SELECT NEW com.choongang.yeonsolution.product.ps.controller.dto.PsViewApiDto(" +
                            "v.item_code, v.item_name, v.item_quantity, " +
                            "SUM(CASE WHEN v.good_yn = 'Y' THEN v.work_order_quantity ELSE 0 END), " +
                            "SUM(CASE WHEN v.good_yn = 'N' THEN v.work_order_quantity ELSE 0 END)) " +
                            "FROM PsViewDto v " +
                            "WHERE v.work_date BETWEEN :startDate AND :endDate " +
                            "AND v.item_name like CONCAT('%', :item_name, '%') " +
                            "GROUP BY v.item_code, v.item_name, v.item_quantity", PsViewApiDto.class)
                    .setParameter("startDate", start)
                    .setParameter("endDate", end)
                    .setParameter("item_name", name)
                    .getResultList();
        } else if (name == null) {
            return em.createQuery("SELECT NEW com.choongang.yeonsolution.product.ps.controller.dto.PsViewApiDto(" +
                            "v.item_code, v.item_name, v.item_quantity, " +
                            "SUM(CASE WHEN v.good_yn = 'Y' THEN v.work_order_quantity ELSE 0 END), " +
                            "SUM(CASE WHEN v.good_yn = 'N' THEN v.work_order_quantity ELSE 0 END)) " +
                            "FROM PsViewDto v " +
                            "WHERE v.work_date BETWEEN :startDate AND :endDate " +
                            "AND v.item_code LIKE CONCAT('%', :item_code, '%') " +
                            "GROUP BY v.item_code, v.item_name, v.item_quantity", PsViewApiDto.class)
                    .setParameter("startDate", start)
                    .setParameter("endDate", end)
                    .setParameter("item_code", code)
                    .getResultList();
        } else {
            return em.createQuery("SELECT NEW com.choongang.yeonsolution.product.ps.controller.dto.PsViewApiDto(" +
                            "v.item_code, v.item_name, v.item_quantity, " +
                            "SUM(CASE WHEN v.good_yn = 'Y' THEN v.work_order_quantity ELSE 0 END), " +
                            "SUM(CASE WHEN v.good_yn = 'N' THEN v.work_order_quantity ELSE 0 END)) " +
                            "FROM PsViewDto v " +
                            "WHERE v.work_date BETWEEN :startDate AND :endDate " +
                            "AND v.item_name like CONCAT('%', :item_name, '%') " +
                            "AND v.item_code LIKE CONCAT('%', :item_code, '%') " +
                            "GROUP BY v.item_code, v.item_name, v.item_quantity", PsViewApiDto.class)
                    .setParameter("startDate", start)
                    .setParameter("endDate", end)
                    .setParameter("item_name", name)
                    .setParameter("item_code", code)
                    .getResultList();
        }
    }
}
