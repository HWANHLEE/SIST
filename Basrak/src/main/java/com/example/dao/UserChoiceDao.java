package com.example.dao;

import java.util.List;

import com.example.vo.UserChoiceVO;

//crrud
public interface UserChoiceDao {
	void insertUserChoice(UserChoiceVO userChoiceVO);
	UserChoiceVO selectUserChoice(String nickname);
	List<UserChoiceVO> selectAllUserChoice();
	void updateUserChoice(String nickname);
	void deleteUserChoice(int choice_seq);
	
}
