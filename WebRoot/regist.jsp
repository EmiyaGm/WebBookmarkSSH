<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>Regist</title>
	<meta name="viewport" content="width=device-width,initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="HTML,CSS,XML,JavaScript">
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
		.tips{
			color: rgba(0, 0, 0, 0.5);
			padding-left: 10px;
		}
		.tips_true,.tips_false{
			padding-left: 10px;
		}
		.tips_true{
			color: green;
		}
		.tips_false{
			color: red;
		}
  </style>
  <script type="text/javascript">
	    function checkna(){
			na=form1.username.value;
			// 1.创建异步交互对象
			var xhr = createXmlHttp();
			// 2.设置监听
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						document.getElementById("span1").innerHTML = xhr.responseText;
					}
				}
			};
			// 3.打开连接
			xhr.open("GET","${pageContext.request.contextPath}/user_findByName.action?time="+new Date().getTime()+"&username="+na,true);
			// 4.发送
			xhr.send(null);
		  	if(na.length<1||na.length>12)  
	  		{  	
	  			divname.innerHTML='<font class="tips_false">长度是1~12个字符</font>';
	  		     
	  		}else{  
	  		    divname.innerHTML='<font class="tips_true">输入正确</font>';
	  		   
	  		}  
	  	
	  }
	  //验证密码 
		function checkpsd1(){
			psd1=form1.password.value;
			var flagZM=false;
			var flagSZ=false;
			var flagQT=false;
			if(psd1.length<6 || psd1.length>12){
				divpassword1.innerHTML='<font class="tips_false">长度错误</font>';
			}else
				{
				  for(i=0;i<psd1.length;i++)
					{
                        if((psd1.charAt(i)>='A'&&psd1.charAt(i)<='Z')||(psd1.charAt(i)>='a'&&psd1.charAt(i)<='z'))
						{
							flagZM=true;
						}
						else if(psd1.charAt(i)>='0'&&psd1.charAt(i)<='9')
						{
							flagSZ=true;
						}else
						{
							flagQT=true;
						}
					}
					if(!flagZM||!flagSZ||flagQT){
					divpassword1.innerHTML='<font class="tips_false">密码必须是字母数字的组合</font>';
					}else{
					divpassword1.innerHTML='<font class="tips_true">输入正确</font>';
                    }
               }
           }
           //验证确认密码
           function checkpsd2(){
               if(form1.password.value!=form1.repassword.value){
                   divpassword2.innerHTML='<font class="tips_false">您两次输入的密码不一样</font>';
				}else{
                  divpassword2.innerHTML='<font class="tips_true">输入正确</font>';
				}
		}
		//验证邮箱
		
		function checkmail(){
					apos=form1.emailvalue.indexOf("@");
					dotpos=form1.email.value.lastIndexOf(".");
					if (apos<1||dotpos-apos<2) 
					  {
					  	divmail.innerHTML='<font class="tips_false">输入错误</font>';
					  }
					else {
						divmail.innerHTML='<font class="tips_true">输入正确</font>';
					}
		}
		
		function checkUsername(){
			// 获得文件框值:
			var username = document.getElementById("username").value;
			// 1.创建异步交互对象
			var xhr = createXmlHttp();
			// 2.设置监听
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						document.getElementById("span1").innerHTML = xhr.responseText;
					}
				}
			};
			// 3.打开连接
			xhr.open("GET","${pageContext.request.contextPath}/user_findByName.action?time="+new Date().getTime()+"&username="+username,true);
			// 4.发送
			xhr.send(null);
		}
		
		function createXmlHttp(){
			   var xmlHttp;
			   try{ // Firefox, Opera 8.0+, Safari
			        xmlHttp=new XMLHttpRequest();
			    }
			    catch (e){
				   try{// Internet Explorer
				         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
				      }
				    catch (e){
				      try{
				         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
				      }
				      catch (e){}
				      }
			    }

				return xmlHttp;
			 }
			 function change(){
			 	var img1 = document.getElementById("checkImg");
			 	img1.src="${pageContext.request.contextPath}/checkImg.action?"+new Date().getTime();
			 }
  </script>
  </head>
  <body>
    <div class="contact" >
      <form action="${ pageContext.request.contextPath }/user_regist.action" method="post" name="form1">
        <ul>
          <li>
            <label>姓名：</label><input type="text" name="username" placeholder="请输入用户名"  onblur="checkna()" required/><span class="tips" id="divname">长度1~12个字符</span><span id="span1"></span>
          </li>
          <li>
            <label>密码：</label><input type="password" name="password" placeholder="请输入你的密码" onBlur="checkpsd1()" required/><span class="tips" id="divpassword1">密码必须由字母和数字组成</span>
          </li>
          <li>
            <label>确认密码：</label><input type="password" name="repassword" placeholder="请再次输入你的密码" onBlur="checkpsd2()" required/><span class="tips" id="divpassword2">两次密码需要相同</span>
          </li>
          <li>
            <label>电子邮箱：</label><input type="text" name="email" placeholder="请输入你的邮箱" onBlur="checkmail()" required/><span class="tips" id="divmail"></span>
          </li>
          <li>
          	<span class="fieldSet">
				<input type="text" id="checkcode" name="checkcode" class="text captcha" maxlength="4" autocomplete="off"><img id="checkImg" class="captchaImage" src="${pageContext.request.contextPath}/checkImg.action" onclick="change()" title="点击更换验证码">										
			</span>
          </li>
        </ul>
        <b class="btn">
          <input  type="submit" value="提交" />
          <input  type="reset" value="清空" />
        </b>
      </form>
    </div>
    <div style="text-align:center;">
      <p><a href="index.jsp">返回主页</a></p>
    </div>
  </body>
</html>
