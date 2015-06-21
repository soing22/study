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
	
	//수정
	function boardUpdate(){
		var url = contextRoot + "/boardWrite.do";
		var params = {
				procMode :	"update",
				boardNo	 :  "${boardView.boardNo}"
		};
		locationToPost(url, params);
	};
	
	//삭제
	function boardDelete(){
		if(!confirm("삭제 하시겠습니까?")){
			return false;
		}
		var url = contextRoot + "/boardDeleteAjax.do";
		var params = {
				boardNo	:	"${boardView.boardNo}"
		};
		$.ajax({
			url: url,
			type:"post",
			data:params,
			datatype:"json",
			success:function(data) {
				if(data.msg == "suc"){
					alert("삭제되었습니다.");
					location.href = contextRoot + "/boardList.do";
				}else{
					alert("삭제실패하였습니다.");
					return;
				}
			}
		});
	};
	
	//파일 다운로드
	function fileDownload(fileNo, ofileName){
		locationToPost(contextRoot + "/boardFileDownload.do", { fileNo : fileNo, ofileName : ofileName });
		
	};
	
	//답글쓰기
	function boardReply(){
		var url = contextRoot + "/boardWrite.do";
		var params = {
				procMode :	"reply",
				boardNo	 :  "${boardView.boardNo}"
		};
		locationToPost(url, params);
	};
	
	//댓글저장
	function boardComment(){
		
	};
	
</script>
<body class="jui">
<div>
	<!-- 버튼 시작 -->
	<div>
		<a href="javascript:boardReply();" class="btn btn-mini btn-black-purple"><span><span> 답글 </span></span></a>
		<a href="javascript:boardUpdate();" class="btn btn-mini btn-black-purple"><span><span> 수정 </span></span></a>
		<a href="javascript:boardDelete();" class="btn btn-mini btn-black-purple"><span><span> 삭제 </span></span></a>
		<a href="javascript:boardList();" class="btn btn-mini btn-black-purple"><span><span> 목록 </span></span></a>
	</div>
	<!-- //버튼 끝 -->

	<!-- 테이블 시작 -->
	<div>
		<table summary="게시글 상세" class="table table-classic">
			<caption>게시글 상세</caption>
			<colgroup>
				<col style="width:165px"/>
				<col style="width:325px"/>
				<col style="width:164px"/>
				<col style="width:325px"/>
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td>${boardView.boardTitle}</td>
					<th scope="row">조회수</th>
					<td>${boardView.readCount}</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${boardView.createUser}</td>
					<th scope="row">작성일</th>
					<td>${boardView.createDate}</td>
				</tr>
				<tr>
					<th scope="row">파일</th>
					<td colspan="3">
						<c:if test="${not empty fileList}">
						<c:forEach items="${fileList}" var="fileList">
<%-- 							<c:if test="${fileList.delYn eq 'N'}"> --%>
							<a href="javascript:fileDownload('${fileList.fileNo}', '${fileList.ofileName}');" >${fileList.ofileName}</a> <span>전송 수 : <c:out value="${fileList.downCount}"/></span>
<%-- 							</c:if> --%>
						</c:forEach>
						</c:if>
					</td>
				</tr>
				<tr height="50px;">
					<td colspan="4">
						<div>
							${boardView.boardContent}
						</div>
						<%-- <div>
							<textarea name="boardContent" id="boardContent" style="width: 100%; height: 200px"><c:out value="${noticeData.content}"/></textarea>
							<script>
							var editor = [];
							nhn.husky.EZCreator.createInIFrame({
								oAppRef: editor,
							    elPlaceHolder: "boardContent",
							    sSkinURI: (contextRoot + "/se2/SmartEditor2Skin.html"),
							    fCreator: "createSEditor2",
								htParams : {
									fOnBeforeUnload : function(){
									}
								}
							});
							</script>
						</div> --%>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- //테이블 끝 -->
	<br>
	<div>
		<textarea id="boardComment" name="boardComment" rows="3" cols="100" style="width: 95%"></textarea>
		<a href="javascript:boardComment();" class="btn btn-large btn-black-purple"><span><span> 등록 </span></span></a>
	</div>
</div>
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