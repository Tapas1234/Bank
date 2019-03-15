<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
		<table><%
		
			Connection con= null;
			PreparedStatement ps=null;
           ResultSet rs=null;
           try{
           int account_no=Integer.parseInt(request.getParameter("account_no"));
           String username = request.getParameter("username");
           String password = request.getParameter("password");
           System.out.print(username + "\n" + password); 
           Class.forName("com.mysql.jdbc.Driver");
			//step 2:Build connection
			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
           boolean status = VerifyLogin.checkLogin(account_no,username,password);
           if(status == true){
        	   out.println("Welcome" + username);
        	   ps = con.prepareStatement("Select * from newacc where account_no = ?;");
        	   ps.setInt(1,account_no);
        	   rs = ps.executeQuery();
        	   out.print("<table align= 'left' cellspacing ='5' cellpadding='5'");
        	   out.print("<tr ><th>acc_no</th><th>user_name</th><th>balance</th></tr>");
        	   while(rs.next()){
        		   int acc_no= rs.getInt(1);
        		   session.setAttribute("acc_no",acc_no);
        		   
        		   out.print("<tr>");
        		   out.print("<td>" + rs.getString(1) + "</td>");
        		  out.print("<td>" + rs.getString(2) + "</td>");
        		   out.print("<td>" + rs.getInt(5)+ "</td>");
        		   out.print("</tr>");
        	   }
        	   
        	   out.print("</table>");
        	   
        	   
           }
           
           else {
        	   out.print("Please check your username and password");
        	   
        	   request.setAttribute("balance","please check your username and password");
           %>
           <%
           		}
           }
           
           				catch(SQLException e){
           					e.printStackTrace();
           				}
							catch(NumberFormatException e){
								e.printStackTrace();
							}
           %>
           			</table>
           	<%@ page import ="java.sql.*" %>
           	<%@ page import = "java.io.*" %>
           	<%@ page import = "javax.servlet.*" %>
           	<%@ page import = "com.sit.VerifyLogin" %>
           