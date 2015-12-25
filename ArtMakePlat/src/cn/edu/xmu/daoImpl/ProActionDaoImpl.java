package cn.edu.xmu.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.BaseDao;
import cn.edu.xmu.dao.ProActionDao;
import cn.edu.xmu.entity.ProAction;
import cn.edu.xmu.entity.Prorecord;
import cn.edu.xmu.util.Common;

public class ProActionDaoImpl implements ProActionDao {


	/**
	 * @Fields dao : dao组件
	 */
	@Resource(name = "DAOProxy")
	BaseDao dao;

	/*
	  * Title: getAllProAction
	  * Description:
	  * @param pro
	  * @return
	  * @see cn.edu.xmu.dao.ProActionDao#getAllProAction(java.util.List)
	  */
	@Override
	public List<ProAction> getAllProAction(List<String> pro) {
		// TODO Auto-generated method stub
		List<ProAction> proActionList = new ArrayList<ProAction>();
		if(pro.size() == 0){
			proActionList = dao.query(Common.HQL_PROACTIONLIST);
		}else{
			proActionList = dao.query(Common.HQL_PROACTIONLIST_SELECT,pro);
		}
		return proActionList;
	}

	/*
	  * Title: getAllProAction
	  * Description:
	  * @param pro
	  * @param pageNo
	  * @param pageSize
	  * @return
	  * @see cn.edu.xmu.dao.ProActionDao#getAllProAction(java.util.List, int, int)
	  */
	@Override
	public List<ProAction> getAllProAction(List<String> pro, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		List<ProAction> proActionList = new ArrayList<ProAction>();
		if(pro.size() == 0){
			proActionList = dao.query(Common.HQL_PROACTIONLIST,pageNo,pageSize);
		}else{
			proActionList = dao.query(Common.HQL_PROACTIONLIST_SELECT,pro,pageNo,pageSize);
		}
		return proActionList;
	}

	/*
	  * Title: countProAction
	  * Description:
	  * @param pro
	  * @return
	  * @see cn.edu.xmu.dao.ProActionDao#countProAction(java.util.List)
	  */
	@Override
	public int countProAction(List<String> pro) {
		// TODO Auto-generated method stub
		int count = this.getAllProAction(pro).size();
		return count;
	}

	/*
	  * Title: saveProAction
	  * Description:
	  * @param proAction
	  * @see cn.edu.xmu.dao.ProActionDao#saveProAction(cn.edu.xmu.entity.ProAction)
	  */
	@Override
	public void saveProAction(ProAction proAction) {
		// TODO Auto-generated method stub
		dao.saveOrUpdate(proAction);
	}

	/*
	  * Title: deleteProActionById
	  * Description:
	  * @param id
	  * @see cn.edu.xmu.dao.ProActionDao#deleteProActionById(int)
	  */
	@Override
	public void deleteProActionById(int id) {
		// TODO Auto-generated method stub
		dao.delById(ProAction.class, id);
	}

	/*
	  * Title: getProActionById
	  * Description:
	  * @param id
	  * @return
	  * @see cn.edu.xmu.dao.ProActionDao#getProActionById(int)
	  */
	@Override
	public ProAction getProActionById(int id) {
		// TODO Auto-generated method stub
		return (ProAction) dao.loadById(ProAction.class, id);
	}

	@Override
	public List<Prorecord> getRecordList(List<Integer> pro) {
		// TODO Auto-generated method stub
		return dao.query(Common.HQL_PRORECORDLIST_BYID, pro);
	}

}
