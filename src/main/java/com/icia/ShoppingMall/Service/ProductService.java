package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.ProductDTO;
import com.icia.ShoppingMall.DTO.Product_categoryDTO;
import com.icia.ShoppingMall.Page.PageDTO;
import com.icia.ShoppingMall.Repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public void productSave(ProductDTO productDTO) throws IOException {
        if (productDTO.getDiscount_rate() != null) {
            double discountRate = productDTO.getDiscount_rate();
            int specialPrice = (int) (productDTO.getPrice() - (productDTO.getPrice() * (discountRate * 0.01)));

            String specialPriceStr = String.valueOf(specialPrice);
            productDTO.setSpecial_price(specialPriceStr);

            if (productDTO.getImg() != null) {
                String originalFilename = productDTO.getImg().getOriginalFilename();
                String savePath = "D:\\ShoppingMall_Img\\" + originalFilename;

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




    public List<ProductDTO> findAll(int page) {
        int pageLimit = 9;
        int pagingStart = (page - 1) * pageLimit;
        Map<String, Integer> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", pageLimit);
        List<ProductDTO> productDTOList = productRepository.findAll(pagingParams);
        return productDTOList;
    }


    public PageDTO pagingParam(int page) {
        int pageLimit = 9;
        int blockLimit = 5;
        int productCount = productRepository.total();
        int maxPage = (int) (Math.ceil((double) productCount / pageLimit));
        int startPage = (((int) (Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        int endPage = startPage + blockLimit -1;
        if(endPage>maxPage){
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setStartPage(startPage);
        return pageDTO;
    }

    public List<ProductDTO> search(int page, String type, String q) {
        int pageLimit = 9;
        int pagingStart = (page-1)*pageLimit;
        Map<String,Object> pagingParams= new HashMap<>();
        pagingParams.put("start",pagingStart);
        pagingParams.put("limit",pageLimit);
        pagingParams.put("q",q);
        pagingParams.put("type",type);
        List<ProductDTO> productDTOList = productRepository.search(pagingParams);
        return productDTOList;
    }

    public PageDTO pagingSearchParam(int page, String type, String q) {
        int pageLimit = 9;
        int blockLimit = 5;
        Map<String, Object> pagingParams = new HashMap<>();
        pagingParams.put("q", q);
        pagingParams.put("type", type);
        int searchCount = productRepository.searchCount(pagingParams);
        int maxPage = (int) (Math.ceil((double) searchCount / pageLimit));
        int startPage = ((int) (Math.ceil((double) page / blockLimit))) * blockLimit - (blockLimit - 1);
        int endPage = startPage + blockLimit - 1;
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setStartPage(startPage);
        return pageDTO;
    }
}
