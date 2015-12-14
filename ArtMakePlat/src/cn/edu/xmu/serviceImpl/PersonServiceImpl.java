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

import javax.annotation.Resource;

import cn.edu.xmu.dao.PersonDao;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.service.PersonService;

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
		if(person != null){
			return person;
		}
		return null;
	}

}
