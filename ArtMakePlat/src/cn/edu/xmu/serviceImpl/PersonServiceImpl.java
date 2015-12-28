/**
 * @Title: PersonService.java
 * @Package cn.edu.xmu.serviceImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月14日 下午10:03:03
 * @version V1.0
 */

package cn.edu.xmu.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.PersonDao;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.util.Common;

/**
 * @ClassName: PersonService
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月14日 下午10:03:03
 */

public class PersonServiceImpl implements PersonService {

	/**
     * @Fields dao : dao组件
     */
   @Resource(name="persondao")
    PersonDao dao ;
   
	@Override
	public Person checkAccount(String account) {
		// TODO Auto-generated method stub
		Person person = dao.getPersonByAccount(account);
		return person;
	}

	@Override
	public List<Person> getPersonList(int role_code,List<String> pro, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Person> personList = new ArrayList<Person>();
		personList = dao.getPersonList(role_code, pro, pageNo, pageSize);
		return personList;
	}


	@Override
	public int getPersonCount(int role_code,List<String> pro) {
		// TODO Auto-generated method stub
		int count = 0;
		count = dao.countPerson(role_code, pro);
		return count;
	}

	@Override
	public void savePerson(Person person) {
		// TODO Auto-generated method stub
		dao.savePerson(person);
	}

	@Override
	public Person getPersonById(int id) {
		// TODO Auto-generated method stub
		return dao.getPersonById(id);
	}

	@Override
	public void deletePersonById(int id) {
		// TODO Auto-generated method stub
		dao.deletePersonById(id);
	}
	
	public void changeBid(Person person){
		if(person.getState() == -1)
			person.setState(0);
		else{
			person.setState(-1);
		}
		dao.savePerson(person);
	}

	@Override
	public void changeIdentify(Person person) {
		// TODO Auto-generated method stub
		if(person.getState() == 1)
			person.setState(0);
		else{
			person.setState(1);
		}
		dao.savePerson(person);
	}
}
