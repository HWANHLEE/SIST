package com.example.dao;

import java.util.List;

import com.example.vo.UserVO;

public interface UserDao {
	void insertUser(UserVO userVO);
	UserVO selectUser(String nickname);
	List<UserVO> selectAllUsers();
	void updateUser(UserVO userVO);
	void deleteUser(String nickname);
	int loginUser(String nickname, String passwd);
	
}
