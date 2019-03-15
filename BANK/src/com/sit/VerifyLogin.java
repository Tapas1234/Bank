package com.sit;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VerifyLogin {
	public static boolean checkLogin(int account_no,String username,String password) throws ClassNotFoundException{
		boolean status=false;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","root");
			PreparedStatement ps=con.prepareStatement("Select * from newacc where account_no=? and username=? and password=?;");
			ps.setInt(1, account_no);
			ps.setString(2, username);
			ps.setString(3, password);
			ResultSet rs=ps.executeQuery();
			status=rs.next();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		return status;
		
	}

}
