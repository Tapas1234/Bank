<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
			boolean status = VerifyLogin.checkLogin(account_no,username,password);
			  if(status == true){
	        	   out.println("Welcome  " + username +". Your account is deleted Successfully");
	        	   Class.forName("com.mysql.jdbc.Driver");
	   			//step 2:Build connection
	   			 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "root");
	        	   ps = con.prepareStatement("delete from newacc where account_no = ?;");
	        	   ps.setInt(1,account_no);
	        	   rs = ps.executeQuery();
	        	   if(rs.next()){

	        		    request.setAttribute("account_no","Your Account has deleted");
	        		    %>
	        		    <%
	        		    }
	        		       	
	        			else{
	        				out.print("Please check your username and password");
	        				}
			  			}
	        				request.setAttribute("account_no","Please check your username and password");
	        				%>
	        				
	        				<%}
  									catch(SQLException e){
    	       						e.printStackTrace();
        	   						}
           					catch(NumberFormatException e){
           					e.printStackTrace();
           					}
           
           %>
							</table>   
							       <%@ page import = "java.sql.*" %>
							       <%@ page import = "java.io.*" %>
							       <%@ page import = "javax.servlet.*"%>
							       <%@ page import = "com.sit.VerifyLogin" %>
</body>
</html>