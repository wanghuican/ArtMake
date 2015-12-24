/**
 * @Title: AuthService.java
 * @Package cn.edu.xmu.service
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月16日 上午12:25:31
 * @version V1.0
 */

package cn.edu.xmu.service;

import java.util.List;

import cn.edu.xmu.entity.Auth;


/**
  * @ClassName: AuthService
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月18日 下午7:38:54
  */
public interface AuthService {
	public List<Auth> getAllAuth(List<Integer> pro);
	
	public List<Auth> getAllAuth(List<Integer> pro,int pageNo,int pageSize);
	
	public int countAuth(List<Integer> pro);
	
	public void deleteAuthById(int id);
	
	public void saveAuth(Auth Auth);
	
	public Auth getAuthById(int id);
	
	public Auth getAuthByRole_id(int role_id);
}
