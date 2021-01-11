package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.FaqDao;
import com.example.vo.FaqVO;
import com.example.vo.VvsVO;

@Service("faqService")
public class FaqServiceImpl implements FaqService {
	@Autowired
	private FaqDao faqDao;

	@Override
	public FaqVO read(String f_seq) {
		FaqVO faqVO = this.faqDao.selectFaq(f_seq);
		
		String title = faqVO.getTitle();
		title = this.reverseChangeTag(title);
		title = title.replace("\"", "'");
		faqVO.setTitle(title);
		
		String content = faqVO.getContent();
		content = this.reverseChangeTag(content);
		faqVO.setContent(content);
		
		return faqVO;
	}

	// faqDao의 selectAllFaq를 찾아간다
	@Override
	public List<FaqVO> readAll() {
		List<FaqVO> list = this.faqDao.selectAllFaq();
		list.forEach(vvs -> {
			String title = vvs.getTitle();
			title = this.reverseChangeTag(title);
			title = title.replace("\"", "'");
			vvs.setTitle(title);
		});
		
		return list;
	}

	@Override
	public void updateReadnum(String f_seq) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getTotalPage(int pageSize) {
		int count = this.faqDao.getTotalCount();
		   int totalPage = 0;
		   if(count % pageSize == 0) totalPage = count / pageSize;
		   else totalPage = count / pageSize + 1;
		   
	   return totalPage;
	}
	
	 private String reverseChangeTag(String str) {
		   String newstr = str.replace("&lt;", "<");
		   return newstr.replace("&gt;", ">");
		   
   }

}
