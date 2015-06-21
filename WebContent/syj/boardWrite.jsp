<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/tlds/CustomUtil" prefix="fnlb" %>
<!-- jquery 관련 -->
<script type="text/javascript" src="${fnlb:fnContextPathNormalize(pageContext.request)}/jquery-1.11.0.min.js"></script> 
<!-- Smart Editor 2.0 -->
<script type="text/javascript" src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<link rel="stylesheet" href="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/jui.css" />
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/lib/jquery-1.8.0.min.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/lib/jquery.binder.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/base.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/core.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/ui/dropdown.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/ui/modal.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/uix/table.js"></script>
<script src="${fnlb:fnContextPathNormalize(pageContext.request)}/common/jui-develop/js/uix/xtable.js"></script>

<script type="text/javascript">

	var contextRoot = "${fnlb:fnContextPathNormalize(pageContext.request)}";
 	//목록
	function boardList(){
		location.href = contextRoot + "/boardList.do";
	};
	
	//게시글 저장
	function boardSave(){
		
		editor[0].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용된다.

		//유효성 체크
		var boardContent = $.trim($("#boardContent").val());
		if($("#boardTitle").val() == null || $("#boardTitle").val() == ""){
			alert("제목을 입력해주세요.");
			$("#boardTitle").focus();
			return;
		}
		if(boardContent == "<p>&nbsp;</p>" || boardContent == "" || boardContent == "<br>"){
			alert("내용을 입력해주세요.");
			$("#boardContent").focus();
			return false;
		}
		
		
		//boardSaveAjax
		var ofileName =  $("#files").val().substr($("#files").val().lastIndexOf("\\")+1);
		$("#ofileName").val(ofileName);
		
		var frm = document.editForm;
		frm.action = contextRoot + "/boardSaveAjax.do";
		frm.target = "saveResult";
		frm.submit();
		/* 
		$.ajax({
			url: url,
			type:"post",
			data:$("form[name=editForm]").serializeArray(),
			datatype:"json",
			success:function(data) {
				var msg = data.msg;
				var procMode = data.procMode;
				if(procMode == "insert" && msg == "suc"){
					alert("저장되었습니다.");
					var url = contextRoot + "/boardView.do";
					var params = {
							boardNo	:	data.boardNo
					};
					locationToPost(url, params);
				}else if(procMode == "insert" && msg == "fail"){
					alert("저장실패하였습니다.");
					return;
				}else if(procMode == "update" && msg == "suc"){
					alert("수정되었습니다.");
					var url = contextRoot + "/boardView.do";
					var params = {
							boardNo	:	data.boardNo
					};
					locationToPost(url, params);
				}else if(procMode == "update" && msg == "fail"){
					alert("수정실패하였습니다.");
					return;
				}
			}
		}); */
	};
	
	//저장 완료 처리
	completeSave = function(resultCd, boardNo){
		var url = contextRoot + "/boardView.do";
		var params = {
				boardNo	:	boardNo
		};
		locationToPost(url, params);
	};
	
	//파일 다운로드
	function fileDownload(fileNo, ofileName){
		locationToPost(contextRoot + "/boardFileDownload.do", { fileNo : fileNo, ofileName : ofileName });
		
	};
	
</script>
<body class="jui">
<form name="editForm" method="post" enctype="multipart/form-data">
<input type="hidden" id="boardNo" name="boardNo" value="${boardNo}">
<input type="hidden" id="procMode" name="procMode" value="${procMode}">
<input type="hidden" id="ofileName" name="ofileName">
<div>
	<!-- 버튼 시작 -->
	<div>
		<c:if test="${procMode eq 'update'}">
			<a href="javascript:boardSave();" class="btn btn-mini btn-black-purple"><span><span> 수정 </span></span></a>
		</c:if>
		<c:if test="${procMode eq 'insert'}">
			<a href="javascript:boardSave();" class="btn btn-mini btn-black-purple"><span><span> 저장 </span></span></a>
		</c:if>
		<c:if test="${procMode eq 'reply'}">
			<a href="javascript:boardSave();" class="btn btn-mini btn-black-purple"><span><span> 저장 </span></span></a>
		</c:if>
		<a href="javascript:boardList();" class="btn btn-mini btn-black-purple"><span><span> 목록 </span></span></a>
	</div>
	<!-- //버튼 끝 -->

	<!-- 테이블 시작 -->
	<div>
		<table summary="게시판 등록" class="table table-classic">
				<c:if test="${procMode eq 'update'}">
					<caption>게시판 수정</caption>
				</c:if>
				<c:if test="${procMode eq 'insert'}">
					<caption>게시판 등록</caption>
				</c:if>
				<c:if test="${procMode eq 'reply'}">
					<caption>게시판 답글</caption>
				</c:if>
			<colgroup>
				<col style="width:165px"/>
				<col style="width:325px"/>
				<col style="width:164px"/>
				<col style="width:325px"/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">
						<c:choose>
							<c:when test="${procMode eq 'reply'}">
							<span style="width: 5%;">[답글]</span> <input type="text" style="width: 95%;" id="boardTitle" name="boardTitle" value="${boardTitle}">
							</c:when>
							<c:otherwise>
							<input type="text" style="width: 100%;" id="boardTitle" name="boardTitle" value="${boardTitle}">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td id="createUser">${createUser}</td>
					<th scope="row">작성일</th>
					<td id="createDate">${createDate}</td>
				</tr>
				<tr>
					<th scope="row">파일</th>
					<td colspan="3">
						<c:if test="${not empty fileList and procMode eq 'update'}">
						<c:forEach items="${fileList}" var="fileList">
<%-- 							<c:if test="${fileList.delYn eq 'N'}"> --%>
							<a href="javascript:fileDownload('${fileList.fileNo}', '${fileList.ofileName}');" >${fileList.ofileName}</a>
<%-- 							</c:if> --%>
						</c:forEach>
						</c:if>
						<input type="file" id="files" name="files" multiple /><br>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<%-- <div class="editView">
							<textarea rows="10" cols="150" id="boardContent">${noticeData.content}</textarea>
						</div> --%>
						<div>
							<textarea id="boardContent" name="boardContent" style="width: 100%; height: 200px"><c:out value="${boardContent}"/></textarea>
							<script>
							var editor = [];
							nhn.husky.EZCreator.createInIFrame({
								oAppRef: editor,
							    elPlaceHolder: "boardContent",
							    sSkinURI: (contextRoot + "/common/se2/SmartEditor2Skin.html"),
							    fCreator: "createSEditor2",
								htParams : {
									fOnBeforeUnload : function(){
									}
								}
							});
							</script>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- //테이블 끝 -->

</div>
</form>
<iframe name="saveResult" height="0" frameborder="0"></iframe>
</body>
<script type="text/javascript">
// Post Submit (window.location.href)
function locationToPost(url, params) 
{
	var temp=document.createElement("form");
	temp.action = url;
	temp.method = "POST";
	temp.style.display = "none";
	for(var x in params) {
		var opt = document.createElement("textarea");
		opt.name = x;
		opt.value = params[x];
		temp.appendChild(opt);
	}
	
	document.body.appendChild(temp);
	temp.submit();
	return temp;
};
</script>