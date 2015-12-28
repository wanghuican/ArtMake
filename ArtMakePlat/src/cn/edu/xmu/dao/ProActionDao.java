
package cn.edu.xmu.dao;

import java.util.List;

import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.ProAction;
import cn.edu.xmu.entity.Product;
import cn.edu.xmu.entity.ProRecord;


/**
  * @ClassName: ProActionDao
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月22日 上午12:57:10
  */
public interface ProActionDao {
	
	public List<ProAction> getAllProAction(List<String> pro);
	
	public List<ProAction> getAllProAction(List<String> pro,int pageNo,int pageSize);
	
	public int countProAction(List<String> pro);
	
	public void saveProAction(ProAction proAction);
	
	public void deleteProActionById(int id);
	
	public ProAction getProActionById(int id);
	
	public List<ProAction> getProActionByPid(List<Integer> pro);

	public List<ProRecord> getRecordListPerson(List<Integer> pro);
}
