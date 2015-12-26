package cn.edu.xmu.util;

import java.util.ArrayList;
import java.util.List;

public class Common {
	//TABLE
	public final static String TABLE_PERSON = "Person";
	public final static String TABLE_ROLE = "Role";
	public final static String TABLE_ARTICLE = "Article";
	public final static String TABLE_AUTH = "Auth";
	
	//role
	public final static int CODE_USER = 0;
	public final static int CODE_ARTIST = 5;
	public final static int CODE_EDITER = 10;
	public final static int CODE_MAINEDITER = 20;
	public final static int CODE_ADMIN = 50;
	public final static int CODE_SUPERARTIST = 100;
	
	//config
	public final static String PLAT_SRC = "L:/ArtMake/ArtMakePlat/WebContent/";
	public final static String ARTICLE_SRC = "images/article";
	public final static String PRODUCT_SRC = "images/product";
	
	//query
	public final static String HQL_LOGIN = "HQL_LOGIN";
	public final static String HQL_GET_PERSON_BYACCOUNT = "HQL_GET_PERSON_BYACCOUNT";
	public final static String HQL_ARTICLELIST_TODAY = "HQL_ARTICLELIST_TODAY";
	public final static String HQL_PRODUCTLIST_ING = "HQL_PRODUCTLIST_ING";
	public final static String HQL_PRODUCTLIST_NOTING = "HQL_PRODUCTLIST_NOTING";
	public final static String HQL_AUTH = "HQL_AUTH";
	public final static String HQL_PROACTION_TIME = "HQL_PROACTION_TIME";
	public final static String HQL_RECORDLIST_PERSON = "HQL_RECORDLIST_PERSON";
	public final static String HQL_ORDER_PERSON = "HQL_ORDER_PERSON";
	public final static String HQL_DEMANDLIST_ING = "HQL_DEMANDLIST_ING";
	public final static String HQL_ORDER_DEMAND = "HQL_ORDER_DEMAND";
	public final static String HQL_RECORDLIST_DEMAND = "HQL_RECORDLIST_DEMAND";
	
	//backstage query
	public final static String HQL_ARTICLELIST = "HQL_ARTICLELIST";
	public final static String HQL_INFOLIST_SELECT = "HQL_INFOLIST_SELECT";
	public final static String HQL_ADLIST_SELECT = "HQL_ADLIST_SELECT";
	public final static String HQL_ADCOUNT = "HQL_ADCOUNT";
	public final static String HQL_PERSONLIST = "HQL_PERSONLIST";
	public final static String HQL_PERSONLIST_SELECT = "HQL_PERSONLIST_SELECT";
	public final static String HQL_ROLELIST = "HQL_ROLELIST";
	public final static String HQL_ROLELIST_SELECT = "HQL_ROLELIST_SELECT";
	public final static String HQL_AUTHLIST = "HQL_AUTHLIST";
	public final static String HQL_AUTHLIST_SELECT = "HQL_AUTHLIST_SELECT";
	public final static String HQL_KEYLIST = "HQL_KEYLIST";
	public final static String HQL_KEYLIST_SELECT = "HQL_KEYLIST_SELECT";
	public final static String HQL_ROLELIST_CODE = "HQL_ROLELIST_CODE";
	public final static String HQL_ROLELIST_ROLENAME = "HQL_ROLELIST_ROLENAME";
	public final static String HQL_PRODUCTLIST = "HQL_PRODUCTLIST";
	public final static String HQL_PRODUCTLIST_SELECT = "HQL_PRODUCTLIST_SELECT";
	public final static String HQL_DEMANDLIST = "HQL_DEMANDLIST";
	public final static String HQL_DEMANDLIST_SELECT = "HQL_DEMANDLIST_SELECT";
	public final static String HQL_PROACTIONLIST = "HQL_PROACTIONLIST";
	public final static String HQL_PROACTIONLIST_SELECT = "HQL_PROACTIONLIST_SELECT";
	public final static String HQL_ORDERLIST = "HQL_ORDERLIST";
	public final static String HQL_PROORDERLIST_SELECT = "HQL_PROORDERLIST_SELECT";
	public final static String HQL_DEMORDERLIST_SELECT = "HQL_DEMORDERLIST_SELECT";
	public final static String HQL_PRORECORDLIST_BYID = "HQL_PRORECORDLIST_BYID";
	public final static String HQL_MESSAGELIST = "HQL_MESSAGELIST";
	public final static String HQL_MESSAGELIST_SELECT = "HQL_MESSAGELIST_SELECT";
	
	//common
	public final static int BACKSTAGE_PAGESIZE = 3;
	public final static int PAGESIZE = 6;
	public final static int MIN = -999999;
	public final static int MAX = 999999;
	public final static String DEFAULT_PASSWORD = "666666";
	public static boolean[] LOCK = new boolean[999999999];
	
	
}
