package com.tradeflow.system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tradeflow.system.model.ProductModel;
import com.tradeflow.system.utils.DBConfig;

public class ProductDAO {
	
	public void addNewProduct(String productName, String productBrand, String category, int price, int stockQuantity) throws Exception{
		
		Connection dbconn = DBConfig.getConnection();
		
		String sqlQuery =  "INSERT INTO products (product_name, product_brand, category, price, stock_quantity, status) VALUES (?,?,?,?,?,?)";
		PreparedStatement pst =  dbconn.prepareStatement(sqlQuery);
		pst.setString(1, productName);
		pst.setString(2, productBrand);
		pst.setString(3, category);
		pst.setInt(4, price);
		pst.setInt(5, stockQuantity);
		pst.setString(6, "active");
		pst.executeUpdate();
		pst.close();
		dbconn.close();
	}
	
	
	public List<ProductModel> getAllProducts() throws Exception{
		List<ProductModel> products = new ArrayList<>();
		Connection dbconn = DBConfig.getConnection();
		String sqlQuery = "SELECT * FROM products where status='active'";
		PreparedStatement pst = dbconn.prepareStatement(sqlQuery);
		ResultSet rs = pst.executeQuery();
		
		while(rs.next()) {
			ProductModel p = new ProductModel();
			p.setProductId(rs.getInt("product_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductBrand(rs.getString("product_brand"));
			p.setCategory(rs.getString("category"));
			p.setPrice(rs.getInt("price"));
			p.setStockQuantity(rs.getInt("stock_quantity"));
			products.add(p);
		}
		rs.close();
		pst.close();
		dbconn.close();
		return products;
	}
	
	public boolean deleteProduct(int productId) {
		String sql = "UPDATE products SET status = 'inactive' WHERE product_id = ?";
		try (
				Connection dbconn = DBConfig.getConnection();
				PreparedStatement ps = dbconn.prepareStatement(sql);)
		{
			ps.setInt(1, productId);
			int result = ps.executeUpdate();
			return result>0;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return false;
	}
}
