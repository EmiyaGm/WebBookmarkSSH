package com.bookmark.type.service;

import java.util.List;

import com.bookmark.type.dao.TypeDao;
import com.bookmark.type.vo.Type;

public class TypeService {
	private TypeDao typeDao;

	public void setTypeDao(TypeDao typeDao) {
		this.typeDao = typeDao;
	}

	public List<Type> findAll() {
		// TODO Auto-generated method stub
		return typeDao.findAll();
	}

	public void add(Type type) {
		// TODO Auto-generated method stub
		typeDao.add(type);
	}
	

}
