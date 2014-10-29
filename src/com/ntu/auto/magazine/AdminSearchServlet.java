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
 * Servlet implementation class AdminSearchServlet
 */
@WebServlet(name = "adminSearch", urlPatterns = { "/adminSearch" })
public class AdminSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		SearchFilter filter = new SearchFilter();
		filter.setCategory(request.getParameter("category") != null ? request.getParameter("category") : "");
		filter.setEngineCapacity(request.getParameter("engineCapacity") != null ? request.getParameter("engineCapacity") : "");
		filter.setGear(request.getParameter("gear") != null ? request.getParameter("gear") : "");
		filter.setMake(request.getParameter("make") != null ? request.getParameter("make") : "");
		filter.setMakeYear(request.getParameter("makeYear") != null ? request.getParameter("makeYear") : "");
		filter.setMileage(request.getParameter("mileage") != null ? request.getParameter("mileage") : "");
		filter.setModel(request.getParameter("model") != null ? request.getParameter("model") : "");
		filter.setPrice(request.getParameter("price") != null ? request.getParameter("price") : "");
		filter.setRegisteredYear(request.getParameter("registeredYear") != null ? request.getParameter("registeredYear") : "");
		filter.setApproved(request.getParameter("approved") != null ? request.getParameter("approved") : "");
		filter.setStatus(request.getParameter("status") != null ? request.getParameter("status") : "");
		filter.setPostDate(request.getParameter("post") != null ? request.getParameter("post") : "");
		/*
		 * if(request.getSession().getAttribute("search") != null){ filter =
		 * (SearchFilter) request.getSession().getAttribute("search"); }else{
		 * filter = new SearchFilter();
		 * request.getSession().setAttribute("search", filter); }
		 */
		AutomobileDao automobileDao = new AutomobileDaoImpl();
		List<Advertisement> advList = automobileDao.searchAdvertisements(filter, true);
		request.setAttribute("advList", advList);
		// request.getSession().setAttribute("search", filter);
		request.setAttribute("search", filter);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminPage.jsp");
		dispatcher.forward(request, response);
	}

}
