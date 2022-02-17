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

	try{
		
		//1 연결
		conn = DAO.getConnection();
		String sql = "SELECT SUBSTR(u_birth,1,4) FROM muser where u_no ="+u_no;
		//2 명령문보내기
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR); // 이번년도(생년월일 계산)
		
		if(rs.next()){
			int birth = Integer.parseInt(rs.getString("u_birth"));
			int age = y-birth; //나이 A=전체 B=15 C=19
		}
		rs.close();
		ps.close();
		conn.close();
		
		/*관람등급비교
		if(age < 15){
			
		}*/
		/*String sql2 = "select M.m_name FROM reservation R,movie M WHERE R.m_no = M.m_no";*/
	
	}catch(Exception e){
		e.printStackTrace();
	}
%>