package com.bookmark.bookmark.dao;

import java.util.List;

import javax.transaction.Transaction;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bookmark.bookmark.vo.Bookmark;
import com.bookmark.utils.PageHibernateCallback;


public class BookmarkDao extends HibernateDaoSupport{

	public Integer findByCountUid(String username) {
		String hql="select count(*) from Bookmark b where b.username = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, username);
		if(list!=null&&list.size()>0){
			return list.get(0).intValue();
		}
		return null;
	}

	public List<Bookmark> findByPageUsername(String username, Integer begin,
			Integer limit) {
		String hql = "from Bookmark where username = ?";
		List<Bookmark> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Bookmark>(hql, new Object[]{username}, begin, limit));
		return list;
	}

	public void add(Bookmark bookmark) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(bookmark);
	}

	public void delete(Integer bid) {
		// TODO Auto-generated method stub
		String sql="delete from bookmark where id = "+bid;
		this.getSession().createSQLQuery(sql).executeUpdate();
		this.getSession().flush();
		this.getSession().clear();
	}

	public void edit(Bookmark bookmark) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(bookmark);
	}

	public Bookmark findById(Integer bid) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Bookmark.class, bid);
	}


}
