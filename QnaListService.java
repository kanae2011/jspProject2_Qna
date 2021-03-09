package com.webjjang.qna.service;

import com.webjjang.main.controller.Service;
import com.webjjang.qna.dao.QnaDAO;
import com.webjjang.util.PageObject;

public class QnaListService implements Service {

	private QnaDAO dao;
	
	
	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
		long totalRow = dao.getTotalRow();
		//넘어오는 obj가 Object 타입으로 넘어오지만 PageObject가 들어있으므로 형변환 
		 PageObject pageObject = (PageObject)obj;
		 pageObject.setTotalRow(totalRow);
		 System.out.println("BoardListService.pageObject : " + pageObject);
		return dao.list(pageObject);
	}

	
	@Override
	public void setDAO(Object dao) {
		// TODO Auto-generated method stub
		this.dao = (QnaDAO)dao;
	}
}
