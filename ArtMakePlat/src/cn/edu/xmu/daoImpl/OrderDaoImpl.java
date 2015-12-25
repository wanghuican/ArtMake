package cn.edu.xmu.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.OrderDao;
import cn.edu.xmu.dao.BaseDao;
import cn.edu.xmu.entity.Order;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.DateHandler;
import cn.edu.xmu.util.WebTool;

/**
  * @ClassName: OrderDaoImpl
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月26日 上午1:58:25
  */
public class OrderDaoImpl implements OrderDao {

	/**
	 * @Fields dao : dao组件
	 */
	@Resource(name = "DAOProxy")
	BaseDao dao;


	/*
	 * Title: getOrderList Description:
	 * 
	 * @return
	 * 
	 * @see cn.edu.xmu.dao.OrderDao#getOrderList()
	 */

	@Override
	public List<Order> getOrderList(int type, List<String> pro) {
		// TODO Auto-generated method stub
		List<Order> orderList = new ArrayList<Order>();
		if (pro.size() == 0) {
			pro.add(type + "");
			orderList = dao.query(Common.HQL_ORDERLIST, pro);
			pro.remove(pro.size() - 1);
		} else {
			pro.add(type + "");
			if(type == 0)
		    	orderList = dao.query(Common.HQL_PROORDERLIST_SELECT, pro);
			else
				orderList = dao.query(Common.HQL_DEMORDERLIST_SELECT, pro);
			pro.remove(pro.size() - 1);
		}
		return orderList;
	}

	/*
	 * Title: getOrderList Description:
	 * 
	 * @param type
	 * 
	 * @param pageNo
	 * 
	 * @param pageSize
	 * 
	 * @return
	 * 
	 * @see cn.edu.xmu.dao.OrderDao#getOrderList(int, int, int)
	 */
	@Override
	public List<Order> getOrderList(int type,List<String> pro, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Order> orderList = new ArrayList<Order>();
		if (pro.size() == 0) {
			pro.add(type + "");
			orderList = dao.query(Common.HQL_ORDERLIST, pro, pageNo,
					pageSize);
			pro.remove(pro.size() - 1);
		} else {
			pro.add(type + "");
			if(type == 0)
	     		orderList = dao.query(Common.HQL_PROORDERLIST_SELECT, pro, pageNo,
		    			pageSize);
			else
				orderList = dao.query(Common.HQL_DEMORDERLIST_SELECT, pro, pageNo,
		    			pageSize);
			pro.remove(pro.size() - 1);
		}
		return orderList;
	}


	
	/*
	 * Title: countOrder Description:
	 * 
	 * @param type
	 * 
	 * @return
	 * 
	 * @see cn.edu.xmu.dao.OrderDao#countOrder(int)
	 */
	@Override
	public int countOrder(int type, List<String> pro) {
		// TODO Auto-generated method stub
		int count = getOrderList(type, pro).size();
		return count;
	}
	

	/*
	 * Title: saveOrder Description:
	 * 
	 * @param order
	 * 
	 * @see cn.edu.xmu.dao.OrderDao#saveOrder(cn.edu.xmu.entity.Order)
	 */
	public void saveOrder(Order order) {
		dao.saveOrUpdate(order);
	}

	@Override
	public Order getOrderById(int id) {
		// TODO Auto-generated method stub
		return (Order) dao.loadById(Order.class, id);
	}

	@Override
	public void deleteOrderById(int id) {
		// TODO Auto-generated method stub
		dao.delById(Order.class, id);
	}

}
