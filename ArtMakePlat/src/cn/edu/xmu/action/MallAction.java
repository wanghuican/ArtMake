/**
 * @Title: ProductAction.java
 * @Package cn.edu.xmu.action
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月14日 下午10:06:51
 * @version V1.0
 */

package cn.edu.xmu.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import cn.edu.xmu.entity.Auth;
import cn.edu.xmu.entity.Key;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.ProAction;
import cn.edu.xmu.entity.Product;
import cn.edu.xmu.entity.ProRecord;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.AuthService;
import cn.edu.xmu.service.KeyService;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.service.ProActionService;
import cn.edu.xmu.service.ProductService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

/**
  * @ClassName: MallAction
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月27日 下午9:12:35
  */
public class MallAction extends ActionSupport {
	/**
	 * @Fields loginService : 登录业务逻辑组件
	 */
	@Resource(name = "productService")
	ProductService productService;

	@Resource(name = "keyService")
	KeyService keyService;
	
	private Product product;

	private String result;

	private List<Key> keyList;
	
	private int id;

	/**
	 * getter method
	 * 
	 * @return the result
	 */

	public String getResult() {
		return result;
	}

	/**
	 * setter method
	 * 
	 * @param result
	 *            the result to set
	 */

	public void setResult(String result) {
		this.result = result;
	}

	/**
	 * getter method
	 * 
	 * @return the product
	 */

	public Product getProduct() {
		return product;
	}

	/**
	 * setter method
	 * 
	 * @param product
	 *            the product to set
	 */

	public void setProduct(Product product) {
		this.product = product;
	}

	/**
	 * getter method
	 * 
	 * @return the productService
	 */

	public ProductService getProductService() {
		return productService;
	}

	/**
	 * getter method
	 * 
	 * @return the id
	 */

	public int getId() {
		return id;
	}

	/**
	 * setter method
	 * 
	 * @param id
	 *            the id to set
	 */

	public void setId(int id) {
		this.id = id;
	}

	/**
	 * setter method
	 * 
	 * @param productService
	 *            the productService to set
	 */

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
		
	
	
	/**
	 * getter method
	 * @return the keyService
	 */
	
	public KeyService getKeyService() {
		return keyService;
	}

	/**
	 * setter method
	 * @param keyService the keyService to set
	 */
	
	public void setKeyService(KeyService keyService) {
		this.keyService = keyService;
	}

	/**
	 * getter method
	 * @return the keyList
	 */
	
	public List<Key> getKeyList() {
		return keyList;
	}

	/**
	 * setter method
	 * @param keyList the keyList to set
	 */
	
	public void setKeyList(List<Key> keyList) {
		this.keyList = keyList;
	}

	/*
	  * Title: execute
	  * Description:
	  * @return
	  * @throws Exception
	  * @see com.opensymphony.xwork2.ActionSupport#execute()
	  */
	@Override
	public String execute() throws Exception {
		setKeyList(keyService.getAllKey(new ArrayList<Integer>()));
		return SUCCESS;
	}
	public String toMallList() {
		String kid = WebTool.getRequest().getParameter("kid");
		String pname = WebTool.getRequest().getParameter("pname");
		String state = WebTool.getRequest().getParameter("state");
		pname = pname == null ? "" : pname;
		List<String> pro = new ArrayList<String>();
	    pro.add(pname);
	    pro.add(pname);
		pro = WebTool.dealStrProList(pro);
		List<Product> productList = productService.searchProduct(state,kid,pro);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", WebTool.listToJsonStr(productList));
		map.put("imagesrc", Common.PRODUCT_SRC);
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
}
