package com.example.service;

import java.util.List;

import com.example.vo.SportsVO;

public interface SportsService {
	void create(SportsVO sportsVO);
	SportsVO read(int s_seq);
	List<SportsVO>readAll();
	void update(SportsVO sportsVO);
	void delete(int s_seq);
}
