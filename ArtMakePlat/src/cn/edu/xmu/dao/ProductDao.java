
package cn.edu.xmu.dao;

import java.util.List;

import cn.edu.xmu.entity.Product;


/**
  * @ClassName: ProductDao
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月22日 上午12:57:10
  */
public interface ProductDao {
	
	public List<Product> getAllProduct(List<String> pro);
	
	public List<Product> getProductByname(List<String> pro);
	
	public List<Product> getAllProduct(List<String> pro,int pageNo,int pageSize);
	
	public int countProduct(List<String> pro);
	
	public void saveProduct(Product product);
	
	public void deleteProductById(int id);
	
	public Product getProductById(int id);
	
    public int countProductByIng(List<Integer> pro);
	
	public int countProductByNotIng(List<Integer> pro);
	
	public List<Product> getProductByIng(List<Integer> pro,int pageNo,int pageSize);
	
	public List<Product> getProductByNotIng(List<Integer> pro,int pageNo,int pageSize);
}
