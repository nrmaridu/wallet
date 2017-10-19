package com.wallet.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wallet.db.DbConnectionProvider;
import com.wallet.db.DbUtils;
import com.wallet.pojo.User;
import com.wallet.util.WalletViews;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DbUtils dbUtils = new DbUtils();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignupServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher(WalletViews.IndexPage).forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String query = "insert into user(username,email,password) values(?,?,?)";
		Connection conn = DbConnectionProvider.getConnection();
		
		User user = new User(request.getParameter("username"), request.getParameter("email"),
				request.getParameter("password"));
		
		boolean userExists = dbUtils.checkUserExistence(user.getUsername());

		if (userExists) {
			request.setAttribute("userExists", true);
			request.setAttribute("currentUser", user.getUsername());
			request.getRequestDispatcher(WalletViews.IndexPage).forward(request, response);
			return;
		}

		try {
			java.sql.PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			int success = ps.executeUpdate();
			if (success == 1) {
				user = dbUtils.getUserByUserName(request.getParameter("username"));
				dbUtils.createUserWallet(user);
				request.setAttribute("message", "Successfully created the user.");
				request.setAttribute("user", user);
				request.getRequestDispatcher(WalletViews.UserDetailsView).forward(request, response);
				return;
			}
		} catch (SQLException e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher(WalletViews.ErrorPage).forward(request, response);
		}
	}
}
