package com.bookmark.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bookmark.user.vo.User;

public class UserDao extends HibernateDaoSupport{

	public void save(User user) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(user);
	}

	public User login(User user) {
		String hql="from User where username = ? and password = ? and usermark = ?";
		List<User> list = this.getHibernateTemplate().find(hql, user.getUsername(),user.getPassword(),user.getUsermark());
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
	}
	
	public User findByUserName(String username){
		String hql="from User where username = ?";
		
		List<User> list = this.getHibernateTemplate().find(hql,username);
		
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		return null;
		
		
	}

}
