package myservletpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.ResultSet;
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
 * Servlet implementation class calculate_fine
 */
@WebServlet("/calculate_fine")
public class calculate_fine extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public calculate_fine() {
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
		try {

			String query = "", issue_id = "";
			issue_id = request.getParameter("hide_issueid");
			Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			Statement stmt = con.createStatement();
			// query = "delete from calculate_fine where issue_id='" + issue_id
			// + "'";
			// int count = stmt.executeUpdate(query);

			ResultSet rs = stmt.executeQuery("select * from calculate_fine where issue_id='" + issue_id + "'");

			/// String id = "", name = "", branch = "";
			int count = 0, count2 = 0, total_fine = 0;
			Date current_date = new Date();
			long diff, dd = 0;
			String ac_return_date = "";

			while (rs.next()) {
				count++;
				ac_return_date = rs.getString(7);
				if (ac_return_date == "" || ac_return_date == null) {
					ac_return_date = new SimpleDateFormat("yyyy-MM-dd").format(current_date);
					System.out.println("ac_return_date" + ac_return_date);
				}
				Date date = new SimpleDateFormat("yyyy-MM-dd").parse(ac_return_date);
				Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString(4));
				DateFormat month_year_format = new SimpleDateFormat("yyyy-MM-dd");
				if (date.after(date1)) {
					Statement stmt1 = con.createStatement();
					query = "delete from calculate_fine where RECORD_TIME='" + rs.getString(8) + "'";
					count = stmt1.executeUpdate(query);
					System.out.println(query);
					stmt1.close();
				} else {

				}
			}
			rs.close();
			stmt.close();
			con.close();

			if (count > 0) {
				response.setContentType("text/html");
				String title = "Fine has been successfully Paid !";
				request.setAttribute("title", title);
				request.setAttribute("url",
						"http://localhost:9090/library_project/jsp/button_controls_jsp/calculate_fine.jsp");
				request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);
			} else {
				request.setAttribute("title", "Fine Updation Failed..!!");
				request.setAttribute("url",
						"http://localhost:9090/library_project/jsp/button_controls_jsp/calculate_fine.jsp");
				request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block

			System.out.println("Error is - " + e);
			e.printStackTrace();
			request.setAttribute("title", "There has some Error while calculate fine ");
			request.setAttribute("url",
					"http://localhost:9090/library_project/jsp/button_controls_jsp/calculate_fine.jsp");
			request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			String stu_id = request.getParameter("stu_id");
			// Class.forName("oracle.jdbc.driver.OracleDriver");
			Driver d = new OracleDriver();
			DriverManager.registerDriver(d);
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "oracle");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from calculate_fine where issue_id='" + stu_id + "'");

			
			int count = 0, count1 = 0, count2 = 0, total_fine = 0;
			Date current_date = new Date();
			long diff, dd = 0;
			StringBuilder stringBuilder = new StringBuilder();
			String book_id = "", ac_return_date = "";
			stringBuilder.append("Book ID " + "\t" + "Issue Date" + "\t" + "Return Date" + "\t" + "Ac-Return Date"
					+ "\t" + "Status" + "\t" + "Fine" + "\n\n");
			while (rs.next()) {
				count++;
				ac_return_date = rs.getString(7);
				if (ac_return_date == "" || ac_return_date == null) {
					ac_return_date = new SimpleDateFormat("yyyy-MM-dd").format(current_date);
					System.out.println("ac_return_date" + ac_return_date);
				}
				Date date = new SimpleDateFormat("yyyy-MM-dd").parse(ac_return_date);
				Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString(4));
				DateFormat month_year_format = new SimpleDateFormat("yyyy-MM-dd");
				if (date.after(date1) && !(rs.getString(5).equals("Return"))) {
					diff = Math.abs(date.getTime() - date1.getTime());
					dd = diff / (24 * 60 * 60 * 1000);
					dd = dd * 2;

				} else {
					dd = 0;
				}

				System.out.println(month_year_format.format(date) + " : " + month_year_format.format(date1)
						+ "minus value :" + dd);

				stringBuilder.append(rs.getInt(1) + " \t" + rs.getString(3) + " \t" + rs.getString(4) + " \t"
						+ ac_return_date + " \t" + rs.getString(5) + " \t" + dd + "\n");

				book_id = stringBuilder.toString();
				total_fine = (int) (total_fine + dd);

			}
			request.setAttribute("total_fine", total_fine);
			request.setAttribute("book_id", book_id);
			rs.close();
			ResultSet rs1 = stmt.executeQuery("select * from student where id='" + stu_id + "'");
			while (rs1.next()) {
				count1++;
				request.setAttribute("id", rs1.getString(1));
				request.setAttribute("name", rs1.getString(2).toUpperCase());
				request.setAttribute("branch", rs1.getString(5).toUpperCase());
				request.setAttribute("image", rs1.getString(7));
			}
			rs1.close();
			ResultSet rs2 = stmt.executeQuery("select * from employee where id='" + stu_id + "'");
			while (rs2.next()) {
				count2++;

				request.setAttribute("id", rs2.getString(1));
				request.setAttribute("name", rs2.getString(2));
				request.setAttribute("branch", rs2.getString(5));
				request.setAttribute("image", rs2.getString(7));
			}

			if (count <= 0) {
				request.setAttribute("invalid_id", "Not Issue anything on this ID..!");

				if (count1 <= 0 && count2 <= 0) {

					request.setAttribute("invalid_id", "ID Does't Exist..!");

				}
				request.getRequestDispatcher("jsp/button_controls_jsp/calculate_fine.jsp").forward(request, response);
			} else {
				request.setAttribute("invalid_id", "");
				request.getRequestDispatcher("jsp/button_controls_jsp/calculate_fine.jsp").forward(request, response);
			}

			rs2.close();
			stmt.close();
			con.close();

		}

		catch (Exception e) {
			e.printStackTrace();

			System.out.println(e);
			request.setAttribute("title", "There has some Error while calculate fine ");
			request.setAttribute("url",
					"http://localhost:9090/library_project/jsp/button_controls_jsp/calculate_fine.jsp");
			request.getRequestDispatcher("jsp/button_controls_jsp/sucess_fail.jsp").forward(request, response);
		}
	}
}
