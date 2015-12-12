/**
 * @Title: Key.java
 * @Package cn.edu.xmu.entity
 * @Description: TODO
 * team:3-10打屁屁小队
 * @date 2015年11月25日 下午8:40:58
 * @version V1.0
 */

package cn.edu.xmu.entity;

import java.io.Serializable;

/**
 * @ClassName: Key
 * @Description: 关键词实体
 * team: 3-10打屁屁小队
 * @date 2015年11月25日 下午8:40:58
 */

public class Key extends JsonEntity{

	/**
	  * @Fields key_id
	  */
	private int key_id;
	
	/**
	  * @Fields keyname
	  */
	private String keyname;
	
	/**
	  * 创建一个新的实例 Key. 
	  * <p>Description: 无参构造函数</p>
	  */
	
	public Key() {
		super();
	}

	/**
	  * 创建一个新的实例 Key. 
	  * <p>Description: 全参构造函数</p>
	  * @param key_id
	  * @param keyname
	  */
	
	public Key(int key_id, String keyname) {
		super();
		this.key_id = key_id;
		this.keyname = keyname;
	}

	/**
	 * getter method
	 * @return the key_id
	 */
	
	public int getKey_id() {
		return key_id;
	}

	/**
	 * setter method
	 * @param key_id the key_id to set
	 */
	
	public void setKey_id(int key_id) {
		this.key_id = key_id;
	}

	/**
	 * getter method
	 * @return the keyname
	 */
	
	public String getKeyname() {
		return keyname;
	}

	/**
	 * setter method
	 * @param keyname the keyname to set
	 */
	
	public void setKeyname(String keyname) {
		this.keyname = keyname;
	}

	
	/*
	  * Title: toJsonString
	  * Description:
	  * @return
	  * @see cn.edu.xmu.entity.JsonEntity#toJsonString()
	  */
	public String toJsonString() {
		return "{\"key_id\":\"" + key_id + "\",\"keyname\":\"" + keyname
				+ "\"}  ";
	}

	
}
