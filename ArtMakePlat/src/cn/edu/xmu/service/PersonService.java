package cn.edu.xmu.service;

import java.util.List;

import cn.edu.xmu.entity.Person;

/**
  * @ClassName: PersonService
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月14日 下午9:59:26
  */
public interface PersonService {
	public Person checkAccount(String account);
	
	public List<Person> getPersonList(int role_code,List<String> pro,int pageNo,int pageSize);
	
	public int getPersonCount(int role_code,List<String> pro);

}
