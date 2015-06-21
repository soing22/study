<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="title" content="IDR Group"><!--홈페이지이름 입력-->
<meta name="description" content="IDR Solution"><!--설명문 입력-->
<meta name="keywords" content="IDR"><!--키워드 입력-->
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<title><tiles:insertAttribute name="title" ignore="true" /></title>
<tiles:insertAttribute name="common" ignore="true" />
<noscript>
이 사이트의 기능을 모두 활용하기 위해서는 자바스크립트를 활성화 시킬 필요가 있습니다.<br />
<a href="http://www.enable-javascript.com/ko/" target="_blank">브라우저에서 자바스크립트를 활성화하는 방법</a>을 참고 하세요.
</noscript>
</head>

<body onload="javascript:set_button();">
	<br><br><br><br><br>
					<div class="contents">
						<tiles:insertAttribute name="body" ignore="true" />
					</div>
				
		<!-- //container -->
</body>
</html>
		
		