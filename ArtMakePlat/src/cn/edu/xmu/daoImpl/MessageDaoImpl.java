/**
 * @Title: MessageDaoImpl.java
 * @Package cn.edu.xmu.daoImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月19日 下午1:32:54
 * @version V1.0
 */

package cn.edu.xmu.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.BaseDao;
import cn.edu.xmu.dao.MessageDao;
import cn.edu.xmu.entity.Message;
import cn.edu.xmu.util.Common;

/**
 * @ClassName: MessageDaoImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月19日 下午1:32:54
 */

public class MessageDaoImpl implements MessageDao {

	/**
	 * @Fields dao : dao组件
	 */
	@Resource(name = "DAOProxy")
	BaseDao dao;
	
	/*
	 * Title: getAllMessage
	 * Description:
	 * @param pro
	 * @return
	 * @see cn.edu.xmu.dao.MessageDao#getAllMessage(java.util.List)
	 */

	@Override
	public List<Message> getAllMessage(List<String> pro) {
		// TODO Auto-generated method stub
		List<Message> messageList = new ArrayList<Message>();
		if(pro.size() == 0){
			messageList = dao.query(Common.HQL_MESSAGELIST);
		}else{
			messageList = dao.query(Common.HQL_MESSAGELIST_SELECT,pro);
		}
		return messageList;
	}

	/*
	 * Title: getAllMessage
	 * Description:
	 * @param pro
	 * @param pageNo
	 * @param pageSize
	 * @return
	 * @see cn.edu.xmu.dao.MessageDao#getAllMessage(java.util.List, int, int)
	 */

	@Override
	public List<Message> getAllMessage(List<String> pro, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Message> messageList = new ArrayList<Message>();
		if(pro.size() == 0){
			messageList = dao.query(Common.HQL_MESSAGELIST,pageNo,pageSize);
		}else{
			messageList = dao.query(Common.HQL_MESSAGELIST_SELECT,pro,pageNo,pageSize);
		}
		return messageList;
	}

	/*
	 * Title: countMessage
	 * Description:
	 * @param pro
	 * @return
	 * @see cn.edu.xmu.dao.MessageDao#countMessage(java.util.List)
	 */

	@Override
	public int countMessage(List<String> pro) {
		// TODO Auto-generated method stub
		int count = this.getAllMessage(pro).size();
		return count;
	}

	/*
	 * Title: saveMessage
	 * Description:
	 * @param Message
	 * @see cn.edu.xmu.dao.MessageDao#saveMessage(cn.edu.xmu.entity.Message)
	 */

	@Override
	public void saveMessage(Message Message) {
		// TODO Auto-generated method stub
		dao.saveOrUpdate(Message);
	}

	/*
	 * Title: deleteMessageById
	 * Description:
	 * @param id
	 * @see cn.edu.xmu.dao.MessageDao#deleteMessageById(int)
	 */

	@Override
	public void deleteMessageById(int id) {
		// TODO Auto-generated method stub
		dao.delById(Message.class, id);
	}

	/*
	 * Title: getMessageById
	 * Description:
	 * @param id
	 * @return
	 * @see cn.edu.xmu.dao.MessageDao#getMessageById(int)
	 */

	@Override
	public Message getMessageById(int id) {
		// TODO Auto-generated method stub
		return (Message)dao.loadById(Message.class, id);
	}

	@Override
	public List<Message> getMessageByPerson(List<Integer> pro) {
		// TODO Auto-generated method stub
		return dao.query(Common.HQL_MESSAGELIST_PERSON,pro);
	}

	@Override
	public List<Message> getMessageByOTOPerson(List<Integer> pro) {
		// TODO Auto-generated method stub
		return dao.query(Common.HQL_MESSAGELIST_OTOPERSON,pro);
	}
}
