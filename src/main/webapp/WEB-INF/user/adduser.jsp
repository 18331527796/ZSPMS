<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户新增</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admin.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css">
    <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript">
  	
    //用户名必须包含字母，结束之前不能全部都是数字,至少6位数
    var CHKLOGINNAME="^(?![0-9]+ $)[a-zA-Z0-9]{6,}$";
  	//密码必须包含数字和字母，结束之前不能以纯数字结束或不能以纯字母结束至少6位
  	var CHKPWD="^(?![0-9]+ $)(?![a-zA-Z]+ $)[a-zA-Z0-9]{6,}$";
  	//验证邮箱XXXXX(可以是数字或字母)@XXX ( 2-5位字母) ( .XXX(2-3位) 1-2
  	var CHKEMAIL="^[a-z0-9A-Z_]+@[a-zA-Z0-9]{2,5}(\.[a-z]{2,3}){1,2}$";
  	//姓名必须包含两个或两个以上汉字
  	var CHKREALNAME="^[\u4e00-\u9fa5]{2,}$";
  	//出生年月
  	var CHKYEAR=/\S/;
  	//ajax原理
  	//创建请求对象
  	//准备发送请求的数据(请求方式，请求地址)
  	//调用请求对象的open（）方法，将方式以及地址传进去
  	//调用请求对象的send（）方法，向服务器发送请求
  	//服务器给出想用，如果响应成功并且可用，从服务器获得数据
  	//然后用js来操作dom来更新页面
    //验证用户名的唯一性
    function chkLoginnameExist(loginname) {
  	var flag=false;
  	$.ajax({
  		//请求方式
  		type:'post',
  		//请求路径
  		url:'exist.do',
  		//请求参数
  		data:'type=1&loginname='+loginname,
  		//是否同步请求(true为异步)
  		async:false,
  		//请求数据类型
  		dataType:'text',
  		success:function(data){
  			if (data=="true") {
  				//有重复的用户名
  				$("#loginnamemsg").html("该用户名已被占用");
  				$("#loginnamemsg").css("color","red");
  				flag=false;
  			} else {
  				$("#loginnamemsg").html("该用户名可用");
  				$("#loginnamemsg").css("color","green");
  				flag=true;
  			}
  		},
  		error:function(){
  			alert("请求数据失败……");
  		}
  	})
  	return flag;
  }
    
    //验证邮箱的唯一性
    function chkEmailExist(email) {
  		var flag=false;
  		$.ajax({
  			//请求方式
  			type:'post',
  			//请求路径
  			url:'exist.do',
  			//请求参数
  			data:'type=2&email='+email,
  			//是否同步请求(true为异步)
  			async:false,
  			//请求数据类型
  			dataType:'text',
  			success:function(data){
  				if (data=="true") {
  					//有重复的用户名
  					$("#mailmsg").html("该邮箱已被占用");
  					$("#mailmsg").css("color","red");
  					flag=false;
  				} else {
  					$("#mailmsg").html("该邮箱可用");
  					$("#mailmsg").css("color","green");
  					flag=true;
  				}
  			},
  			error:function(){
  				alert("请求数据失败……");
  			}
  		})
  		return flag;
  	}
  	//验证用户
  	function chkLoginName() {
  		//获取输入框输入的信息
		var loginname=document.getElementById("loginname").value;
		//创建新的正则表达式
		var reg=new RegExp(CHKLOGINNAME);
		//获得显示验证结果信息的元素
		var msg=document.getElementById("loginnamemsg");
		if (reg.test(loginname)) {
			//匹配时把可用信息打印页面 表示可用
			 if(chkLoginnameExist(loginname)){
				return true;
			}else{
				return false;
			}
		} else {
			msg.innerHTML="用户不可用，请检查输入~~";
			msg.style.color="red";
			return false;
		}
	}
  	//密码验证
  	function chkPwd() {
		var pwd=document.getElementById("password").value;
		var reg=new RegExp(CHKPWD);
		var msg=document.getElementById("pwdmsg");
		if (reg.test(pwd)) {
			msg.innerHTML="密码可用";
			msg.style.color="green";
			return true;
		} else {
			msg.innerHTML="密码不符合要求，请重新输入~";
			msg.style.color="red";
			return false;
		}
	}
  	//验证两次密码输入一致性
  	function repwd() {
  		var pwd=document.getElementById("password").value;
  		var repwd=document.getElementById("chkpwd").value;
  		var chkpwdmsg=document.getElementById("chkpwdmsg");
  		if (pwd==repwd) {
  			chkpwdmsg.innerHTML="密码输入一致";
			chkpwdmsg.style.color="green";
			return true;
		} else {
			chkpwdmsg.innerHTML="密码输入不一致，请重新输入~";
			chkpwdmsg.style.color="red";
			return false;
		}
	}
  	//真实姓名验证
  	function realName() {
		var realname=document.getElementById("realname").value;
		var reg=new RegExp(CHKREALNAME);
		var msg=document.getElementById("realnamemsg");
		if (reg.test(realname)) {
			msg.innerHTML="输入内容可用！";
			msg.style.color="green";
			return true;
		} else {
			msg.innerHTML="真实姓名输入有误，请重新输入~"
			msg.style.color="red";
			return false;
		}
	}
  	//验证邮箱
  	function chkmail() {
		var mail=document.getElementById("email").value;
		var reg=new RegExp(CHKEMAIL);
		var msg=document.getElementById("mailmsg");
		if (reg.test(mail)) {
			 if (chkEmailExist(mail)) {
				return true;
			}else{
				return false;
			} 
			
		} else {
			msg.innerHTML="邮箱输入有误，请重新输入~~";
			msg.style.color="red";
			return false;
		}
	}
  	// 出生日期
  	function chkyear() {
		var year=document.getElementById("birthday").value;
		var reg=new RegExp(CHKYEAR);
		var msg=document.getElementById("birthdaymsg");
		if (reg.test(year)) {
			msg.innerHTML="输入正确~";
			msg.style.color="green";
			return true;
		} else {
			msg.innerHTML="输入有误，请重新输入~";
			msg.style.color="red";
			return false;
		}
		
		
	}
  	//验证能否提交
  	function chkSubmit() {
		return chkmail()&&realName()&&repwd()&&chkPwd()&&chkLoginName()&&chkyear()
	}
  	
    </script>
    <script>
  $(function() {
    var nowTemp = new Date();
    var nowDay = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0).valueOf();
    var nowMoth = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), 1, 0, 0, 0, 0).valueOf();
    var nowYear = new Date(nowTemp.getFullYear(), 0, 1, 0, 0, 0, 0).valueOf();
    var $myStart2 = $('#birthday');

    var checkin = $myStart2.datepicker({
      onRender: function(date, viewMode) {
        // 默认 days 视图，与当前日期比较
        var viewDate = nowDay;

        switch (viewMode) {
          // moths 视图，与当前月份比较
          case 1:
            viewDate = nowMoth;
            break;
          // years 视图，与当前年份比较
          case 2:
            viewDate = nowYear;
            break;
        }

        return date.valueOf() > viewDate ? 'am-disabled' : '';
      }
    }).on('changeDate.datepicker.amui', function(ev) {
        if (ev.date.valueOf() > checkout.date.valueOf()) {
          var newDate = new Date(ev.date)
          newDate.setDate(newDate.getDate() + 1);
          checkout.setValue(newDate);
        }
        checkin.close();
        $('#my-end-2')[0].focus();
    }).data('amui.datepicker');

    
  });

