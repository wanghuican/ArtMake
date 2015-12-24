package cn.edu.xmu.backstage.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import cn.edu.xmu.entity.Demand;
import cn.edu.xmu.service.DemandService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

public class DemandAction extends ActionSupport {

	/**
	 * @Fields personService
	 */
	@Resource(name = "demandService")
	DemandService demandService;
	private List<Demand> demandList;
	
	private List<String> selectpro;
	
	private Demand demand;
	
	private int id;
	
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
	 * @return the demandList
	 */
	
	public List<Demand> getDemandList() {
		return demandList;
	}

	/**
	 * setter method
	 * @param demandList the demandList to set
	 */
	
	public void setDemandList(List<Demand> demandList) {
		this.demandList = demandList;
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
	 * setter method
	 * @param demand the demand to set
	 */
	
	public void setDemand(Demand demand) {
		this.demand = demand;
	}

	public String execute() throws Exception {
		if(getSelectpro() != null){
			setSelectpro(getSelectpro());
			selectpro = WebTool.dealStrProList(selectpro);
			//WebTool.printList(selectpro);
		}else{
			selectpro = new ArrayList<String>();
		}
		int page = 1;
		int count = demandService.countDemand(selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setDemandList(demandService.getAllDemand(selectpro, page, Common.BACKSTAGE_PAGESIZE));
		return INPUT;
	}
	
	public void delDemand() throws IOException{
		demandService.deleteDemandById(getId());
	    WebTool.alertMessage("删除定制服务成功", "demandManage");
	}
	
	public void ndelDemand()throws IOException{
		String[] rids = WebTool.getNids();
		for(String rid:rids){
			System.out.print(rid);
			demandService.deleteDemandById(Integer.parseInt(rid));
		}
		WebTool.alertMessage("删除定制服务成功", "demandManage");
	}
	
	public String changedemPass() throws IOException{
		Demand demand = demandService.getDemandById(getId());
		demand.setPass(1);
		demandService.saveDemand(demand);
		String[] message = new String[2];
		message[0] = "取消通过成功";
		message[1] = "通过成功";
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("message", message[demand.getPass()]);
		map.put("pass", demand.getPass());
		map.put("id", getId());
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		//System.out.print(result);
		return SUCCESS;
	}
	
	public String nchangedemPass(){
		String[] aids = WebTool.getNids();
		for(String aid:aids){
			Demand demand = demandService.getDemandById(Integer.parseInt(aid));
			demand.setPass(1);
			demandService.saveDemand(demand);
		}
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("message", "通过成功");
		map.put("aids", aids);
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		//System.out.println(result);
		return SUCCESS;
	}
	
}
