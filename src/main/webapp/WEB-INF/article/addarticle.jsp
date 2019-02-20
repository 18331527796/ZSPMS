<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>文章新增</title>
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
<script type="text/javascript">

	function chkTitleExsit(title) {
		var flag=false;
		$.ajax({
				
		type:'post',
		data:'title='+title,
		dataType:'text',
		async:false,
		url:'${pageContext.request.contextPath}/articletitleExist.do',
		success:function(data){
			if (data=="true") {
				alert(1);
				$("#titlemsg").html("此标题被占用");
				$("#titlemsg").css("color","red");
				flag=false;
			} else {
				alert(2);
				$("#titlemsg").html("此标题可用");
				$("#titlemsg").css("color","green");
				flag=true;
			}
		},
		error:function(){
			alert("请求失败")
		}
		})
		return flag;
	}

	var CHKTITLE="^[\u4e00-\u9fa5]{2,}$";
	
	var CHKCONTENT=/\S/;
	
	var CHKAUTHOR="^[\u4e00-\u9fa5]{2,}$";
	
	//验证标题
	function chktitle() {
		var title=document.getElementById("title").value;
		var reg=new RegExp(CHKTITLE);
		var msg=document.getElementById("titlemsg");
		if (reg.test(title)) {
			
			if (chkTitleExsit(title)) {
				alert(4);
				return true;
			} else {
				return false;
			}
		} else {
			msg.innerHTML="标题输入有误，请重新输入~";
			msg.style.color="red";
			return false;
		}
	}
	//验证内容
	function chkcontent() {
		var content=document.getElementById("content").value;
		var reg=new RegExp(CHKCONTENT);
		var msg=document.getElementById("contentmsg");
		if (reg.test(content)) {
			msg.innerHTML="内容属实很棒~~";
			msg.style.color="green";
			return true;
		} else {
			msg.innerHTML="内容输入有误，请重新输入~";
			msg.style.color="red";
			return false;
		}
	}
	//验证作者
	function chkauthor() {
		var author=document.getElementById("author").value;
		var reg=new RegExp(CHKAUTHOR);
		var msg=document.getElementById("authormsg");
		if (reg.test(author)) {
			msg.innerHTML="输入无误~";
			msg.style.color="green";
			return true;
		} else {
			msg.innerHTML="输入有误，请重新输入~";
			msg.style.color="red";
			return false;
		}
	}
	//验证提交
	function chk() {
		return chkauthor()&&chkcontent()&&chktitle()
	}

</script>

</head>

<body data-type="generalComponents">


	<header> </header>



	<div class="tpl-portlet-components">
		<div class="portlet-title">
			<div class="caption font-green bold">
				<span class="am-icon-code"></span> 文章新增 <a
					href="${pageContext.request.contextPath}/articlelist.do?page=1"
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
						action="articleadd.do" method="post" onsubmit="return chk()" >
						
						<div class="am-form-group">
							<label for="user-name" class="am-u-sm-3 am-form-label">标题 / Title</label>
							<div class="am-u-sm-9">
								<input type="text" id="title" value="" name="title"
									placeholder=">标题 / Title" style="float: left;" onblur="chktitle()" />
								<small>标题名为不得小于2位的汉字<span id="titlemsg"></span></small>
							</div>
						</div>
						
						
						<div class="am-form-group">
							<label for="user-name" class="am-u-sm-3 am-form-label">内容 / Content</label>
							<div class="am-u-sm-9">
							<textarea rows="10" cols="10" name="content" onblur="chkcontent()" id="content"></textarea>
								
								<small>内容长度不得为空且长度小于4000<span id="contentmsg"></span></small>
							</div>
						</div>
						
						<div class="am-form-group">
							<label for="user-name" class="am-u-sm-3 am-form-label">作者 / Author</label>
							<div class="am-u-sm-9">
								<input type="text" id="author" value="" name="author" onblur="chkauthor()"
									placeholder=">作者 / Author" style="float: left;">
								<small>作者名字为不少于两位的汉字<span id="authormsg"></span></small>
							</div>
						</div>
						
						<div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">添加日期 / Crtime</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="crtime" name="crtime"class="am-form-field tpl-form-no-bg" placeholder="添加日期" data-am-datepicker="" readonly/>
                                        <small></small>
                                    </div>
                                </div>
						
						<div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">所属栏目 / Channel</label>
                                    <div class="am-u-sm-9">
                                   	
                                      <select name="channel" style="width: 300px"id="pid">
                                   			<c:forEach items="${CHANNELALL}" var="channel">
                                   					<option value="${channel.id}">${channel.cname}</option>
                                   			</c:forEach>
                                      </select>
                                        <small></small>
                                    </div>
                                </div>

						<div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">是否推荐 / Isremod</label>
                                    <div class="am-u-sm-9">
                                  
                                        <input type="radio" name="isremod" checked="checked" value="1">推荐&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="isremod" value="0">不推荐
                                   
                                        <small></small>
                        </div>
                        </div>

						<div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">是否热点 / Ishot</label>
                                    <div class="am-u-sm-9">
                                  
                                        <input type="radio" name="ishot" checked="checked" value="1">是热点&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;
                                        <input type="radio" name="ishot" value="0">不是热点
                                   
                                        <small></small>
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