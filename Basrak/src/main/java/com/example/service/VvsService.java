package com.example.service;

import java.util.List;

import com.example.vo.VvsVO;

public interface VvsService {
	void create(VvsVO vvsVO);					// 글 추가하기
	VvsVO read(String u_seq);						// 글 읽기
	List<VvsVO> readAll();							// 전체 글 목록 보기
	void update(VvsVO vvsVO);					// 글 수정하기
	void delete(String u_seq);						// 글 삭제하기
	void updateReadnum(String u_seq);	
	int getTotalPage(int pageSize);
}
