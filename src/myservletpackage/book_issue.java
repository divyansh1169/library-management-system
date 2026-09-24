package myservletpackage;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class book_issue
 */
@WebServlet("/book_issue")
public class book_issue extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public book_issue() {
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

			String book_id = request.getParameter("bookid");
			String stu_id = request.getParameter("stuid");
			String select = request.getParameter("select");

			Date date = new Date();
			DateFormat formatter = new SimpleDateFormat("YYYY-MM-dd");
			String issue_Date = formatter.format(date);

			// Date date1 = DateUtils.addDays(new Date(), +15);
			String return_Date = (String) request.getParameter("return_date");

			System.out.println("return date is  : " + return_Date);
			Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			Statement stmt = con.createStatement();
			int count = 0;
			String query = "";
			String query1 = "";
			String query2 = "";

			if (select.equals("Issue")) {
				query = "update book_details set issue_id='" + stu_id + "',issue_date='" + issue_Date
						+ "' ,return_date='" + return_Date + "' where id='" + book_id + "'";

				query1 = "insert into calculate_fine(book_id,issue_id,issue_date,return_date,iss_return,fine,ac_return_date) values("
						+ book_id + ",'" + stu_id + "', '" + issue_Date + "' ,'" + return_Date + "' ,'" + select
						+ "',0,'')";

			} else if (select.equals("Reissue")) {
				query = "update book_details set issue_id='" + stu_id + "',issue_date='" + issue_Date
						+ "' ,return_date='" + return_Date + "' where id='" + book_id + "'";

				query2 = "update calculate_fine set ac_return_date='" + issue_Date
						+ "' where RECORD_TIME =(select RECORD_TIME from( select * from calculate_fine where book_id="
						+ book_id + " order by record_time desc ) where rownum<=1)";

				query1 = "insert into calculate_fine(book_id,issue_id,issue_date,return_date,iss_return,fine,ac_return_date) values("
						+ book_id + ",'" + stu_id + "', '" + issue_Date + "' ,'" + return_Date + "' ,'" + select
						+ "',0,'')";

			} else if (select.equals("Return")) {
				query = "update book_details set issue_id='',issue_date='',return_date='' where id='" + book_id + "'";

				query2 = "update calculate_fine set ac_return_date='" + issue_Date
						+ "' where RECORD_TIME =(select RECORD_TIME from( select * from calculate_fine where book_id="
						+ book_id + " order by record_time desc ) where rownum<=1)";

				query1 = "insert into calculate_fine(book_id,issue_id,issue_date,return_date,iss_return,fine,ac_return_date) values("
						+ book_id + ",'" + stu_id + "', '" + issue_Date + "' ,'" + issue_Date + "','" + select + "',0,'"
						+ issue_Date + "')";

			}
			System.out.println("book id " + book_id);
			System.out.println("stu id " + stu_id);
			System.out.println(query1);
			System.out.println(query2);
			count = stmt.executeUpdate(query);

			int count1 = 0;
			if (select.equals("Reissue") || select.equals("Return")) {
				count1 = stmt.executeUpdate(query2);
			}
			count1 = stmt.executeUpdate(query1);
			if (count > 0 || count1 > 0) {
				response.setContentType("text/html");
				String title = "Book  has been successfully " + select + " !";
				request.setAttribute("title", title);
				request.setAttribute("url",
						"http://localhost:9090/library_project/jsp/button_controls_jsp/issue_return_book.jsp");
				request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);
			}
			stmt.close();
			con.close();

		} catch (Exception e1) {
			e1.printStackTrace();
			System.out.println(e1);
			request.setAttribute("title", "--- Book Not Update ----");
			request.setAttribute("url",
					"http://localhost:9090/library_project/jsp/button_controls_jsp/issue_return_book.jsp");
			request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);
		}

	}

}
