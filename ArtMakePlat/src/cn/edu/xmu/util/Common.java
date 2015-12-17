package cn.edu.xmu.util;

public class Common {
	//TABLE
	public final static String TABLE_PERSON = "Person";
	public final static String TABLE_ROLE = "Role";
	public final static String TABLE_ARTICLE = "Article";
	
	
	//role_code
	public final static int CODE_USER = 0;
	public final static int CODE_ARTIST = 5;
	public final static int CODE_EDITER = 10;
	public final static int CODE_MAINEDITER = 20;
	public final static int CODE_ADMIN = 50;
	public final static int CODE_SUPERARTIST = 100;
	
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
	public final static String HQL_ADCOUNT = "HQL_ADCOUNT";
	public final static String HQL_PERSONLIST = "HQL_PERSONLIST";
	public final static String HQL_PERSONLIST_SELECT = "HQL_PERSONLIST_SELECT";
	
	//common
	public final static int BACKSTAGE_PAGESIZE = 10;
	public final static int PAGESIZE = 6;
}
