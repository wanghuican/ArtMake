package cn.edu.xmu.backstage.action;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import cn.edu.xmu.entity.ProAction;
import cn.edu.xmu.service.ProActionService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

public class ProActionAction extends ActionSupport {

	/**
	 * @Fields personService
	 */
	@Resource(name = "proActionService")
	ProActionService proActionService;
	private List<ProAction> proActionList;
	
	private List<String> selectpro;
	
	private ProAction proAction;
	
	private int id;
	
	private Timestamp nowDate;
	
	private String result;
	/**
	 * getter method
	 * @return the proActionService
	 */
	
	public ProActionService getProActionService() {
		return proActionService;
	}

	/**
	 * setter method
	 * @param proActionService the proActionService to set
	 */
	
	public void setProActionService(ProActionService proActionService) {
		this.proActionService = proActionService;
	}

	/**
	 * getter method
	 * @return the proActionList
	 */
	
	public List<ProAction> getProActionList() {
		return proActionList;
	}

	/**
	 * setter method
	 * @param proActionList the proActionList to set
	 */
	
	public void setProActionList(List<ProAction> proActionList) {
		this.proActionList = proActionList;
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
	 * @return the proAction
	 */
	
	public ProAction getProAction() {
		return proAction;
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
	 * @param proAction the proAction to set
	 */
	
	public void setProAction(ProAction proAction) {
		this.proAction = proAction;
	}
	
	

	/**
	 * getter method
	 * @return the nowDate
	 */
	
	public Timestamp getNowDate() {
		return nowDate;
	}

	/**
	 * setter method
	 * @param nowDate the nowDate to set
	 */
	
	public void setNowDate(Timestamp nowDate) {
		this.nowDate = nowDate;
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
		int count = proActionService.countProAction(selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setProActionList(proActionService.getAllProAction(selectpro, page, Common.BACKSTAGE_PAGESIZE));
		setNowDate(new Timestamp(new Date().getTime()));
		return INPUT;
	}
	
	public void delProAction() throws IOException{
		proActionService.deleteProActionById(getId());
	    WebTool.alertMessage("删除竞拍成功", "proActionManage");
	}
	
	public void ndelProAction()throws IOException{
		String[] rids = WebTool.getNids();
		for(String rid:rids){
			System.out.print(rid);
			proActionService.deleteProActionById(Integer.parseInt(rid));
		}
		WebTool.alertMessage("删除竞拍成功", "proActionManage");
	}
	
}
