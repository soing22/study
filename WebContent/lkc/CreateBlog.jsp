<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
    <script src="/blog2/common/bower_components/webcomponentsjs/webcomponents-lite.min.js"></script>
    <link rel="import" href="/blog2/common/elements/juielements.jsp">

<body class="jui">
  <div id=container>
  <div class="left">
   <ul>
   <c:forEach items="${blogList}" var="a">  
   <li> ${a.blog_title}1 </li>
   </c:forEach>


</ul>
   </div>
   <div class="right">
    <p>
	<a class="btn btn-normal btn-purple">Default button</a>
	<a class="btn btn-normal btn-gray">Default button</a>
</p>
   </div>
   
   </div>

</body>
<script>
jui.ready([ "ui.layout" ], function(layout) {
	layout_1 = layout("#container", {
		width: "auto",
		height: 300,
		left: {
			size: 100,
			min: 100,
			max: 300,
			resize: true
			
		},
		
		right: {
			size: 100,
			min: 100,
			max: 300,
			resize: true
		}
	});
});
</script>
</html>