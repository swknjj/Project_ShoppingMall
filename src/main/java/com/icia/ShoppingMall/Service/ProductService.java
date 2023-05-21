package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.ProductDTO;
import com.icia.ShoppingMall.DTO.Product_categoryDTO;
import com.icia.ShoppingMall.Repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public void productSave(ProductDTO productDTO) throws IOException {
        if(productDTO.getDiscount_rate()!=null){
            double discountRate = productDTO.getDiscount_rate();
            int specialPrice = (int)(productDTO.getPrice() - (productDTO.getPrice() * (discountRate * 0.01)));

            String specialPriceStr = String.valueOf(specialPrice);
            productDTO.setSpecial_price(specialPriceStr);

            if(productDTO.getImg()!=null) {
                String originalFilename = productDTO.getImg().getOriginalFilename();
                String savePath = "D:\\Project_ShoppingMall\\img\\" + originalFilename;
                productDTO.getImg().transferTo(new File(savePath));
                productDTO.setImage(originalFilename);
            }
            productRepository.productSave(productDTO);
        }
    }
    public List<ProductDTO> findCategory(Long category_id) {
        List<ProductDTO> product_categoryDTOList = productRepository.findCategory(category_id);
        return product_categoryDTOList;
    }

    public List<ProductDTO> findAll() {
        List<ProductDTO> productDTOList = productRepository.findAll();
        return productDTOList;
    }
}
