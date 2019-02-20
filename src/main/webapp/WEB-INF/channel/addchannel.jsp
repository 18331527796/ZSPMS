<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>栏目新增</title>
<meta name="description" content="这是一个 index 页面">
<meta name="keywords" content="index">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="icon" type="image/png"
	href="${pageContext.request.contextPath}/assets/i/favicon.png">
<link rel="apple-touch-icon-precomposed"
	href="${pageContext.request.contextPath}/assets/i/app-icon72x72@2x.png">
<meta name="apple-mobile-web-app-title" content="Amaze UI" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/app.css">
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript">
//验证用户名的唯一性
function chkTitleExist(cname) {
	var flag=false;
	$.ajax({
		//请求方式
		type:'post',
		//请求路径
		url:'${pageContext.request.contextPath}/channeltitleExist.do',
		//请求参数
		data:'cname='+cname,
		//是否同步请求(true为异步)
		async:false,
		//请求数据类型
		dataType:'text',
		success:function(data){
			if (data=="true") {
				//有重复的用户名
				$("#cnamemsg").html("该标题已被占用");
				$("#cnamemsg").css("color","red");
				flag=false;
			} else {
				$("#cnamemsg").html("该标题可用");
				$("#cnamemsg").css("color","green");
				flag=true;
			}
		},
		 error:function(){
			alert("请求数据失败……");
		
         }
	})
	return flag;
}
var CHKCNAME="^[\u4e00-\u9fa5]{2,}$";

var CHKLEV="^[0-9]$";

var CHKSORT="^[0-9]$";
//验证栏目名
function chkcname() {
	var cname=document.getElementById("cname").value;
	var reg=new RegExp(CHKCNAME);
	var msg=document.getElementById("cnamemsg");
	if (reg.test(cname)) {
		
		if (chkTitleExist(cname)) {
			
			return true;
		} else {
			
			return false;
		}
	} else {
		
		msg.innerHTML="输入有误，请重新输入~";
		msg.style.color="red";
		return false;
	}
}
//等级
function chklev() {
	var lev=document.getElementById("lev").value;
	var reg=new RegExp(CHKLEV);
	var msg=document.getElementById("levmsg");
	if (reg.test(lev)) {
		msg.innerHTML="输入正确";
		msg.style.color="green";
		return true;
	} else {
		msg.innerHTML="输入有误，请重新输入~";
		msg.style.color="red";
		return false;
	}
}
//顺序
function chksort() {
	var sort=document.getElementById("sort").value;
	var reg=new RegExp(CHKSORT);
	var msg=document.getElementById("sortmsg");
	if (reg.test(sort)) {
		msg.innerHTML="输入正确";
		msg.style.color="green";
		return true;
	} else {
		msg.innerHTML="输入有误，请重新输入~";
		msg.style.color="red";
		return false;
	}
}

function chk() {
	return chksort()&&chklev()&&chkcname();
}
</script>

</head>

<body data-type="generalComponents">


	<header> </header>



	<div class="tpl-portlet-components">
		<div class="portlet-title">
			<div class="caption font-green bold">
				<span class="am-icon-code"></span> 栏目新增 <a
					href="channellist.do?page=1"
					style="margin-left: 650px">返回</a>
			</div>
			<div class="tpl-portlet-input tpl-fz-ml">
				<div class="portlet-input input-small input-inline"></div>
			</div>

		</div>
		<div class="tpl-block ">

			<div class="am-g tpl-amazeui-form">

				<div class="am-u-sm-12 am-u-md-9">
					<form id="myform" name="myform" class="am-form am-form-horizontal"
						action="channeladd.do" method="post" onsubmit="return chk()" >
						
						<div class="am-form-group">
							<label for="user-name" class="am-u-sm-3 am-form-label">栏目名
								/ ChannelName</label>
							<div class="am-u-sm-9">
								<input type="text" id="cname" value="" name="cname"
									placeholder="栏目名  / ChannelName" style="float: left;" onblur="chkcname()">
								<small>栏目名为不得小于2位的汉字<span id="cnamemsg" style="float: r;"></span></small>
								<span style="color: red">${CHANNELERR}</span>
							</div>
						</div>
						
						
						
						<div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">上级栏目 / Pid</label>
                                    <div class="am-u-sm-9">
                                   	
                                      <select name="pid" style="width: 300px"id="pid">
                                   					<option value="0">无</option>
                                   					
                                   			<c:forEach items="${PID}" var="pid">
                                   					<c:if test="${pid.isleaf!=1}">
                                   					<option value="${pid.id}">${pid.cname}</option>
                                   					</c:if>
                                   			</c:forEach>
                                      </select>
                                        <small></small>
                                    </div>
                                </div>
                                
                                 <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">是否叶子 / Isleaf</label>
                                    <div class="am-u-sm-9">
                                        <input type="radio" name="isleaf" checked="checked" value="1">是&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="isleaf" value="0">否
                                        <small></small>
                                    </div>
                                   
                                </div>

						<div class="am-form-group">
							<label for="user-name" class="am-u-sm-3 am-form-label">等级
								/ Lve</label>
							<div class="am-u-sm-9">
								<input type="text" value="" id="lev" name="lev"
									placeholder="等级   / Lve" onblur="chklev()"> <small>等级要求(必填0-9其一)<span id="levmsg"></span></small>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-email" class="am-u-sm-3 am-form-label">顺序 / Sort</label>
							<div class="am-u-sm-9">
								<input type="text" id="sort" name="sort"
									placeholder="输入你的顺序 / Sort" onblur="chksort()"> <small>顺序决定栏目在页面中出现的位置(必填0-9其一)<span id="sortmsg"></span></small>
							</div>
						</div>

						<div class="am-form-group">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<input class="am-btn am-btn-primary" type="submit" value="提交" />
								<input class="am-btn am-btn-primary" type="reset" value="重置" />
								<!-- <button type="button" class="am-btn am-btn-primary">提交</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button type="button" class="am-btn am-btn-primary">重置</button> -->
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

	</div>


	</div>

	</div>


	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>

</html>