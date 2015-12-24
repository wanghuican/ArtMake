
package cn.edu.xmu.entity;

import java.util.Date;


/**
  * @ClassName: ProAction
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月14日 下午5:14:44
  */
public class ProAction extends JsonEntity{

	/**
	  * @Fields action_id : TODO（用一句话描述这个变量表示什么）
	  */
	private int action_id;
	

	/**
	  * @Fields product : TODO（用一句话描述这个变量表示什么）
	  */
	private Product product;
	
	/**
	  * @Fields startprice : TODO（用一句话描述这个变量表示什么）
	  */
	private double startprice;
	
	/**
	  * @Fields addprice : TODO（用一句话描述这个变量表示什么）
	  */
	private double addprice;
	
	/**
	  * @Fields lasttime : TODO（用一句话描述这个变量表示什么）
	  */
	private int lasttime;
	
	/**
	  * @Fields recordtime : TODO（用一句话描述这个变量表示什么）
	  */
	private Date recordtime;

	/**
	  * @Fields endtime : TODO（用一句话描述这个变量表示什么）
	  */
	private Date endtime;
	
	/**
	  * @Fields introduce
	  */
	private String introduce;
	
	/**
	  * 创建一个新的实例 ProAction. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  */
	
	public ProAction() {
		super();
	}

	

	/**
	  * 创建一个新的实例 ProAction. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param action_id
	  * @param product
	  * @param startprice
	  * @param addprice
	  * @param lasttime
	  * @param recordtime
	  * @param endtime
	  * @param introduce
	  */
	
	public ProAction(int action_id, Product product, double startprice,
			double addprice, int lasttime, Date recordtime, Date endtime,
			String introduce) {
		super();
		this.action_id = action_id;
		this.product = product;
		this.startprice = startprice;
		this.addprice = addprice;
		this.lasttime = lasttime;
		this.recordtime = recordtime;
		this.endtime = endtime;
		this.introduce = introduce;
	}






	/**
	 * getter method
	 * @return the endtime
	 */
	
	public Date getEndtime() {
		return endtime;
	}



	/**
	 * setter method
	 * @param endtime the endtime to set
	 */
	
	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}



	/**
	 * getter method
	 * @return the action_id
	 */
	
	public int getAction_id() {
		return action_id;
	}

	/**
	 * setter method
	 * @param action_id the action_id to set
	 */
	
	public void setAction_id(int action_id) {
		this.action_id = action_id;
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
	 * @return the startprice
	 */
	
	public double getStartprice() {
		return startprice;
	}

	/**
	 * setter method
	 * @param startprice the startprice to set
	 */
	
	public void setStartprice(double startprice) {
		this.startprice = startprice;
	}

	/**
	 * getter method
	 * @return the addprice
	 */
	
	public double getAddprice() {
		return addprice;
	}

	/**
	 * setter method
	 * @param addprice the addprice to set
	 */
	
	public void setAddprice(double addprice) {
		this.addprice = addprice;
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
	 * @return the recordtime
	 */
	
	public Date getRecordtime() {
		return recordtime;
	}

	/**
	 * setter method
	 * @param recordtime the recordtime to set
	 */
	
	public void setRecordtime(Date recordtime) {
		this.recordtime = recordtime;
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

	
	/*
	  * Title: toJsonString
	  * Description:
	  * @return
	  * @see cn.edu.xmu.entity.JsonEntity#toJsonString()
	  */
	@Override
	public String toJsonString() {
		return "{\"action_id\":\"" + action_id + "\",\"product\":\"" + product
				+ "\",\"startprice\":\"" + startprice + "\",\"addprice\":\""
				+ addprice + "\",\"lasttime\":\"" + lasttime
				+ "\",\"recordtime\":\"" + recordtime + "\",\"endtime\":\""
				+ endtime + "\",\"introduce\":\"" + introduce + "\"}  ";
	}

}
