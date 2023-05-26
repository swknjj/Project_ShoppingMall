package com.icia.ShoppingMall.Repository;

import com.icia.ShoppingMall.DTO.InquiryDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class InquiryRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public List<InquiryDTO> findByProductInquiryList(Long product_id) {
        return sql.selectList("Inquiry.findByProductInquiryList",product_id);
    }

    public int findByProductInquiryCount(Long product_id) {
        return sql.selectOne("Inquiry.findByProductInquiryCount",product_id);
    }

    public List<InquiryDTO> is_buy(Map<String,Long> id_key) {
        return sql.selectList("Order.is_buy",id_key);
    }

    public InquiryDTO inquirySave(InquiryDTO inquiryDTO) {
        sql.insert("Inquiry.inquirySave",inquiryDTO);
        return inquiryDTO;
    }
}
