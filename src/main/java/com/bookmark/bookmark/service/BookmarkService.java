package com.bookmark.bookmark.service;

import java.util.List;

import com.bookmark.bookmark.dao.BookmarkDao;
import com.bookmark.bookmark.vo.Bookmark;
import com.bookmark.utils.PageBean;




public class BookmarkService {
	private BookmarkDao bookmarkDao;

	

	public void setBookmarkDao(BookmarkDao bookmarkDao) {
		this.bookmarkDao = bookmarkDao;
	}



	public PageBean<Bookmark> findByPageUsername(String username, Integer page) {
        PageBean<Bookmark> pageBean = new PageBean<Bookmark>();
		pageBean.setPage(page);
		Integer limit = 5;
		pageBean.setLimit(limit);
		Integer totalCount = null;
		totalCount = bookmarkDao.findByCountUid(username);
		pageBean.setTotalCount(totalCount);
		Integer totalPage = null;
		if(totalCount%limit==0){
			totalPage=totalCount / limit;
		}else{
			totalPage=totalCount / limit +1;
		}
		pageBean.setTotalPage(totalPage);
		//设置每页显示数据集合
		Integer begin = (page-1)*limit;
		List<Bookmark> list = bookmarkDao.findByPageUsername(username,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}



	public void add(Bookmark bookmark) {
		// TODO Auto-generated method stub
		bookmarkDao.add(bookmark);
	}



	public void delete(Integer bid) {
		// TODO Auto-generated method stub
		
		bookmarkDao.delete(bid);
	}



	public void edit(Bookmark bookmark) {
		// TODO Auto-generated method stub
		bookmarkDao.edit(bookmark);
	}



	public Bookmark findById(Integer bid) {
		// TODO Auto-generated method stub
		
		return bookmarkDao.findById(bid);
	}

}
