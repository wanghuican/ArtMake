package cn.edu.xmu.service;

import java.util.List;

import cn.edu.xmu.entity.Message;


/**
  * @ClassName: MessageService
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月19日 下午1:49:23
  */
public interface MessageService {
	public List<Message> getAllMessage(List<String> pro);
	
	public List<Message> getAllMessage(List<String> pro,int pageNo,int pageSize);
	
	public int countMessage(List<String> pro);
	
	public void deleteMessageById(int id);
	
	public void saveMessage(Message Message);
	
	public Message getMessageById(int id);
	
}
