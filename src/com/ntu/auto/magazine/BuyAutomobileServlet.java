package com.ntu.auto.magazine;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class BuyAutomobileServlet
 */
@WebServlet(name = "buyAutomobile", urlPatterns = { "/buyAutomobile" })
public class BuyAutomobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyAutomobileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AutomobileDao automobileDao = new AutomobileDaoImpl();
		//List<Advertisement> advList = automobileDao.getAllAdvertisements();
		List<Advertisement> advList = automobileDao.searchAdvertisements(null, false);
		request.setAttribute("advList", advList);
		RequestDispatcher dispatcher  = request.getRequestDispatcher("buyAutomobile.jsp");
		dispatcher.forward(request, response);
	}

}
