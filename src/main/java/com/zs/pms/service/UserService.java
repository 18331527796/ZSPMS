package com.zs.pms.service;

import java.util.List;

import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

public interface UserService {

	public void hello();
	
	public List<TPermission> queryByUid(int id);
	
	public List<TPermission> genMune(List<TPermission> per);
	
	public List<TUser> queryCon(QueryUser qu);
	
	public void updateById(TUser user);
	
	public void insertUser(TUser user);
	
	public void deleteByIds(int []ids);
	
	public List<TUser> queryByPage(int page,QueryUser qu);
	
	public int queryPageCount(QueryUser qu);
	
}
