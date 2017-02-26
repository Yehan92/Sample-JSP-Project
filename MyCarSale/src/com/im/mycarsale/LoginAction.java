package com.im.mycarsale;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login_action")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Read The Request
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		try {
			String sql = "SELECT * FROM member WHERE email=? AND password=?";
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/dbcarsale";
			Connection con = DriverManager.getConnection(url, "root","123,");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			HttpSession session = request.getSession();
			if(rs.next()){
				//Login Success
				
				session.setAttribute("login", true);
				
				String post =rs.getString("post");
				session.setAttribute("post", post);

				String name =rs.getString("name");
				session.setAttribute("name", name);
				
				String id =rs.getString("id");
				session.setAttribute("id", id);
				
				response.sendRedirect("index.jsp");
			}else{
				//Login Fail

				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
