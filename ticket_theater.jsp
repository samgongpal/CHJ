<%@page import="java.util.*"%>
<%@page import="DBPKG.DAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String m_no = request.getParameter("m_no");
	String u_no = request.getParameter("u_no");

	ArrayList<String[]> theaterList = new ArrayList<String[]>();
	
	try{
		
		//1 연결
		conn = DAO.getConnection();
		String sql = "SELECT * FROM THEATER";
		//2 명령문보내기
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		while(rs.next()){
			String[] theater = new String[4];
			theater[0] = rs.getInt("t_no") + "";
			theater[1] = rs.getString("t_name");
			theater[2] = rs.getString("t_address");
			theater[3] = rs.getInt("t_list") + "";
			theaterList.add(theater);
		}
		rs.close();
		ps.close();
		conn.close(); 
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<div align="center">
	<h2>빠른예매_극장선택</h2>
	<table border="1">
		<tr>
			<td rowspan="10" align="center">극장</td>
		<%for(int i = 0; i < theaterList.size(); i++) {%>
		<%String[] theater = theaterList.get(i); %>	
			<td align="center"><%=theater[1] %></td>
			<td align="center">
			<a href="ticket_seat.jsp?m_no=<%=m_no %>&u_no=<%=u_no %>&t_no=<%=theater[0]%>">
			<%=theater[2] %>점</a></td>
		</tr>
		<%} %>
	</table>
</div>

