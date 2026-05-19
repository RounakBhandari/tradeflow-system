package com.tradeflow.system.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.tradeflow.system.service.ProductService;

/**
 * Servlet implementation class AdminAddProduct
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/addProduct" })
public class AdminAddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/WEB-INF/pages/admin/AddProduct.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String productIdStr = request.getParameter("productId");
			String name = request.getParameter("productName");
			String brand = request.getParameter("productBrand");
			String category = request.getParameter("category");
			String priceStr = request.getParameter("price");
			String stockStr = request.getParameter("stockQuantity");
			String minStockStr = request.getParameter("minStockQuantity");

			// Basic presence check
			if (productIdStr == null || productIdStr.trim().isEmpty() ||
				name == null || name.trim().isEmpty() ||
				brand == null || brand.trim().isEmpty() ||
				category == null || category.trim().isEmpty() ||
				priceStr == null || priceStr.trim().isEmpty() ||
				stockStr == null || stockStr.trim().isEmpty() ||
				minStockStr == null || minStockStr.trim().isEmpty()) {
				
				request.setAttribute("error", "All fields are required.");
				request.getRequestDispatcher("/WEB-INF/pages/admin/AddProduct.jsp").forward(request, response);
				return;
			}

			int productId = Integer.parseInt(productIdStr);
			int price = Integer.parseInt(priceStr);
			int stock = Integer.parseInt(stockStr);
			int minStockQuantity = Integer.parseInt(minStockStr);

			if (price < 0) {
				request.setAttribute("error", "Price cannot be negative.");
				request.getRequestDispatcher("/WEB-INF/pages/admin/AddProduct.jsp").forward(request, response);
				return;
			}
			if (stock < 0) {
				request.setAttribute("error", "Stock quantity cannot be negative.");
				request.getRequestDispatcher("/WEB-INF/pages/admin/AddProduct.jsp").forward(request, response);
				return;
			}
			if (minStockQuantity < 0) {
				request.setAttribute("error", "Minimum stock alert level cannot be negative.");
				request.getRequestDispatcher("/WEB-INF/pages/admin/AddProduct.jsp").forward(request, response);
				return;
			}

			ProductService service = new ProductService();
			service.addProduct(productId, name, brand, category, price, stock, minStockQuantity);
			response.sendRedirect(request.getContextPath() + "/admin/inventory");

		} catch (NumberFormatException e) {
			request.setAttribute("error", "Numeric fields must contain valid numbers.");
			request.getRequestDispatcher("/WEB-INF/pages/admin/AddProduct.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "An error occurred while adding the product: " + e.getMessage());
			request.getRequestDispatcher("/WEB-INF/pages/admin/AddProduct.jsp").forward(request, response);
		}
	}

}
