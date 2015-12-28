/**
 * @Title: Demand.java
 * @Package cn.edu.xmu.entity
 * @Description: TODO
 * team:3-10打屁屁小队
 * @date 2015年11月25日 下午9:02:57
 * @version V1.0
 */

package cn.edu.xmu.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName: Demand
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年11月25日 下午9:02:57
 */

public class Demand extends JsonEntity{

	/**
	  * @Fields demand_id
	  */
	private int demand_id;
	
	/**
	  * @Fields price : 一口价
	  */
	private double price;

	
	/**
	  * @Fields introduce
	  */
	private String introduce;
	
	/**
	  * @Fields uptime : TODO（用一句话描述这个变量表示什么）
	  */
	private Date uptime;
	
	/**
	  * @Fields person
	  */
	private Person person;
	
	/**
	  * @Fields lasttime : 持续时间h
	  */
	private int lasttime;
	
	/**
	  * @Fields state : 1:未完成 -1:已完成
	  */
	private int state;


	/**
	  * @Fields pass 
	  */
	private int pass;
	
	/**
	  * @Fields key : TODO（用一句话描述这个变量表示什么）
	  */
	private Key key;
	
	/**
	  * @Fields recordList : 
	  */
	private List<DemRecord> recordList;
	
	/**
	  * 创建一个新的实例 Demand. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  */
	
	public Demand() {
		super();
	}




	/**
	  * 创建一个新的实例 Demand. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param demand_id
	  * @param price
	  * @param introduce
	  * @param uptime
	  * @param person
	  * @param lasttime
	  * @param state
	  * @param pass
	  * @param key
	  * @param recordList
	  */
	
	public Demand(int demand_id, double price, String introduce, Date uptime,
			Person person, int lasttime, int state, int pass, Key key,
			List<DemRecord> recordList) {
		super();
		this.demand_id = demand_id;
		this.price = price;
		this.introduce = introduce;
		this.uptime = uptime;
		this.person = person;
		this.lasttime = lasttime;
		this.state = state;
		this.pass = pass;
		this.key = key;
		this.recordList = recordList;
	}




	/**
	 * getter method
	 * @return the recordList
	 */
	
	public List<DemRecord> getRecordList() {
		return recordList;
	}



	/**
	 * setter method
	 * @param recordList the recordList to set
	 */
	
	public void setRecordList(List<DemRecord> recordList) {
		this.recordList = recordList;
	}



	/**
	 * getter method
	 * @return the demand_id
	 */
	
	public int getDemand_id() {
		return demand_id;
	}


	/**
	 * setter method
	 * @param demand_id the demand_id to set
	 */
	
	public void setDemand_id(int demand_id) {
		this.demand_id = demand_id;
	}


	/**
	 * getter method
	 * @return the price
	 */
	
	public double getPrice() {
		return price;
	}


	/**
	 * setter method
	 * @param price the price to set
	 */
	
	public void setPrice(double price) {
		this.price = price;
	}


	/**
	 * getter method
	 * @return the introduce
	 */
	
	public String getIntroduce() {
		return introduce;
	}


	/**
	 * setter method
	 * @param introduce the introduce to set
	 */
	
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	/**
	 * getter method
	 * @return the uptime
	 */
	
	public Date getUptime() {
		return uptime;
	}


	/**
	 * setter method
	 * @param uptime the uptime to set
	 */
	
	public void setUptime(Date uptime) {
		this.uptime = uptime;
	}


	/**
	 * getter method
	 * @return the person
	 */
	
	public Person getPerson() {
		return person;
	}


	/**
	 * setter method
	 * @param person the person to set
	 */
	
	public void setPerson(Person person) {
		this.person = person;
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


	/**
	 * getter method
	 * @return the state
	 */
	
	public int getState() {
		return state;
	}


	/**
	 * setter method
	 * @param state the state to set
	 */
	
	public void setState(int state) {
		this.state = state;
	}




	/**
	 * getter method
	 * @return the pass
	 */
	
	public int getPass() {
		return pass;
	}




	/**
	 * setter method
	 * @param pass the pass to set
	 */
	
	public void setPass(int pass) {
		this.pass = pass;
	}




	/**
	 * getter method
	 * @return the key
	 */
	
	public Key getKey() {
		return key;
	}




	/**
	 * setter method
	 * @param key the key to set
	 */
	
	public void setKey(Key key) {
		this.key = key;
	}


	/*
	  * Title: toJsonString
	  * Description:
	  * @return
	  * @see cn.edu.xmu.entity.JsonEntity#toJsonString()
	  */
	@Override
	public String toJsonString() {
		return "{\"demand_id\":\"" + demand_id + "\",\"price\":\"" + price
				+ "\",\"introduce\":\"" + introduce + "\",\"personname\":\"" + person.getRole().getRolename()
				+":"+person.getRealname() + "\",\"person_id\":\"" + person.getPerson_id() + "\",\"uptime\":\""
				+ uptime + "\",\"person\":\"" + person + "\",\"lasttime\":\""
				+ lasttime + "\",\"state\":\"" + state + "\",\"pass\":\""
				+ pass + "\",\"key\":\"" + key + "\",\"recordList\":\""
				+ recordList + "\"}  ";
	}

	
	
}
