package myservletpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.jdbc.driver.OracleDriver;

/**
 * Servlet implementation class myservlet
 */
@WebServlet("/add_book")
public class add_book extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public add_book() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		
		try {
			Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			Statement stmt = con.createStatement();

			String hide_id = request.getParameter("hide_id");

			if (!(hide_id.equals(""))) {

				String query1 = "delete from book_details where id=" + hide_id + "";
				stmt.executeQuery(query1);
				stmt.close();
				con.close();
				request.setAttribute("title", "--- Book has been Successfully removed ----");
				request.setAttribute("url",
						"http://localhost:9090/library_project/jsp/button_controls_jsp/remove_book.jsp");
				request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);

			} else {
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			request.setAttribute("title", "--- Book Deletion fail ----");
			request.setAttribute("url",
					"http://localhost:9090/library_project/jsp/button_controls_jsp/remove_book.jsp");
			request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();

		/*
		 * session.setAttribute("book_title",
		 * request.getParameter("book_title")); session.setAttribute("price",
		 * request.getParameter("price")); session.setAttribute("pages",
		 * request.getParameter("pages")); session.setAttribute("strt_book_id",
		 * request.getParameter("strt_book_id"));
		 * session.setAttribute("end_book_id",
		 * request.getParameter("end_book_id"));
		 * session.setAttribute("purchase_date",
		 * request.getParameter("purchase_date"));
		 * session.setAttribute("branch_name",
		 * request.getParameter("branch_name"));
		 */

		try {
			System.out.println("enter in the post");
			Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");

			int diff = 0, strt1 = 0, end1 = 0;
			String end = request.getParameter("end_book_id");
			String strt = request.getParameter("strt_book_id");
			System.out.println(strt);
			if (end.length() > 0 || strt.length() > 0) {
				strt1 = Integer.parseInt(strt);
				end1 = Integer.parseInt(end);
				diff = end1 - strt1 + 1;
			}
			int count = 0;
			for (int i = strt1; i <= end1; i++) {
				String query = "insert into book_details(title ,auther ,publisher ,price ,pages,category,id,end_id,purchase_Date ,branch,book_count,ad_comment)  values( ?,?,?,?,?,?,?,?,?,?,?,?) ";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, request.getParameter("book_title"));
				ps.setString(2, request.getParameter("auther"));
				ps.setString(3, request.getParameter("publisher"));
				ps.setString(4, request.getParameter("price"));
				ps.setString(5, request.getParameter("pages"));
				ps.setString(6, request.getParameter("category"));
				ps.setInt(7, i);
				ps.setString(8, request.getParameter("end_book_id"));
				ps.setString(9, request.getParameter("purchase_date"));
				ps.setString(10, request.getParameter("branch_name"));

				ps.setInt(11, diff);
				ps.setString(12, request.getParameter("ad_comment"));
				count = ps.executeUpdate();
			}

			if (count > 0) {
				String title = "Book details  has been successfully Added !";
				request.setAttribute("title", title);
				request.setAttribute("url",
						"http://localhost:9090/library_project/jsp/button_controls_jsp/add_book.jsp");
				request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);
			} else if (!(count > 0)) {
				String title = "-- Book details  Updation Fail !--";
				request.setAttribute("title", title);
				request.setAttribute("url",
						"http://localhost:9090/library_project/jsp/button_controls_jsp/add_book.jsp");
				request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			String title = "-- Book details  Updation Fail !--";
			request.setAttribute("title", title);
			request.setAttribute("url", "http://localhost:9090/library_project/jsp/button_controls_jsp/add_book.jsp");
			e.printStackTrace();
			System.out.println(e);
		}
	}
}