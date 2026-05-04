package com.tradeflow.system.service;

import java.util.List;

import com.tradeflow.system.dao.ProductDAO;
import com.tradeflow.system.model.ProductModel;

public class ProductService {
	ProductDAO dao = new ProductDAO();
	public void addProduct(String productName, String productBrand, String category, int price, int stockQuantity) throws Exception{
		dao.addNewProduct(productName, productBrand, category, price, stockQuantity);
	}
	public List<ProductModel> getProducts() throws Exception{
		return dao.getAllProducts();
	}
}
