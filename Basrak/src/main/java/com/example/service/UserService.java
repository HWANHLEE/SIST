package com.example.service;

import java.util.List;

import com.example.vo.UserVO;

public interface UserService {
	void create(UserVO userVO);
	UserVO read(String nickname);
	List<UserVO>readAll();
	void update(UserVO userVO);
	void delete(String nickname);
	int login(String nickname, String passwd);
}
