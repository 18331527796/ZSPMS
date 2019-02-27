package com.zs.pms.service;

import java.util.List;

import com.zs.pms.exception.AppException;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.vo.QueryUser;

public interface UserService {

	public void hello();
	
	public List<TPermission> queryByUid(int id);
	
	public List<TPermission> genMune(List<TPermission> per);
	
	public List<TUser> queryCon(QueryUser qu);
	
	public void updateById(TUser user);
	
	public int insertUser(TUser user) throws AppException;
	
	public void deleteByIds(int []ids);
	
	public List<TUser> queryByPage(int page,QueryUser qu);
	
	public int queryPageCount(QueryUser qu);
	
	public void deleteById(int id);
	
	public TUser queryById(int id);
	
}
