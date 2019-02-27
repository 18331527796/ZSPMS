package com.zs.pms.userserviceimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zs.pms.dao.UserDao;
import com.zs.pms.exception.AppException;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.util.MD5;
import com.zs.pms.util.NUM;
import com.zs.pms.vo.QueryUser;

@Service
@Transactional // 需要开启事务 的业务对象
public class UserServiceImpl implements UserService {

	@Autowired
	UserDao dao;


	@Override
	@Transactional(rollbackFor = Exception.class)
	public List<TPermission> queryByUid(int id) {
		// TODO Auto-generated method stub
		return dao.queryByUid(id);
	}

	@Override
	public List<TPermission> genMune(List<TPermission> pers) {

		List<TPermission> list = new ArrayList<TPermission>();

		for (TPermission per : pers) {
			// 一级权限
			if (per.getLev() == 1) {
				// 添加二级权限
				for (TPermission per2 : pers) {
					// 如果二级pid==一级id 就为子级
					if (per2.getPid() == per.getId()) {
						per.addChlid1(per2);
					}
				}
				list.add(per);
			}
		}

		return list;
	}

	@Override
	public List<TUser> queryCon(QueryUser qu) {
		List<TUser> users = dao.queryCon(qu);
		return users;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void updateById(TUser user) {
		dao.updateById(user);

	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public int insertUser(TUser user) throws AppException {
		if (user.getLoginname().equals("admin")) {
			throw new AppException(10101, "登录名不能使用admin!");
		}
		MD5 md5=new MD5();
		user.setPassword(md5.getMD5ofStr(user.getPassword()));
		dao.insertUser(user);
		return user.getId();
	}



	@Override
	@Transactional(rollbackFor = Exception.class)
	public void deleteByIds(int[] ids) {
		dao.deleteByIds(ids);

	}

	@Override
	public List<TUser> queryByPage(int page, QueryUser qu) {
		int start = (page - 1) * NUM.NUM + 1;
		int end = page * NUM.NUM;
		qu.setStart(start);
		qu.setEnd(end);

		return dao.queryByPage(qu);
	}

	@Override
	public int queryPageCount(QueryUser qu) {
		// TODO Auto-generated method stub
		int cont = dao.queryCount(qu);
		if (cont % NUM.NUM == 0) {
			return cont / NUM.NUM;
		} else {
			return cont / NUM.NUM + 1;
		}
	}

	@Override
	public void hello() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteById(int id) {
		dao.deleteById(id);
		
	}

	@Override
	public TUser queryById(int id) {
		
		return dao.queryById(id);
	}

}
