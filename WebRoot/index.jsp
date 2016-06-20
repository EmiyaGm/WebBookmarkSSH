<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>index</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/templatemo_misc.css">
   	<link type="text/css" rel="stylesheet" href="css/easy-responsive-tabs.css" />
    <link href="css/templatemo_style.css" rel="stylesheet">  
     <script>
    function showhide()
    {
        var div = document.getElementById("newpost");
		if (div.style.display !== "none") 
		{
			div.style.display = "none";
		}
		else 
		{
			div.style.display = "block";
		}
    }
  </script>
  </head>
  
  <body>
      <div class="logocontainer">
          <div class="row">
              <h1>在线书签</h1>
          <div class="clear"></div>
            <div class="templatemo_smalltitle">
    尊敬的<s:if test="#session.existUser!=null"><s:property value="#session.existUser.username" /></s:if>用户，欢迎您!</div>
       </div>
    </div>
    <div id="menu-container" class="main_menu">
        <div class="content homepage" id="menu-1">
        <div class="container">
          	<div class="col-md-3 col-sm-6 templatemo_leftgap">
            	<div class="templatemo_mainservice templatemo_botgap">
                	<div class="templatemo_link">
                    <s:if test="#session.existUser==null">
                       <a href="login.jsp">查看书签</a><br />
                     </s:if>
                     <s:else>
                       <a href="${ pageContext.request.contextPath }/bookmark_findByUsername.action?page=1">查看书签</a><br />
                     </s:else>
                    </div>
                    </div>
                <div class="templatemo_mainimg"><img src="images/templatemo_home1.jpg" alt="home img 01"></div>
            </div>
            <div class="col-md-3 col-sm-6 templatemo_leftgap">
            	<div class="templatemo_mainimg templatemo_botgap templatemo_portfotopgap"><img src="images/templatemo_home2.jpg" alt="home img 02"></div>
                <div class="templatemo_mainportfolio">
                      <div class="templatemo_link">
                      <s:if test="#session.existUser==null">
                       <a href="login.jsp">添加书签</a>
                       </s:if>
                       <s:else>
                       <a href="add.jsp">添加书签</a>
                       </s:else>
                       </div>         
                </div>
            </div>
             <div class="col-md-3 col-sm-6 templatemo_leftgap">
            	<div class="templatemo_maintesti templatemo_botgap templatemo_topgap">
                	<div class="templatemo_link">
                	<s:if test="#session.existUser!=null">
                	  <a href="${ pageContext.request.contextPath }/user_quit.action" onClick="{if(confirm('确实要注销吗？')){return true;}return false;}">注销</a>
                	</s:if>
                	<s:else>
                      <a href="login.jsp" >登录</a>
                    </s:else>
                    </div>
                </div>
                <div class="templatemo_mainimg"><img src="images/templatemo_home3.jpg" alt="home img 03"></div>
            </div>
            <div class="col-md-3 col-sm-6 templatemo_leftgap">
            	<div class="templatemo_mainimg templatemo_botgap templatemo_topgap">
             	   <img src="images/templatemo_home4.jpg" alt="home img 04">
                </div>
                <div class="templatemo_mainabout templatemo_botgap">
                	<div class="templatemo_link"><a href="http://182.254.218.192:8080/wordpress/
                	">关于我们</a></div>
                </div>
                <div class="templatemo_maincontact">
                	<div class="templatemo_link"><a href="http://182.254.218.192:8080/wordpress/
                	">联系我们</a></div>
                </div>
            </div>
            </div>
    
   </div>
   </div>
    
  </body>
</html>
