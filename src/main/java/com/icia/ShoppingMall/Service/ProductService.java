package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.*;
import com.icia.ShoppingMall.Page.PageDTO;
import com.icia.ShoppingMall.Repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    public ProductDTO productSave(ProductDTO productDTO) throws IOException {
        ProductDTO dto = null;
        if (productDTO.getDiscount_rate() != 0) {
            double discountRate = productDTO.getDiscount_rate();
            int specialPrice = (int) (productDTO.getPrice() - (productDTO.getPrice() * (discountRate * 0.01)));
            productDTO.setSpecial_price(specialPrice);
        } else {
            productDTO.setSpecial_price(productDTO.getPrice());
        }
        if (productDTO.getImg() != null) {
            String originalFilename = productDTO.getImg().getOriginalFilename();
            String storedFileName = System.currentTimeMillis() + originalFilename;
            String savePath = "D:\\SpringFramework_img\\" + storedFileName;

            productDTO.getImg().transferTo(new File(savePath));
            productDTO.setImage(originalFilename);
            productDTO.setStoredFileName(storedFileName);
        }
        dto = productRepository.productSave(productDTO);

        if (!(productDTO.getProductProfile().get(0).isEmpty())) {
            for (MultipartFile productFile : productDTO.getProductProfile()) {
                String originalName = productFile.getOriginalFilename();
                String storedFileName = System.currentTimeMillis() + originalName;
                Product_imageDTO productImageDTO = new Product_imageDTO();
                productImageDTO.setProduct_id(dto.getProduct_id());
                productImageDTO.setSeller_id(dto.getSeller_id());
                productImageDTO.setFile_name(originalName);
                productImageDTO.setStoredFileName(storedFileName);
                String savePath = "D:\\SpringFramework_img\\" + storedFileName;

                productFile.transferTo(new File(savePath));
                productRepository.saveFile(productImageDTO);
            }
        }
        return dto;
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

    public List<ProductDTO> search(int page, String type, String q) {
        int pageLimit = 9;
        int pagingStart = (page - 1) * pageLimit;
        Map<String, Object> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", pageLimit);
        pagingParams.put("q", q);
        pagingParams.put("type", type);
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

    public ProductDTO findDTO(Long id) {
        return productRepository.findDTO(id);
    }

    public List<Product_imageDTO> findFile(Long product_id) {
        List<Product_imageDTO> product_imageDTOList = productRepository.findFile(product_id);
        return product_imageDTOList;
    }

    public Product_option1DTO option1save(Product_option1DTO productOption1DTO) {
        Product_option1DTO product_option1DTO = productRepository.option1save(productOption1DTO);
        return product_option1DTO;
    }

    public void option2save(Product_option2DTO productOption2DTO) {
        productRepository.option2save(productOption2DTO);
    }

    public Product_option1DTO findOption1(Long product_id) {
        Product_option1DTO product_option1DTO = productRepository.findOption1(product_id);
        return product_option1DTO;
    }

    public Product_option2DTO findOption2(Long option_id) {
        Product_option2DTO product_option2DTO = productRepository.findOption2(option_id);
        return product_option2DTO;
    }

    public void updateOption1(Product_option1DTO productOption1DTO) {
        productRepository.updateOption1(productOption1DTO);
    }
}
