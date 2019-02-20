<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
<head>
<title>后台登录</title>
<!-- Custom Theme files -->
<link href="logincss/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="后台登录" />
<!--Google Fonts-->
<!--<link href='//fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
--><!--Google Fonts-->

</head>

<script type="text/javascript">
	//提交时触发的验证事件
	function chklogin() {
		//获得输入框中输入的信息
		var loginname=document.getElementById("loginname").value;
		var password=document.getElementById("password").value;
		var chkcode=document.getElementById("chkcode").value;
		if (loginname==""||password==""||chkcode=="") {
			document.getElementById("errmsg").innerHTML="输入的信息不能为空，请检查~"
			return false;
		}else{
			return true;
		}
		
	}
	
	//更换验证码
	function changecode() {
		document.getElementById("kaptcha").src="kaptcha.jpg";
	}

</script>
<body>
<!--header start here-->

<div class="login-form">
			<div style="margin-bottom: 10px" >
				<center><img src="logincss/images/logo.png" alt="" /></center>
			</div>
			<h1>每天 学习 一小时</h1>
			<div class="login-top" >
			<form action="login.do" method="post" onsubmit="return chklogin()">
				<span id="errmsg" style="color: red">${errmsg}</span>
				<div class="login-ic">
					<i ></i>
					<input type="text"  value="${cookie.username.value }"  name="loginname" id="loginname"  placeholder="请输入用户名"/>
					<div class="clear"> </div>
				</div>
				
				<div class="login-ic">
					<i class="icon"></i>
					<input type="password"  value="${cookie.pwd.value }" name="password" id="password" placeholder="请输入密码"/>
					<div class="clear"> </div>
				</div>
				
				<div class="login-ic">
					<i ></i>
					
					<input type="text"  value="" id="chkcode" name="chkcode" placeholder="请输入验证码"/>
					<div class="clear"> </div>
				</div>
				<img id="kaptcha" src="kaptcha.jpg" style="position: absolute;top: 67%;left: 70%" onclick="changecode()">
				
				<%-- <jsp:useBean id="user" class="com.zs.cms.bean.userbean" scope="request"></jsp:useBean>
				值是：<jsp:getProperty property="username" name="user"/> --%>
				
				
				<div class="login-ic"><input type="checkbox" value="1" name="remPwd"  style="margin-left: 40px">是否记住密码</div>
			  
				<div class="log-bwn">
					<input type="submit"  value="Login" >
				</div>
				</form>
			</div>
			<p class="copy">© 2018 中仕学社  </p>
</div>		

<!--header start here-->
</body>
</html>