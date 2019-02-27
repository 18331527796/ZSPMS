package com.zs.pms.dao;

import java.util.List;

import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

public interface UserDao {

	public List<TPermission> queryByUid(int id);
	
	public List<TUser> queryCon(QueryUser qu);
	
	public void updateById(TUser user);
	
	public void insertUser(TUser user);
	
	public void deleteByIds(int []ids);
	
	public List<TUser> queryByPage(QueryUser qu);
	
	public int queryCount(QueryUser qu);
	
	public void deleteById(int id);
	
	public TUser queryById(int id);
	
}
