
package cn.edu.xmu.service;

import java.util.List;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Demand;
import cn.edu.xmu.entity.Demrecord;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.Product;

/**
  * @ClassName: DemandService
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月22日 上午1:11:08
  */
public interface DemandService {
	public List<Demand> getAllDemand(List<String> pro);
	
	public List<Demand> getAllDemand(List<String> pro,int pageNo,int pageSize);
	
	public int countDemand(List<String> pro);
	
	public void deleteDemandById(int id);
	
	public void saveDemand(Demand demand);
	
	public Demand getDemandById(int id);
	
	public List<Demand> getForDemandList(Person person,int pageNo,int pageSize);
	
	public int countForDemand(Person person);
	
	public List<Demrecord> getRocordList(int demand_id);
	
	public void saveDemRecord(Demrecord dr);
}
