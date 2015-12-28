/**
 * @Title: OrderService.java
 * @Package cn.edu.xmu.service
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月8日 下午7:14:00
 * @version V1.0
 */

package cn.edu.xmu.service;

import java.util.List;

import cn.edu.xmu.entity.Order;

/**
 * @ClassName: OrderService
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月8日 下午7:14:00
 */

public interface OrderService {
	
	public List<Order> getProList(List<String> pro,int pageNo,int pageSize);
	
	public List<Order> getDemList(List<String> pro,int pageNo,int pageSize);
	
	public List<Order> getForProList(int pid,int pageNo,int pageSize);
	
	public List<Order> getForDemList(int pid,int pageNo,int pageSize);
	
	public List<Order> getForIngDemList(int pid,int pageNo,int pageSize);
	
	public int getForProCount(int pid);
	
	public int getForDemCount(int pid);
	
	public int getForIngDemCount(int pid);
	
	public int getProCount(List<String> pro);
	
	public int getDemCount(List<String> pro);
	
	public void saveOrder(Order order);

	public Order getOrderById(int id);
	
	public void deleteOrderById(int id);

}
