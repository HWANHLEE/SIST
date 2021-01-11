package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.VvsDao;
import com.example.vo.VvsVO;

import lombok.extern.java.Log;

@Service("bbsService")
@Log
public class VvsServiceImpl implements VvsService {
	@Autowired
	private VvsDao vvsDao;
	
	@Override
	public void create(VvsVO vvsVO) {
		   String content = vvsVO.getContent();
		   content = this.changeTag(content);
		   vvsVO.setContent(content);
		   
		   String title = vvsVO.getTitle();
		   title = this.changeTag(title);
		   title = title.replace("'", "\"");
		   vvsVO.setTitle(title);
		   
		   this.vvsDao.insertBoard(vvsVO);

	}

	@Override
	public VvsVO read(String u_seq) {
		   VvsVO vvsVO = this.vvsDao.selectBoard(u_seq);
		   
		   String title = vvsVO.getTitle();
		   title = this.reverseChangeTag(title);
		   title = title.replace("\"", "'");
		   vvsVO.setTitle(title);
		   
		   String content = vvsVO.getContent();
		   content = this.reverseChangeTag(content);
		   vvsVO.setContent(content);
			
		   return  vvsVO;
	}

	@Override
	public List<VvsVO> readAll() {
		List<VvsVO> list = this.vvsDao.selectAllBoard();
		list.forEach(vvs -> {
			String title = vvs.getTitle();
			title = this.reverseChangeTag(title);
			title = title.replace("\"", "'");
			vvs.setTitle(title);
		});
		
		return list;
	}

	@Override
	public void update(VvsVO vvsVO) {
		String content = vvsVO.getContent();
		content = this.changeTag(content);  
		content = content.replace("'", "\""); 
		vvsVO.setContent(content);
		
		String title = vvsVO.getTitle();
		title = this.changeTag(title);
		title = title.replace("'", "\"");
		log.info(title);
		vvsVO.setTitle(title);
		
		this.vvsDao.updateBoard(vvsVO);
	}

	@Override
	public void delete(String u_seq) {
		this.vvsDao.deleteBoard(u_seq);
	}

	@Override
	public void updateReadnum(String u_seq) {
		this.vvsDao.readnumUpdate(u_seq);
	}
	
//	private String changeEnter(String str) {
//	   return str.replace("\n", "<br />");
//   }
//   
//   private String reverseChangeEnter(String str) {
//	   return str.replace("<br />", "\n");
//   }
   
   private String changeTag(String str) {
	   String newstr = str.replace("<", "&lt;");
	   return newstr.replace(">", "&gt;");
	   
   }
   
   private String reverseChangeTag(String str) {
	   String newstr = str.replace("&lt;", "<");
	   return newstr.replace("&gt;", ">");
	   
   }

   @Override
   public int getTotalPage(int pageSize) {
	   int count = this.vvsDao.getTotalCount();
	   int totalPage = 0;
	   if(count % pageSize == 0) totalPage = count / pageSize;
	   else totalPage = count / pageSize + 1;
	   
	   return totalPage;
	}

}
