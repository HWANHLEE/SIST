package com.example.service;

import java.util.List;

import com.example.vo.FaqVO;

public interface FaqService {
	FaqVO read(String f_seq); 			// 글 읽기
	List<FaqVO> readAll();    			// 전체 글 목록 보기
	void updateReadnum(String f_seq);   
	int getTotalPage(int pageSize);
}
