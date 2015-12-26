
package cn.edu.xmu.dao;

import java.util.List;

import cn.edu.xmu.entity.Demand;
import cn.edu.xmu.entity.Prorecord;


/**
  * @ClassName: DemandDao
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月22日 上午12:57:10
  */
public interface DemandDao {
	
	public List<Demand> getAllDemand(List<String> pro);
	
	public List<Demand> getAllDemand(List<String> pro,int pageNo,int pageSize);
	
	public int countDemand(List<String> pro);
	
	public void saveDemand(Demand demand);
	
	public void deleteDemandById(int id);
	
	public Demand getDemandById(int id);
}