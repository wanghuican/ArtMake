/**
 * @Title: Article.java
 * @Package cn.edu.xmu.entity
 * @Description: TODO
 * team:3-10打屁屁小队
 * @date 2015年11月25日 下午8:24:58
 * @version V1.0
 */

package cn.edu.xmu.entity;

import java.util.Date;

/**
 * @ClassName: Article
 * @Description: 咨询实体
 * team: 3-10打屁屁小队
 * @date 2015年11月25日 下午8:24:58
 */

public class Article {

	/**
	  * @Fields article_id
	  */
	private int article_id;
	
	/**
	  * @Fields title 
	  */
	private String title;
	/**
	  * @Fields content
	  */
	private String content;
	
	/**
	  * @Fields type : TODO（用一句话描述这个变量表示什么）
	  */
	private int type;
	/**
	  * @Fields image
	  */
	private String image;
	
	/**
	  * @Fields uptime
	  */
	private Date uptime;
	
	/**
	  * @Fields person 
	  */
	private Person person;
	
	/**
	  * @Fields video
	  */
	private String video;
	
	
	/**
	  * @Fields time : TODO（用一句话描述这个变量表示什么）
	  */
	private String time;
	
	/**
	  * @Fields column_id : TODO（用一句话描述这个变量表示什么）
	  */
	private String column_id;
	
	/**
	  * @Fields type : TODO（用一句话描述这个变量表示什么）
	  */
	private int pass;
	
	/**
	  * 创建一个新的实例 Article. 
	  * <p>Description: 无参构造函数</p>
	  */
	
	public Article() {
		super();
	}

	


	/**
	  * 创建一个新的实例 Article. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param article_id
	  * @param title
	  * @param content
	  * @param type
	  * @param image
	  * @param uptime
	  * @param person
	  * @param video
	  * @param time
	  * @param column_id
	  * @param pass
	  */
	
	public Article(int article_id, String title, String content, int type,
			String image, Date uptime, Person person, String video,
			String time, String column_id, int pass) {
		super();
		this.article_id = article_id;
		this.title = title;
		this.content = content;
		this.type = type;
		this.image = image;
		this.uptime = uptime;
		this.person = person;
		this.video = video;
		this.time = time;
		this.column_id = column_id;
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
	 * @return the column_id
	 */
	
	public String getColumn_id() {
		return column_id;
	}




	/**
	 * setter method
	 * @param column_id the column_id to set
	 */
	
	public void setColumn_id(String column_id) {
		this.column_id = column_id;
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
	 * @return the article_id
	 */
	
	public int getArticle_id() {
		return article_id;
	}



	/**
	 * setter method
	 * @param article_id the article_id to set
	 */
	
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}



	/**
	 * getter method
	 * @return the content
	 */
	
	public String getContent() {
		return content;
	}


	/**
	 * setter method
	 * @param content the content to set
	 */
	
	public void setContent(String content) {
		this.content = content;
	}


	/**
	 * getter method
	 * @return the image
	 */
	
	public String getImage() {
		return image;
	}


	/**
	 * setter method
	 * @param image the image to set
	 */
	
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * getter method
	 * @return the video
	 */
	
	public String getVideo() {
		return video;
	}

	/**
	 * setter method
	 * @param video the video to set
	 */
	
	public void setVideo(String video) {
		this.video = video;
	}

	/**
	 * getter method
	 * @return the title
	 */
	
	public String getTitle() {
		return title;
	}

	/**
	 * setter method
	 * @param title the title to set
	 */
	
	public void setTitle(String title) {
		this.title = title;
	}



	/**
	 * getter method
	 * @return the uptime
	 */
	
	public Date getUptime() {
		return uptime;
	}



	/**
	 * setter method
	 * @param uptime the uptime to set
	 */
	
	public void setUptime(Date uptime) {
		this.uptime = uptime;
	}



	/**
	 * getter method
	 * @return the person
	 */
	
	public Person getPerson() {
		return person;
	}



	/**
	 * setter method
	 * @param person the person to set
	 */
	
	public void setPerson(Person person) {
		this.person = person;
	}



	/**
	 * getter method
	 * @return the type
	 */
	
	public int getType() {
		return type;
	}



	/**
	 * setter method
	 * @param type the type to set
	 */
	
	public void setType(int type) {
		this.type = type;
	}
	
	
	
}
