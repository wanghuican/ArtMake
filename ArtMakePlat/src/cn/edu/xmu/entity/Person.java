/**
 * @Title: Person.java
 * @Package cn.edu.xmu.entity
 * @Description: TODO
 * team:3-10打屁屁小队
 * @date 2015年11月25日 下午7:34:34
 * @version V1.0
 */

package cn.edu.xmu.entity;

import java.util.ArrayList;
import java.util.List;

/**
  * @ClassName: Person
  * @Description: 人员实体
  * team: 3-10打屁屁小队
  * @date 2015年11月25日 下午7:08:51
  */
public class Person extends JsonEntity{

	/**
	  * @Fields person_id
	  */
	private int person_id;
	/**
	  * @Fields account
	  */
	private String account;
	/**
	  * @Fields password
	  */
	private String password;
	/**
	  * @Fields realname
	  */
	private String realname;
	/**
	  * @Fields email
	  */
	private String email;
	
	/**
	  * @Fields qq
	  */
	private String qq;
	
	/**
	  * @Fields idcard
	  */
	private String idcard;
	
	/**
	  * @Fields tel
	  */
	private String tel;
	/**
	  * @Fields address : 注册地址
	  */
	private String address;
	/**
	  * @Fields sex
	  */
	private String sex;
	
	/**
	  * @Fields state
	  */
	private int state;
	/**
	  * @Fields introduce
	  */
	private String introduce;
	
	/**
	  * @Fields role : 身份
	  */
	private Role role;

	/**
	  * @Fields addressList : 收货地址列表
	  */
	private List<Address> addressList = new ArrayList();
	
	/**
	  * @Fields productList : 商品列表
	  */
	private List<Product> productList = new ArrayList();
	
	/**
	  * @Fields demandList : 需求列表
	  */
	private List<Demand> demandList = new ArrayList();
	
	/**
	  * @Fields keyList : 关键词列表
	  */
	private List<Perkey> keyList = new ArrayList();
	
	/**
	  * @Fields articleList
	  */
	private List<Article> articleList = new ArrayList();
	
	/**
	  * 创建一个新的实例 Person. 
	  * Description: 无参构造函数
	  */
	public Person() {
		super();
	}
	

	/**
	  * 创建一个新的实例 Person. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param person_id
	  * @param account
	  * @param password
	  * @param realname
	  * @param email
	  * @param qq
	  * @param idcard
	  * @param tel
	  * @param address
	  * @param sex
	  * @param state
	  * @param introduce
	  * @param role
	  * @param addressList
	  * @param productList
	  * @param demandList
	  * @param keyList
	  * @param articleList
	  */
	public Person(int person_id, String account, String password,
			String realname, String email, String qq, String idcard,
			String tel, String address, String sex, int state,
			String introduce, Role role, List<Address> addressList,
			List<Product> productList, List<Demand> demandList,
			List<Perkey> keyList, List<Article> articleList) {
		super();
		this.person_id = person_id;
		this.account = account;
		this.password = password;
		this.realname = realname;
		this.email = email;
		this.qq = qq;
		this.idcard = idcard;
		this.tel = tel;
		this.address = address;
		this.sex = sex;
		this.state = state;
		this.introduce = introduce;
		this.role = role;
		this.addressList = addressList;
		this.productList = productList;
		this.demandList = demandList;
		this.keyList = keyList;
		this.articleList = articleList;
	}

	/**
	 * getter method
	 * @return the person_id
	 */
	
	public int getPerson_id() {
		return person_id;
	}
	/**
	 * setter method
	 * @param person_id the person_id to set
	 */
	
	public void setPerson_id(int person_id) {
		this.person_id = person_id;
	}
	/**
	 * getter method
	 * @return the account
	 */
	
	public String getAccount() {
		return account;
	}
	/**
	 * setter method
	 * @param account the account to set
	 */
	
	public void setAccount(String account) {
		this.account = account;
	}
	/**
	 * getter method
	 * @return the password
	 */
	
