<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建管理员</title>
</head>
<body>
<form action="personManage!createAdmin" method="post">
Account:
<input type="text" name="person.account"/>
<br/>
Password:"
<input type="password" name="person.password"/>
<br/>
Realname:
<input type="text" name="person.realname"/>
<br/>
Email:
<input type="text" name="person.email"/>
<br/>
Tell:
<input type="text" name="person.tel"/>
<br/>
Address:
<input type="text" name="person.address"/>
<br/>
Sex:
<input type="radio" name="person.sex" value="男"/>
<input type="radio" name="person.sex" value="女"/>
<br/>
QQ:
<input type="text" name="person.qq"/>
<br/>
<input type="submit" value="新建"/>
</form>
</body>
</html>