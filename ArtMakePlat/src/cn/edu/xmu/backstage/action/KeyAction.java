package cn.edu.xmu.backstage.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.Key;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.service.KeyService;
import cn.edu.xmu.service.RoleService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class KeyAction extends ActionSupport {

	/**
	 * @Fields keyService
	 */
	@Resource(name = "keyService")	
	KeyService keyService;
	
	
	private List<Key> keyList;
	
	private List<Integer> selectpro;
	
	private Key key;
	
	private int id;
	
	/**
	 * getter method
	 * @return the KeyService
	 */
	
	public KeyService getKeyService() {
		return keyService;
	}

	/**
	 * setter method
	 * @param KeyService the KeyService to set
	 */
	
	public void setKeyService(KeyService keyService) {
		this.keyService = keyService;
	}

	/**
	 * getter method
	 * @return the KeyList
	 */
	
	public List<Key> getKeyList() {
		return keyList;
	}

	/**
	 * setter method
	 * @param KeyList the KeyList to set
	 */
	
	public void setKeyList(List<Key> keyList) {
		this.keyList = keyList;
	}

	
	
	/**
	 * getter method
	 * @return the selectpro
	 */
	
	public List<Integer> getSelectpro() {
		return selectpro;
	}

	/**
	 * setter method
	 * @param selectpro the selectpro to set
	 */
	
	public void setSelectpro(List<Integer> selectpro) {
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
	 * @return the Key
	 */
	
	public Key getKey() {
		return key;
	}

	/**
	 * setter method
	 * @param Key the Key to set
	 */
	
	public void setKey(Key key) {
		this.key = key;
	}
	

	public String execute() throws Exception {
		if(getSelectpro() != null){
			setSelectpro(getSelectpro());
			selectpro = WebTool.dealIntProList(selectpro);
			//WebTool.printList(selectpro);
		}else{
			selectpro = new ArrayList<Integer>();
		}
		int page = 1;
		int count = keyService.countKey(selectpro);
		page = WebTool.dealPage(count,page,Common.BACKSTAGE_PAGESIZE);
		setKeyList(keyService.getAllKey(selectpro, page, Common.BACKSTAGE_PAGESIZE));
	    return INPUT;
	}
	
	public void delKey() throws IOException{
		keyService.deleteKeyById(getId());
	    WebTool.alertMessage("删除关键词成功", "keyManage");
	}
	
	public void ndelKey()throws IOException{
		String[] aids = WebTool.getNids();
		for(String aid:aids){
			keyService.deleteKeyById(Integer.parseInt(aid));
		}
		WebTool.alertMessage("删除关键词成功", "keyManage");
	}
	
	public String goEdit(){
		System.out.print(getId());
		if(getId() != 0){
			setKey(keyService.getKeyById(getId()));
		}
		return "edit";
	}
	
	public String saveKey() throws IOException{
		if(getId() != 0){
			getKey().setKey_id(id);
		}
		keyService.saveKey(key);
		WebTool.alertMessage("保存成功","keyManage!goEdit?id=" + getId());
		return null;
	}

	
}
