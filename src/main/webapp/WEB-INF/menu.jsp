<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>左侧导航</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js"></script>
<script src="js/public.js"></script>
</head>
<body style="background: #313131">

	<c:forEach items="${MENU}" var="p1">
  <li class="menu-list-title">
   <span>${p1.pname}</span>
   <i>◢</i>
  </li>
  <li>
   <ul class="menu-children">
   <c:forEach items="${p1.children1}" var="p2">
    <li><a href="${p2.url}" target="mainCont">${p2.pname}</a></li>
   </c:forEach>
   </ul>
  </li>
  </c:forEach>
	
	
	
	
	
	
	
	
	
	
	
	<div class="menu-footer">
		© 更多模板：<a href="http://www.mycodes.net/" target="_blank">源码之家</a>
	</div>
</body>
</html>