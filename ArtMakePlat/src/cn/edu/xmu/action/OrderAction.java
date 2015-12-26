/**
 * @Title: ProductAction.java
 * @Package cn.edu.xmu.action
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月14日 下午10:06:51
 * @version V1.0
 */

package cn.edu.xmu.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import cn.edu.xmu.entity.Auth;
import cn.edu.xmu.entity.Demand;
import cn.edu.xmu.entity.Order;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.ProAction;
import cn.edu.xmu.entity.Product;
import cn.edu.xmu.entity.Prorecord;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.AuthService;
import cn.edu.xmu.service.DemandService;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.service.OrderService;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.service.ProActionService;
import cn.edu.xmu.service.ProductService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: ProductAction
 * @Description: TODO team: 3-10打屁屁小队
 * @date 2015年12月14日 下午10:06:51
 */

public class OrderAction extends ActionSupport {
	/**
	 * @Fields loginService : 登录业务逻辑组件
	 */
	@Resource(name = "orderService")
	OrderService orderService;

	@Resource(name = "personService")
	PersonService personService;
	
	@Resource(name = "demandService")
	DemandService demandService;
	
	private Product product;

	private String result;

	private Demand demand;
	
	private Order order;
	
	private int id;


	/**
	 * getter method
	 * 
	 * @return the result
	 */

	public String getResult() {
		return result;
	}

	/**
	 * setter method
	 * 
	 * @param result
	 *            the result to set
	 */

	public void setResult(String result) {
		this.result = result;
	}

	/**
	 * getter method
	 * 
	 * @return the product
	 */

	public Product getProduct() {
		return product;
	}

	/**
	 * setter method
	 * 
	 * @param product
	 *            the product to set
	 */

	public void setProduct(Product product) {
		this.product = product;
	}

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
	 * @return the personService
	 */
	
	public PersonService getPersonService() {
		return personService;
	}

	/**
	 * setter method
	 * @param personService the personService to set
	 */
	
	public void setPersonService(PersonService personService) {
		this.personService = personService;
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
	 * @return the demandService
	 */
	
	public DemandService getDemandService() {
		return demandService;
	}

	/**
	 * setter method
	 * @param demandService the demandService to set
	 */
	
	public void setDemandService(DemandService demandService) {
		this.demandService = demandService;
	}

	/**
	 * getter method
	 * @return the demand
	 */
	
	public Demand getDemand() {
		return demand;
	}

	/**
	 * setter method
	 * @param demand the demand to set
	 */
	
	public void setDemand(Demand demand) {
		this.demand = demand;
	}

	public String toProOrderList() {
		Person person = new Person();
		if (getId() == 0) {
		    person = WebTool.getSessionPerson();
			setId(person.getPerson_id());
		}else{
		    person = personService.getPersonById(getId());
		}
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(getId());
		int count = orderService.getForProCount(getId());
		int page = 0;
		page = WebTool.dealPage(count, page, Common.PAGESIZE, "PAGEOING");
		List<Order> orderList = orderService.getForProList(getId(),
				page, Common.PAGESIZE);
		List<Product> productList = new ArrayList<Product>();
		for(int i=0;i<orderList.size();i++){
			productList.add(orderList.get(i).getProduct());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("orows", WebTool.listToJsonStr(orderList));
		map.put("rows", WebTool.listToJsonStr(productList));
		map.put("size", count);
		map.put("imagesrc", Common.PRODUCT_SRC);
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	public String toDemOrderList() {
		Person person = new Person();
		if (getId() == 0) {
		    person = WebTool.getSessionPerson();
			setId(person.getPerson_id());
		}else{
		    person = personService.getPersonById(getId());
		}
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(getId());
		int count = orderService.getForDemCount(getId());
		int page = 0;
		page = WebTool.dealPage(count, page, Common.PAGESIZE, "PAGEDOING");
		List<Order> orderList = orderService.getForDemList(getId(),
				page, Common.PAGESIZE);
		List<Demand> demandList = new ArrayList<Demand>();
		for(int i=0;i<orderList.size();i++){
			demandList.add(orderList.get(i).getDemand());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("orows", WebTool.listToJsonStr(orderList));
		map.put("rows", WebTool.listToJsonStr(demandList));
		map.put("size", count);
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	public String toDemIngOrderList() {
		Person person = new Person();
		if (getId() == 0) {
		    person = WebTool.getSessionPerson();
			setId(person.getPerson_id());
		}else{
		    person = personService.getPersonById(getId());
		}
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(getId());
		int count = orderService.getForIngDemCount(getId());
		int page = 0;
		page = WebTool.dealPage(count, page, Common.PAGESIZE, "PAGEDOING");
		List<Order> orderList = orderService.getForIngDemList(getId(),
				page, Common.PAGESIZE);
		List<Demand> demandList = new ArrayList<Demand>();
		for(int i=0;i<orderList.size();i++){
			demandList.add(orderList.get(i).getDemand());
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("orows", WebTool.listToJsonStr(orderList));
		map.put("rows", WebTool.listToJsonStr(demandList));
		map.put("size", count);
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	public String delOrder() throws IOException {
		orderService.deleteOrderById(getId());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", "删除订单成功");
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	public String payOrder() throws IOException{
		Order order = orderService.getOrderById(getId());
		if(order.getProduct() != null){
			order.getProduct().setState(-1);
			order.setState(1);
		}else{
			order.getDemand().setState(-1);
			order.setState(1);
		}
		orderService.saveOrder(order);
		WebTool.alertMessage("支付成功", "person!goInfo");
		return null;
	}
	
	public String putdemand() throws IOException{
		Order order = new Order();
		order.setBuytime(new Date());
		order.setDemand(demandService.getDemandById(getId()));
		order.setPerson(personService.getPersonById(Integer.parseInt(WebTool.getRequest().getParameter("pid"))));
	    order.setState(0);
	    order.setType(1);
	    order.getDemand().setState(0);
	    orderService.saveOrder(order);
	    WebTool.alertMessage("委任成功", "person!goInfo");
	    return null;
	}
	
	public String goDoingEditDemand(){
			Order order = orderService.getOrderById(getId());
			Demand demand = order.getDemand();
			setDemand(demand);
			setOrder(order);
			return "detail";
	}	
}
