package com.bookmark.bookmark.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.bookmark.bookmark.service.BookmarkService;
import com.bookmark.bookmark.vo.Bookmark;
import com.bookmark.type.service.TypeService;
import com.bookmark.type.vo.Type;
import com.bookmark.user.vo.User;
import com.bookmark.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BookmarkAction extends ActionSupport implements ModelDriven<Bookmark>{
	private BookmarkService bookmarkService;
	private Integer page;
	private Integer bid;
	private Bookmark bookmark = new Bookmark();
	private TypeService typeService;
	
	@Override
	public Bookmark getModel() {
		// TODO Auto-generated method stub
		return bookmark;
	}
	


	public void setBid(Integer bid) {
		this.bid = bid;
	}



	public void setPage(Integer page) {
		this.page = page;
	}
	
	public void setBookmarkService(BookmarkService bookmarkService) {
		this.bookmarkService = bookmarkService;
	}
	
	
	public void setTypeService(TypeService typeService) {
		this.typeService = typeService;
	}



	public String findByUsername(){
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		PageBean<Bookmark> pageBean = bookmarkService.findByPageUsername(user.getUsername(),page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByUsernameSuccess";
	}
	public String add(){
		bookmarkService.add(bookmark);
		return "addSuccess";
	}
	
	public String delete(){
		bookmarkService.delete(bid);
		return "deleteSuccess";
	}
	public String edit(){
		bookmarkService.edit(bookmark);
		return "editSuccess";
	}
	
	public String findById(){
		bookmark = bookmarkService.findById(bid);
		List<Type> tlist = new ArrayList<Type>();
		tlist = typeService.findAll();
		ActionContext.getContext().getValueStack().set("type", tlist);
		ActionContext.getContext().getValueStack().set("bookmark", bookmark);
		return "findByIdSuccess";
	}


}
