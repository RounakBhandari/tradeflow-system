package com.tradeflow.system.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.tradeflow.system.service.ProductService;
import com.tradeflow.system.model.ProductModel;

/**
 * Servlet implementation class AdminUpdateProduct
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/admin/updateProduct" })
public class AdminUpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminUpdateProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String idStr = request.getParameter("id");
			if (idStr == null || idStr.trim().isEmpty()) {
				response.sendRedirect(request.getContextPath() + "/admin/inventory");
				return;
			}
			
			int productId = Integer.parseInt(idStr);
			ProductService service = new ProductService();
			ProductModel product = service.getProductById(productId);
			
			if (product == null) {
				response.sendRedirect(request.getContextPath() + "/admin/inventory");
				return;
			}
			
			request.setAttribute("product", product);
			request.getRequestDispatcher("/WEB-INF/pages/admin/UpdateProduct.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/admin/inventory");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productIdStr = request.getParameter("productId");
		String name = request.getParameter("productName");
		String brand = request.getParameter("productBrand");
		String category = request.getParameter("category");
		String priceStr = request.getParameter("price");
		String stockStr = request.getParameter("stockQuantity");
		String minStockStr = request.getParameter("minStockQuantity");

		ProductService service = new ProductService();
		ProductModel product = null;

		try {
			int productId = Integer.parseInt(productIdStr);
			
			// We fetch the existing product object to pass back in case of validation failure.
			product = service.getProductById(productId);

			// Basic presence check
			if (name == null || name.trim().isEmpty() ||
				brand == null || brand.trim().isEmpty() ||
				category == null || category.trim().isEmpty() ||
				priceStr == null || priceStr.trim().isEmpty() ||
				stockStr == null || stockStr.trim().isEmpty() ||
				minStockStr == null || minStockStr.trim().isEmpty()) {
				
				request.setAttribute("error", "All fields are required.");
				request.setAttribute("product", product);
				request.getRequestDispatcher("/WEB-INF/pages/admin/UpdateProduct.jsp").forward(request, response);
				return;
			}

			int price = Integer.parseInt(priceStr);
			int stock = Integer.parseInt(stockStr);
			int minStockQuantity = Integer.parseInt(minStockStr);

			if (price < 0) {
				request.setAttribute("error", "Price cannot be negative.");
				request.setAttribute("product", product);
				request.getRequestDispatcher("/WEB-INF/pages/admin/UpdateProduct.jsp").forward(request, response);
				return;
			}
			if (stock < 0) {
				request.setAttribute("error", "Stock quantity cannot be negative.");
				request.setAttribute("product", product);
				request.getRequestDispatcher("/WEB-INF/pages/admin/UpdateProduct.jsp").forward(request, response);
				return;
			}
			if (minStockQuantity < 0) {
				request.setAttribute("error", "Minimum stock alert level cannot be negative.");
				request.setAttribute("product", product);
				request.getRequestDispatcher("/WEB-INF/pages/admin/UpdateProduct.jsp").forward(request, response);
				return;
			}

			service.updateProduct(productId, name, brand, category, price, stock, minStockQuantity);
			response.sendRedirect(request.getContextPath() + "/admin/inventory");

		} catch (NumberFormatException e) {
			request.setAttribute("error", "Numeric fields must contain valid numbers.");
			request.setAttribute("product", product);
			request.getRequestDispatcher("/WEB-INF/pages/admin/UpdateProduct.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "An error occurred while updating the product: " + e.getMessage());
			request.setAttribute("product", product);
			request.getRequestDispatcher("/WEB-INF/pages/admin/UpdateProduct.jsp").forward(request, response);
		}
	}

}
