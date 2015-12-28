/**
 * @Title: MessageServiceImpl.java
 * @Package cn.edu.xmu.serviceImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月19日 下午1:49:52
 * @version V1.0
 */

package cn.edu.xmu.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.AuthDao;
import cn.edu.xmu.dao.MessageDao;
import cn.edu.xmu.entity.Message;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.service.MessageService;
import cn.edu.xmu.util.WebTool;

/**
 * @ClassName: MessageServiceImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月19日 下午1:49:52
 */

public class MessageServiceImpl implements MessageService {

	/**
     * @Fields dao : dao组件
     */
   @Resource(name="messagedao")
    MessageDao dao ;
	
	/*
	 * Title: getAllMessage
	 * Description:
	 * @param pro
	 * @return
	 * @see cn.edu.xmu.service.MessageService#getAllMessage(java.util.List)
	 */

	@Override
	public List<Message> getAllMessage(List<String> pro) {
		// TODO Auto-generated method stub
		return dao.getAllMessage(pro);
	}

	/*
	 * Title: getAllMessage
	 * Description:
	 * @param pro
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @see cn.edu.xmu.service.MessageService#getAllMessage(java.util.List, int, int)
	 */

	@Override
	public List<Message> getAllMessage(List<String> pro, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return dao.getAllMessage(pro, pageNo, pageSize);
	}

	/*
	 * Title: countMessage
	 * Description:
	 * @param pro
	 * @return
	 * @see cn.edu.xmu.service.MessageService#countMessage(java.util.List)
	 */

	@Override
	public int countMessage(List<String> pro) {
		// TODO Auto-generated method stub
		return dao.countMessage(pro);
	}

	/*
	 * Title: deleteMessageById
	 * Description:
	 * @param id
	 * @see cn.edu.xmu.service.MessageService#deleteMessageById(int)
	 */

	@Override
	public void deleteMessageById(int id) {
		// TODO Auto-generated method stub
		dao.deleteMessageById(id);
	}

	/*
	 * Title: saveMessage
	 * Description:
	 * @param Message
	 * @see cn.edu.xmu.service.MessageService#saveMessage(cn.edu.xmu.entity.Message)
	 */

	@Override
	public void saveMessage(Message Message) {
		// TODO Auto-generated method stub
		dao.saveMessage(Message);
	}

	/*
	 * Title: getMessageById
	 * Description:
	 * @param id
	 * @return
	 * @see cn.edu.xmu.service.MessageService#getMessageById(int)
	 */

	@Override
	public Message getMessageById(int id) {
		// TODO Auto-generated method stub
		return dao.getMessageById(id);
	}

	@Override
	public List<Person> getToPerson() {
		// TODO Auto-generated method stub
		List<Person> personList = new ArrayList<Person>();
		List<Integer> pro = new ArrayList<Integer>();
		Person person = WebTool.getSessionPerson();
		pro.add(person.getPerson_id());
		pro.add(person.getPerson_id());
		List<Message> messageList= dao.getMessageByPerson(pro);
		for(int i=0;i<messageList.size();i++){
			Person fperson = messageList.get(i).getFromperson();
			Person tperson = messageList.get(i).getToperson();
			if(person.getPerson_id() != fperson.getPerson_id()){
				if(!personList.contains(fperson))
					personList.add(fperson);
			}else{
				if(!personList.contains(tperson))
					personList.add(tperson);
			}
		}
		return personList;
	}
	
	@Override
	public List<Message> getOTOMessage(int pid){
		List<Integer> pro = new ArrayList<Integer>();
		Person person = WebTool.getSessionPerson();
		pro.add(person.getPerson_id());
		pro.add(pid);
		pro.add(person.getPerson_id());
		pro.add(pid);
		List<Message> messageList= dao.getMessageByOTOPerson(pro);
		return messageList;
	}

}