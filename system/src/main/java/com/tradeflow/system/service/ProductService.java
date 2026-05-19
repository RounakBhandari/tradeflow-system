package com.tradeflow.system.service;

import java.util.List;

import com.tradeflow.system.dao.ProductDAO;
import com.tradeflow.system.model.ProductModel;

public class ProductService {
	ProductDAO dao = new ProductDAO();
	public void addProduct(int productId, String productName, String productBrand, String category, int price, int stockQuantity, int minStockQuantity) throws Exception{
		dao.addNewProduct(productId, productName, productBrand, category, price, stockQuantity, minStockQuantity);
	}

	public List<ProductModel> getProducts() throws Exception{
		return dao.getAllProducts();
	}
	public boolean deleteProduct(int productId) throws Exception {
	    return dao.deleteProduct(productId);
	}

	public ProductModel getProductById(int productId) throws Exception {
		return dao.getProductById(productId);
	}

	public void updateProduct(int productId, String productName, String productBrand, String category, int price, int stockQuantity, int minStockQuantity) throws Exception {
		dao.updateProduct(productId, productName, productBrand, category, price, stockQuantity, minStockQuantity);
	}
}
