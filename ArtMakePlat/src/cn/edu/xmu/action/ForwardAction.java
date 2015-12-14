package cn.edu.xmu.action;

import com.opensymphony.xwork2.ActionSupport;


/**
 * @ClassName: ForwardAction
 * @Description: 登录 team: 3-10打屁屁小队
 * @date 2015年11月20日 上午2:54:21
 */
public class ForwardAction extends ActionSupport {

	 @Override
	 public String execute() throws Exception {
	       return super.execute();
	 }
	 
	public String goUser() throws Exception{
			return "user";
	}
	
	
	public String goAdminLogin() throws Exception{
		return "adminLogin";
	}
	
	public String goAbout() throws Exception{
		return "about";
	}
	
	public String goInfo() throws Exception{
		return "info";
	}

	public String goAd() throws Exception{
		return "ad";
	}
	
	public String goAdminInfo() throws Exception{
		return "admininfo";
	}
	
	public String goAdminAd() throws Exception{
		return "adminad";
	}
	
	public String goInfolist() throws Exception{
		return "infolist";
	}
	
	public String goInfoedit() throws Exception{
		return "infoedit";
	}
}
