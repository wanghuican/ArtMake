/**
 * @Title: Product.java
 * @Package cn.edu.xmu.entity
 * @Description: TODO
 * team:3-10打屁屁小队
 * @date 2015年11月25日 下午8:49:24
 * @version V1.0
 */

package cn.edu.xmu.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName: Product
 * @Description: 艺术品实体
 * team: 3-10打屁屁小队
 * @date 2015年11月25日 下午8:49:24
 */

public class Product extends JsonEntity{

	/**
	  * @Fields product_id
	  */
	private int product_id;
	
	/**
	  * @Fields price : 当前价格
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
	  * @Fields productname : TODO（用一句话描述这个变量表示什么）
	  */
	private String productname;
	
	/**
	  * @Fields state : 0:未展示 1:未售出 -1:已售出
	  */
	private int state;
	
	/**
	  * @Fields pass : TODO（用一句话描述这个变量表示什么）
	  */
	private int pass;
	
	/**
	  * @Fields imageList : 图片列表
	  */
	private List<Proimg> imageList = new ArrayList();
	
	/**
	  * @Fields keyList : 关键词列表
	  */
	private List<Prokey> keyList = new ArrayList();

	/**
	  * @Fields actionList :
	  */
	private List<ProAction> actionList = new ArrayList();
	
	/**
	  * 创建一个新的实例 Product. 
	  * <p>Description: 无参构造函数</p>
	  */
	
	public Product() {
		super();
	}

	

	/**
	  * 创建一个新的实例 Product. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param product_id
	  * @param price
	  * @param introduce
	  * @param uptime
	  * @param person
	  * @param productname
	  * @param state
	  * @param pass
	  * @param imageList
	  * @param keyList
	  * @param actionList
	  */
	
	public Product(int product_id, double price, String introduce, Date uptime,
			Person person, String productname, int state, int pass,
			List<Proimg> imageList, List<Prokey> keyList,
			List<ProAction> actionList) {
		super();
		this.product_id = product_id;
		this.price = price;
		this.introduce = introduce;
		this.uptime = uptime;
		this.person = person;
		this.productname = productname;
		this.state = state;
		this.pass = pass;
		this.imageList = imageList;
		this.keyList = keyList;
		this.actionList = actionList;
	}



	/**
	 * getter method
	 * @return the productname
	 */
	
	public String getProductname() {
		return productname;
	}



	/**
	 * setter method
	 * @param productname the productname to set
	 */
	
	public void setProductname(String productname) {
		this.productname = productname;
	}



	/**
	 * getter method
	 * @return the product_id
	 */
	
	public int getProduct_id() {
		return product_id;
	}

	/**
	 * setter method
	 * @param product_id the product_id to set
	 */
	
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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
	 * @return the imageList
	 */
	
	public List<Proimg> getImageList() {
		return imageList;
	}

	/**
	 * setter method
	 * @param imageList the imageList to set
	 */
	
	public void setImageList(List<Proimg> imageList) {
		this.imageList = imageList;
	}

	/**
	 * getter method
	 * @return the keyList
	 */
	
	public List<Prokey> getKeyList() {
		return keyList;
	}

	/**
	 * setter method
	 * @param keyList the keyList to set
	 */
	
	public void setKeyList(List<Prokey> keyList) {
		this.keyList = keyList;
	}

	/**
	 * getter method
	 * @return the actionList
	 */
	
	public List<ProAction> getActionList() {
		return actionList;
	}

	/**
	 * setter method
	 * @param actionList the actionList to set
	 */
	
	public void setActionList(List<ProAction> actionList) {
		this.actionList = actionList;
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


	/*
	  * Title: toJsonString
	  * Description:
	  * @return
	  * @see cn.edu.xmu.entity.JsonEntity#toJsonString()
	  */
	@Override
	public String toJsonString() {
		return "{\"product_id\":\"" + product_id + "\",\"price\":\"" + price
				+ "\",\"introduce\":\"" + introduce + "\",\"uptime\":\"" + uptime
				+ "\",\"person\":\"" + person + "\",\"productname\":\""
				+ productname + "\",\"state\":\"" + state + "\",\"pass\":\""
				+ pass + "\",\"imageList\":\"" + imageList + "\",\"image\":\"" 
				+ imageList.get(0).getImage() + "\",\"keyList\":\"" + keyList + "\",\"actionList\":\""
				+ actionList + "\"}  ";
	}

	

	
}
