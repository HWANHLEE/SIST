package com.example.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.UserVO;

@Repository
public class UserDao {
	@Autowired
	private SqlSession sqlSession;

	public void insertUser(UserVO userVO) {
		this.sqlSession.insert("insert", userVO);
	}
}
