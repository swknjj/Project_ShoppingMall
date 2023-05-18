package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.SellerDTO;
import com.icia.ShoppingMall.Repository.SellerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellerService {
    @Autowired
    private SellerRepository sellerRepository;

    public SellerDTO findBySeller(Long user_Id) {
        SellerDTO sellerDTO = sellerRepository.findBySeller(user_Id);
        return sellerDTO;
    }
}
