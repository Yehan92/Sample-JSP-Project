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
import javax.servlet.http.HttpSession;

@WebServlet("/car_action")
public class CarAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Read The Request
		String model = request.getParameter("model");
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String photo = request.getParameter("photo");
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("id");
				
		try {
			String sql = "INSERT INTO car (title,description, price, photo, model_id, member_id) "
					+ " VALUES (?,?,?,?,?,?)";
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/dbcarsale";
			Connection con = DriverManager.getConnection(url, "root","123,");
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, description);
			ps.setString(3, price);
			ps.setString(4, photo);
			ps.setString(5, model);
			ps.setString(6, memberId);
			ps.executeUpdate();
			response.sendRedirect("index.jsp");
		} catch (Exception e) {
			e.printStackTrace();
					
		}
	}

}
