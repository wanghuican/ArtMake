package cn.edu.xmu.backstage.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;

import cn.edu.xmu.entity.Order;
import cn.edu.xmu.service.OrderService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;


/**
  * @ClassName: OrderAction
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月26日 上午2:15:55
  */
public class OrderAction extends ActionSupport{

	/**
	 * @Fields orderService : 业务逻辑组件
	 */
	@Resource(name = "orderService")
	OrderService orderService;

	private List<Order> orderList;
	
	private int id;
	
	private Order order;

	private String result;

	private List<String> time;
	
	private List<String> selectpro;
	
	private List<Integer> countList;
	/**
	 * getter method
	 * @return the orderService
	 */
	public OrderService getOrderService() {
		return orderService;
	}

	/**
	 * setter method
	 * @param orderService the orderService to set
	 */
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	/**
	 * getter method
	 * @return the orderList
	 */
	
	public List<Order> getOrderList() {
		return orderList;
	}

	/**
	 * setter method
	 * @param orderList the orderList to set
	 */
	
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
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
	 * @return the time
	 */
	
	public List<String> getTime() {
		return time;
	}

	/**
	 * setter method
	 * @param time the time to set
	 */
	
	public void setTime(List<String> time) {
		this.time = time;
	}

	/**
	 * getter method
	 * @return the order
	 */
	
	public Order getOrder() {
		return order;
	}

	/**
	 * setter method
	 * @param order the order to set
	 */
	
	public void setOrder(Order order) {
		this.order = order;
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
	 * @return the countList
	 */
	
	public List<Integer> getCountList() {
		return countList;
	}

	/**
	 * setter method
	 * @param countList the countList to set
	 */
	
	public void setCountList(List<Integer> countList) {
		this.countList = countList;
	}


	/**
	  * MethidName: goPro
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: goPro
	  * @Description: TODO
	  * @param @return
	  * @param @throws Exception    设定文件
	  * @return String    返回类型
	  * @throws
	  */
	public String goPro() throws Exception {
		// 登录前清空所有session	
		if(getSelectpro() != null){
			setSelectpro(getSelectpro());
			selectpro = WebTool.dealStrProList(selectpro);
			WebTool.printList(selectpro);
		}else{
			selectpro = new ArrayList<String>();
		}
		int page = 1;
		int count = orderService.getProCount(selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setOrderList(orderService.getProList(selectpro,page,Common.BACKSTAGE_PAGESIZE));
		return "pro";
	}
	
	public void deleteInfo() throws IOException{
		Order order = orderService.getOrderById(getId());
		int type = order.getType();
		orderService.deleteOrderById(getId());
		if(type == 0)
	    	WebTool.alertMessage("删除订单成功", "orderManage!goPro");
		else
			WebTool.alertMessage("删除订单成功", "orderManage!goDem");
	}
	
	
	public void ndelInfo() throws IOException{
		String[] aids = WebTool.getNids();
		Order order = orderService.getOrderById(Integer.parseInt(aids[0]));
		int type = order.getType();
		for(String aid:aids){
			orderService.deleteOrderById(Integer.parseInt(aid));
	    	System.out.print(aid);	
		}
		if(type == 0)
	    	WebTool.alertMessage("删除订单成功", "orderManage!goPro");
		else
			WebTool.alertMessage("删除订单成功", "orderManage!goDem");
	}
	 
	
	public String goDem(){
		if(getSelectpro() != null){
			setSelectpro(getSelectpro());
			selectpro = WebTool.dealStrProList(selectpro);
			//WebTool.printList(selectpro);
		}else{
			selectpro = new ArrayList<String>();
		}
		int page = 1;
		int count = orderService.getDemCount(selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setOrderList(orderService.getDemList(selectpro,page,Common.BACKSTAGE_PAGESIZE));
		return "dem";
	}	
	

}
