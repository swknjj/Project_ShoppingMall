package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.AddressDTO;
import com.icia.ShoppingMall.Repository.AddressRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressService {
    @Autowired
    AddressRepository addressRepository;

    public void userAddress(AddressDTO addressDTO) {
        addressRepository.userAddress(addressDTO);
    }

    public List<AddressDTO> findByAddress(Long user_Id) {
        List<AddressDTO> addressDTOList = addressRepository.findByAddress(user_Id);
        return addressDTOList;
    }

    public List<AddressDTO> findByOrderAddress(Long user_id) {
        return addressRepository.findByOrderAddress(user_id);
    }

    public AddressDTO findByAddressOne(Long address_id) {
        AddressDTO addressDTO = addressRepository.findByAddressOne(address_id);
        return addressDTO;
    }
}
