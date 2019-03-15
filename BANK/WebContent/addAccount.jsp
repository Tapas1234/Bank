<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>
   <%@page import="java.io.*" %>
   <%@page import="javax.servlet.*"%>
   <%@page import="javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;
	try{		
			//String acc=request.getParameter("acc");
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String address=request.getParameter("address");
			int amount=Integer.parseInt(request.getParameter("amount"));
			int phone=Integer.parseInt(request.getParameter("phone"));
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
			String strSQL="insert into newacc(username,password,address,amount,phone)values(?,?,?,?,?);";
			PreparedStatement pstmt=con.prepareStatement(strSQL);
			pstmt.setString(1,username);
			pstmt.setString(2, password);
			pstmt.setString(3, address);
			pstmt.setInt(4, amount);
			pstmt.setInt(5, phone);
			
			if(pstmt.executeUpdate()==0){
				out.println("Insertion failed");
			}
			else{
				out.println("Record inserted");	
			}
	}catch(SQLException e){
		e.printStackTrace();
	}
	catch(NumberFormatException e){
		e.printStackTrace();
	}

%>

</body>
</html>