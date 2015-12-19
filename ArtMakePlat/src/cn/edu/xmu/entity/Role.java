/**
 * @Title: Role.java
 * @Package cn.edu.xmu.entity
 * @Description: TODO
 * team:3-10打屁屁小队
 * @date 2015年11月25日 下午7:34:34
 * @version V1.0
 */

package cn.edu.xmu.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

/**
 * @ClassName: Role
 * @Description: 角色实体
 * team: 3-10打屁屁小队
 * @date 2015年11月25日 下午7:34:34
 */

public class Role extends JsonEntity{
	
	/**
	  * @Fields role_id
	  */
	private int role_id;
	
	
	/**
	  * @Fields role_code : 角色代码
	  */
	private int role_code;
	
	/**
	  * @Fields rolename
	  */
	private String rolename;
	
	/**
	  * @Fields frolename
	  */
	private String frolename;
	
	/**
	  * @Fields personList : TODO（用一句话描述这个变量表示什么）
	  */
	private List<Person> personList;
	
	/**
	  * 创建一个新的实例 Role. 
	  * <p>Description: 无参构造函数</p>
	  */
	
	public Role() {
		super();
	}

	
	
	
	/**
	  * 创建一个新的实例 Role. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param role_id
	  * @param role_code
	  * @param rolename
	  * @param frolename
	  * @param personList
	  */
	
	public Role(int role_id, int role_code, String rolename, String frolename,
			 List<Person> personList) {
		super();
		this.role_id = role_id;
		this.role_code = role_code;
		this.rolename = rolename;
		this.frolename = frolename;
		this.personList = personList;
	}




	/**
	 * getter method
	 * @return the personList
	 */
	
	public List<Person> getPersonList() {
		return personList;
	}




	/**
	 * setter method
	 * @param personList the personList to set
	 */
	
	public void setPersonList(List<Person> personList) {
		this.personList = personList;
	}




	/**
	 * getter method
	 * @return the role_id
	 */
	
	public int getRole_id() {
		return role_id;
	}

	/**
	 * setter method
	 * @param role_id the role_id to set
	 */
	
	public void setRole_id(int role_id) {
		this.role_id = role_id;
	}


	/**
	 * getter method
	 * @return the role_code
	 */
	
	public int getRole_code() {
		return role_code;
	}

	/**
	 * setter method
	 * @param role_code the role_code to set
	 */
	
	public void setRole_code(int role_code) {
		this.role_code = role_code;
	}

	/**
	 * getter method
	 * @return the rolename
	 */
	
	public String getRolename() {
		return rolename;
	}

	/**
	 * setter method
	 * @param rolename the rolename to set
	 */
	
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	

	
	/**
	 * getter method
	 * @return the frolename
	 */
	
	public String getFrolename() {
		return frolename;
	}

	/**
	 * setter method
	 * @param frolename the frolename to set
	 */
	
	public void setFrolename(String frolename) {
		this.frolename = frolename;
	}




	
	/*
	  * Title: toJsonString
	  * Description:
	  * @return
	  * @see cn.edu.xmu.entity.JsonEntity#toJsonString()
	  */
	@Override
	public String toJsonString() {
		return "{\"role_id\":\"" + role_id + "\",\"role_code\":\"" + role_code
				+ "\",\"rolename\":\"" + rolename + "\",\"frolename\":\""
				+ frolename +  "\",\"personList\":\"" + personList + "\"}  ";
	}

	

}