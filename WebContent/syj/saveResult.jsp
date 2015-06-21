<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
	alert("<c:out value='${result}'/>");
	if(typeof parent.completeSave === 'function'){
		parent.completeSave("${resultCd}","${boardNo}");
	}
</script>
