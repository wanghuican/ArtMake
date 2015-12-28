/**
 * @Title: OrderDao.java
 * @Package cn.edu.xmu.dao
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月8日 下午7:06:34
 * @version V1.0
 */

package cn.edu.xmu.dao;

import java.util.List;

import cn.edu.xmu.entity.Order;


/**
  * @ClassName: OrderDao
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月26日 上午1:57:08
  */
public interface OrderDao {

	public List<Order> getOrderList(int type,List<String> pro);
	
	public List<Order> getOrderList(int type,List<String> pro, int pageNo, int pageSize);
	
	public List<Order> getOrderList(List<Integer> pro);
	
	public List<Order> getOrderList(List<Integer> pro, int pageNo, int pageSize);
	
	public List<Order> getOrderIngList(List<Integer> pro);
	
	public List<Order> getOrderIngList(List<Integer> pro, int pageNo, int pageSize);
	
	public int countOrder(int type,List<String> pro);
	
	public void saveOrder(Order order);
	
	public Order getOrderById(int id);
	
	public void deleteOrderById(int id);
}
