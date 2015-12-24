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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.Product;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.service.ProductService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: ProductAction
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月14日 下午10:06:51
 */

public class ProductAction extends ActionSupport{
	/**
	 * @Fields loginService : 登录业务逻辑组件
	 */
	@Resource(name = "productService")
	ProductService productService;
	
	private Product product;
	
	private String result;
	
	private int id;
	
	private List<Product> productIngList;
	
	private List<Product> productNotIngList;

	/**
	 * getter method
	 * @return the result
	 */
	
	public String getResult() {
		return result;
	}


	/**
	 * setter method
	 * @param result the result to set
	 */
	
	public void setResult(String result) {
		this.result = result;
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
	 * @return the productService
	 */
	
	public ProductService getProductService() {
		return productService;
	}

	
	/**
	 * getter method
	 * @return the id
	 */
	
	public int getId() {
		return id;
	}


	/**
	 * setter method
	 * @param id the id to set
	 */
	
	public void setId(int id) {
		this.id = id;
	}


	/**
	 * setter method
	 * @param productService the productService to set
	 */
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}


	/**
	 * getter method
	 * @return the productIngList
	 */
	
	public List<Product> getProductIngList() {
		return productIngList;
	}


	/**
	 * setter method
	 * @param productIngList the productIngList to set
	 */
	
	public void setProductIngList(List<Product> productIngList) {
		this.productIngList = productIngList;
	}


	/**
	 * getter method
	 * @return the productNotIngList
	 */
	
	public List<Product> getProductNotIngList() {
		return productNotIngList;
	}


	/**
	 * setter method
	 * @param productNotIngList the productNotIngList to set
	 */
	
	public void setProductNotIngList(List<Product> productNotIngList) {
		this.productNotIngList = productNotIngList;
	}

	public String toProductIngList(){
		if(getId() == 0){
			Person person = WebTool.getSessionPerson();
	    	setId(person.getPerson_id());
		}
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(getId());
		int count = productService.countProductByIng(pro);
		int page = 0;
		page = WebTool.dealPage(count, page, Common.PAGESIZE,"PAGEING");
		List<Product> productIngList = productService.getProductByIng(pro,page, Common.PAGESIZE);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", page);
		map.put("rows", WebTool.listToJsonStr(productIngList));
		map.put("size", count);
		map.put("imagesrc", Common.PRODUCT_SRC);
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	public String toProductNotIngList(){
		if(getId() == 0){
			Person person = WebTool.getSessionPerson();
	    	setId(person.getPerson_id());
		}
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(getId());
		int count = productService.countProductByNotIng(pro);
		int page = 0;
		page = WebTool.dealPage(count, page, Common.PAGESIZE-1,"PAGENOTING");
		List<Product> productNotIngList = productService.getProductByNotIng(pro,page, Common.PAGESIZE-1);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", page);
		map.put("rows", WebTool.listToJsonStr(productNotIngList));
		map.put("size", count);
		map.put("imagesrc", Common.PRODUCT_SRC);
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	public String delProduct() throws IOException{
		Product product = productService.getProductById(getId());
		for(int i=0;i<product.getImageList().size();i++){
			String imagepath = Common.PLAT_SRC + Common.PRODUCT_SRC +"/" + product.getImageList().get(i).getImage();
			File imgfile = new File(imagepath);
			WebTool.deleteFile(imgfile);
		}
		productService.deleteProductById(getId());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("message", "删除艺术品成功");
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	public String goEditProduct(){
		if(getId()!=0){
			Product product = productService.getProductById(getId());
			setProduct(product);
			if(product.getPerson().getPerson_id() != WebTool.getSessionPerson().getPerson_id()
					|| product.getState() == 1){
				WebTool.getProductSrc();
				return "detail";
			}
		}
		return "edit";
	}
	
	public String editProduct() throws IOException{
		Product product = productService.getProductById(getId());
		product.setProductname(WebTool.getRequest().getParameter("pname"));
		product.setIntroduce(WebTool.getRequest().getParameter("introduce"));
		productService.saveProduct(product);
		WebTool.alertMessage("修改艺术品成功", "person!goInfo");
		return null;
	}
	
	public String getPrice(){
		Product product = productService.getProductById(getId());
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("price", product.getPrice());
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
}
