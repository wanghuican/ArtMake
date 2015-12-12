/**
 * @Title: JsonEntity.java
 * @Package cn.edu.xmu.entity
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月13日 上午5:30:43
 * @version V1.0
 */

package cn.edu.xmu.entity;

import java.io.Serializable;

/**
 * @ClassName: JsonEntity
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月13日 上午5:30:43
 */

public abstract class JsonEntity implements Serializable{
	public abstract String toJsonString();
}
