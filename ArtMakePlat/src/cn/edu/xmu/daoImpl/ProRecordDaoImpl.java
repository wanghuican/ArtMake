package cn.edu.xmu.daoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.dao.BaseDao;
import cn.edu.xmu.dao.ProActionDao;
import cn.edu.xmu.dao.ProRecordDao;
import cn.edu.xmu.entity.ProAction;
import cn.edu.xmu.entity.ProRecord;
import cn.edu.xmu.util.Common;

public class ProRecordDaoImpl implements ProRecordDao {

	/**
	 * @Fields dao : dao组件
	 */
	@Resource(name = "DAOProxy")
	BaseDao dao;
	
	@Override
	public List<ProRecord> getRecordList(List<Integer> pro) {
		// TODO Auto-generated method stub
		return dao.query(Common.HQL_PRORECORDLIST_BYID, pro);
	}

	@Override
	public void saveProRecord(ProRecord pr) {
		// TODO Auto-generated method stub
		dao.saveOrUpdate(pr);
	}

}
