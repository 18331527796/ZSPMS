package com.zs.pms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zs.pms.service.DepService;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@Controller
public class UserController {

	@Autowired
	UserService us;
	@Autowired
	DepService ds;
	
	@RequestMapping("/user/list.do")
	public String toList(ModelMap model,String page,QueryUser qu) {
		if(page==null) {
			page="1";
		}
		model.addAttribute("USERS", us.queryByPage(Integer.parseInt(page), qu));
		model.addAttribute("PAGE", page);
		model.addAttribute("PAGECOUNT", us.queryPageCount(qu));
		model.addAttribute("QUERYUSER", qu);
		return "user/user_list";
	}
	
	@RequestMapping("/user/initdep.do")
	public String toInsert(ModelMap model,) {
		model.addAttribute("",ds.queryByDid() )
		return "user/adduser";
	}
}
