/**
 * @Title: OrderServiceImpl.java
 * @Package cn.edu.xmu.serviceImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月8日 下午7:17:09
 * @version V1.0
 */

package cn.edu.xmu.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.OrderDao;
import cn.edu.xmu.entity.Order;
import cn.edu.xmu.service.OrderService;
import cn.edu.xmu.util.DateHandler;
import cn.edu.xmu.util.DateUtil;
import cn.edu.xmu.util.WebTool;

/**
 * @ClassName: OrderServiceImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月8日 下午7:17:09
 */

public class OrderServiceImpl implements OrderService {

	
	/**
     * @Fields dao : dao组件
     */
   @Resource(name="orderdao")
    OrderDao dao ;


	@Override
	public List<Order> getProList(List<String> pro,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		List<Order> orderList = new ArrayList<Order>();
		orderList = dao.getOrderList(0,pro,pageNo,pageSize);
		return orderList;
	}
	
	/*
	  * Title: getAdList
	  * Description:
	  * @param pro
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.service.OrderService#getAdList(java.util.List, int, int)
	  */
	@Override
	public List<Order> getDemList(List<String> pro,int pageNo,int pageSize) {
		List<Order> orderList = new ArrayList<Order>();
		orderList = dao.getOrderList(1,pro,pageNo,pageSize);
		return orderList;
	}
		
	@Override
	public int getProCount(List<String> pro) {
		// TODO Auto-generated method stub
		int count = 0;
		count = dao.countOrder(0,pro);
		return count;
	}
	
	@Override
	public int getDemCount(List<String> pro) {
		// TODO Auto-generated method stub
		int count = 0;
		count = dao.countOrder(1,pro);
		return count;
	}
	
	@Override
	public int getForProCount(int pid) {
		// TODO Auto-generated method stub
		int count = 0;
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(pid);
		pro.add(0);
		count = dao.getOrderList(pro).size();
		return count;
	}

	@Override
	public int getForDemCount(int pid) {
		// TODO Auto-generated method stub
		int count = 0;
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(pid);
		pro.add(1);
		count = dao.getOrderList(pro).size();
		return count;
	}
	

	@Override
	public void saveOrder(Order order) {
		// TODO Auto-generated method stub
		dao.saveOrder(order);
	}

	@Override
	public Order getOrderById(int id) {
		// TODO Auto-generated method stub
		return dao.getOrderById(id);
	}

	@Override
	public void deleteOrderById(int id) {
		// TODO Auto-generated method stub
		dao.deleteOrderById(id);
	}

	@Override
	public List<Order> getForProList(int pid,int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(pid);
		pro.add(0);
		return dao.getOrderList(pro, pageNo, pageSize);
	}

	@Override
	public List<Order> getForDemList(int pid,int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(pid);
		pro.add(1);
		return dao.getOrderList(pro, pageNo, pageSize);
	}

	@Override
	public List<Order> getForIngDemList(int pid, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(pid);
		pro.add(1);
		return dao.getOrderIngList(pro, pageNo, pageSize);
	}

	@Override
	public int getForIngDemCount(int pid) {
		// TODO Auto-generated method stub
		List<Integer> pro = new ArrayList<Integer>();
		int count = 0;
		pro.add(pid);
		pro.add(1);
		count = dao.getOrderIngList(pro).size();
		return count;
	}

	
}
