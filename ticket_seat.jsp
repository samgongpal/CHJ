<%@page import="java.util.*"%>
<%@page import="DBPKG.DAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	//ticket_seatPro로 값 넘기기??
	String m_no = request.getParameter("m_no");
	String u_no = request.getParameter("u_no");
	String t_no = request.getParameter("t_no");
	
	
	//받아온 영화관번호를 통해 상영관개수를 얻어서 해당 상영관의 좌석 개수를 구하기
%>

<script>
function checkAll(){
	var obj = document.form;
	
	if(obj.sno.value == ""){
		alert("학생번호가 입력되지 않았습니다!");
		obj.sno.focus();
		return false;
	}
}
</script>

<!--
<script>
var orgBColor = '#ffffff';
var orgTColor = '#000000';

function HighLightTd(target, backColor,textColor) {
	var tbody = target.parentNode;
	var tds = tbody.getElementsByTagName('td');
	for(var i = 0; i < tds.length; i++){
		if ( tds[i] != target ) {
			tds[i].style.backgroundColor = orgBColor;
			tds[i].style.color = orgTColor;
		} else {
			tds[i].style.backgroundColor = backColor;
			tds[i].style.color = textColor;
		}
	}
}
</script>
-->

<div align="center">
	<h2>빠른예매_좌석선택</h2>
	<form name="form" action="ticket_seatPro.jsp" method="post" onsubmit="return checkAll()">
		<table border="1">
			<tr>			
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
			</tr>
			<tr>			
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
			</tr>
			<tr>			
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
			</tr>
			<tr>			
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
			</tr>
			<tr>			
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
				<td width="50px" height="50px" align="center"><input type="checkbox"></td>
			</tr>
			<tr>			
				<td colspan="5" align="center"><input type="submit"  value="선택완료"></td>									
			</tr>
		</table>
	</form>
</div>
