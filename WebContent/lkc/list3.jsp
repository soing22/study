<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="/blog2/dblist2.do" method="get">
�⺻15<input type="text" name="cnt" value="${cnt}" >page <input type="text"  name="num1"  value="${num1}">
<input type="submit" value="����">
<table>
<c:forEach  items="${dblist2}" var="a">
 <tr>
<td>${a.group1}</td>
<td>   ${a.group2}</td> 
 <td> ${a.group3}  </td>

 <td>     ${a.money1}  </td>
  <td>      ${a.money2} </td>
   <td>      ${a.money3}</td>

</tr>
</c:forEach>
</table>
<br/>
${pagingHtml}
</form>
</body>
</html>