<%@page import="com.tradeflow.system.model.ProductModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        	<a href="<%=request.getContextPath()%>/admin/addProduct">
    			<button class="addProductBtn">Add New Product</button>
			</a>
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

    <c:if test="${not empty productList}">
        <c:forEach var="p" items="${productList}">
            
            <div class="card">
                <div class="cardInfo">
                    <p>${p.productName}</p>
                    <p>${p.category}</p>
                </div>

                <div class="stockInfo">
                    <div>
                        <p>Available Stock</p>
                        <p>${p.stockQuantity} Pieces</p>
                    </div>

                    <div>
                        <span class="stockStatus">
                            <c:choose>
                                <c:when test="${p.stockQuantity > 50}">
                                    Healthy
                                </c:when>
                                <c:otherwise>
                                    Critical
                                </c:otherwise>
                            </c:choose>
                        </span>

                        <button class="restockBtn">Restock Now</button>

                        <a href="<%= request.getContextPath()%>/admin/deleteProduct?id=${p.productId}">
                            <button>Delete</button>
                        </a>
                    </div>
                </div>
            </div>

        </c:forEach>
    </c:if>

</div>
      </div>

    </div>

</div>
</body>
</html>