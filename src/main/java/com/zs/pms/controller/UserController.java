package com.zs.pms.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.table.TableStringConverter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDep;
import com.zs.pms.po.TUser;
import com.zs.pms.service.DepService;
import com.zs.pms.service.UserService;
import com.zs.pms.util.DateUtil;
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
		return "user/list";
	}
	
	@RequestMapping("/user/initdep.do")
	public String toInsert(ModelMap model) {
		model.addAttribute("DEPS",ds.queryByDid(0) );
		return "user/add";
	}
	
	@RequestMapping("/user/getDeps.do")
	@ResponseBody
	public List<TDep> getDeps(int pid) {
		return ds.queryByDid(pid);
	}
	
	@RequestMapping("/user/useradd.do")
	public String addUser(TUser user,HttpSession session,ModelMap model) {
		TUser cu=(TUser) session.getAttribute("USER");
		user.setIsenabled(1);
		user.setCreator(cu.getId());
	
		
		try {
			us.insertUser(user);
			return "redirect:list.do";
		} catch (AppException e) {
			// TODO Auto-generated catch block
			model.addAttribute("USERERR", "登录名不能使用admin");
			return this.toInsert(model);
		}
	}
	
	@RequestMapping("/user/userdalete.do")
	public String deleteUser(TUser user) {
		
		us.deleteById(user.getId());
		
		return "redirect:list.do";
	}
	
	@RequestMapping("/user/UserDeleteByIds.do")
	public String deleteUsers(int[] ids) {
		us.deleteByIds(ids);
		return "redirect:list.do";
	}
	
	@RequestMapping("/user/userupdate.do")
	public String updateUser(int id,ModelMap model) {
		model.addAttribute("DEPS", ds.queryByDid(0));
		model.addAttribute("USERBYID", us.queryById(id));
		return "/user/updateuser";
	}
	
	@RequestMapping("/user/update.do")
	public String updateSuccess(TUser user,HttpSession session) throws ParseException {
		TUser cu=(TUser) session.getAttribute("USER");
		user.setUpdator(cu.getId());
		
		
		us.updateById(user);
		return "redirect:list.do";
	}
	
}
