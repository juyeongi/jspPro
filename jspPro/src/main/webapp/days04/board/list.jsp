<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
	.material-symbols-outlined{
		vertical-align: text-bottom;
	}
</style>
<style>
/* .title {
   display: inline-block;
   white-space: nowrap;
   width: 90%;
   overflow: hidden;
   text-overflow: ellipsis;
}
 */</style>
</head>
<body>
<header class="sticky">
	<h1 class="main">
		<a href="#">home</a>
	</h1>
	<ul>
		<li> <a href="#">로그인</a> </li>
		<li> <a href="#">회원가입</a> </li>
	</ul>	
</header>
<h3>
	<span class="material-symbols-outlined">view_list</span>
	jsp days00
</h3>
<div>

	<xmp class="code">
		
	</xmp>
	<!-- <img src="../images/다운로드.jpg" style="width: 250px; height : 250px;"> -->
	<h2>목록보기</h2>
	<a href="<%=contextPath%>/cstvsboard/write.htm">글쓰기</a>
	<table>
		<thead>
		<tr>
           <th width="10%">번호</th>
           <th width="45%">제목</th>
           <th width="17%">작성자</th>
           <th width="20%">등록일</th>
           <th width="10%">조회</th>
         </tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${not empty list }">
					<c:forEach items="${list }" var= "dto">
					<tr>
					<td>${dto.seq }</td>
					<td class="title"><a href="<%=contextPath%>/cstvsboard/view.htm?seq=${dto.seq}">${ dto.title }</td>
					<td>${dto.writer }</td>
					<td>${dto.writedate }</td>
					<td>${dto.readed }</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5">등록된 게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" align="center">
				<div class="pagination">
				<c:if test="${pDto.prev}">
			<a href="<%=contextPath%>/cstvsboard/list.htm?currentpage=${pDto.start -1}">&lt;</a>
			</c:if>
			 	<c:forEach var="i" begin="${pDto.start }" end="${pDto.end }" step="1">
				<c:choose>
					<c:when test="${i eq pDto.currentPage }">
						<a href="#" class="active">${i}</a>
					</c:when>
					<c:otherwise>
					  <a href="<%=contextPath%>/cstvsboard/list.htm?currentpage=${i}">${i}</a>
					</c:otherwise>
				</c:choose>  
  </c:forEach>
  <c:if test="${pDto.next }">
  	<a href="<%=contextPath%>/cstvsboard/list.htm?currentpage=${pDto.end +1}">&gt;</a>
  </c:if>
</div>	
				</td>
			</tr>
			<tr>
        <td colspan="5" align="center">
       <!--  http://localhost/jspPro/cstvsboard/list.htm
        ?
        searchCondition=1
        &
        searchWord=%EB%B0%94%EB%B3%B4 -->
          <form method="get">
             <select name="searchCondition" id="searchCondition">
              <option value="1">title</option>
              <option value="2">content</option>
              <option value="3">writer</option>
              <option value="4">title+content</option>
            </select>
            <input type="text" name="searchWord" id="searchWord">
            <input type="submit" value="search">          
            
          </form>
        </td>
      </tr>
		</tfoot>
	</table>
</div>
<script>
	$(function () {
		//list.htm?write=success
		if('<%= request.getParameter("write")%>'=="success"){
			alert("글쓰기 완료~");
		}
	});
	$(function () {
		//list.htm?delete=success
		if('<%= request.getParameter("delete")%>'=="success"){
			alert("글삭제 완료~");
		}
	});
</script>
<!-- <script>
        let width = window.innerWidth;
        let height = window.innerHeight;

        function init() {
            for(let i=0; i<30; i++) {
                let div = document.createElement("div");
                div.style.position = 'absolute'
                div.style.left = Math.floor(Math.random()*width) + "px";
                div.style.top = Math.floor(Math.random()*height) + "px";
                div.innerHTML = "집가고싶다";
                document.getElementsByTagName("body")[0].appendChild(div);
            }
           
        }

        function moveSnow() {
            let div = document.getElementsByTagName("div");
            for(let i=0; i<div.length; i++) {
                div[i].style.top = (parseInt(div[i].style.top) + 20) + "px";
                if(parseInt(div[i].style.top) > height) {
                    div[i].style.top = "0px";
                }
            }
        }

        init();
        setInterval(moveSnow, 500);
    </script>  -->
<script>
	$("#searchCondition").val(${param.searchCondition});
	$("#searchWord").val("${param.searchWord}");
</script>
<script>
	$(".pagination a:not(.active)").attr("href", function(index, oldhref) {
    	return `\${oldhref}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
 	});
</script>
<script>
$(".title a").attr("href", function(index, oldhref) {
    return `\${oldhref}&currentpage=${param.currentpage}&searchCondition=${param.searchCondition}&searchWord=${param.searchWord}`;
 });
</script>
</body>
</html>