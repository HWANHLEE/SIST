package com.example.service;

import java.util.List;

import com.example.vo.UserChoiceVO;

//crrud
public interface UserChoiceService {
	void create(UserChoiceVO userChoiceVO);
	UserChoiceVO read(String nickname);
	List<UserChoiceVO>readAll();
	void update(String nickname);
	void delete(int choice_seq);
	
}
