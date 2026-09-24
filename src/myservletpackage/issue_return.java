package myservletpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.jdbc.driver.OracleDriver;

/**
 * Servlet implementation class login2
 */
@WebServlet("/issue_return")
public class issue_return extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public issue_return() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String stu_id = request.getParameter("stu_id");
		String book_id = request.getParameter("hide_book");
		String invalid_stu = "";
		int count = 0;
		int count1 = 0;
		String query = "";
		try {

			Driver d = new OracleDriver();
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			Statement stmt = con.createStatement();

			String query1 = "select * from book_details where id=" + book_id + " ";
			String get_issue_id = "";
			ResultSet rs1 = stmt.executeQuery(query1);
			while (rs1.next()) {
				count1++;
				request.setAttribute("title", "Title : " + rs1.getString(4).toUpperCase());
				request.setAttribute("auther_name", "Auther Name : " + rs1.getString(5).toUpperCase());
				request.setAttribute("publisher", "Publisher Name : " + rs1.getString(6).toUpperCase());
				request.setAttribute("category", "Category : " + rs1.getString(13).toUpperCase());
				request.setAttribute("price", "Price : " + rs1.getInt(7));
				request.setAttribute("branch", "Branch : " + rs1.getString(12).toUpperCase());
				request.setAttribute("issue_status", rs1.getString(10));
				if (rs1.getString(10) == null || rs1.getString(10) == "") {

				} else {
					request.setAttribute("issue_id", "Issue ID : " + rs1.getString(10));
					get_issue_id = rs1.getString(10).toString();
					request.setAttribute("issue_date", "Issue Date : " + rs1.getString(15));
					request.setAttribute("return_date", "Return Date : " + rs1.getString(16));
				}
				request.setAttribute("book_id", book_id);
				request.setAttribute("book_id1", "Book ID : " + book_id);

			}
			rs1.close();

			// student and employee id configuration
			if (!(get_issue_id.equals(""))) {
				if (!(get_issue_id.equals(stu_id))) {

					invalid_stu = "Student/Emp. ID not Match..";
				} else if ((get_issue_id.equals(stu_id))) {

					if (stu_id.contains("WCTM") == true) {
						query = "select * from employee where id='" + stu_id + "' ";
					} else {
						query = "select * from student where id='" + stu_id + "' ";
					}
					System.out.println(query);
					ResultSet rs = stmt.executeQuery(query);
					while (rs.next()) {
						count++;

						if (stu_id.contains("WCTM") == true) {
							request.setAttribute("student_id", "ID : " + rs.getString(1));
						} else {
							request.setAttribute("student_id", "ID : " + rs.getInt(1));
						}

						request.setAttribute("stu_name", "NAME : " + rs.getString(2).toUpperCase());
						request.setAttribute("stu_branch", "BRANCH : " + rs.getString(5).toUpperCase());
						request.setAttribute("image", rs.getString(7));
						request.setAttribute("stu_id", stu_id);
					}
					rs.close();
				}

			} else {

				if (stu_id.contains("WCTM") == true) {
					query = "select * from employee where id='" + stu_id + "' ";
				} else {
					query = "select * from student where id='" + stu_id + "' ";
				}
				System.out.println(query);
				ResultSet rs = stmt.executeQuery(query);
				while (rs.next()) {
					count++;

					if (stu_id.contains("WCTM") == true) {
						request.setAttribute("student_id", "ID : " + rs.getString(1));
					} else {
						request.setAttribute("student_id", "ID : " + rs.getInt(1));
					}

					request.setAttribute("stu_name", "NAME : " + rs.getString(2).toUpperCase());
					request.setAttribute("stu_branch", "BRANCH : " + rs.getString(5).toUpperCase());
					request.setAttribute("image", rs.getString(7));
					request.setAttribute("stu_id", stu_id);
				}
				rs.close();
				if (!(count > 0)) {

					invalid_stu = "Student/Employee ID Not Found";

				} else if (!(count1 > 0)) {
					request.setAttribute("invalid", "Book ID Not Found");
				}
			}
			stmt.close();
			con.close();
			request.setAttribute("invalid_stu", invalid_stu);
			request.getRequestDispatcher("jsp/button_controls_jsp/issue_return_book.jsp").forward(request, response);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			String book_id = request.getParameter("book_id");
			String stu_id = request.getParameter("stu_id");
			Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			Statement stmt = con.createStatement();
			int count = 0;

			System.out.println("enter if-1");
			String query = "select * from book_details where id=" + book_id + " ";
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				count++;
				request.setAttribute("title", "Title : " + rs.getString(4).toUpperCase());
				request.setAttribute("auther_name", "Auther Name : " + rs.getString(5).toUpperCase());
				request.setAttribute("publisher", "Publisher Name : " + rs.getString(6).toUpperCase());
				request.setAttribute("category", "Category : " + rs.getString(13).toUpperCase());
				request.setAttribute("price", "Price : " + rs.getInt(7));
				request.setAttribute("branch", "Branch : " + rs.getString(12).toUpperCase());
				if (rs.getString(10) == null || rs.getString(10) == "") {

				} else {
					request.setAttribute("issue_id", "Issue ID : " + rs.getString(10));
					request.setAttribute("issue_date", "Issue Date : " + rs.getString(15));
					request.setAttribute("return_date", "Return Date : " + rs.getString(16));
				}
				request.setAttribute("book_id", book_id);
				System.out.println("enter if-2");
			}
			rs.close();
			con.close();
			if (!(count > 0)) {
				request.setAttribute("invalid", "Book ID Not Found");
			}
			request.getRequestDispatcher("jsp/button_controls_jsp/issue_return_book.jsp").forward(request, response);
			// response.sendRedirect("jsp/button_controls_jsp/issue_return_book.jsp");

		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.println(e1);
			response.sendRedirect("jsp/button_controls_jsp/issue_return_book.jsp");
		}

	}

}
