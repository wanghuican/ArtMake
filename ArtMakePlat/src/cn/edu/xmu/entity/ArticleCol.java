/**
 * @Title: ArticleCol.java
 * @Package cn.edu.xmu.entity
 * @Description: TODO
 * team:3-10打屁屁小队
 * @author Comsys-xmu03
 * @date 2015年12月8日 下午3:04:59
 * @version V1.0
 */

package cn.edu.xmu.entity;
/**
 * @ClassName: ArticleCol
 * @Description: TODO
 * team: 3-10打屁屁小队
 * @date 2015年12月8日 下午3:04:59
 */

public class ArticleCol {

	/**
	  * @Fields record_id : TODO（用一句话描述这个变量表示什么）
	  */
	private int record_id;
	
	/**
	  * @Fields article : TODO（用一句话描述这个变量表示什么）
	  */
	private Article article;
	
	/**
	  * @Fields pass : TODO（用一句话描述这个变量表示什么）
	  */
	private int pass;
	
	/**
	  * @Fields time : TODO（用一句话描述这个变量表示什么）
	  */
	private String time;
	
	/**
	  * @Fields column : TODO（用一句话描述这个变量表示什么）
	  */
	private String column;

	
	
	/**
	  * 创建一个新的实例 ArticleCol. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  */
	
	public ArticleCol() {
		super();
	}



	/**
	  * 创建一个新的实例 ArticleCol. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param record_id
	  * @param article
	  * @param pass
	  * @param time
	  * @param column
	  */
	
	public ArticleCol(int record_id, Article article, int pass, String time,
			String column) {
		super();
		this.record_id = record_id;
		this.article = article;
		this.pass = pass;
		this.time = time;
		this.column = column;
	}



	/**
	 * getter method
	 * @return the record_id
	 */
	
	public int getRecord_id() {
		return record_id;
	}



	/**
	 * setter method
	 * @param record_id the record_id to set
	 */
	
	public void setRecord_id(int record_id) {
		this.record_id = record_id;
	}



	/**
	 * getter method
	 * @return the article
	 */
	
	public Article getArticle() {
		return article;
	}



	/**
	 * setter method
	 * @param article the article to set
	 */
	
	public void setArticle(Article article) {
		this.article = article;
	}



	/**
	 * getter method
	 * @return the pass
	 */
	
	public int getPass() {
		return pass;
	}



	/**
	 * setter method
	 * @param pass the pass to set
	 */
	
	public void setPass(int pass) {
		this.pass = pass;
	}



	/**
	 * getter method
	 * @return the time
	 */
	
	public String getTime() {
		return time;
	}



	/**
	 * setter method
	 * @param time the time to set
	 */
	
	public void setTime(String time) {
		this.time = time;
	}



	/**
	 * getter method
	 * @return the column
	 */
	
	public String getColumn() {
		return column;
	}



	/**
	 * setter method
	 * @param column the column to set
	 */
	
	public void setColumn(String column) {
		this.column = column;
	}
	
	
	
}
