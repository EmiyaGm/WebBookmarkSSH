package com.bookmark.user.service;

import com.bookmark.user.dao.UserDao;
import com.bookmark.user.vo.User;

public class UserService {
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void save(User user) {
		userDao.save(user);
		
	}
	public User findByUsername(String username){
		return userDao.findByUserName(username);
	}

	public User login(User user) {
		// TODO Auto-generated method stub
		return userDao.login(user);
	}

}
