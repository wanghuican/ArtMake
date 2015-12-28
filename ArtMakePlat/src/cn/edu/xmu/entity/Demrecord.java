
package cn.edu.xmu.entity;

import java.util.Date;


/**
  * @ClassName: Demrecord
  * @Description: TODO
  * team: 3-10打屁屁小队
  * @date 2015年12月14日 下午5:14:44
  */
public class DemRecord extends JsonEntity{
	
	/**
	  * @Fields record_id
	  */
	private int record_id;
	
	/**
	  * @Fields demand
	  */
	private Demand demand;
	
	/**
	  * @Fields person
	  */
	private Person person;
	
	/**
	  * @Fields message
	  */
	private String message;
	
	/**
	  * @Fields recordtime
	  */
	private Date recordtime;

	
	
	/**
	  * 创建一个新的实例 Demrecord. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  */
	
	public DemRecord() {
		super();
	}

	/**
	  * 创建一个新的实例 Demrecord. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param record_id
	  * @param demand
	  * @param person
	  * @param message
	  * @param recordtime
	  */
	
	public DemRecord(int record_id, Demand demand, Person person,
			String message, Date recordtime) {
		super();
		this.record_id = record_id;
		this.demand = demand;
		this.person = person;
		this.message = message;
		this.recordtime = recordtime;
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
	 * @return the demand
	 */
	
	public Demand getDemand() {
		return demand;
	}

	/**
	 * setter method
	 * @param demand the demand to set
	 */
	
	public void setDemand(Demand demand) {
		this.demand = demand;
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
	 * @return the message
	 */
	
	public String getMessage() {
		return message;
	}

	/**
	 * setter method
	 * @param message the message to set
	 */
	
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * getter method
	 * @return the recordtime
	 */
	
	public Date getRecordtime() {
		return recordtime;
	}

	/**
	 * setter method
	 * @param recordtime the recordtime to set
	 */
	
	public void setRecordtime(Date recordtime) {
		this.recordtime = recordtime;
	}

	@Override
	public String toJsonString() {
		// TODO Auto-generated method stub
		return "{\"record_id\":\"" + record_id + "\",\"demand\":\"" + demand
				+ "\",\"person\":\"" + person + "\",\"message\":\"" + message
				+ "\",\"recordtime\":\"" + recordtime + "\"}  ";
	}

	
}
