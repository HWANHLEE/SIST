package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.vo.FaqVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("faqDao")
public class FaqDaoImpl implements FaqDao {
	@Autowired
	private SqlSession sqlSession;
	
	// 한개의 글 조회
	@Override
	public FaqVO selectFaq(String f_seq) {
		log.warn("--------------------------------------------------------------" +f_seq);
		log.warn("한개의 글 조회 : " + this.sqlSession.selectOne("Faq.selectOne", f_seq));
		
		return this.sqlSession.selectOne("Faq.selectOne", f_seq);
	}
	
	@Override
	public List<FaqVO> selectAllFaq() {
		Map<String, Object> map = new HashMap<String, Object>();
		this.sqlSession.selectList("Faq.selectAllSP", map);
		List<FaqVO> list = (List<FaqVO>)map.get("result");
//		List<FaqVO> list = this.sqlSession.selectList("Faq.selectAllSP");
		
//		log.info("들어오는 값 : " + list);
		
		return list;
	}
	
	// 조회수
	@Override
	public void readnumUpdate(String f_seq) {
		this.sqlSession.update("Faq.readnumUpdate", f_seq);
	}

	// page 갯수 조회
	@Override
	public int getTotalCount() {
		return (Integer)this.sqlSession.selectOne("selectCountFaq");
	}

}
