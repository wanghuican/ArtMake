package cn.edu.xmu.util;

public class Common {
	//TABLE
	public final static String TABLE_PERSON = "Person";
	public final static String TABLE_ROLE = "Role";
	public final static String TABLE_ARTICLE = "Article";
	
	//ROLE
	public final static String ROLE_YONGHU = "用户";
	public final static String ROLE_YISHUJIA1 = "低级艺术家";
	public final static String ROLE_YISHUJIA2 = "初级艺术家";
	public final static String ROLE_YISHUJIA3 = "中级级艺术家";
	public final static String ROLE_YISHUJIA4 = "高级艺术家";
	public final static String ROLE_YISHUJIA5 = "顶级艺术家";
	public final static String ROLE_CAIBIAN = "采编人员";
	public final static String ROLE_ZHUBIAN = "主编人员";
	public final static String ROLE_ADMIN = "管理员";
	public final static String ROLE_SUPERADMIN = "超级管理员";
	
	//config
	public final static String PLAT_SRC = "L:/ArtMake/ArtMakePlat/WebContent/";
	public final static String ARTICLE_SRC = "images/article";
	
	//query
	public final static String HQL_LOGIN = "HQL_LOGIN";
	public final static String HQL_GET_PERSON_BYACCOUNT = "HQL_GET_PERSON_BYACCOUNT";
	public final static String HQL_ARTICLELIST_TODAY = "HQL_ARTICLELIST_TODAY";
	
	//backstage query
	public final static String HQL_ARTICLELIST = "HQL_ARTICLELIST";
	public final static String HQL_INFOLIST_SELECT = "HQL_INFOLIST_SELECT";
	public final static String HQL_ADLIST_SELECT = "HQL_ADLIST_SELECT";
	
	//common
	public final static int BACKSTAGE_PAGESIZE = 10;
	public final static int PAGESIZE = 6;
}
