<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>用户列表</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${pageContext.request.contextPath}/style/adminStyle.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/js/public.js"></script>
<script>
			//文档就需事件
			$(function(){
				//当多选按键前的input的框发生变化的时候把所有的多选框的值同事改变
				$("#del").change(function(){
					//使用prop("checked")可以获得元素有没有checked=checked
					if($("#del").prop("checked")){
						//条件为true是为全选
						//使用选择起来选中全部带ID=id的多选框
						$("input[type=checkbox][id=id]").each(function(){
							//把每元素的checked属性改成true，多选框被选中
							$(this).prop("checked",true);
						})
					}else{
						//否则全部取消
						$("input[type=checkbox][id=id]").each(function(){
							//把每元素的checked属性改成false，多选款取消
							$(this).prop("checked",false);
						})
					}
				})
			})
			
			function chk1() {
				//获得群不断id的多选框
				var idsele=document.getElementsByName("id");
				var sum=0;
				//遍历元素看元素是否被选中，如果选中就让计数器自增
				for (var i = 0; i < idsele.length; i++) {
					var ids=idsele[i];
					//元素.checked如果选中返回值为true，没选中返回值为false
					if (ids.checked==true) {
						//自增
						sum++;
					}
				}
				//如果计数器为0，表示一个多选框都没选中
				if (sum==0) {
					//提示
					alert("请先勾选想要删除的信息！");
					//返回false
					return false;
				}
				//确定狂的判断，确定true表示删除，取消为false取消提交的时间
				return confirm("胸嘚，你确定删除哈！")
			}
		</script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="user"></i><em>用户列表</em></span>
    <span class="modular fr"><a href="initdep.do" class="pt-link-btn">+添加新用户</a></span>
  </div>
  <div class="operate">
   <form id="myform"  name="myform"action="list.do?page=1" method="post" onsubmit="return chk()">
    <input type="text" class="textBox length-long"  name="loginname"placeholder="请输入用户ID" value="${QUERYUSER.loginname}"/>
    <select name="isenabled">
    	<c:if test="${QUERYUSER.isenabled==0}">
    		<option value="0">请选择</option>
    		<option value="1">可用</option>
    		<option value="-1">不可用</option>
    	</c:if>
    	<c:if test="${QUERYUSER.isenabled==1}">
    		<option value="0">请选择</option>
    		<option value="1" selected="selected">可用</option>
    		<option value="-1">不可用</option>
    	</c:if>
    	<c:if test="${QUERYUSER.isenabled==-1}">
    		<option value="0">请选择</option>
    		<option value="1">可用</option>
    		<option value="-1" selected="selected">不可用</option>
    	</c:if>
    </select>
    <input type="submit" value="查询" class="tdBtn"/>
   </form>
  </div>
  <form name="update" action="UserDeleteByIds.do" method="post" onsubmit="return chk1()">
  <table class="list-style Interlaced">
   <tr>
     <th>ID</th>
     <th>登录名</th>
     <th>真实姓名</th>
     <th>性别</th>
     <th>出生年月</th>
     <th>部门名称</th>
     <th>email</th>
     <th>是否可用</th>
     <th colspan="2">操作</th>
     
   </tr>


   
<c:forEach items="${USERS}" var="user">
<tr>
   
    <td>
     <input type="checkbox" name="id"  id="id"  value="${user.id}"/>
     <span class="middle">${user.id}</span>
    </td>
    <td class="center">${user.loginname}</td>
    <td class="center">${user.realname}</td>
    <td class="center">${user.sex}</td>
    <td class="center">${user.birthdayTxt}</td>
    <td class="center">${user.dept.name}</td>
    <td class="center">${user.email}</td>
    <td class="center">
    	<c:if test="${user.isenabled==1}">
    	<img src="${pageContext.request.contextPath}/images/yes.gif"/>
    	</c:if>
    	<c:if test="${user.isenabled==-1}">
    	<img src="${pageContext.request.contextPath}/images/no.gif"/>
    	</c:if>
    	
    		
    
    </td>
          
   
    <td class="center">
    
    <a href="userupdate.do?id=${user.id}"><img src="${pageContext.request.contextPath}/images/icon_edit.gif" /></a>
    
    </td>
    <td>
      
     <a onclick="if(!confirm('胸dei，你真得要删除吗？')){return false}" href="${pageContext.request.contextPath}/userdalete.do?id=${user.id}&&page=${PAGE>1?PAGE-1:1}" ><img src="${pageContext.request.contextPath}/images/icon_drop.gif"/></a>
    
    </td>
   </tr>
</c:forEach>
   
   

   
   
 
  </table>
  <!-- BatchOperation -->
  <div style="overflow:hidden;">
      <!-- Operation -->
	  <div class="BatchOperation fl">
	   <input type="checkbox" id="del"   />
	   <label for="del" class="btnStyle middle" >全选</label>
	   <input type="submit" value="批量删除" class="btnStyle" />
	  </div>
 
	  <!-- turn page -->
 	  <div class="turnPage center fr">
	   <a href="list.do?page=1&loginname=${QUERYUSER.loginname}&isenabled=${QUERYUSER.isenabled}" >第一页</a>
	   <a href="list.do?page=${PAGE>1?PAGE-1:1}&loginname=${QUERYUSER.loginname}&isenabled=${QUERYUSER.isenabled}" >上一页</a>
	   <a href="list.do?page=${PAGE==PAGECOUNT?PAGE:PAGE+1}&loginname=${QUERYUSER.loginname}&isenabled=${QUERYUSER.isenabled}" >下一页</a>
	   <a href="list.do?page=${PAGECOUNT}&loginname=${QUERYUSER.loginname}&isenabled=${QUERYUSER.isenabled}">最后一页</a>
	   第${PAGE}页/共${PAGECOUNT}页
	   
	  </div>  
  </div>
  	</form> 
 </div>

</body>
</html>