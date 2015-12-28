
package cn.edu.xmu.service;

import java.util.List;

import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.ProAction;
import cn.edu.xmu.entity.Product;
import cn.edu.xmu.entity.ProRecord;

/**
  * @ClassName: ProActionService
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月22日 上午1:11:08
  */
public interface ProActionService {
	public List<ProAction> getAllProAction(List<String> pro);
	
	public List<ProAction> getAllProAction(List<String> pro,int pageNo,int pageSize);
	
	public int countProAction(List<String> pro);
	
	public void deleteProActionById(int id);
	
	public void saveProAction(ProAction proAction);
	
	public void saveProRecord(ProRecord proRecord);
	
	public ProAction getProActionById(int id);
	
	public List<ProRecord> getRecordList(int action_id);
	
	public ProRecord getFirstRecord(int action_id);
	
	public List<ProAction> getActionList(int pid);
	
	public ProAction getFirstAction(int pid);
	
	public List<Product> getProductListPerson(Person person,int pageNo,int pageSize);
	
	public int countProductPerson(Person person);
}
