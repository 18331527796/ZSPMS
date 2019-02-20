import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.zs.pms.po.TUser;
import com.zs.pms.service.UserService2;
import com.zs.pms.vo.QueryUser;

public class TestUser2 {

	@Autowired
	UserService2 us;
	@Test
	public void test() {
		QueryUser qu=new QueryUser();
		qu.setLoginname("zhangyu");
		List<TUser > list=us.queryCon(qu);
		for (TUser 	user : list) {
			System.out.println(user.getId());
		}
		
	}
}
