package com.zs.pms.po;

import java.io.Serializable;
import java.util.Date;

import com.zs.pms.util.DateUtil;

public class TUser implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -5359045721710315098L;

	private int id;
	
	private String loginname;
	
	private String realname;
	
	private String sex;
	
	private Date birthday;
	
	private String password;
	
	private TDep dept;
	
	private String email;
	
	private int isenabled;
	
	private int creator;
	
	private Date creatortime;
	
	private int updator;
	
	private Date updatortime;
	
	private String pic;
	
	private String birthdayTxt;
	
	private String isenabledTxt;
	
	
	
	public String getBirthdayTxt() {
		
		return DateUtil.getDateToStr(this.birthday, "yyyy-MM-dd");
	}
	public String getIsenabledTxt() {
		if (this.isenabled==1) {
			return "可用";
		}else {
			return "不可用";
		}
	}
	public int getIsenabled() {
		return isenabled;
	}
	public void setIsenabled(int isenabled) {
		this.isenabled = isenabled;
	}
	public TDep getDept() {
		return dept;
	}
	public void setDept(TDep dept) {
		this.dept = dept;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCreator() {
		return creator;
	}
	public void setCreator(int creator) {
		this.creator = creator;
	}
	public Date getCreatortime() {
		return creatortime;
	}
	public void setCreatortime(Date creatortime) {
		this.creatortime = creatortime;
	}
	public int getUpdator() {
		return updator;
	}
	public void setUpdator(int updator) {
		this.updator = updator;
	}
	public Date getUpdatortime() {
		return updatortime;
	}
	public void setUpdatortime(Date updatortime) {
		this.updatortime = updatortime;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	
	
}
