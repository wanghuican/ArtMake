/**
 * @Title: ProActionServiceImpl.java
 * @Package cn.edu.xmu.serviceImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月16日 上午12:29:50
 * @version V1.0
 */

package cn.edu.xmu.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.ProActionDao;
import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.ProAction;
import cn.edu.xmu.entity.Prorecord;
import cn.edu.xmu.service.ProActionService;

/**
 * @ClassName: ProActionServiceImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月16日 上午12:29:50
 */

public class ProActionServiceImpl implements ProActionService {

	
	/**
     * @Fields dao : dao组件
     */
   @Resource(name="proActiondao")
    ProActionDao dao ;

	
	/*
	 * Title: getAllProAction
	 * Description:
	 * @return
	 * @see cn.edu.xmu.service.ProActionService#getAllProAction()
	 */

	@Override
	public List<ProAction> getAllProAction(List<String> pro) {
		// TODO Auto-generated method stub
		return dao.getAllProAction(pro);
	}
	
	/*
	  * Title: getAllProAction
	  * Description:
	  * @param pro
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.service.ProActionService#getAllProAction(java.util.List, int, int)
	  */
	@Override
	public List<ProAction> getAllProAction(List<String> pro,int pageNo,int pageSize){
		return dao.getAllProAction(pro, pageNo, pageSize);
	}

	@Override
	public int countProAction(List<String> pro) {
		// TODO Auto-generated method stub
		return dao.countProAction(pro);
	}

	@Override
	public void deleteProActionById(int id) {
		// TODO Auto-generated method stub
		dao.deleteProActionById(id);
	}

	@Override
	public void saveProAction(ProAction proAction) {
		// TODO Auto-generated method stub
		dao.saveProAction(proAction);
	}
	
	@Override
	public ProAction getProActionById(int id){
		return dao.getProActionById(id);
	}

	@Override
	public List<Prorecord> getRecordList(int action_id) {
		// TODO Auto-generated method stub
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(action_id);
		return dao.getRecordList(pro);
	}

	@Override
	public Prorecord getFirstRecord(int action_id) {
		// TODO Auto-generated method stub
		if(getRecordList(action_id).size() == 0)
	    	return null;
		else 
			return getRecordList(action_id).get(0);
	}

	
}
