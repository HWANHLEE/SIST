package com.example.service;

import java.util.List;

import com.example.vo.DayVO;

public interface DayService {
	void create(DayVO dayVO);
	DayVO read(int d_seq);
	List<DayVO>readAll();
	void update(DayVO dayVO);
	void delete(int d_seq);
}
