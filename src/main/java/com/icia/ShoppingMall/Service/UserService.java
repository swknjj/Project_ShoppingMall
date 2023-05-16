package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.UserDTO;
import com.icia.ShoppingMall.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public UserDTO findByNickname(String nickname) {
        UserDTO userDTO = userRepository.findByNickName(nickname);
        return userDTO;
    }
}
