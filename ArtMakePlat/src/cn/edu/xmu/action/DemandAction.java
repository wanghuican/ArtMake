/**
 * @Title: DemandAction.java
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
import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Auth;
import cn.edu.xmu.entity.DemRecord;
import cn.edu.xmu.entity.Key;
import cn.edu.xmu.entity.Order;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.ProAction;
import cn.edu.xmu.entity.Demand;
import cn.edu.xmu.entity.Demand;
import cn.edu.xmu.entity.Product;
import cn.edu.xmu.entity.ProRecord;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.AuthService;
import cn.edu.xmu.service.KeyService;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.service.ProActionService;
import cn.edu.xmu.service.DemandService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: DemandAction
 * @Description: TODO team: 3-10打屁屁小队
 * @date 2015年12月14日 下午10:06:51
 */

public class DemandAction extends ActionSupport {
	/**
	 * @Fields loginService : 登录业务逻辑组件
	 */
	@Resource(name = "demandService")
	DemandService demandService;

	/**
	  * @Fields personService : TODO（用一句话描述这个变量表示什么）
	  */
	@Resource(name = "personService")
	PersonService personService;
	/**
	 * @Fields keyService : 登录业务逻辑组件
	 */
	@Resource(name = "keyService")
	KeyService keyService;
	
	private int id;
	
	private Demand demand;
	
	private List<Key> keyList;
	
	private String result;
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



	/**
	 * getter method
	 * @return the keyService
	 */
	
	public KeyService getKeyService() {
		return keyService;
	}



	/**
	 * setter method
	 * @param keyService the keyService to set
	 */
	
	public void setKeyService(KeyService keyService) {
		this.keyService = keyService;
	}



	/**
	 * getter method
	 * @return the keyList
	 */
	
	public List<Key> getKeyList() {
		return keyList;
	}



	/**
	 * setter method
	 * @param keyList the keyList to set
	 */
	
	public void setKeyList(List<Key> keyList) {
		this.keyList = keyList;
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

	@Override
	public String execute() throws Exception {
		setKeyList(keyService.getAllKey(new ArrayList<Integer>()));
		return SUCCESS;
	}
	
	public String toDemandList() {
		String keyname = WebTool.getRequest().getParameter("keyname");
		String note = WebTool.getRequest().getParameter("note");
		keyname = keyname == null ? "" : keyname;
		note = note == null ? "" : note;
		List<String> pro = new ArrayList<String>();
		pro.add(keyname);
		pro.add(note);
		pro.add(note);
		pro = WebTool.dealStrProList(pro);
		List<Demand> demandList = demandService.getDemandList(pro);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", WebTool.listToJsonStr(demandList));
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}

	public String toDemandIngList() {
		Person person = new Person();
		if (getId() == 0) {
			person = WebTool.getSessionPerson();
			setId(person.getPerson_id());
		}else{
			person = personService.getPersonById(getId());
		}
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(getId());
		int count = demandService.countForDemand(person);
		int page = 0;
		page = WebTool.dealPage(count, page, Common.PAGESIZE-1, "PAGENOTING");
		List<Demand> DemandIngList = demandService.getForDemandList(person,
				page, Common.PAGESIZE-1);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("rows", WebTool.listToJsonStr(DemandIngList));
		map.put("size", count);
		map.put("imagesrc", Common.PRODUCT_SRC);
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	public String goEditDemand() {	
		if (getId() != 0) {
			Demand demand = demandService.getDemandById(getId());
			setDemand(demand);
			if (demand.getPerson().getPerson_id() != WebTool
					.getSessionPerson().getPerson_id()) {
				return "detail";
			}
		}
		setKeyList(keyService.getAllKey(new ArrayList<Integer>()));
		return "edit";
	}
	

	public String uploadDemand() throws IOException{
		String key_id = WebTool.getRequest().getParameter("keys");
		Demand demand = new Demand();
		if(getId() != 0){
			demand = demandService.getDemandById(getId());
		}else{
			demand.setPass(0);
			demand.setState(1);
			demand.setPerson(WebTool.getSessionPerson());
			demand.setUptime(new Date());
		}
		demand.setIntroduce(WebTool.getRequest().getParameter("introduce"));
		demand.setPrice(Double.parseDouble(WebTool.getRequest().getParameter("price")));
		if(!WebTool.StringisNullOrEmpty(key_id))
	    	demand.setKey(keyService.getKeyById(Integer.parseInt(key_id)));
		demandService.saveDemand(demand);
		if(getId() != 0){
			WebTool.alertMessage("保存成功", "person!goInfo");
		}else{
	    	WebTool.confirmMessage("继续上传需求？", "demand!goEditDemand",
		    		"person!goInfo");
		}
		return null;
	}
	public String delDemand() throws IOException {
		demandService.deleteDemandById(getId());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", "删除服务成功");
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}
	
	public String goPutDemand() {
		Demand demand = demandService.getDemandById(getId());
		setDemand(demand);
		return "put";
	}
	
	public String createRecord() throws IOException{
		DemRecord dr = new DemRecord();
		dr.setDemand(demandService.getDemandById(getId()));
		dr.setPerson(WebTool.getSessionPerson());
		dr.setMessage(WebTool.getRequest().getParameter("message"));
		dr.setRecordtime(new Date());
		demandService.saveDemRecord(dr);
		WebTool.alertMessage("申请成功", "demand!goEditDemand?id="+getId());
		return null;
	}
}
