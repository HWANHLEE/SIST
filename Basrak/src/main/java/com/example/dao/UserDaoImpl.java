package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.UserVO;

import lombok.extern.java.Log;
@Repository("userDao")
@Log
public class UserDaoImpl implements UserDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertUser(UserVO userVO) {
		log.info("추가되는 유저 정보 = " + userVO.toString());
		this.sqlSession.insert("Users.insertSP", userVO);
	}

	@Override
	public UserVO selectUser(String email) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		this.sqlSession.selectOne("Users.selectOneSP", map);
		List<UserVO>list = (List<UserVO>)map.get("result");
		if(list.size() == 1) return list.get(0); //테이블에서 유저를 찾았다면 //primary key로 검색하니까 1개밖에 안나오게찌
		else return null;//테이블에서 유저를 못 찾았다면
	}

	@Override
	public List<UserVO> selectAllUsers() {
		Map<String,Object> map = new HashMap<String, Object>();
		this.sqlSession.selectList("Users.selectAllSP", map);
		return (List<UserVO>)map.get("result");
	}

	@Override
	public void updateUser(UserVO userVO) {
		this.sqlSession.update("Users.updateSP", userVO);
	}

	@Override
	public void deleteUser(String nickname) {
		this.sqlSession.delete("Users.deleteSP", nickname);
	}

	@Override
	public int loginUser(String email, String passwd) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);//INPUT parameter
		map.put("passwd", passwd);//INPUT parameter
		this.sqlSession.selectList("Users.login",map);
		log.info("result = " + map.get("result"));
		
		return (Integer)map.get("result");
	}

}
