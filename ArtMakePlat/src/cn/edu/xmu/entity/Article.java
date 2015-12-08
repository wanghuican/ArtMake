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
	  * @Fields image
	  */
	private String image;
	
	/**
	  * @Fields uptime : TODO（用一句话描述这个变量表示什么）
	  */
	private Date uptime;
	
	/**
	  * @Fields person : TODO（用一句话描述这个变量表示什么）
	  */
	private Person person;
	
	/**
	  * @Fields video
	  */
	private String video;
	
	
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
	  * @param image
	  * @param uptime
	  * @param person
	  * @param video
	  */
	
	public Article(int article_id, String title, String content, String image,
			Date uptime, Person person, String video) {
		super();
		this.article_id = article_id;
		this.title = title;
		this.content = content;
		this.image = image;
		this.uptime = uptime;
		this.person = person;
		this.video = video;
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
	
	
}
