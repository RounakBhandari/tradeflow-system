package com.tradeflow.system.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.tradeflow.system.model.ProductModel;
import com.tradeflow.system.service.ProductService;

/**
 * Servlet implementation class AdminInventory
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/inventory" })
public class AdminInventory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminInventory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductService service = new ProductService();
		try {
			List<ProductModel> products = service.getProducts();
			request.setAttribute("productList", products);
			
			int totalProducts = 0;
			int lowStockItems = 0;
			int outOfStock = 0;
			
			if (products != null) {
			    totalProducts = products.size();
			    for (ProductModel p : products) {
			        if (p.getStockQuantity() == 0) {
			            outOfStock++;
			        } else if (p.getStockQuantity() <= p.getMinStockQuantity()) {
			            lowStockItems++;
			        }
			    }
			}
			
			request.setAttribute("totalProducts", totalProducts);
			request.setAttribute("lowStockItems", lowStockItems);
			request.setAttribute("outOfStock", outOfStock);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/pages/admin/Inventory.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
