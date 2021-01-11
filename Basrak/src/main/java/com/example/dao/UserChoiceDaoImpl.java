package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.UserChoiceVO;

import lombok.extern.java.Log;

@Repository("userChoiceDao")
@Log
public class UserChoiceDaoImpl implements UserChoiceDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertUserChoice(UserChoiceVO userChoiceVO) {
		log.info("넘어오는 값 ="+userChoiceVO.toString());
		this.sqlSession.insert("UserChoice.insert", userChoiceVO);
	}

	// 수정해
	@Override
	public UserChoiceVO selectUserChoice(String nickname) {
		Map<String, Object> map = new HashMap<String, Object>();
		this.sqlSession.selectList("UserChoice.selectAllSP", map);
		log.info("제발 넘어와줘 : " + this.sqlSession.selectList("UserChoice.selectAllSP", map));
		
		return null;
	}

	@Override
	public List<UserChoiceVO> selectAllUserChoice() {
		Map<String, Object> map = new HashMap<String, Object>();
		this.sqlSession.selectList("UserChoice.selectAllSP", map);
		
		return (List<UserChoiceVO>)map.get("result");
	}

	@Override
	public void updateUserChoice(String nickname) {
		this.sqlSession.update("UserChoice.updelete", nickname);
	}

	@Override
	public void deleteUserChoice(int choice_seq) {
		// TODO Auto-generated method stub

	}

}
