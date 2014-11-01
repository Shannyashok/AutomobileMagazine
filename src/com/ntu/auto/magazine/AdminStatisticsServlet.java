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
import com.ntu.auto.magazine.model.AdvStatisticsHolder;

/**
 * Servlet implementation class AdminStatisticsServlet
 */
@WebServlet(name = "adminStatistics", urlPatterns = { "/adminStatistics" })
public class AdminStatisticsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminStatisticsServlet() {
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
		AutomobileDao automobileDao = new AutomobileDaoImpl();
		AdvStatisticsHolder holder = automobileDao.getAdvertisementStatistics();
		request.setAttribute("holder", holder);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminStatistics.jsp");
		dispatcher.forward(request, response);
	}

}
