package com.example.dao;

import java.util.List;

import com.example.vo.DayVO;

public interface DayDao {
	void insertDay(DayVO dayVO);
	DayVO selectDay(int d_seq);
	List<DayVO>selectAllDay();
	void updateDay(DayVO dayVO);
	void deleteDay(int d_seq);
}
