package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.UserDao;
import com.example.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	
	@Override
	public void create(UserVO userVO) {
		this.userDao.insertUser(userVO);
	}

	@Override
	public UserVO read(String email) {
		return this.userDao.selectUser(email);
	}

	@Override
	public List<UserVO> readAll() {
		return this.userDao.selectAllUsers();
	}

	@Override
	public void update(UserVO userVO) {
		this.userDao.updateUser(userVO);
	}

	@Override
	public void delete(String nickname) {
		this.userDao.deleteUser(nickname);
	}

	@Override
	public int login(String email, String passwd) {
		return this.userDao.loginUser(email, passwd);
	}

}
