package com.ntu.auto.magazine;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.ntu.auto.magazine.dao.AutomobileDao;
import com.ntu.auto.magazine.dao.AutomobileDaoImpl;
import com.ntu.auto.magazine.model.Advertisement;

/**
 * Servlet implementation class SellAutomobileServlet
 */
@WebServlet(name = "sellAutomobile", urlPatterns = { "/sellAutomobile" })
@MultipartConfig(maxFileSize = 16177215)
public class SellAutomobileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellAutomobileServlet() {
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
		if("add".equals(action)){
			Advertisement adv = new Advertisement();
			adv.setName(request.getParameter("name"));
			adv.setEmail(request.getParameter("email"));
			adv.setContact(request.getParameter("contact"));
			adv.setAddress(request.getParameter("address"));
			adv.setLocation(request.getParameter("location"));
			adv.setTitle(request.getParameter("title"));
			adv.setMake(request.getParameter("make"));
			adv.setModel(request.getParameter("model"));
			adv.setModelNumber(request.getParameter("modelNumber"));
			adv.setMakeYear(request.getParameter("makeYear"));
			adv.setRegisteredYear(request.getParameter("registeredYear"));
			adv.setPrice(Double.valueOf(request.getParameter("price")).doubleValue());
			adv.setAdditionalInfo(request.getParameter("additionalInfo"));
			adv.setCategory(request.getParameter("category"));
			adv.setEngineCapacity(Integer.valueOf(request.getParameter("engineCapacity")).intValue());
			adv.setMileage(Integer.valueOf(request.getParameter("mileage")).intValue());
			adv.setGear(request.getParameter("gear"));
			
			Part photo1 = request.getPart("photo1");
			System.out.println(photo1.getName());
			adv.setPhoto1(photo1.getInputStream());
			
			System.out.println(adv);
			
			AutomobileDao automobileDao = new AutomobileDaoImpl();
			automobileDao.addAdvertisement(adv);
			request.setAttribute("msg", "Your post has been registered successfully");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("sellAutomobile.jsp");
		dispatcher.forward(request, response);
	}

}
