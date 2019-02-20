<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- 要使用JSTL，导入 标签库-->
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>广告修改</title>
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
   
    var REG=/\S/;
    
    function chktitle() {
		var title=document.getElementById("title").value;
		var reg=new RegExp(REG);
		var msg=document.getElementById("titlemsg");
		if (reg.test(title)) {
			msg.innerHTML="输入内容可用~";
			msg.style.color="green";
			return true;
		} else {
			msg.innerHTML="输入内容不能为空，请重新输入！！"
			msg.style.color="red";
			return false;
		}
	}
    function chkcontent() {
		var content=document.getElementById("content").value;
		var reg=new RegExp(REG);
		var msg=document.getElementById("contentmsg");
		if (reg.test(content)) {
			msg.innerHTML="输入内容可用~";
			msg.style.color="green";
			return true;
		} else {
			msg.innerHTML="输入内容不能为空，请重新输入！！"
			msg.style.color="red";
			return false;
		}
	}
    function chkcman() {
		var cman=document.getElementById("cman").value;
		var reg=new RegExp(REG);
		var msg=document.getElementById("cmanmsg");
		if (reg.test(cman)) {
			msg.innerHTML="输入内容可用~";
			msg.style.color="green";
			return true;
		} else {
			msg.innerHTML="输入内容不能为空，请重新输入！！"
			msg.style.color="red";
			return false;
		}
	}
    function chk() {
		return chkcman()&&chkcontent()&&chktile();
	}
    
    </script>
    
</head>

<body data-type="generalComponents">


    <header >
   
    </header>






           
            <div class="tpl-portlet-components">
                <div class="portlet-title">
                    <div class="caption font-green bold">
                        <span class="am-icon-code"></span> 广告修改
                          <a href="${pageContext.request.contextPath}/messagelist.do?page=1"  style="margin-left: 650px">返回</a>
                    </div>
                    <div class="tpl-portlet-input tpl-fz-ml">
                        <div class="portlet-input input-small input-inline">
                            
                        </div>
                    </div>


                </div>
                <div class="tpl-block ">

                    <div class="am-g tpl-amazeui-form">

							
                        <div class="am-u-sm-12 am-u-md-9">
                            <form id="myform" name="myform" class="am-form am-form-horizontal" action="messageupdate.do?page=1" method="post" onsubmit="return chk()">
                            
                             <input type="hidden" name="id" value="${MESSAGEBYID.id}" />		
                               
                                <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">标题 / Title</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="title" value="${MESSAGEBYID.title}" readonly="readonly" name="title" placeholder="标题 / Title"  style="float: left;" onblur="chktitle()">
                                        <small>广告标题不能为空<span id="titlemsg" style="float: r;"></span></small>
                                    </div>
                                </div>
                                
                                
                              <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">内容 / Content</label>
                                    <div class="am-u-sm-9">
                                        <textarea rows="10" cols="10" name="content" onblur="chkcontent()" id="content">${MESSAGEBYID.content}</textarea>
                                        <small>广告内容不得为空<span id="contentmsg"></span></small>
                                    </div>
                                </div>
                                
                              <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">公告时间 / CTime</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="ctime" value="2018-12-19" name="ctime" value="${MESSAGEBYID.ctime}" class="am-form-field tpl-form-no-bg" placeholder="公告时间 " data-am-datepicker="" readonly/>
                                        <small></small>
                                    </div>
                                </div>
                            
									 <div class="am-form-group">
                                    <label for="user-name" class="am-u-sm-3 am-form-label">公告人 / Cman</label>
                                    <div class="am-u-sm-9">
                                        <input type="text" id="cman" value="${MESSAGEBYID.cman}" name="cman" placeholder="公告人 / Cman" onblur="chkcman()">
                                        <small>不得为空<span id="cmanmsg"></span></small>
                                    </div>
                                </div>
                                  

                                <div class="am-form-group">
                                    <div class="am-u-sm-9 am-u-sm-push-3">
                                    <input class="am-btn am-btn-primary" type="submit" value="修改"/>   <input class="am-btn am-btn-primary" type="reset" value="重置"/>
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