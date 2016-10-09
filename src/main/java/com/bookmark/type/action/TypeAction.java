package com.bookmark.type.action;

import com.bookmark.type.service.TypeService;
import com.bookmark.type.vo.Type;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TypeAction extends ActionSupport implements ModelDriven<Type>{
	private Type type = new Type();
	private TypeService typeService;

	@Override
	public Type getModel() {
		// TODO Auto-generated method stub
		return type;
	}

	public void setTypeService(TypeService typeService) {
		this.typeService = typeService;
	}
	
	public String add(){
		typeService.add(type);
		return "addSuccess";
	}

}
