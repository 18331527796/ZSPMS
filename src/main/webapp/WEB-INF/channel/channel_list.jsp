<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>栏目列表</title>
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
		</script>
</head>
<body>
 <div class="wrap">
  <div class="page-title">
    <span class="modular fl"><i class="user"></i><em>栏目列表</em></span>
    <span class="modular fr"><a href="${pageContext.request.contextPath}/channeldip.do" class="pt-link-btn">+添加新栏目</a></span>
  </div>
  <div class="operate">
   <form id="myform"  name="myform"action="" method="post" onsubmit="return chk1()">
    <input type="text" class="textBox length-long"  name="id"placeholder="请输入栏目名称"/>
    <input type="submit" value="查询" class="tdBtn"/>
   </form>
  </div>
  <form name="update" action="${pageContext.request.contextPath}/ChannelDeleteByIds.do" method="post" >
  <table class="list-style Interlaced">
   <tr>
     <th>ID</th>
     <th>栏目名</th>
     <th>上级栏目</th>
     <th>级别</th>
     <th>是否叶子</th>
     <th>顺序</th>
     
     <th colspan="2">操作</th>
     
   </tr>


   
<c:forEach items="${CHANNEL}" var="channel">
<tr>
   
    <td>
     <input type="checkbox" name="id"  id="id"  value="${channel.id}"/>
     <span class="middle">${channel.id}</span>
    </td>
    <td class="center">${channel.cname}</td>
    <td class="center">${channel.pidname}
    	<c:if test="${channel.pid==0}">无</c:if>
    </td>
    <td class="center">${channel.lev}</td>
    <td class="center">
    
    <c:if test="${channel.isleaf==1}">
   		 <input type="hidden"  name="isleaf" value="1"/>
    	<img src="${pageContext.request.contextPath}/images/yes.gif"/>
    	</c:if>
    	<c:if test="${channel.isleaf==0}">
    	<input type="hidden"  name="isleaf" value="0"/>
    	<img src="${pageContext.request.contextPath}/images/no.gif"/>
    	</c:if></td>
    <td class="center">${channel.sort}</td>
   
    <td class="center">
    
    <a href="channelbyid.do?id=${channel.id}"><img src="${pageContext.request.contextPath}/images/icon_edit.gif" /></a>
    
    </td>
    <td>
      
     <a onclick="if(!confirm('胸dei，你真得要删除吗？')){return false}" href="channeldelete.do?id=${channel.id}&&page=${PAGE>1?PAGE-1:1}" ><img src="${pageContext.request.contextPath}/images/icon_drop.gif"/></a>
    
    </td>
   </tr>
</c:forEach>
   
   

   
   
 
  </table>
  <!-- BatchOperation -->
  <div style="overflow:hidden;">
      <!-- Operation -->
	  <div class="BatchOperation fl">
	   <input type="checkbox" id="del"  />
	   <label for="del" class="btnStyle middle" >全选</label>
	   <input type="submit" value="批量删除" class="btnStyle"/>
	  </div>
 
	  <!-- turn page -->
 	  <div class="turnPage center fr">
	   <a href="channellist.do?page=1" >第一页</a>
	   <a href="channellist.do?page=${PAGE>1?PAGE-1:1}" >上一页</a>
	   <a href="channellist.do?page=${PAGE==PAGECOUNT?PAGE:PAGE+1}" >下一页</a>
	   <a href="channellist.do?page=${PAGECOUNT}">最后一页</a>
	  第${PAGE}页/共${PAGECOUNT}页/共${COUNT}条信息
	  </div>  
  </div>
  	</form> 
 </div>

</body>
</html>