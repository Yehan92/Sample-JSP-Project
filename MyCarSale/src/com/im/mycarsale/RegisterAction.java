package com.im.mycarsale;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/register_action")
public class RegisterAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Read The Request
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String tp = request.getParameter("tp");
		String password = request.getParameter("password");
		
		try {
			String sql = "INSERT INTO member (name,email,tp,password,post) VALUES (?,?,?,?,?)";
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/dbcarsale";
			Connection con = DriverManager.getConnection(url, "root","123,");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, tp);
			ps.setString(4, password);
			ps.setString(5, "m");
			ps.executeUpdate();
			response.sendRedirect("thankyou.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
