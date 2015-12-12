package cn.edu.xmu.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.BaseDao;
import cn.edu.xmu.dao.PersonDao;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.util.Common;

public class PersonDaoImpl implements PersonDao {
	/**
     * @Fields dao : dao组件
     */
   @Resource(name="DAOProxy")
    BaseDao dao ;
   
	@Override
	public Person getPersonByLogin(Person person) {
		// TODO Auto-generated method stub
		String nq = Common.HQL_LOGIN;
		List<String> pro = new ArrayList<String>();
		pro.add(person.getAccount());
		pro.add(person.getPassword());
		Person p = (Person) dao.loadObject(nq,pro);
		if(p != null)
			return p;
		return null;
	}

	@Override
	public Person getPersonByAccount(String account) {
		// TODO Auto-generated method stub
		String nq = Common.HQL_GET_PERSON_BYACCOUNT;
		List<String> pro = new ArrayList<String>();
		pro.add(account);
		Person p = (Person) dao.loadObject(nq,pro);
		if(p != null)
			return p;
		return null;
	}

}
