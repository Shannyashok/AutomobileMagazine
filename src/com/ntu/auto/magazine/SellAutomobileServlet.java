package com.ntu.auto.magazine;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ntu.auto.magazine.dao.AutomobileDao;
import com.ntu.auto.magazine.dao.AutomobileDaoImpl;
import com.ntu.auto.magazine.model.Advertisement;
import com.ntu.auto.magazine.model.Seller;

/**
 * Servlet implementation class SellAutomobileServlet
 */
@WebServlet(name = "sellAutomobile", urlPatterns = { "/sellAutomobile" })
@MultipartConfig(maxFileSize=16777215)
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
		AutomobileDao automobileDao = new AutomobileDaoImpl();
		List<com.ntu.auto.magazine.model.Package> pkgs = automobileDao.getAllPackages();
		request.setAttribute("pkgs", pkgs);
		RequestDispatcher dispatcher = request.getRequestDispatcher("sellAutomobile.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long advId = Long.valueOf(request.getParameter("advId")!=null ?request.getParameter("advId") :"-1").longValue();
		int sellId = Integer.valueOf(request.getParameter("sellId")!=null ?request.getParameter("sellId") :"-1").intValue();
		boolean isNew = false;
		if(advId != -1)
		{
			AutomobileDao automobileDao = new AutomobileDaoImpl();
			if(advId == 0){
				advId = automobileDao.getNextAdvId();
				sellId = automobileDao.getNextSellerId();
				isNew = true;
			}
			Advertisement adv = new Advertisement();
			adv.setAdvId(advId);
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
			adv.setPrice(Double.valueOf(!"".equals(request.getParameter("price"))? request.getParameter("price") :"0.0").doubleValue());
			adv.setAdditionalInfo(request.getParameter("additionalInfo"));
			adv.setCategory(request.getParameter("category"));
			adv.setEngineCapacity(Integer.valueOf( !"".equals(request.getParameter("engineCapacity")) && request.getParameter("engineCapacity")!=null ? request.getParameter("engineCapacity") : "1" ).intValue());
			adv.setMileage(Integer.valueOf( !"".equals(request.getParameter("mileage"))  && request.getParameter("mileage")!=null  ? request.getParameter("mileage") : "1" ).intValue());
			adv.setGear(request.getParameter("gear"));
			adv.setAvailable(Integer.valueOf( !"".equals(request.getParameter("status"))  && request.getParameter("status")!=null ? request.getParameter("status") : "1" ).intValue());
			adv.setSellerId(sellId);
			adv.setCode(request.getParameter("packageCode"));
			
			Seller seller = new Seller();
			seller.setSellerId(sellId);
			seller.setName(request.getParameter("name"));
			seller.setEmail(request.getParameter("email"));
			seller.setContact(request.getParameter("contact"));
			seller.setAddress(request.getParameter("address"));
			seller.setLocation(request.getParameter("location"));
			seller.setNric(request.getParameter("nric"));
			
			System.out.println(adv);
			System.out.println(seller);
			if(isNew){
				automobileDao.addSeller(seller);
				automobileDao.addAdvertisement(adv);
				request.setAttribute("msg", "Your post has been registered successfully");
			}else{
				automobileDao.updateSeller(seller);
				automobileDao.updateAdvertisement(adv);
				request.setAttribute("adv", adv);
				request.setAttribute("sell", seller);
				request.setAttribute("msg", "Your post has been updated successfully");
			}
			List<com.ntu.auto.magazine.model.Package> pkgs = automobileDao.getAllPackages();
			request.setAttribute("pkgs", pkgs);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("sellAutomobile.jsp");
		dispatcher.forward(request, response);
	}

}
