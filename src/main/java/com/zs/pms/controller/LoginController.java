package com.zs.pms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.code.kaptcha.Constants;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.util.DateUtil;
import com.zs.pms.util.MD5;
import com.zs.pms.vo.QueryLogin;
import com.zs.pms.vo.QueryUser;

@Controller
public class LoginController {

	@Autowired
	UserService us;

	@RequestMapping("/tologin.do")
	public String Login() {
		return "login";
	}

	@RequestMapping("/login.do")
	public String toLogin(HttpSession session, QueryLogin ql, ModelMap model) {

		String chkcode = (String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);

		// 判断验证码是否匹配，如果匹配进去验证用户账号密码，不匹配的话直接回到登录界面
		if (!chkcode.equalsIgnoreCase(ql.getChkcode())) {
			model.addAttribute("errmsg", "验证码输入有误请重新输入！");
			return "login";
		}
		// 将从页面获取的loginname，password传入queryuser中
		// 创建queryuser对象
		QueryUser user = new QueryUser();
		//创建MD5对象
		MD5 md5 = new MD5();
		user.setLoginname(ql.getLoginname());
		user.setPassword(md5.getMD5ofStr(ql.getPassword()));
		//按条件查找用户信息
		List<TUser> users = us.queryCon(user);
		//判断是否登陆成功
		if (users == null || users.size() != 1) {
			model.addAttribute("errmsg", "用户名或密码错误请重新输入！");
			return "login";
		}
		session.setAttribute("TIME", DateUtil.getStrDate());
		session.setAttribute("USER", users.get(0));
		return "index";
	}

	@RequestMapping("/top.do")
	public String top() {

		return "top";
	}

	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}

	@RequestMapping("/menu.do")
	public String menu(ModelMap model,HttpSession session) {
		
		TUser user=(TUser) session.getAttribute("USER");
		
		List<TPermission> list=us.queryByUid(user.getId());
		
		model.addAttribute("MENU", us.genMune(list));
		
		return "menu";
	}
	

}