</script>
    
</head>

<body data-type="generalComponents">


    <header >
   
    </header>
 <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 用户新增
                          <a href="${pageContext.request.contextPath}/userlist.do?page=1"  style="margin-left: 650px">返回</a>
                    </div>
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            
                        </div>
                    </div>


                </div>
                <div class="tpl-block ">

                    <div class="am-g tpl-amazeui-form">

							
                        <div class="am-u-sm-12 am-u-md-9">
                            <form id="myform" name="myform" class="am-form am-form-horizontal" action="useradd.do?page=${PAGE>1?PAGE-1:1}" method="post" onsubmit="return chkSubmit()">
                                <input type="hidden" name="id" value="">
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">登录名 /LoginName</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="loginname" value="" onblur="chkLoginName()" name="loginname"placeholder="登录名 /LoginName"  style="float: left;">
                                        <small>用户登录名长度不得低于6位数<span id="loginnamemsg" style="float: r;"></span><span>${USERERR}</span></small>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">密码 / Password</label>
                                    <div class="am-u-sm-9">
                                        <input type="password" value="" id="password" name="password" onblur="chkPwd()" placeholder="密码 / Password">
                                        <small>密码不得低于6位数<span id="pwdmsg"></span></small>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">确认密码 / Password</label>
                                    <div class="am-u-sm-9">
                                        <input type="password"name="chkpwd" onblur="repwd()" id="chkpwd" placeholder="确认密码 / Password">
                                        <small>两次密码必须一致<span id="chkpwdmsg"></span></small>
                                    </div>
                                </div>
                                 <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">真实姓名 / Realname</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="realname" onblur="realName()" name="realname" placeholder="真实姓名 / Realname">
                                        <small>真实姓名不可为空且至少包含两个汉字<span id="realnamemsg"></span></small>
                                    </div>
                                </div>
                                   
                                   <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">部门/Dep</label>
                                    <div class="am-u-sm-9">
                                   	
                                      <select name="dep" style="width: 300px"id="dep">
                                   			<c:forEach items="${DEPS}" var="deps">
                                   					<option value="${deps.id}">${deps.name}</option>
                                   			</c:forEach>
                                      </select>
                                        <small></small>
                                    </div>
                                </div>
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">性别 / gender</label>
                                    <div class="am-u-sm-9">
                                        <input type="radio" name="sex" checked="checked" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="sex" value="女">女
                                        <small></small>
                                    </div>
                                   
                                </div>
                                
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">是否可用/ enable</label>
                                    <div class="am-u-sm-9">
                                  
                                        <input type="radio" name="enable" checked="checked" value="1">可用&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="enable" value="0">不可用
                                   
                                        <small></small>
                                    </div>
                                </div>
                                   
                                   
                                   
                                   
									<div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">出生年月/Birthday</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="birthday" value="1995-11-12"  name="birthday"class="am-form-field tpl-form-no-bg" placeholder="出生年月" data-am-datepicker="" readonly onblur="chkyear()"/>
                                        <small>不能为空<span id="birthdaymsg"></span></small>
                                    </div>
                                </div>
                                 
                             
                                <div class="am-form-group">
                                    <label for="user-email" class="am-u-sm-3 am-form-label">电子邮件 / Email</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="email" onblur="chkmail()" name="email"placeholder="输入你的电子邮件 / Email">
                                        <small>邮箱你懂得...<span id="mailmsg"></span></small>
                                    </div>
                                </div>

                              

                                

                              

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                    <input class="am-btn am-btn-primary" type="submit" value="提交" />   <input class="am-btn am-btn-primary" type="reset" value="重置"/>
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


    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
</body>

</html>