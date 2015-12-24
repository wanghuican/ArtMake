package cn.edu.xmu.action;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import cn.edu.xmu.entity.Article;
import cn.edu.xmu.entity.Person;
import cn.edu.xmu.entity.Product;
import cn.edu.xmu.entity.Proimg;
import cn.edu.xmu.service.PersonService;
import cn.edu.xmu.service.ProductService;
import cn.edu.xmu.util.Common;
import cn.edu.xmu.util.WebTool;

import com.opensymphony.xwork2.ActionSupport;

public class UploadProductAction extends ActionSupport {

	/**
	 * @Fields productService : 业务逻辑组件
	 */
	@Resource(name = "productService")
	ProductService productService;
	
	@Resource(name = "personService")
	PersonService personService;
	
	private File file1;
	private File file2;
	private File mainfile;
	private String file1FileName;
	private String file1ContentType;
	private String file2FileName;
	private String file2ContentType;
	private String mainfileFileName;
	private String mainfileContentType;
	private String pname;
	private String introduce;

	

	/**
	 * getter method
	 * @return the productService
	 */
	
	public ProductService getProductService() {
		return productService;
	}

	/**
	 * setter method
	 * @param productService the productService to set
	 */
	
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	/**
	 * getter method
	 * @return the personService
	 */
	
	public PersonService getPersonService() {
		return personService;
	}

	/**
	 * setter method
	 * @param personService the personService to set
	 */
	
	public void setPersonService(PersonService personService) {
		this.personService = personService;
	}

	
	
	/**
	 * getter method
	 * @return the file1
	 */
	
	public File getFile1() {
		return file1;
	}

	/**
	 * setter method
	 * @param file1 the file1 to set
	 */
	
	public void setFile1(File file1) {
		this.file1 = file1;
	}

	/**
	 * getter method
	 * @return the file2
	 */
	
	public File getFile2() {
		return file2;
	}

	/**
	 * setter method
	 * @param file2 the file2 to set
	 */
	
	public void setFile2(File file2) {
		this.file2 = file2;
	}

	/**
	 * getter method
	 * @return the mainfile
	 */
	
	public File getMainfile() {
		return mainfile;
	}

	/**
	 * setter method
	 * @param mainfile the mainfile to set
	 */
	
	public void setMainfile(File mainfile) {
		this.mainfile = mainfile;
	}

	/**
	 * getter method
	 * @return the file1FileName
	 */
	
	public String getFile1FileName() {
		return file1FileName;
	}

	/**
	 * setter method
	 * @param file1FileName the file1FileName to set
	 */
	
	public void setFile1FileName(String file1FileName) {
		this.file1FileName = file1FileName;
	}

	/**
	 * getter method
	 * @return the file1ContentType
	 */
	
	public String getFile1ContentType() {
		return file1ContentType;
	}

	/**
	 * setter method
	 * @param file1ContentType the file1ContentType to set
	 */
	
	public void setFile1ContentType(String file1ContentType) {
		this.file1ContentType = file1ContentType;
	}

	/**
	 * getter method
	 * @return the file2FileName
	 */
	
	public String getFile2FileName() {
		return file2FileName;
	}

	/**
	 * setter method
	 * @param file2FileName the file2FileName to set
	 */
	
	public void setFile2FileName(String file2FileName) {
		this.file2FileName = file2FileName;
	}

	/**
	 * getter method
	 * @return the file2ContentType
	 */
	
	public String getFile2ContentType() {
		return file2ContentType;
	}

	/**
	 * setter method
	 * @param file2ContentType the file2ContentType to set
	 */
	
	public void setFile2ContentType(String file2ContentType) {
		this.file2ContentType = file2ContentType;
	}

	/**
	 * getter method
	 * @return the mainfileFileName
	 */
	
	public String getMainfileFileName() {
		return mainfileFileName;
	}

	/**
	 * setter method
	 * @param mainfileFileName the mainfileFileName to set
	 */
	
	public void setMainfileFileName(String mainfileFileName) {
		this.mainfileFileName = mainfileFileName;
	}

	/**
	 * getter method
	 * @return the mainfileContentType
	 */
	
	public String getMainfileContentType() {
		return mainfileContentType;
	}

	/**
	 * setter method
	 * @param mainfileContentType the mainfileContentType to set
	 */
	
	public void setMainfileContentType(String mainfileContentType) {
		this.mainfileContentType = mainfileContentType;
	}

	/**
	 * getter method
	 * @return the pname
	 */
	
	public String getPname() {
		return pname;
	}

	/**
	 * setter method
	 * @param pname the pname to set
	 */
	
	public void setPname(String pname) {
		this.pname = pname;
	}

	/**
	 * getter method
	 * @return the introduce
	 */
	
	public String getIntroduce() {
		return introduce;
	}

	/**
	 * setter method
	 * @param introduce the introduce to set
	 */
	
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	@Override
	public String execute() throws Exception {
		Product product = new Product();
		List<Proimg> imgList = new ArrayList<Proimg>();
		product.setProductname(this.getPname());
		product.setIntroduce(this.getIntroduce());
		product.setPass(0);
		product.setState(0);
		product.setUptime(new Date());
		product.setPerson(WebTool.getSessionPerson());
	    Proimg proimg1 = new Proimg();
	    Proimg proimg2 = new Proimg();
	    Proimg mainproimg = new Proimg();
	    if(!WebTool.StringisNullOrEmpty(getFile1FileName())){
	    	proimg1.setFlag(0);
	    	String newfilename = upFile(getFile1(),getFile1FileName());
	    	proimg1.setImage(newfilename);
	    	proimg1.setProduct(product);
	    	upFile(getFile1(),getFile1FileName());
	    	imgList.add(proimg1);
	    }
	    if(!WebTool.StringisNullOrEmpty(getFile2FileName())){
	    	proimg2.setFlag(0);
	    	String newfilename = upFile(getFile2(),getFile2FileName());
	    	proimg2.setImage(newfilename);
	    	proimg2.setProduct(product);
	    	imgList.add(proimg2);
	    }
	    if(!WebTool.StringisNullOrEmpty(getMainfileFileName())){
	    	mainproimg.setFlag(1);
	    	String newfilename = upFile(getMainfile(),getMainfileFileName());
	    	mainproimg.setImage(newfilename);
	    	mainproimg.setProduct(product);
	    	imgList.add(mainproimg);
	    }
	    product.setImageList(imgList);
	    productService.saveProduct(product);
		WebTool.confirmMessage("继续上传艺术品？", "product!goUploadProduct",
				"person!goInfo");
		return null;
	}


	public String upFile(File file,String filename) throws IOException{
		// System.out.println(times.toString());

		String path = Common.PLAT_SRC + Common.PRODUCT_SRC;
		if(!WebTool.StringisNullOrEmpty(filename)){
		String suffix = filename.substring(
				filename.indexOf("."), filename.length());
		String newfilename = System.currentTimeMillis() + suffix;
		WebTool.upFile(path, newfilename, file);
		return newfilename;
		}
		return "";
	}
	
	
}
