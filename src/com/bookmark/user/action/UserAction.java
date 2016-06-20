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
	 * ������֤��
	 */
	
	private String checkcode;
	
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	/**
	 * ��ת��ע��ҳ���ִ�з���
	 */
	
	public String registPage(){
		return "registPage";
	}
	
	public String loginPage(){
		return "loginPage";
	}
	
	public String findByName() throws IOException{
		//����service���в�ѯ
		User existUser=userService.findByUsername(user.getUsername());
		//���response������ҳ�����
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		if(existUser!=null){
			response.getWriter().println("<font color='red'>�û����Ѿ�����</font>");
			
		}else{
			response.getWriter().println("<font color='green'>�û�������ʹ��</font>");
		}
		return NONE;
		
	} 
	
	/**
	 * �û�ע�᷽��
	 */
	
	public String regist(){
		//�ж���֤�����
		//��session�л����֤�������
		String checkcode1 = ServletActionContext.getRequest().getSession().getAttribute("checkcode").toString();
		if(!checkcode.equalsIgnoreCase(checkcode1)){
			this.addActionError("��֤���������");
			return "checkcodeFail";
		}
		userService.save(user);
		this.addActionMessage("ע��ɹ�");
		
		
		return "registSuccess";
		
	}
	
	public String login(){
		User existUser = userService.login(user);
		if(existUser==null){
			this.addActionError("��¼ʧ�ܣ�����û������������");
			return LOGIN;
		}else{
			//���û���Ϣ����session��
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			return "loginSuccess";
		}
	}
	
	public String quit(){
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}

}
