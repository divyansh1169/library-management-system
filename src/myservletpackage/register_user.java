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
import javax.servlet.http.HttpSession;

import oracle.jdbc.driver.OracleDriver;

/**
 * Servlet implementation class register_user
 */
@WebServlet("/register_user")
public class register_user extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public register_user() {
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
		System.out.println("enter get");
		PrintWriter out = response.getWriter();
		try {
			String empid = request.getParameter("hide_empid");
			String status = request.getParameter("select_status");
			String query = "";
			Driver d = new OracleDriver();
			DriverManager.registerDriver(d);

			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			Statement stmt = con.createStatement();
			if (empid.contains("WCTM") == true) {
				query = "update employee set lib_status='" + status + "'where id='" + empid + "'";
			} else {
				query = "update student set lib_status='" + status + "'where id='" + empid + "'";
			}

			int count = stmt.executeUpdate(query);
			if (count > 0) {
				response.setContentType("text/html");
				String back_query = "<script type=" + "text/javascript" + "> window.history.back();	</script>";
				String title = "Librarian status has been successfully Updated !";
				request.setAttribute("title", title);
				request.setAttribute("url",
						"http://localhost:9090/library_project/jsp/button_controls_jsp/registration_user.jsp");
				request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);
			}
			stmt.close();
			con.close();

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
		
		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			String empid = request.getParameter("txt_empid").toUpperCase();

			// Class.forName("oracle.jdbc.driver.OracleDriver");
			Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			Statement stmt = con.createStatement();

			String empname = "", email = "", dept = "", id = "", image = "", status = "", query = "";

			if (empid.contains("WCTM") == true) {
				query = "SELECT id, name,branch , email,image,lib_status FROM employee where id='" + empid + "'";
			} else {
				query = "SELECT id, name,branch ,email,image,lib_status FROM student where id='" + empid + "'";
			}
			int count = 0;
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				count++;
				empname = rs.getString("name");
				id = rs.getString("id");
				dept = rs.getString("branch");
				email = rs.getString("email");
				image = rs.getString("image");
				status = rs.getString("lib_status");
				System.out.println(id);
			}

			if (count > 0) {
				HttpSession session = request.getSession();
				// session.setMaxInactiveInterval(2 * 60);
				if (status.equals("active")) {
					session.setAttribute("status", status);
					session.setAttribute("status2", "inactive");
				} else {
					session.setAttribute("status", status);
					session.setAttribute("status2", "active");
				}

				session.setAttribute("empid", empid);
				session.setAttribute("empname", empname);
				session.setAttribute("email", email);
				session.setAttribute("dept", dept);
				session.setAttribute("image", image);
				session.setAttribute("hide", "show");
				request.setAttribute("invalid_login", "");
				// request.getRequestDispatcher("jsp/button_controls_jsp/registration_user.jsp").forward(request,
				// response);
				response.sendRedirect("jsp/button_controls_jsp/registration_user.jsp");
				rs.close();
				con.close();

			}

			else {
				request.setAttribute("invalid_login", "Invalid Employee ID");

				request.getRequestDispatcher("jsp/button_controls_jsp/registration_user.jsp").forward(request,
						response);
				rs.close();
				con.close();
			}

		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.println(e1);
		}

	}

}
