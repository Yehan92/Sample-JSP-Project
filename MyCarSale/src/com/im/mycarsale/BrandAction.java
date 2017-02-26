package com.im.mycarsale;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/brand_action")
public class BrandAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Read The Request
				String name = request.getParameter("name");
				
				try {
					String sql = "INSERT INTO brand (name) VALUES (?)";
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/dbcarsale";
					Connection con = DriverManager.getConnection(url, "root","123,");
					PreparedStatement ps = con.prepareStatement(sql);
					ps.setString(1, name);
					ps.executeUpdate();
					response.sendRedirect("brand_list.jsp");
				} catch (Exception e) {
					e.printStackTrace();
					
				}
	}

}
