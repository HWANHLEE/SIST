package com.example.dao;

import java.util.List;

import com.example.vo.FaqVO;

public interface FaqDao {
	FaqVO selectFaq(String f_seq);			// 글 읽기
	List<FaqVO> selectAllFaq();				// 전체 글 목록 보기		
	void readnumUpdate(String f_seq);		
	int getTotalCount();
}
