package com.example.dao;

import java.util.List;

import com.example.vo.VvsVO;

public interface VvsDao {
	void insertBoard(VvsVO vvsVO);
	VvsVO selectBoard(String u_seq);
	List<VvsVO> selectAllBoard();
	void updateBoard(VvsVO vvsVO);
	void deleteBoard(String u_seq);
	void readnumUpdate(String u_seq);
	int getTotalCount();
}
