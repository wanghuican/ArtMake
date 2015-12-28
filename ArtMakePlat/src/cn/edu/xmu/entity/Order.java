/**
 * @Title: Order.java
 * @Package cn.edu.xmu.entity
 * @Description: TODO
 * team:3-10打屁屁小队
 * @date 2015年11月25日 下午8:24:58
 * @version V1.0
 */

package cn.edu.xmu.entity;

import java.io.Serializable;
import java.util.Date;

import cn.edu.xmu.util.CTool;
import cn.edu.xmu.util.WebTool;

/**
 * @ClassName: Order
 * @Description: 咨询实体
 * team: 3-10打屁屁小队
 * @date 2015年11月25日 下午8:24:58
 */

public class Order extends JsonEntity{

	/**
	  * @Fields order_id
	  */
	private int order_id;
	
	/**
	  * @Fields person
	  */
	private Person person;
	
	/**
	  * @Fields buytime
	  */
	private Date buytime;
	
	/**
	  * @Fields product
	  */
	private Product product;
	
	/**
	  * @Fields demand
	  */
	private Demand demand;
	
	/**
	  * @Fields state
	  */
	private int state;

	/**
	  * @Fields type : TODO（用一句话描述这个变量表示什么）
	  */
	private int type;
	
	/**
	  * 创建一个新的实例 Order. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  */
	
	public Order() {
		super();
	}



	/**
	  * 创建一个新的实例 Order. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param order_id
	  * @param person
	  * @param buytime
	  * @param product
	  * @param demand
	  * @param state
	  * @param type
	  */
	
	public Order(int order_id, Person person, Date buytime, Product product,
			Demand demand, int state, int type) {
		super();
		this.order_id = order_id;
		this.person = person;
		this.buytime = buytime;
		this.product = product;
		this.demand = demand;
		this.state = state;
		this.type = type;
	}



	/**
	 * getter method
	 * @return the type
	 */
	
	public int getType() {
		return type;
	}



	/**
	 * setter method
	 * @param type the type to set
	 */
	
	public void setType(int type) {
		this.type = type;
	}



	/**
	 * getter method
	 * @return the order_id
	 */
	
	public int getOrder_id() {
		return order_id;
	}



	/**
	 * setter method
	 * @param order_id the order_id to set
	 */
	
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
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
	 * @return the buytime
	 */
	
	public Date getBuytime() {
		return buytime;
	}



	/**
	 * setter method
	 * @param buytime the buytime to set
	 */
	
	public void setBuytime(Date buytime) {
		this.buytime = buytime;
	}



	/**
	 * getter method
	 * @return the product
	 */
	
	public Product getProduct() {
		return product;
	}



	/**
	 * setter method
	 * @param product the product to set
	 */
	
	public void setProduct(Product product) {
		this.product = product;
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
	 * @return the demand
	 */
	
	public Demand getDemand() {
		return demand;
	}




	/**
	 * setter method
	 * @param demand the demand to set
	 */
	
	public void setDemand(Demand demand) {
		this.demand = demand;
	}


	
	/*
	  * Title: toJsonString
	  * Description:
	  * @return
	  * @see cn.edu.xmu.entity.JsonEntity#toJsonString()
	  */
	@Override
	public String toJsonString() {
		return "{\"order_id\":\"" + order_id + "\",\"person\":\"" + person
				+ "\",\"buytime\":\"" + buytime + "\",\"product\":\"" + product
				+ "\",\"demand\":\"" + demand + "\",\"state\":\"" + state
				+ "\",\"type\":\"" + type + "\"}  ";
	}

	
}
