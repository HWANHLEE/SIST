package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.UserChoiceDao;
import com.example.vo.UserChoiceVO;

@Service("userChoiceService")
public class UserChoiceServiceImpl implements UserChoiceService {
	@Autowired
	private UserChoiceDao userChoiceDao;
	
	@Override
	public void create(UserChoiceVO userChoiceVO) {
		this.userChoiceDao.insertUserChoice(userChoiceVO);
	}

	@Override
	public UserChoiceVO read(String nickname) {
		return this.userChoiceDao.selectUserChoice(nickname);
		
	}

	@Override
	public List<UserChoiceVO> readAll() {
		return this.userChoiceDao.selectAllUserChoice();
	}

	@Override
	public void update(String nickname) {
		this.userChoiceDao.updateUserChoice(nickname);
	}

	@Override
	public void delete(int choice_seq) {
		// TODO Auto-generated method stub

	}

}
