package com.im.mycarsale;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Carload
 */
@WebServlet("/carload")
public class Carload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Carload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(request.getParameter("limit2"));
		String p=request.getParameter("limit2");
		String q=request.getParameter("limit1");
		String sql = "SELECT * FROM car limit "+p+", "+q+" ";
		//String sql2 = "select count(*) as c from car";
		System.out.println(sql);
		try {

		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/carsale";
		Connection con;
					con = DriverManager.getConnection(url, "root","123,");
					Statement st=con.createStatement();
					ResultSet rs=st.executeQuery(sql);
			
			ArrayList<HashMap<String, String>> cars=new ArrayList<HashMap<String, String>>();
			
			while(rs.next()){
				HashMap<String, String> car=new HashMap<String, String>();
				String id = rs.getString("id");
				String title = rs.getString("title");
				String description = rs.getString("description");
				String price = rs.getString("price");
				String photo = rs.getString("photo");
				
				car.put("title", title);
				car.put("dis", description);
				car.put("price", price);
				
				cars.add(car);
			}
			
			String carlist=JSONHelper.convertToJsonObjectSet(cars);		
			response.getWriter().write(carlist);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
