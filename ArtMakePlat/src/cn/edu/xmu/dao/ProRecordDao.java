
package cn.edu.xmu.dao;

import java.util.List;

import cn.edu.xmu.entity.ProAction;
import cn.edu.xmu.entity.Prorecord;


/**
  * @ClassName: ProActionDao
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月22日 上午12:57:10
  */
public interface ProRecordDao {
	
	public List<Prorecord> getRecordList(List<Integer> pro);

	public void saveProRecord(Prorecord pr);
}
