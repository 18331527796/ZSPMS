package com.zs.pms.po;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TPermission implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7512049132416900243L;

	private int id;
	
	private String pname;
	
	private int pid;
	
	private int lev;
	
	private int idleaf;
	
	private int sort;
	
	private String url;
	
	private List<TPermission> children1 = new ArrayList<TPermission>();
	
	public void addChlid1(TPermission ts) {
		children1.add(ts);
	}
	
	
	public List<TPermission> getChildren1() {
		return children1;
	}


	public void setChildren1(List<TPermission> children1) {
		this.children1 = children1;
	}






	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getIdleaf() {
		return idleaf;
	}
	public void setIdleaf(int idleaf) {
		this.idleaf = idleaf;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	@Override
	public String toString() {
		return "TPermission [id=" + id + ", pname=" + pname + ", pid=" + pid + ", lev=" + lev + ", idleaf=" + idleaf
				+ ", sort=" + sort + ", url=" + url + "]";
	}
	
	
	
	
	
	
}
