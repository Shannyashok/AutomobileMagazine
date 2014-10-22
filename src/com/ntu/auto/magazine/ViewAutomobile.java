package com.ntu.auto.magazine;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ntu.auto.magazine.dao.AutomobileDao;
import com.ntu.auto.magazine.dao.AutomobileDaoImpl;
import com.ntu.auto.magazine.model.Advertisement;

/**
 * Servlet implementation class ViewAutomobile
 */
@WebServlet(name = "viewAutomobile", urlPatterns = { "/viewAutomobile" })
public class ViewAutomobile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewAutomobile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		long advId = Long.valueOf(request.getParameter("advId")).longValue();
		AutomobileDao automobileDao = new AutomobileDaoImpl();
		Advertisement adv = automobileDao.getAdvertisementById(advId);
		request.setAttribute("adv", adv);
		RequestDispatcher dispatcher = request.getRequestDispatcher("viewAutomobile.jsp");
		dispatcher.forward(request, response);
	}

}