	public String getPassword() {
		return password;
	}
	/**
	 * setter method
	 * @param password the password to set
	 */
	
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * getter method
	 * @return the realname
	 */
	
	public String getRealname() {
		return realname;
	}
	/**
	 * setter method
	 * @param realname the realname to set
	 */
	
	public void setRealname(String realname) {
		this.realname = realname;
	}
	/**
	 * getter method
	 * @return the email
	 */
	
	public String getEmail() {
		return email;
	}
	/**
	 * setter method
	 * @param email the email to set
	 */
	
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * getter method
	 * @return the tel
	 */
	
	public String getTel() {
		return tel;
	}
	/**
	 * setter method
	 * @param tel the tel to set
	 */
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	/**
	 * getter method
	 * @return the address
	 */
	
	public String getAddress() {
		return address;
	}
	/**
	 * setter method
	 * @param address the address to set
	 */
	
	public void setAddress(String address) {
		this.address = address;
	}
	/**
	 * getter method
	 * @return the sex
	 */
	
	public String getSex() {
		return sex;
	}
	/**
	 * setter method
	 * @param sex the sex to set
	 */
	
	public void setSex(String sex) {
		this.sex = sex;
	}
	
	
	
	/**
	 * getter method
	 * @return the qq
	 */
	
	public String getQq() {
		return qq;
	}



	/**
	 * setter method
	 * @param qq the qq to set
	 */
	
	public void setQq(String qq) {
		this.qq = qq;
	}



	/**
	 * getter method
	 * @return the idcard
	 */
	
	public String getIdcard() {
		return idcard;
	}



	/**
	 * setter method
	 * @param idcard the idcard to set
	 */
	
	public void setIdcard(String idcard) {
		this.idcard = idcard;
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
	 * @return the addressList
	 */
	
	public List<Address> getAddressList() {
		return addressList;
	}
	/**
	 * setter method
	 * @param addressList the addressList to set
	 */
	
	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}


	/**
	 * getter method
	 * @return the productList
	 */
	
	public List<Product> getProductList() {
		return productList;
	}


	/**
	 * setter method
	 * @param productList the productList to set
	 */
	
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}


	/**
	 * getter method
	 * @return the demandList
	 */
	
	public List<Demand> getDemandList() {
		return demandList;
	}


	/**
	 * setter method
	 * @param demandList the demandList to set
	 */
	
	public void setDemandList(List<Demand> demandList) {
		this.demandList = demandList;
	}



	/**
	 * getter method
	 * @return the articleList
	 */
	
	public List<Article> getArticleList() {
		return articleList;
	}



	/**
	 * setter method
	 * @param articleList the articleList to set
	 */
	
	public void setArticleList(List<Article> articleList) {
		this.articleList = articleList;
	}


	/**
	 * getter method
	 * @return the keyList
	 */
	
	public List<Perkey> getKeyList() {
		return keyList;
	}


	/**
	 * setter method
	 * @param keyList the keyList to set
	 */
	
	public void setKeyList(List<Perkey> keyList) {
		this.keyList = keyList;
	}


	
	/*
	  * Title: toJsonString
	  * Description:
	  * @return
	  * @see cn.edu.xmu.entity.JsonEntity#toJsonString()
	  */
	@Override
	public String toJsonString() {
		return "{\"person_id\":\"" + person_id + "\",\"account\":\"" + account
				+ "\",\"password\":\"" + password + "\",\"realname\":\""
				+ realname + "\",\"email\":\"" + email + "\",\"qq\":\"" + qq
				+ "\",\"idcard\":\"" + idcard + "\",\"tel\":\"" + tel
				+ "\",\"address\":\"" + address + "\",\"sex\":\"" + sex
				+ "\",\"state\":\"" + state + "\",\"introduce\":\"" + introduce
				+ "\",\"role\":\"" + role + "\",\"addressList\":\""
				+ addressList + "\",\"productList\":\"" + productList
				+ "\",\"demandList\":\"" + demandList + "\",\"keyList\":\""
				+ keyList + "\",\"articleList\":\"" + articleList + "\"}  ";
	}

	

}
