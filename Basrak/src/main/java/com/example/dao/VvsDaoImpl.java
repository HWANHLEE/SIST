package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.VvsVO;

import lombok.extern.java.Log;

@Log
@Repository("vvsDao")
public class VvsDaoImpl implements VvsDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertBoard(VvsVO vvsVO) {
		 log.info("DAO에서 들어온 내용 " + vvsVO.toString());
		 this.sqlSession.insert("Vvs.insertSP", vvsVO);
	}

	@Override
	public VvsVO selectBoard(String u_seq) {
		return this.sqlSession.selectOne("Vvs.selectOne", u_seq); 
	}

	@Override
	public List<VvsVO> selectAllBoard() {
		Map<String, Object> map = new HashMap<String, Object>();
		this.sqlSession.selectList("Vvs.selectAllSP", map);
		List<VvsVO> list = (List<VvsVO>)map.get("result");
		
		return list;
		
	}

	@Override
	public void updateBoard(VvsVO vvsVO) {
		this.sqlSession.update("Vvs.update", vvsVO);
	}

	@Override
	public void deleteBoard(String u_seq) {
		this.sqlSession.delete("Vvs.delete", u_seq);
	}

	@Override
	public void readnumUpdate(String u_seq) {
		this.sqlSession.update("Vvs.readnumUpdate", u_seq);
	}

	@Override
	public int getTotalCount() {
		return (Integer)this.sqlSession.selectOne("selectCount");
	}

}
