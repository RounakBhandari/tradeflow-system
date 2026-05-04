<%@page import="com.tradeflow.system.model.ProductModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/leftNav.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminInventory.css">
</head>
<body>
<div class="main-container">
    <div class="left-nav">
        <div class="logo">
            <img src="">
            <span>TradeFlow</span>
        </div>

        <div class="nav-links">
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a></div>
            <div class="nav-link linkSelected"><a href="<%=request.getContextPath()%>/admin/inventory">Inventory</a></div>
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/orderApprovals">Order Approvals</a></div>
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/retailers">Retailers</a></div>
        </div>

        <div class="userProfile">
            <div class="profile">
                <img src="">
                <div class="profileDetails">
                    <span class="userName">Admin</span>
                    <span class="userRole">Sales Manager</span>
                </div>
            </div>
            <button class="logoutBtn">Logout</button>
        </div>
    </div>

    <div class="right-container">

      <div class="top">
        <div class="navDisplay">
            <p>Admin > Inventory</p>
        </div>
        <div class="addProduct">
        	<button class="addProductBtn">Add New Product</button>
        </div>
      </div>
      <div class="bottom">
        <div class="header">
            <h3>Inventory Overview</h3>
            <div class="filterCategory">
                <p>Filter by Category</p>
            </div>
        </div>
        <div class="inventoryCards">
        <%
        	List<ProductModel> products = (List<ProductModel>) request.getAttribute("productList");
        	if(products != null){
        		for (ProductModel p: products){
        %>
            <div class="card">
                <div class="cardInfo">
                        <p><%= p.getProductName() %>></p>
                        <p><%= p.getCategory() %></p>
                </div>
                <div class="stockInfo">
                    <div>
                        <p>Available Stock</p>
                        <p><%= p.getStockQuantity() %> Pieces</p>
                    </div>
                    <div>
                        <span class="stockStatus"><% if(p.getStockQuantity()>50) {%>Healthy<%} else{ %>Critical<%} %></span>
                        <button class="restockBtn">Restock Now</button>
                    </div>
                </div>
            </div>
        <%
            }
        	}
        %>	
            
        </div>
      </div>

    </div>

</div>
</body>
</html>