package myservletpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.jdbc.driver.OracleDriver;

/**
 * Servlet implementation class stu_status
 */
@WebServlet("/stu_status")
public class stu_status extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public stu_status() {
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
		response.getWriter().append("Served at:").append(request.getContextPath());
		try {
			String hide_captcha2 = (String) request.getParameter("hide_captcha21");
			String name = (String) request.getParameter("name");
			String email = (String) request.getParameter("email");

			String message = "Hello " + name
					+ ", \n\nThis e-mail is sent to you because you have requested One-time-password (OTP) for Book Reissue. Please use the OTP to complete your Reissue Request."
					+ "\n\nOTP : " + hide_captcha2 + "\n\n\nThanks\nTeam WCTM";
			System.out.println(message);

			SendEmail.Email(email, message);
		} catch (Exception e) {
			request.setAttribute("title", "Book Not Reissue \n There has some problem..!");
			request.setAttribute("url",
					"http://localhost:9090/library_project/jsp/button_controls_jsp/student/stu_status2.jsp");
			request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		try {
			// SendEmail.Email("d.y3001@gmail.com", "stu_status testing");

			Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			Statement stmt = con.createStatement();

			String[] chkbox = request.getParameterValues("chk_reissue");

			Date date = new Date();
			DateFormat formatter = new SimpleDateFormat("YYYY-MM-dd");
			String issue_Date = formatter.format(date);
			String return_Date = (String) request.getParameter("hide_return_date");
			String stu_id = (String) request.getParameter("hide_stuid");

			StringBuffer query = new StringBuffer("");
			StringBuffer query2 = new StringBuffer("");
			StringBuffer query3 = new StringBuffer("");
			//
			if (chkbox != null) {
				for (int i = 0; i < chkbox.length; i++) {
					if (i == 0) {
						query.append("update book_details set issue_date = '" + issue_Date + "' ,return_date = '"
								+ return_Date + "' where id=" + chkbox[i] + "");

						query2.append("update calculate_fine set ac_return_date='" + issue_Date
								+ "' where RECORD_TIME =(select RECORD_TIME from( select * from calculate_fine where book_id="
								+ chkbox[i] + " order by record_time desc ) where rownum<=1)");

						query3.append(
								"insert into calculate_fine(book_id,issue_id,issue_date,return_date,iss_return,fine,ac_return_date) values("
										+ chkbox[i] + ",'" + stu_id + "', '" + issue_Date + "' ,'" + return_Date
										+ "' ,'" + "Reissue" + "',0,'')");

					} else {

						query.append(" or id=" + chkbox[i] + "");
						query2.append(" or book_id=" + chkbox[i] + "");

					}

				}

			}
			String query1 = query.toString();
			String query22 = query2.toString();
			String query33 = query3.toString();

			System.out.println(query1);
			int count = stmt.executeUpdate(query1);
			Statement stmt1 = con.createStatement();
			int count2 = stmt1.executeUpdate(query22);
			Statement stmt2 = con.createStatement();
			int count3 = stmt2.executeUpdate(query33);

			stmt.close();
			con.close();
			if (count > 0) {
				response.setContentType("text/html");
				String title = "Book  has been successfully Reissue !";
				request.setAttribute("title", title);
				request.setAttribute("url",
						"http://localhost:9090/library_project/jsp/button_controls_jsp/student/stu_status2.jsp");
				request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);
			}

		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.println(e1);
			response.sendRedirect("jsp/button_controls_jsp/student/stu_status2.jsp");
		}

	}

}
