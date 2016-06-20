<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>edit</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
		body{
			font:14px/28px "微软雅黑";
		}
		.contact *:focus{outline :none;}
		.contact{
			width: 700px;
			height: auto;
			background: #f6f6f6;
			margin: 40px auto;
			padding: 10px;
		}
		.contact ul {
			width: 650px;
			margin: 0 auto;
		}
		.contact ul li{
			border-bottom: 1px solid #dfdfdf;
			list-style: none;
			padding: 12px;
		}
		.contact ul li label {
			width: 120px;
			display: inline-block;
			float: left;
		}
		.contact ul li input[type=text],.contact ul li input[type=password]{
			width: 220px;
			height: 25px;
			border :1px solid #aaa;
			padding: 3px 8px;
			border-radius: 5px;
		}
		.contact ul li input:focus{
			border-color: #c00;
			
		}
		.contact ul li input[type=text]{
			transition: padding .25s;
			-o-transition: padding  .25s;
			-moz-transition: padding  .25s;
			-webkit-transition: padding  .25s;
		}
		.contact ul li input[type=password]{
			transition: padding  .25s;
			-o-transition: padding  .25s;
			-moz-transition: padding  .25s;
			-webkit-transition: padding  .25s;
		}
		.contact ul li input:focus{
			padding-right: 70px;
		}
		.btn{
			position: relative;
			left: 300px;
		}
		h1{
		  text-align:center;
		}
  </style>

  </head>
  
  <body>
    <h1>修改书签</h1>
    <p></p>
    <div class="contact" >
      <form method="post" action="${ pageContext.request.contextPath }/bookmark_edit.action" name="form1">
      	<input type="hidden" name="id" value="<s:property value="bookmark.id" />">
        <input type="hidden" name="username" value="<s:property value="#session.existUser.username" />">
        <ul>
          <li>
            <label>address:http://</label><input type="text" name="address" value="<s:property value="bookmark.address" />"/>
          </li>
          <li>
            <label>title:</label><input type="text" name="title" value="<s:property value="bookmark.title" />"/>
          </li>
          <li>
            <label>分类:</label>
            <select name="type">
            	<s:iterator var="t" value="type">
            		<option><s:property value="#t.type" /></option>
            	</s:iterator>
            </select><label><a href="addType.jsp">添加</a></label>
          </li>
        </ul>
          <b class="btn">
            <input type="submit" value="提交" />
          </b>
      </form>
    </div>
    <div style="text-align:center;">
      <p><a href="index.jsp">返回主页</a></p>
    </div>
  </body>
</html>
