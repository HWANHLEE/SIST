package com.example.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.DayVO;

import lombok.extern.java.Log;

@Repository("dayDao")
@Log
public class DayDaoImpl implements DayDao {
	@Autowired
	private SqlSession sqlsession;
	
	@Override
	public void insertDay(DayVO dayVO) {
		this.sqlsession.insert("Day.insert",dayVO);
	}

	@Override
	public DayVO selectDay(int d_seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DayVO> selectAllDay() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateDay(DayVO dayVO) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteDay(int d_seq) {
		// TODO Auto-generated method stub

	}

}
