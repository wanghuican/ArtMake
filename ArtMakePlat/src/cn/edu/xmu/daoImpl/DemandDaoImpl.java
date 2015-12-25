package cn.edu.xmu.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.BaseDao;
import cn.edu.xmu.dao.DemandDao;
import cn.edu.xmu.entity.Demand;
import cn.edu.xmu.util.Common;

public class DemandDaoImpl implements DemandDao {


	/**
	 * @Fields dao : dao组件
	 */
	@Resource(name = "DAOProxy")
	BaseDao dao;

	/*
	  * Title: getAllDemand
	  * Description:
	  * @param pro
	  * @return
	  * @see cn.edu.xmu.dao.DemandDao#getAllDemand(java.util.List)
	  */
	@Override
	public List<Demand> getAllDemand(List<String> pro) {
		// TODO Auto-generated method stub
		List<Demand> demandList = new ArrayList<Demand>();
		if(pro.size() == 0){
			demandList = dao.query(Common.HQL_DEMANDLIST);
		}else{
			demandList = dao.query(Common.HQL_DEMANDLIST_SELECT,pro);
		}
		return demandList;
	}

	/*
	  * Title: getAllDemand
	  * Description:
	  * @param pro
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.dao.DemandDao#getAllDemand(java.util.List, int, int)
	  */
	@Override
	public List<Demand> getAllDemand(List<String> pro, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<Demand> demandList = new ArrayList<Demand>();
		if(pro.size() == 0){
			demandList = dao.query(Common.HQL_DEMANDLIST,pageNo,pageSize);
		}else{
			demandList = dao.query(Common.HQL_DEMANDLIST_SELECT,pro,pageNo,pageSize);
		}
		return demandList;
	}

	/*
	  * Title: countDemand
	  * Description:
	  * @param pro
	  * @return
	  * @see cn.edu.xmu.dao.DemandDao#countDemand(java.util.List)
	  */
	@Override
	public int countDemand(List<String> pro) {
		// TODO Auto-generated method stub
		int count = this.getAllDemand(pro).size();
		return count;
	}

	/*
	  * Title: saveDemand
	  * Description:
	  * @param demand
	  * @see cn.edu.xmu.dao.DemandDao#saveDemand(cn.edu.xmu.entity.Demand)
	  */
	@Override
	public void saveDemand(Demand demand) {
		// TODO Auto-generated method stub
		dao.saveOrUpdate(demand);
	}

	/*
	  * Title: deleteDemandById
	  * Description:
	  * @param id
	  * @see cn.edu.xmu.dao.DemandDao#deleteDemandById(int)
	  */
	@Override
	public void deleteDemandById(int id) {
		// TODO Auto-generated method stub
		dao.delById(Demand.class, id);
	}

	/*
	  * Title: getDemandById
	  * Description:
	  * @param id
	  * @return
	  * @see cn.edu.xmu.dao.DemandDao#getDemandById(int)
	  */
	@Override
	public Demand getDemandById(int id) {
		// TODO Auto-generated method stub
		return (Demand) dao.loadById(Demand.class, id);
	}


}
