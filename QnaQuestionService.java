package com.webjjang.qna.service;

import com.webjjang.main.controller.Service;
import com.webjjang.qna.dao.QnaDAO;
import com.webjjang.qna.vo.QnaVO;

public class QnaQuestionService implements Service {

	private QnaDAO dao;
	
	public QnaQuestionService() {
		System.out.println("QnaQuestionService_생성완료");
	}
	
	@Override
	public Object service(Object obj) throws Exception {
		// TODO Auto-generated method stub
	System.out.println("QnaQuestionService().obj:" + obj);
		return dao.question((QnaVO)obj);
	}

	
	@Override
	public void setDAO(Object dao) {
		// TODO Auto-generated method stub
		System.out.println("QnaQuestionService().dao:" + dao);
		this.dao = (QnaDAO)dao;
	}
}
