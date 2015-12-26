/**
 * @Title: PersonAction.java
 * @Package cn.edu.xmu.action
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月14日 下午10:06:51
 * @version V1.0
 */

package cn.edu.xmu.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import cn.edu.xmu.entity.Auth;
import cn.edu.xmu.entity.Key;
import cn.edu.xmu.entity.Perkey;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.Role;
import cn.edu.xmu.service.AuthService;
import cn.edu.xmu.service.DemandService;
import cn.edu.xmu.service.KeyService;
import cn.edu.xmu.service.LoginService;
import cn.edu.xmu.service.OrderService;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.service.ProActionService;
import cn.edu.xmu.service.ProductService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @ClassName: PersonAction
 * @Description: TODO team: 3-10打屁屁小队
 * @date 2015年12月14日 下午10:06:51
 */

public class PersonAction extends ActionSupport {
	/**
	 * @Fields loginService : 登录业务逻辑组件
	 */
	@Resource(name = "personService")
	PersonService personService;
	
	/**
	 * @Fields loginService : 登录业务逻辑组件
	 */
	@Resource(name = "orderService")
	OrderService orderService;
	
	/**
	 * @Fields authService
	 */
	@Resource(name = "authService")
	AuthService authService;

	/**
	 * @Fields authService
	 */
	@Resource(name = "proActionService")
	ProActionService proActionService;
	
	/**
	 * @Fields keyService : 登录业务逻辑组件
	 */
	@Resource(name = "keyService")
	KeyService keyService;

	/**
	 * @Fields productService : 登录业务逻辑组件
	 */
	@Resource(name = "productService")
	ProductService productService;

	/**
	  * @Fields demandService : TODO（用一句话描述这个变量表示什么）
	  */
	@Resource(name = "demandService")
	DemandService demandService;
	
	private List<Key> keyList;

	private Person person;

	private Auth auth;
	
	private String result;

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
	 * 
	 * @return the person
	 */

	public Person getPerson() {
		return person;
	}

	/**
	 * setter method
	 * 
	 * @param person
	 *            the person to set
	 */

	public void setPerson(Person person) {
		this.person = person;
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
	 * 
	 * @return the personService
	 */

	public PersonService getPersonService() {
		return personService;
	}

	/**
	 * getter method
	 * 
	 * @return the id
	 */

	public int getId() {
		return id;
	}

	/**
	 * setter method
	 * 
	 * @param id
	 *            the id to set
	 */

	public void setId(int id) {
		this.id = id;
	}

	
	/**
	 * getter method
	 * @return the auth
	 */
	
	public Auth getAuth() {
		return auth;
	}

	/**
	 * setter method
	 * @param auth the auth to set
	 */
	
	public void setAuth(Auth auth) {
		this.auth = auth;
	}

	/**
	 * getter method
	 * 
	 * @return the keyService
	 */

	public KeyService getKeyService() {
		return keyService;
	}

	/**
	 * setter method
	 * 
	 * @param keyService
	 *            the keyService to set
	 */

	public void setKeyService(KeyService keyService) {
		this.keyService = keyService;
	}

	/**
	 * getter method
	 * 
	 * @return the productService
	 */

	public ProductService getProductService() {
		return productService;
	}

	/**
	 * setter method
	 * 
	 * @param productService
	 *            the productService to set
	 */

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	/**
	 * getter method
	 * 
	 * @return the keyList
	 */

	public List<Key> getKeyList() {
		return keyList;
	}

	/**
	 * setter method
	 * 
	 * @param keyList
	 *            the keyList to set
	 */

	public void setKeyList(List<Key> keyList) {
		this.keyList = keyList;
	}

	/**
	 * setter method
	 * 
	 * @param personService
	 *            the personService to set
	 */

	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}
	
	

	/**
	 * getter method
	 * @return the authService
	 */
	
	public AuthService getAuthService() {
		return authService;
	}

	/**
	 * setter method
	 * @param authService the authService to set
	 */
	
	public void setAuthService(AuthService authService) {
		this.authService = authService;
	}

	public String checkAccount() {
		String account = WebTool.getRequest().getParameter("account");
		Person person = personService.checkAccount(account);
		if (person == null) {
			person = new Person();
		}
		result = person.toJsonString();
		// WebTool.printOb(result);
		return SUCCESS;
	}

