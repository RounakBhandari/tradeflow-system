package com.tradeflow.system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tradeflow.system.model.ProductModel;
import com.tradeflow.system.utils.DBConfig;

public class ProductDAO {
	
	public void addNewProduct(int productId, String productName, String productBrand, String category, int price, int stockQuantity, int minStockQuantity) throws Exception{
		
		Connection dbconn = DBConfig.getConnection();
		
		String sqlQuery =  "INSERT INTO products (product_id, product_name, product_brand, category, price, stock_quantity, min_stock_quantity, status) VALUES (?,?,?,?,?,?,?,?)";
		PreparedStatement pst =  dbconn.prepareStatement(sqlQuery);
		pst.setInt(1, productId);
		pst.setString(2, productName);
		pst.setString(3, productBrand);
		pst.setString(4, category);
		pst.setInt(5, price);
		pst.setInt(6, stockQuantity);
		pst.setInt(7, minStockQuantity);
		pst.setString(8, "active");
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
			p.setMinStockQuantity(rs.getInt("min_stock_quantity"));
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

	public ProductModel getProductById(int productId) throws Exception {
		ProductModel p = null;
		Connection dbconn = DBConfig.getConnection();
		String sqlQuery = "SELECT * FROM products WHERE product_id = ? AND status = 'active'";
		PreparedStatement pst = dbconn.prepareStatement(sqlQuery);
		pst.setInt(1, productId);
		ResultSet rs = pst.executeQuery();
		if (rs.next()) {
			p = new ProductModel();
			p.setProductId(rs.getInt("product_id"));
			p.setProductName(rs.getString("product_name"));
			p.setProductBrand(rs.getString("product_brand"));
			p.setCategory(rs.getString("category"));
			p.setPrice(rs.getInt("price"));
			p.setStockQuantity(rs.getInt("stock_quantity"));
			p.setMinStockQuantity(rs.getInt("min_stock_quantity"));
		}
		rs.close();
		pst.close();
		dbconn.close();
		return p;
	}

	public void updateProduct(int productId, String productName, String productBrand, String category, int price, int stockQuantity, int minStockQuantity) throws Exception {
		Connection dbconn = DBConfig.getConnection();
		String sqlQuery = "UPDATE products SET product_name = ?, product_brand = ?, category = ?, price = ?, stock_quantity = ?, min_stock_quantity = ? WHERE product_id = ?";
		PreparedStatement pst = dbconn.prepareStatement(sqlQuery);
		pst.setString(1, productName);
		pst.setString(2, productBrand);
		pst.setString(3, category);
		pst.setInt(4, price);
		pst.setInt(5, stockQuantity);
		pst.setInt(6, minStockQuantity);
		pst.setInt(7, productId);
		pst.executeUpdate();
		pst.close();
		dbconn.close();
	}
}
