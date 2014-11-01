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
import com.ntu.auto.magazine.model.Enquiry;

/**
 * Servlet implementation class EnquiryServlet
 */
@WebServlet(name = "enquiry", urlPatterns = { "/enquiry" })
public class EnquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnquiryServlet() {
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
		Enquiry enq = new Enquiry();
		enq.setNature(request.getParameter("nature"));
		enq.setName(request.getParameter("name"));
		enq.setEmail(request.getParameter("email"));
		enq.setContact(request.getParameter("contact"));
		enq.setComments(request.getParameter("comments"));
		AutomobileDao automobileDao = new AutomobileDaoImpl();
		automobileDao.addEnquiry(enq);
		RequestDispatcher dispatcher = request.getRequestDispatcher("contactUs.jsp");
		dispatcher.forward(request, response);
	}

}