	public String goInfo() {
		if (getId() == 0) {
			Person person = WebTool.getSessionPerson();
			setId(person.getPerson_id());
		}
		setPerson(personService.getPersonById(getId()));
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(getId());
		if (person.getRole().getRole_code() != Common.CODE_ARTIST) {
			int counting = proActionService.countProductPerson(getPerson());
			int countoing = orderService.getForProCount(getId());
			int countdoing = orderService.getForIngDemCount(getId());
			int countnoting = demandService.countForDemand(getPerson());
			int pageing = 0, pageoing = 0,pagenoting = 0,pagedoing = 0;
			pageing = WebTool.dealPage(counting, pageing, Common.PAGESIZE,
					"PAGEING");
			pageoing = WebTool.dealPage(countoing, pageoing, Common.PAGESIZE,
					"PAGEOING");
			pagenoting = WebTool.dealPage(countnoting, pagenoting, Common.PAGESIZE - 1,
					"PAGENOTING");
			pagedoing = WebTool.dealPage(countdoing, pagedoing, Common.PAGESIZE,
					"PAGEDOING");
			return "userinfo";
		} else {
			setAuth(authService.getAuthByRole_id(person.getRole().getRole_id()));
			int pageing = 0, pagenoting = 0,pagedoing = 0;
			int counting = productService.countProductByIng(pro);
			int countnoting = productService.countProductByNotIng(pro);
			int countdoing = orderService.getForDemCount(getId());
			pageing = WebTool.dealPage(counting, pageing, Common.PAGESIZE,
					"PAGEING");
			pagenoting = WebTool.dealPage(countnoting, pagenoting,
					Common.PAGESIZE - 1, "PAGENOTING");
			pagedoing = WebTool.dealPage(countdoing, pagedoing, Common.PAGESIZE,
					"PAGEDOING");
			return "artistinfo";
		}
	}

	public String goImprove() {
		Person person = WebTool.getSessionPerson();
		setPerson(personService.getPersonById(person.getPerson_id()));
		setKeyList(keyService.getAllKey(new ArrayList<Integer>()));
		return "improve";
	}

	public String goRepassword() {
		Person person = WebTool.getSessionPerson();
		setPerson(personService.getPersonById(person.getPerson_id()));
		return "repassword";
	}
	
	public String goCastMsg(){
		return "gocastmsg";
	}

	public String changeIdentify() {
		Person person = personService.getPersonById(getId());
		personService.changeIdentify(person);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("message", person.getState() == 1 ? "进行申请成功" : "取消申请成功");
		map.put("state", person.getState());
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		return SUCCESS;
	}

	public String improvePerson() throws IOException {
		String keys = WebTool.getRequest().getParameter("keys");
		Person newperson = personService.getPersonById(getId());
		if (newperson.getRole().getRole_code() == 5) {
			List<Perkey> keyList = newperson.getKeyList();
			List<Perkey> newkeyList = new ArrayList<Perkey>();
			String[] nkey = keys.split(",");
			System.out.print(nkey.length);
			if (!WebTool.StringisNullOrEmpty(keys)) {

				for (int i = 0; i < nkey.length; i++) {
					Perkey pk = new Perkey();
					if (i < keyList.size())
						pk = keyList.get(i);
					else
						pk.setPerson(newperson);
					Key k = keyService.getKeyById(Integer.parseInt(nkey[i]));
					pk.setKey(k);
					newkeyList.add(pk);
				}
			}
			for (int i = nkey.length; i < 3; i++) {
				Perkey pk = keyList.get(i);
				pk.setKey(keyService.getKeyById(1));
				newkeyList.add(pk);
			}
			newperson.setKeyList(newkeyList);
		}
		newperson.setAddress(getPerson().getAddress());
		newperson.setEmail(getPerson().getEmail());
		newperson.setRealname(getPerson().getRealname());
		newperson.setTel(getPerson().getTel());
		newperson.setSex(getPerson().getSex());
		newperson.setQq(getPerson().getQq());
		newperson.setIdcard(getPerson().getIdcard());
		newperson.setIntroduce(getPerson().getIntroduce().trim());
		setPerson(newperson);
		personService.savePerson(getPerson());
		WebTool.alertMessage("完善信息成功！", "person!goInfo");
		return null;
	}

	public String repassword() throws IOException {
		Person person = personService.getPersonById(getId());
		person.setPassword(getPerson().getPassword());
		personService.savePerson(person);
		WebTool.alertMessage("修改密码成功！", "person!goInfo");
		return null;
	}

}
