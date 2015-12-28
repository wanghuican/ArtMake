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
		List<Person> pList = dao.query(nq,pro);
		if(pList.size() != 0)
			return pList.get(0);
		return null;
	}

	@Override
	public List<Person> getPersonList(int role_code, List<String> pro) {
		// TODO Auto-generated method stub
		List<Person> personList = new ArrayList<Person>();
		if(pro.size() == 0){
	    	pro.add(role_code + "");
	    	personList = dao.query(Common.HQL_PERSONLIST,pro);
	    	pro.remove(pro.size() - 1);
	    }else{
	    	pro.add(role_code + "");
	    	personList = dao.query(Common.HQL_PERSONLIST_SELECT,pro);
	    	pro.remove(pro.size() - 1);
	    }
		return personList;
	}
	
	@Override
	public List<Person> getPersonList(int role_code,List<String> pro,int pageNo,int pageSize) {
		// TODO Auto-generated method stub
		List<Person> personList = new ArrayList<Person>();
		if(pro.size() == 0){
	    	pro.add(role_code + "");
	    	personList = dao.query(Common.HQL_PERSONLIST,pro,pageNo, pageSize);
	    	pro.remove(pro.size() - 1);
	    }else{
	    	pro.add(role_code + "");
	    	personList = dao.query(Common.HQL_PERSONLIST_SELECT,pro,pageNo, pageSize);
	    	pro.remove(pro.size() - 1);
	    }
		return personList;
	}

	@Override
	public int countPerson(int role_code,List<String> pro){
		int count = getPersonList(role_code,pro).size();
		return count;
	}

	@Override
	public void savePerson(Person person) {
		// TODO Auto-generated method stub
		dao.saveOrUpdate(person);
	}

	@Override
	public Person getPersonById(int id) {
		// TODO Auto-generated method stub
		return (Person)dao.loadById(Person.class, id);
	}

	@Override
	public void deletePersonById(int id) {
		// TODO Auto-generated method stub
		dao.delById(Person.class, id);
	}

}