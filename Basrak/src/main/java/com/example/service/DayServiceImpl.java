package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.DayDao;
import com.example.vo.DayVO;
@Service("dayService")
public class DayServiceImpl implements DayService {
	@Autowired
	private DayDao dayDao;
	
	@Override
	public void create(DayVO dayVO) {
		this.dayDao.insertDay(dayVO);
	}

	@Override
	public DayVO read(int d_seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DayVO> readAll() {
		return null;
		//return this.dayDao.selectAllDay();
	}

	@Override
	public void update(DayVO dayVO) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int d_seq) {
		// TODO Auto-generated method stub

	}

}
