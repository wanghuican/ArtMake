package cn.edu.xmu.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.BaseDao;
import cn.edu.xmu.dao.ProductDao;
import cn.edu.xmu.entity.Product;
import cn.edu.xmu.util.Common;

public class ProductDaoImpl implements ProductDao {


	/**
	 * @Fields dao : dao组件
	 */
	@Resource(name = "DAOProxy")
	BaseDao dao;

	/*
	  * Title: getAllProduct
	  * Description:
	  * @param pro
	  * @return
	  * @see cn.edu.xmu.dao.ProductDao#getAllProduct(java.util.List)
	  */
	@Override
	public List<Product> getAllProduct(List<String> pro) {
		// TODO Auto-generated method stub
		List<Product> productList = new ArrayList<Product>();
		if(pro.size() == 0){
			productList = dao.query(Common.HQL_PRODUCTLIST);
		}else{
			productList = dao.query(Common.HQL_PRODUCTLIST_SELECT,pro);
		}
		return productList;
	}

	/*
	  * Title: getAllProduct
	  * Description:
	  * @param pro
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.dao.ProductDao#getAllProduct(java.util.List, int, int)
	  */
	@Override
	public List<Product> getAllProduct(List<String> pro, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Product> productList = new ArrayList<Product>();
		if(pro.size() == 0){
			productList = dao.query(Common.HQL_PRODUCTLIST,pageNo,pageSize);
		}else{
			productList = dao.query(Common.HQL_PRODUCTLIST_SELECT,pro,pageNo,pageSize);
		}
		return productList;
	}

	/*
	  * Title: getProductByname
	  * Description:
	  * @param pro
	  * @return
	  * @see cn.edu.xmu.dao.ProductDao#getProductByname(java.util.List)
	  */
	@Override
	public List<Product> getProductByname(List<String> pro) {
		// TODO Auto-generated method stub
		return dao.query(Common.HQL_MALL_PNAME,pro);
	}


	
	/*
	  * Title: countProduct
	  * Description:
	  * @param pro
	  * @return
	  * @see cn.edu.xmu.dao.ProductDao#countProduct(java.util.List)
	  */
	@Override
	public int countProduct(List<String> pro) {
		// TODO Auto-generated method stub
		int count = this.getAllProduct(pro).size();
		return count;
	}

	/*
	  * Title: saveProduct
	  * Description:
	  * @param product
	  * @see cn.edu.xmu.dao.ProductDao#saveProduct(cn.edu.xmu.entity.Product)
	  */
	@Override
	public void saveProduct(Product product) {
		// TODO Auto-generated method stub
		dao.saveOrUpdate(product);
	}

	/*
	  * Title: deleteProductById
	  * Description:
	  * @param id
	  * @see cn.edu.xmu.dao.ProductDao#deleteProductById(int)
	  */
	@Override
	public void deleteProductById(int id) {
		// TODO Auto-generated method stub
		dao.delById(Product.class, id);
	}

	/*
	  * Title: getProductById
	  * Description:
	  * @param id
	  * @return
	  * @see cn.edu.xmu.dao.ProductDao#getProductById(int)
	  */
	@Override
	public Product getProductById(int id) {
		// TODO Auto-generated method stub
		return (Product) dao.loadById(Product.class, id);
	}

	@Override
	public List<Product> getProductByIng(List<Integer> pro,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		return dao.query(Common.HQL_PRODUCTLIST_ING,pro,pageNo,pageSize);
	}

	@Override
	public List<Product> getProductByNotIng(List<Integer> pro, int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		return dao.query(Common.HQL_PRODUCTLIST_NOTING,pro,pageNo,pageSize);
	}

	@Override
	public int countProductByIng(List<Integer> pro) {
		// TODO Auto-generated method stub
		return dao.query(Common.HQL_PRODUCTLIST_ING,pro).size();
	}

	@Override
	public int countProductByNotIng(List<Integer> pro) {
		// TODO Auto-generated method stub
		return dao.query(Common.HQL_PRODUCTLIST_NOTING,pro).size();
	}

	
	
}
