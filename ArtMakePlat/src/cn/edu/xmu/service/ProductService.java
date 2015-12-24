
package cn.edu.xmu.service;

import java.util.List;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Product;

/**
  * @ClassName: ProductService
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月22日 上午1:11:08
  */
public interface ProductService {
	public List<Product> getAllProduct(List<String> pro);
	
	public List<Product> getAllProduct(List<String> pro,int pageNo,int pageSize);
	
	public int countProduct(List<String> pro);
	
	public void deleteProductById(int id);
	
	public void saveProduct(Product product);
	
	public Product getProductById(int id);
	
	 public int countProductByIng(List<Integer> pro);
		
	public int countProductByNotIng(List<Integer> pro);
	
	public List<Product> getProductByIng(List<Integer> pro,int pageNo,int pageSize);
	
	public List<Product> getProductByNotIng(List<Integer> pro,int pageNo,int pageSize);
}
