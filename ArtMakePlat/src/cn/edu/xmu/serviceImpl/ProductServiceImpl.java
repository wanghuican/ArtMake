/**
 * @Title: ProductServiceImpl.java
 * @Package cn.edu.xmu.serviceImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月16日 上午12:29:50
 * @version V1.0
 */

package cn.edu.xmu.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.ProductDao;
import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Key;
import cn.edu.xmu.entity.Perkey;
import cn.edu.xmu.entity.Product;
import cn.edu.xmu.service.ProductService;
import cn.edu.xmu.util.WebTool;

/**
 * @ClassName: ProductServiceImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月16日 上午12:29:50
 */

public class ProductServiceImpl implements ProductService {

	
	/**
     * @Fields dao : dao组件
     */
   @Resource(name="productdao")
    ProductDao dao ;

	
	/*
	 * Title: getAllProduct
	 * Description:
	 * @return
	 * @see cn.edu.xmu.service.ProductService#getAllProduct()
	 */

	@Override
	public List<Product> getAllProduct(List<String> pro) {
		// TODO Auto-generated method stub
		return dao.getAllProduct(pro);
	}
	
	/*
	  * Title: getAllProduct
	  * Description:
	  * @param pro
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.service.ProductService#getAllProduct(java.util.List, int, int)
	  */
	@Override
	public List<Product> getAllProduct(List<String> pro,int pageNo,int pageSize){
		return dao.getAllProduct(pro, pageNo, pageSize);
	}

	@Override
	public int countProduct(List<String> pro) {
		// TODO Auto-generated method stub
		return dao.countProduct(pro);
	}

	@Override
	public void deleteProductById(int id) {
		// TODO Auto-generated method stub
		dao.deleteProductById(id);
	}

	@Override
	public void saveProduct(Product product) {
		// TODO Auto-generated method stub
		dao.saveProduct(product);
	}
	
	@Override
	public Product getProductById(int id){
		return dao.getProductById(id);
	}

	@Override
	public List<Product> getProductByIng(List<Integer> pro,int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return dao.getProductByIng(pro,pageNo, pageSize);
	}

	@Override
	public List<Product> getProductByNotIng(List<Integer> pro,int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return dao.getProductByNotIng(pro,pageNo, pageSize);
	}

	@Override
	public int countProductByIng(List<Integer> pro) {
		// TODO Auto-generated method stub
		return dao.countProductByIng(pro);
	}

	@Override
	public int countProductByNotIng(List<Integer> pro) {
		// TODO Auto-generated method stub
		return dao.countProductByNotIng(pro);
	}

	@Override
	public List<Product> searchProduct(String state,String kid,List<String> pro) {
		// TODO Auto-generated method stub
		List<Product> allProduct = dao.getProductByname(pro);
		if(!WebTool.StringisNullOrEmpty(state) && !state.equals("2")){
			for(int i=0;i<allProduct.size();i++){
				Product product = allProduct.get(i);
	    		if(product.getState() != Integer.parseInt(state)){
		    		allProduct.remove(product);
		    		i--;
		    	}
		   	}
		}
		if(!WebTool.StringisNullOrEmpty(kid)){
			Integer k_id = Integer.parseInt(kid);
			for(int i=0;i<allProduct.size();i++){
				Product product = allProduct.get(i);
				List<Perkey> keyList = product.getPerson().getKeyList();
				List<Integer> kidList = new ArrayList<Integer>();
				for(int k=0;k<keyList.size();k++){
					kidList.add(keyList.get(k).getKey().getKey_id());
				}
				if(!kidList.contains(k_id)){
					allProduct.remove(product);
					i--;
				}
			}
		}
		return allProduct;
	}
}
