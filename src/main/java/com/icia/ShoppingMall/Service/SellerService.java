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

    public SellerDTO sellerNum_check(Long reg) {
        SellerDTO sellerDTO = sellerRepository.sellerNum_check(reg);
        return sellerDTO;
    }

    public void sellerSave(SellerDTO sellerDTO) {
        sellerRepository.sellerSave(sellerDTO);
    }

    public void sellerDelete(Long seller_id) {
        sellerRepository.sellerDelete(seller_id);
    }

    public void sellerUpdate(SellerDTO sellerDTO) {
        sellerRepository.sellerUpdate(sellerDTO);
    }
}
