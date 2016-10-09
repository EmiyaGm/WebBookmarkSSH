package com.bookmark.type.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bookmark.type.vo.Type;

public class TypeDao extends HibernateDaoSupport{

	public List<Type> findAll() {
		// TODO Auto-generated method stub
		String hql = "from Type";
		return this.getHibernateTemplate().find(hql);
	}

	public void add(Type type) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(type);
	}

}
