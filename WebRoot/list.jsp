<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
  <head>
    
    <title>My List</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style>
        body{
            padding:0;
            margin:0;
            font:normal 12px/24px "\5FAE\8F6F\96C5\9ED1";
            color:#444;
            }
        table{
            border:0;
            margin:100px auto 0;
            text-align:center;
            border-collapse:collapse;
            border-spacing:0;
            }
        table th{
            background:#0090D7;
            font-weight:normal;
            font-size:14px;
            color:#FFF;
            }
        table tr:nth-child(odd){
            background:#F4F4F4;
            }
        table td:nth-child(even){
            color:#C00;
            }
        table tr:hover{
            background:#73B1E0;
            color:#FFF;
            }
        table td,table th{
            border:1px solid #EEE;
            }
    </style>
	<script language="javascript">
         
  </script>

  </head>
  
  <body>
  
    
    <table width="100%" border="0">
      <tr>
        <th>
        <font size=4>第<s:property value="pageBean.page" />/<s:property value="pageBean.totalPage" />页 </font>
        </th>
      </tr>
    </table>
    <table>
        <tr>
            <th>address</th>
            <th>title</th>
            <th>type</th>
            <th>修改</th>
            <th>删除</th>
            <th>点此进入</th>
        </tr>
        
        <s:iterator var="bookmark" value="pageBean.list">
        <td><input type="hidden" name="username" value="<s:property value="#session.existUser.username" />" /></td>
        <tr>
            <td><input type="text" name="address" value="<s:property value="#bookmark.address" />" /></td>
            <td><input type="text" name="title" value="<s:property value="#bookmark.title" />" /></td>
            <td><s:property value="#bookmark.type" /><input type="hidden" name="type" value="<s:property value="#bookmark.type" />" /></td>
            <td><a href="${ pageContext.request.contextPath }/bookmark_findById.action?bid=<s:property value="#bookmark.id"/>" >修改</a></td>
            <td><a href="${ pageContext.request.contextPath }/bookmark_delete.action?bid=<s:property value="#bookmark.id"/>" >delete</a></td>
            <td><a href="http://<s:property value="#bookmark.address" />">点此进入</a></td>
        </tr>

        </s:iterator>

    </table>
   

    <table width="100%" border="0">
      <tr>
        <th><div align="center">
        <span>第<s:property value="pageBean.page" />/<s:property
								value="pageBean.totalPage" />页 </span>
								<s:if test="pageBean.page != 1">
								<a
									href="${ pageContext.request.contextPath }/bookmark_findByUsername.action?page=1"
									class="firstPage">&nbsp;</a>
								<a
									href="${ pageContext.request.contextPath }/bookmark_findByUsername?page=<s:property value="pageBean.page-1"/>"
									class="previousPage">&nbsp;</a>
							</s:if> <s:iterator var="i" begin="1" end="pageBean.totalPage">
								<s:if test="pageBean.page != #i">
									<a
										href="${ pageContext.request.contextPath }/bookmark_findByUsername.action?page=<s:property value="#i"/>"><s:property
											value="#i" />
									</a>
								</s:if>
								<s:else>
									<span class="currentPage"><s:property value="#i" />
									</span>
								</s:else>
							</s:iterator> <s:if test="pageBean.page != pageBean.totalPage">
								<a class="nextPage"
									href="${ pageContext.request.contextPath }/bookmark_findByUsername.action?page=<s:property value="pageBean.page+1"/>">&nbsp;</a>
								<a class="lastPage"
									href="${ pageContext.request.contextPath }/bookmark_findByUsername?page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
							</s:if>

</div>
</th>
</tr>
</table>
    <div style="text-align:center;">
      <p><a href="index.jsp">返回主页</a></p>
    </div>
  </body>
</html>
