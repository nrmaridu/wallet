package com.wallet.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wallet.db.DbUtils;
import com.wallet.pojo.Transaction;
import com.wallet.pojo.User;
import com.wallet.pojo.Wallet;
import com.wallet.util.WalletViews;

/**
 * Servlet implementation class TransServlet
 */
@WebServlet("/TransServlet")
public class TransServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DbUtils dbUtils = new DbUtils();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TransServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		List<Transaction> transactions = dbUtils.getTransactions(5, user);
		request.setAttribute("transactions", transactions);
		request.getRequestDispatcher(WalletViews.TransView).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user = (User) session.getAttribute("user");
		
		Double cash = Double.parseDouble(request.getParameter("cash"));
		Transaction trans = new Transaction(cash,request.getParameter("comments"));
		
		trans.setUser(user.getId());
		
		Wallet userWallet = dbUtils.getUserWalletBalance(user.getId());
		Double existingCash = userWallet.getCash();
		Double updatedAmount = existingCash-trans.getAmount();
		if(updatedAmount < 0){
			request.setAttribute("transError", "Last transaction failed due to lack of sufficient funds");
			doGet(request, response);
			return;
		}
		
		Wallet newWallet = dbUtils.updateUserWalletBalance(user.getId(), updatedAmount);
		
		if(null != newWallet){
			dbUtils.doTransaction(trans);
		} else {
			request.setAttribute("transError", "Last Transaction failed due to unexpected error.");
			doGet(request, response);
			return;
		}
		request.setAttribute("transSuccess", "Transaction Successful. Current user wallet balance : "+updatedAmount);
		doGet(request, response);
		return;
	}

}
