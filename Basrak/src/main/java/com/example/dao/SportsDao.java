package com.example.dao;

import java.util.List;

import com.example.vo.DayVO;
import com.example.vo.SportsVO;

public interface SportsDao {
	void insertDay(SportsVO sportsVO);
	SportsVO selectDay(int s_seq);
	List<SportsVO>selectAllDay();
	void updateDay(SportsVO sportsVO);
	void deleteDay(int s_seq);
}
