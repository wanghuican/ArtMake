/**
 * @Title: DemandServiceImpl.java
 * @Package cn.edu.xmu.serviceImpl
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月16日 上午12:29:50
 * @version V1.0
 */

package cn.edu.xmu.serviceImpl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONObject;
import cn.edu.xmu.dao.DemandDao;
import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Demand;
import cn.edu.xmu.entity.DemRecord;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.service.DemandService;

/**
 * @ClassName: DemandServiceImpl
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月16日 上午12:29:50
 */

public class DemandServiceImpl implements DemandService {

	
	/**
     * @Fields dao : dao组件
     */
   @Resource(name="demanddao")
    DemandDao dao ;

	
	/*
	 * Title: getAllDemand
	 * Description:
	 * @return
	 * @see cn.edu.xmu.service.DemandService#getAllDemand()
	 */

	@Override
	public List<Demand> getAllDemand(List<String> pro) {
		// TODO Auto-generated method stub
		return dao.getAllDemand(pro);
	}
	
	/*
	  * Title: getAllDemand
	  * Description:
	  * @param pro
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.service.DemandService#getAllDemand(java.util.List, int, int)
	  */
	@Override
	public List<Demand> getAllDemand(List<String> pro,int pageNo,int pageSize){
		return dao.getAllDemand(pro, pageNo, pageSize);
	}

	@Override
	public int countDemand(List<String> pro) {
		// TODO Auto-generated method stub
		return dao.countDemand(pro);
	}

	@Override
	public void deleteDemandById(int id) {
		// TODO Auto-generated method stub
		dao.deleteDemandById(id);
	}

	@Override
	public void saveDemand(Demand demand) {
		// TODO Auto-generated method stub
		dao.saveDemand(demand);
	}
	
	@Override
	public Demand getDemandById(int id){
		return dao.getDemandById(id);
	}

	@Override
	public List<Demand> getForDemandList(Person person, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(person.getPerson_id());
		return dao.getForDemand(pro, pageNo, pageSize);
	}

	@Override
	public int countForDemand(Person person) {
		// TODO Auto-generated method stub
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(person.getPerson_id());
		return dao.countForDemand(pro);
	}

	@Override
	public List<DemRecord> getRocordList(int demand_id) {
		// TODO Auto-generated method stub
		List<Integer> pro = new ArrayList<Integer>();
		pro.add(demand_id);
		return dao.getRocordList(pro);
	}

	@Override
	public void saveDemRecord(DemRecord dr) {
		// TODO Auto-generated method stub
		dao.saveDemRecord(dr);
	}

	@Override
	public List<Demand> getDemandList(List<String> pro) {
		// TODO Auto-generated method stub
		return dao.getDemandList(pro);
	}
	
}
