<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="DBPKG.DAO"%>
<%@page import="java.sql.*"%>
<%@include file="certificated.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String m_no = request.getParameter("m_no");
//	String m_no1 = (m_no == null)?"":m_no;
	
	ArrayList<String[]> movieList = new ArrayList<String[]>();
	ArrayList<String[]> theaterList = new ArrayList<String[]>();
	
	try{
		//1. 연결

		conn = DAO.getConnection();
		String sql = "SELECT m_no, m_name, m_grade FROM movie";
		//2. 명령문보내기
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()){
			String[] movie = new String[11];
			movie[0] = rs.getInt("m_no") + "";
			movie[1] = rs.getString("m_name");
			movie[2] = rs.getString("m_grade");
			movieList.add(movie);
		}
		rs.close();
		ps.close();
		conn.close();
	
		if(m_no != null){
			//1. 연결
			conn = DAO.getConnection();
			String sql2 = "SELECT * FROM theater";
			//2. 명령문보내기
			ps = conn.prepareStatement(sql2);
			rs = ps.executeQuery();
			
			while(rs.next()){
				String[] theater = new String[4];
				theater[0] = rs.getInt("t_no") + "";
				theater[1] = rs.getString("t_name");
				theater[2] = rs.getString("t_address");
				theaterList.add(theater);
			}
			rs.close();
			ps.close();
			conn.close();
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화예매</title>
<link rel="stylesheet" href="css/style.css">

<style>
section{
	font-size: 1.2rem;
}
.ticket{	
	max-height: 500px;
	/* overflow: */
	margin-top: 100px;
}
.ticketBox{
	width: 100%;
	background-color: white;
	border-radius: 2rem;
}
.ticketHead{
	text-align: center;
}
.ticketList{
	padding: 15px;
	cursor: pointer;
}
.ticketList:hover{
	background: #c2c4c4;
}
@media screen and (min-width: 700px) {
	.ticket{
		display: flex;
		justify-content: center;
		align-items: center;
	}
}
</style>
</head>

<body>
<%@ include file="topmenu.jsp" %>
<section>

<div class="ticket">
	<div class="ticketBox">
		<div class="ticketHead"><h3>영화</h3></div>

		<%for(int i = 0; i < movieList.size(); i++) {%>
		<%String[] movie = movieList.get(i); %>	
		
		<div class="ticketList" onClick="location='ticketList.jsp?m_no=<%=movie[0]%>&u_no=<%=session_no%>' ">
		<img style="width:20px" src="img/A.png"> <%=movie[2]%><!-- 영화등급 -->
		<%=movie[1]%>
		</div>
	
		<%} %>
	</div>
	
		<div class="ticketBox">
		<div class="ticketHead"><h3>극장</h3></div>

		<%for(int i = 0; i < theaterList.size(); i++) {%>
		<%String[] theater = theaterList.get(i); %>	
		
		<div class="ticketList" onClick="location='ticketSeat.jsp?m_no=<%=m_no%>&u_no=<%=session_no%>&t_no=<%=theater[0] %>' ">
		<%=theater[1] %> - <%=theater[2] %>
		</div>
	
		<%} %>
	</div>
	
</div>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>