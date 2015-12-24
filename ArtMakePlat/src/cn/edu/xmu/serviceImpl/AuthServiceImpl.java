/**
 * @Title: AuthServiceImpl.java
 * @Package cn.edu.xmu.serviceImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月16日 上午12:29:50
 * @version V1.0
 */

package cn.edu.xmu.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.AuthDao;
import cn.edu.xmu.entity.Auth;
import cn.edu.xmu.service.AuthService;

/**
  * @ClassName: AuthServiceImpl
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月18日 下午7:39:25
  */
public class AuthServiceImpl implements AuthService {

	
	/**
     * @Fields dao : dao组件
     */
   @Resource(name="authdao")
    AuthDao dao ;

	
	/*
	 * Title: getAllAuth
	 * Description:
	 * @return
	 * @see cn.edu.xmu.service.AuthService#getAllAuth()
	 */

	@Override
	public List<Auth> getAllAuth(List<Integer> pro) {
		// TODO Auto-generated method stub
		return dao.getAllAuth(pro);
	}
	
	/*
	  * Title: getAllAuth
	  * Description:
	  * @param pro
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.service.AuthService#getAllAuth(java.util.List, int, int)
	  */
	@Override
	public List<Auth> getAllAuth(List<Integer> pro,int pageNo,int pageSize){
		return dao.getAllAuth(pro, pageNo, pageSize);
	}

	@Override
	public int countAuth(List<Integer> pro) {
		// TODO Auto-generated method stub
		return dao.countAuth(pro);
	}

	@Override
	public void deleteAuthById(int id) {
		// TODO Auto-generated method stub
		dao.deleteAuthById(id);
	}

	@Override
	public void saveAuth(Auth Auth) {
		// TODO Auto-generated method stub
		dao.saveAuth(Auth);
	}

	public Auth getAuthById(int id){
		return dao.getAuthById(id);
	}

	@Override
	public Auth getAuthByRole_id(int role_id) {
		// TODO Auto-generated method stub
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(role_id);
		return dao.getAuthByRole_id(pro);
	}
	
}
