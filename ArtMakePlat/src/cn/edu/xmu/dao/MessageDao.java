package cn.edu.xmu.dao;

import java.util.List;

import cn.edu.xmu.entity.Message;

/**
  * @ClassName: MessageDao
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月19日 下午1:29:40
  */
public interface MessageDao {
	
	public List<Message> getAllMessage(List<String> pro);
	
	public List<Message> getAllMessage(List<String> pro,int pageNo,int pageSize);
	
	public int countMessage(List<String> pro);
	
	public void saveMessage(Message Message);
	
	public void deleteMessageById(int id);
	
	public Message getMessageById(int id);
	
}
