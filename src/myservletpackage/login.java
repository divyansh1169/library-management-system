package myservletpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.jdbc.driver.OracleDriver;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// logout button working
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		session.removeAttribute("get_username");
		request.getRequestDispatcher("index.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		try {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			String _username = request.getParameter("txt_username");
			String _password = request.getParameter("txt_password");
			System.out.println("UserName: " + _username);
			System.out.println("Password: " + _password);
			String set_login = request.getParameter("set_login").toString();
			// Class.forName("oracle.jdbc.driver.OracleDriver");
			
			if ((_username.equals("admin")) && (_password.equals("password"))) {
				HttpSession session = request.getSession();
				session.setMaxInactiveInterval(5 * 60);
				session.setAttribute("get_username", _username);
				session.setAttribute("empname", "Administrator");
				session.setAttribute("empbranch", "library");
				session.setAttribute("empimage", "/library_project/images/MCA.gif");
				response.sendRedirect("jsp/admin.jsp");

			} else if (!(set_login.equals("admin"))) {
				Driver d = new OracleDriver();
				DriverManager.registerDriver(d);
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
				String query = "";
				String target = "";
				if (set_login.equals("student")) {

					query = "select name ,branch ,batch,image,email  from student where id='" + _username
							+ "' and spassword='" + _password + "'and lib_status='active'";
					target = "jsp/student.jsp";
				} else if (set_login.equals("librarian")) {
					query = "select id,name,branch,image,email from employee where id='" + _username
							+ "' and emp_pass='" + _password + "'and lib_status='active'";
					target = "jsp/librarian.jsp";
				}
				System.out.println(query);
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				String empname = "", empbranch = "", empbatch = "", empimage = "", empemail = "";
				int count = 0;
				while (rs.next()) {
					count++;

					empname = rs.getString("name");
					empbranch = rs.getString("branch");
					empimage = rs.getString("image");
					empemail = rs.getString("email");

				}
				if (count > 0) {

					HttpSession session = request.getSession();
					session.setMaxInactiveInterval(5 * 60);
					session.setAttribute("get_username", _username);
					session.setAttribute("setlogin", set_login);
					session.setAttribute("empname", empname);
					session.setAttribute("empbranch", empbranch);
					session.setAttribute("empimage", empimage);
					session.setAttribute("empemail", empemail);
					response.sendRedirect(target);
				} else {
					request.setAttribute("invalid_login", "Invalid Username and Password");
					// response.sendRedirect("index.jsp");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				rs.close();
				con.close();
			} else {
				request.setAttribute("invalid_login", "Invalid Username and Password");
				// response.sendRedirect("index.jsp");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}

		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.println(e1);
			response.sendRedirect("index.jsp");
		}

	}

}
