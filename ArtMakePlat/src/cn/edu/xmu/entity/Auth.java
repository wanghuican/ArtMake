/**
 * @Title: RoleAuth.java
 * @Package cn.edu.xmu.entity
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月18日 下午5:13:42
 * @version V1.0
 */

package cn.edu.xmu.entity;
/**
 * @ClassName: RoleAuth
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月18日 下午5:13:42
 */

public class Auth extends JsonEntity {

	private int auth_id;
	
	private Role role;
	
	private int upnum;
	
	private int lasttime;

	
	
	/**
	  * 创建一个新的实例 RoleAuth. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  */
	
	public Auth() {
		super();
	}



	/**
	  * 创建一个新的实例 RoleAuth. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param auth_id
	  * @param role
	  * @param upnum
	  * @param lasttime
	  */
	
	public Auth(int auth_id, Role role, int upnum, int lasttime) {
		super();
		this.auth_id = auth_id;
		this.role = role;
		this.upnum = upnum;
		this.lasttime = lasttime;
	}



	/**
	 * getter method
	 * @return the auth_id
	 */
	
	public int getAuth_id() {
		return auth_id;
	}



	/**
	 * setter method
	 * @param auth_id the auth_id to set
	 */
	
	public void setAuth_id(int auth_id) {
		this.auth_id = auth_id;
	}



	/**
	 * getter method
	 * @return the role
	 */
	
	public Role getRole() {
		return role;
	}



	/**
	 * setter method
	 * @param role the role to set
	 */
	
	public void setRole(Role role) {
		this.role = role;
	}



	/**
	 * getter method
	 * @return the upnum
	 */
	
	public int getUpnum() {
		return upnum;
	}



	/**
	 * setter method
	 * @param upnum the upnum to set
	 */
	
	public void setUpnum(int upnum) {
		this.upnum = upnum;
	}



	/**
	 * getter method
	 * @return the lasttime
	 */
	
	public int getLasttime() {
		return lasttime;
	}



	/**
	 * setter method
	 * @param lasttime the lasttime to set
	 */
	
	public void setLasttime(int lasttime) {
		this.lasttime = lasttime;
	}

	
	/*
	  * Title: toJsonString
	  * Description:
	  * @return
	  * @see cn.edu.xmu.entity.JsonEntity#toJsonString()
	  */
	@Override
	public String toJsonString() {
		return "{\"auth_id\":\"" + auth_id + "\",\"role\":\"" + role
				+ "\",\"upnum\":\"" + upnum + "\",\"lasttime\":\"" + lasttime
				+ "\"}  ";
	}
	
	

}
