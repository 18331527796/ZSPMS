import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.zs.pms.dao.UserDao;
import com.zs.pms.exception.AppException;
import com.zs.pms.po.TDep;
import com.zs.pms.po.TPermission;
import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService;
import com.zs.pms.vo.QueryUser;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationcontext.xml")
public class TestUser {


	
	@Autowired
	UserService us;
	
	
	public void test() {
		
		us.hello();
	}
	
	@Test
	public void testuser() {
		
		List<TPermission> per=us.queryByUid(11);
		for (TPermission t : us.genMune(per)) {
			System.out.println(t.getPname());
			for (TPermission t2 : t.getChildren1()) {
				System.out.println("-----"+t2.getPname());
			}
		}
	}
	
	
	public void testInsert() throws AppException {
		TUser user=new TUser();
		TDep dep=new TDep();
		dep.setId(2);
		user.setLoginname("ceshi11");
		user.setRealname("测试211");
		user.setSex("女");
		user.setPassword("1234561");
		
		user.setCreator(1);
		user.setDept(dep);
		user.setEmail("1234567114311@qq.com");
		user.setIsenabled(1);
		user.setPic("ceshi21.jpg");
		us.insertUser(user);
		
		
	}
	
	public void testUpdate() {
		TUser user=new TUser();
		user.setId(1005);
		user.setRealname("正房1");
		
		us.updateById(user);
	}
	
	public void testDelete() {
		
		int [] ids= {1005,1006};
		us.deleteByIds(ids);
	}
	
	
	public void queryCon() {
		QueryUser user=new QueryUser();
		user.setLoginname("zhangyu");
		us.queryCon(user);
	}

	public void testQueryByPage() {
		QueryUser qu=new QueryUser();
		qu.setLoginname("zhangyu");
		for(TUser user:us.queryByPage(2, qu)) {
			System.out.println(user.getRealname());
		}
		System.out.println("一共"+us.queryPageCount(qu));
	}
	
}
