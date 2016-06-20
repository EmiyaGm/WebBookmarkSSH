package com.bookmark.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.bookmark.user.service.UserService;
import com.bookmark.user.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;



public class UserAction extends ActionSupport implements ModelDriven<User>{
	private User user = new User();
	private UserService userService;

	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	/*
	 * 接收验证码
	 */
	
	private String checkcode;
	
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	/**
	 * 跳转到注册页面的执行方法
	 */
	
	public String registPage(){
		return "registPage";
	}
	
	public String loginPage(){
		return "loginPage";
	}
	
	public String findByName() throws IOException{
		//调用service进行查询
		User existUser=userService.findByUsername(user.getUsername());
		//获得response对象，向页面输出
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		if(existUser!=null){
			response.getWriter().println("<font color='red'>用户名已经存在</font>");
			
		}else{
			response.getWriter().println("<font color='green'>用户名可以使用</font>");
		}
		return NONE;
		
	} 
	
	/**
	 * 用户注册方法
	 */
	
	public String regist(){
		//判断验证码程序
		//从session中获得验证码随机至
		String checkcode1 = ServletActionContext.getRequest().getSession().getAttribute("checkcode").toString();
		if(!checkcode.equalsIgnoreCase(checkcode1)){
			this.addActionError("验证码输入错误");
			return "checkcodeFail";
		}
		userService.save(user);
		this.addActionMessage("注册成功");
		
		
		return "registSuccess";
		
	}
	
	public String login(){
		User existUser = userService.login(user);
		if(existUser==null){
			this.addActionError("登录失败，你的用户名或密码错误！");
			return LOGIN;
		}else{
			//将用户信息存入session中
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			return "loginSuccess";
		}
	}
	
	public String quit(){
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}

}
