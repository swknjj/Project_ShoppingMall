package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.InquiryDTO;
import com.icia.ShoppingMall.Repository.InquiryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class InquiryService {
    @Autowired
    private InquiryRepository inquiryRepository;

    public List<InquiryDTO> findByProductInquiryList(Long product_id) {
        List<InquiryDTO> inquiryDTOList = inquiryRepository.findByProductInquiryList(product_id);
        return inquiryDTOList;
    }

    public int findByProductInquiryCount(Long product_id) {
        int result = inquiryRepository.findByProductInquiryCount(product_id);
        return result;
    }

    public List<InquiryDTO> is_buy(Map<String,Long> id_key) {
        List<InquiryDTO> inquiryDTOList = inquiryRepository.is_buy(id_key);
        return inquiryDTOList;
    }

    public InquiryDTO inquirySave(InquiryDTO inquiryDTO) {
        return inquiryRepository.inquirySave(inquiryDTO);
    }
}
