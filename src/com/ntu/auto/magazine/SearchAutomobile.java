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
import com.ntu.auto.magazine.filter.SearchFilter;
import com.ntu.auto.magazine.model.Advertisement;

/**
 * Servlet implementation class SearchAutomobile
 */
@WebServlet(name = "searchAutomobile", urlPatterns = { "/searchAutomobile" })
public class SearchAutomobile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAutomobile() {
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
		SearchFilter filter = new SearchFilter();
		filter.setCategory(request.getParameter("category"));
		filter.setEngineCapacity(request.getParameter("engineCapacity"));
		filter.setGear(request.getParameter("gear"));
		filter.setMake(request.getParameter("make"));
		filter.setMakeYear(request.getParameter("makeYear"));
		filter.setMileage(request.getParameter("mileage"));
		filter.setModel(request.getParameter("model"));
		filter.setPrice(request.getParameter("price"));
		filter.setRegisteredYear(request.getParameter("registeredYear"));
		/*if(request.getSession().getAttribute("search") != null){
			filter = (SearchFilter) request.getSession().getAttribute("search");
		}else{
			filter = new SearchFilter();
			request.getSession().setAttribute("search", filter);
		}*/
		AutomobileDao automobileDao = new AutomobileDaoImpl();
		List<Advertisement> advList = automobileDao.searchAdvertisements(filter);
		request.setAttribute("advList", advList);
		//request.getSession().setAttribute("search", filter);
		request.setAttribute("search", filter);
		RequestDispatcher dispatcher = request.getRequestDispatcher("buyAutomobile.jsp");
		dispatcher.forward(request, response);
	}

}
