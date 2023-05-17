package com.icia.ShoppingMall.Service;

import com.icia.ShoppingMall.DTO.UserDTO;
import com.icia.ShoppingMall.Repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {
    @Autowired
    UserRepository userRepository;

    public UserDTO findByNickname(String nickname) {
        UserDTO userDTO = userRepository.findByNickName(nickname);
        return userDTO;
    }

    public void userSave(UserDTO userDTO) {
        if(userDTO.getEmail()!=null && userDTO.getDomain()!=null){
            userDTO.setEmail_full(userDTO.getEmail()+"@"+userDTO.getDomain());
        }
        System.out.println("userDTO = " + userDTO);
        userRepository.userSave(userDTO);
    }


    public UserDTO findByEmail(String email) {
        UserDTO userDTO = userRepository.findByEmail(email);
        return userDTO;
    }

    public UserDTO userLogin(UserDTO userDTO) {
        return userRepository.userLogin(userDTO);
    }

    public UserDTO findByPassword(String emailFull) {
        UserDTO userDTO = userRepository.findByPassword(emailFull);
        return userDTO;
    }

    public void userPasswordChange(UserDTO userDTO) {
        userRepository.userPasswordChange(userDTO);
    }

    public void userUpdate(UserDTO userDTO) {
        userRepository.userUpdate(userDTO);
    }
}
