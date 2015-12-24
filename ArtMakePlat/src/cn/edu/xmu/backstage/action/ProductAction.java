package cn.edu.xmu.backstage.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Product;
import cn.edu.xmu.service.ProductService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

public class ProductAction extends ActionSupport {

	/**
	 * @Fields personService
	 */
	@Resource(name = "productService")
	ProductService productService;
	private List<Product> productList;
	
	private List<String> selectpro;
	
	private Product product;
	
	private int id;
	
	private String result;
	/**
	 * getter method
	 * @return the productService
	 */
	
	public ProductService getProductService() {
		return productService;
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
	 * @return the selectpro
	 */
	
	public List<String> getSelectpro() {
		return selectpro;
	}

	/**
	 * setter method
	 * @param selectpro the selectpro to set
	 */
	
	public void setSelectpro(List<String> selectpro) {
		this.selectpro = selectpro;
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
	 * getter method
	 * @return the product
	 */
	
	public Product getProduct() {
		return product;
	}

	
	
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
	 * setter method
	 * @param product the product to set
	 */
	
	public void setProduct(Product product) {
		this.product = product;
	}

	public String execute() throws Exception {
		if(getSelectpro() != null){
			setSelectpro(getSelectpro());
			selectpro = WebTool.dealStrProList(selectpro);
			//WebTool.printList(selectpro);
		}else{
			selectpro = new ArrayList<String>();
		}
		int page = 1;
		int count = productService.countProduct(selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setProductList(productService.getAllProduct(selectpro, page, Common.BACKSTAGE_PAGESIZE));
	    WebTool.getProductSrc();
		return INPUT;
	}
	
	public void delProduct() throws IOException{
		Product product = productService.getProductById(getId());
		for(int i=0;i<product.getImageList().size();i++){
			String imagepath = Common.PLAT_SRC + Common.PRODUCT_SRC +"/" + product.getImageList().get(i).getImage();
			File imgfile = new File(imagepath);
			WebTool.deleteFile(imgfile);
		}
		productService.deleteProductById(getId());
	    WebTool.alertMessage("删除艺术品成功", "productManage");
	}
	
	public void ndelProduct()throws IOException{
		String[] rids = WebTool.getNids();
		for(String rid:rids){
			Product product = productService.getProductById(Integer.parseInt(rid));
			for(int i=0;i<product.getImageList().size();i++){
				String imagepath = Common.PLAT_SRC + Common.PRODUCT_SRC +"/" + product.getImageList().get(i).getImage();
				File imgfile = new File(imagepath);
				WebTool.deleteFile(imgfile);
			}
			productService.deleteProductById(Integer.parseInt(rid));
		}
		WebTool.alertMessage("删除艺术品成功", "productManage");
	}
	
	public String changeproPass() throws IOException{
		Product product = productService.getProductById(getId());
		product.setPass(1);
		productService.saveProduct(product);
		String[] message = new String[2];
		message[0] = "取消通过成功";
		message[1] = "通过成功";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("message", message[product.getPass()]);
		map.put("pass", product.getPass());
		map.put("id", getId());
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		//System.out.print(result);
		return SUCCESS;
	}
	
	public String nchangeproPass(){
		String[] aids = WebTool.getNids();
		for(String aid:aids){
			Product product = productService.getProductById(Integer.parseInt(aid));
			product.setPass(1);
			productService.saveProduct(product);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("message", "通过成功");
		map.put("aids", aids);
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		//System.out.println(result);
		return SUCCESS;
	}
}
