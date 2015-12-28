package cn.edu.xmu.dao;

import com.mysql.jdbc.Connection;

import java.util.Collection;
import java.util.List;

/**
  * @ClassName: BaseDao
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年11月20日 上午2:54:51
  */
public interface BaseDao {


	/**
	  * MethidName: loadById
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: loadById
	  * @Description: TODO
	  * @param @param clazz
	  * @param @param id
	  * @param @return    设定文件
	  * @return Object    返回类型
	  * @throws
	  */
	public Object loadById(Class clazz, int id);

	/**
	  * MethidName: loadObject
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: loadObject
	  * @Description: TODO
	  * @param @param nq
	  * @param @return    设定文件
	  * @return Object    返回类型
	  * @throws
	  */
	public Object loadObject( String nq);

	/**
	  * MethidName: loadObject
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: loadObject
	  * @Description: TODO
	  * @param @param nq
	  * @param @param pro
	  * @param @return    设定文件
	  * @return Object    返回类型
	  * @throws
	  */
	public Object loadObject( String nq,List pro);
	
	/**
	  * MethidName: delById
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: delById
	  * @Description: TODO
	  * @param @param clazz
	  * @param @param id    设定文件
	  * @return void    返回类型
	  * @throws
	  */
	public void  delById(Class clazz, int id);
	

	/**
	  * MethidName: saveOrUpdate
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: saveOrUpdate
	  * @Description: TODO
	  * @param @param obj    设定文件
	  * @return void    返回类型
	  * @throws
	  */
	public void saveOrUpdate(Object obj);

	
	/**
	  * MethidName: saveOrUpdateAll
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: saveOrUpdateAll
	  * @Description: TODO
	  * @param @param list    设定文件
	  * @return void    返回类型
	  * @throws
	  */
	public void saveOrUpdateAll(List list);
	
	/**
	  * MethidName: listAll
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: listAll
	  * @Description: nq
	  * @param @param nq
	  * @param @return    设定文件
	  * @return List    返回类型
	  * @throws
	  */
	public List listAll(String nq);

	/**
	  * MethidName: listAll
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: listAll
	  * @Description: TODO
	  * @param @param nq
	  * @param @param pageNo
	  * @param @param pageSize
	  * @param @return    设定文件
	  * @return List    返回类型
	  * @throws
	  */
	public List listAll(String nq, int pageNo, int pageSize);


	/**
	  * MethidName: query
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: query
	  * @Description: TODO
	  * @param @param nq
	  * @param @return    设定文件
	  * @return List    返回类型
	  * @throws
	  */
	public List query(String nq);

	/**
	  * MethidName: query
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: query
	  * @Description: TODO
	  * @param @param nq
	  * @param @param pro
	  * @param @return    设定文件
	  * @return List    返回类型
	  * @throws
	  */
	public List query(String nq,List pro);

	
	/**
	  * MethidName: query
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: query
	  * @Description: TODO
	  * @param @param nq
	  * @param @param pageNo
	  * @param @param pageSize
	  * @param @return    设定文件
	  * @return List    返回类型
	  * @throws
	  */
	public List query(String nq, int pageNo, int pageSize);

	/**
	  * MethidName: query
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: query
	  * @Description: TODO
	  * @param @param nq
	  * @param @param pro
	  * @param @param pageNo
	  * @param @param pageSize
	  * @param @return    设定文件
	  * @return List    返回类型
	  * @throws
	  */
	public List query(String nq,List pro, int pageNo, int pageSize);
	/**
	  * MethidName: countQuery
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: countQuery
	  * @Description: TODO
	  * @param @param nq
	  * @param @return    设定文件
	  * @return int    返回类型
	  * @throws
	  */
	public int countQuery(String nq);

	
	/**
	  * MethidName: countQuery
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: countQuery
	  * @Description: TODO
	  * @param @param nq
	  * @param @param pro
	  * @param @return    设定文件
	  * @return int    返回类型
	  * @throws
	  */
	public int countQuery(String nq,List pro);
	/**
	  * MethidName: update
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: update
	  * @Description: TODO
	  * @param @param nq
	  * @param @return    设定文件
	  * @return int    返回类型
	  * @throws
	  */
	public int update(String nq);

	/**
	  * MethidName: getConnection
	  * TODO(这里描述这个方法适用条件 – 可选)
	  * TODO(这里描述这个方法的使用方法 – 可选)
	  * TODO(这里描述这个方法的注意事项 – 可选)
	  * @Title: getConnection
	  * @Description: TODO
	  * @param @return    设定文件
	  * @return Connection    返回类型
	  * @throws
	  */
	public Connection getConnection();
        
       
        
}