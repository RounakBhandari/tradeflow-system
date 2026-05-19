<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="jakarta.tags.core" prefix="c" %>
   <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminDashboard.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/topNav.css?v=2">

<title>TradeFlow - Dashboard</title>
</head>
<body>

<div class="main-container"> 

<div class="top-nav">
    <!-- LEFT -->
    <div class="nav-left">
        <div class="logo">
            TradeFlow
        </div>
        <div class="nav-links">
            <div class="nav-link linkSelected">
                <a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a>
            </div>
            <div class="nav-link">
                <a href="<%=request.getContextPath()%>/admin/inventory">Inventory</a>
            </div>
            <div class="nav-link">
                <a href="<%=request.getContextPath()%>/admin/orderApprovals">Order Approvals</a>
            </div>
            <div class="nav-link">
                <a href="<%=request.getContextPath()%>/admin/pendingUsers">User Approvals</a>
            </div>
            <div class="nav-link">
                <a href="<%=request.getContextPath()%>/admin/retailers">Retailers</a>
            </div>
            <div class="nav-link">
               <a href="<%=request.getContextPath()%>/admin/transactions">Transactions</a>
            </div>
        </div>
    </div>

    <!-- RIGHT -->
    <div class="nav-right">
        <div class="profile">
        <a href="<%=request.getContextPath()%>/profile">
   <img src="<%= request.getContextPath() %>/${sessionScope.profilePic}"
     alt="Profile" onerror="this.style.display='none'">
    <div class="profileDetails">
        <span class="userName profile">
            
                ${sessionScope.firstName}
            </a>
        </span>
        <span class="userRole">${sessionScope.role}</span>
    </div>
</div>
        
       <a class="logoutBtn" href="<%=request.getContextPath()%>/logout">Logout</a>
        </div>
    </div>
<div class="content-container">

        <!-- HERO -->
        <div class="hero">
            <h1>Overview</h1>
            <p>Welcome back! here's what's new!!</p>
        </div>

        <!-- OVERVIEW -->
        <div class="overview">

            <div class="ovwcard">
    <h2>Rs. ${totalRevenue}</h2>
    <span>Total Revenue</span>
</div>

<div class="ovwcard">
    <h2>${pendingApprovals}</h2>
    <span>Pending Approvals</span>
</div>

<div class="ovwcard">
    <h2>${lowStockCount}</h2>
    <span>Low Stock Alert</span>
</div>

<div class="ovwcard">
    <h2>Rs. ${outstandingDues}</h2>
    <span>Outstanding Dues</span>
</div>

        </div>

        <!-- SUMMARY -->
        <div class="summary">

            <!-- ORDER SECTION -->
            <div class="section">

                <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:15px;">
                    <h2 class="section-title" style="margin:0;">Order Approval Queue</h2>
                    <p style="margin:0; cursor:pointer;"><span class="profile"><a  href="<%=request.getContextPath()%>/admin/orderApprovals">View all Orders →</span></a></p>
                </div>

                <table class="table">

                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Retailer</th>
                            <th>Status</th>
                            <th>Actions</th>
                            <th>Details</th>
                        </tr>
                    </thead>

                    <tbody>

                       <c:forEach var="order" items="${recentOrders}">
    <tr>
        <td>#${order.orderId}</td>
        <td>${order.date}</td>
        <td>${order.retailerName}</td>
        <td><span class="status">${order.status}</span></td>
        <td class="action-icons">
            <span class="tick">✔</span>
            <span class="cross">✖</span>
        </td>
        <td><span style="cursor:pointer;">View Details</span></td>
    </tr>
</c:forEach>

                    </tbody>

                </table>

            </div>

            <!-- INVENTORY SECTION -->
            <div class="section">

                <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:15px;">
                    <h2 class="section-title" style="margin:0;">Inventory</h2>
                    <p style="margin:0; cursor:pointer;"><span class="profile"><a  href="<%=request.getContextPath()%>/admin/inventory">View all Inventory →</span></a>
                    </p>
                </div>

                <table class="table">

                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th>Category</th>
                            <th>Stock</th>
                            <th>Status</th>
                           
                            
                        </tr>
                    </thead>

                    <tbody>

<c:forEach var="product" items="${lowStockProducts}">
    <tr>
        <td>${product.productId}</td>
        <td>${product.productName}</td>
        <td>${product.category}</td>
        <td>${product.stock}</td>
        <td>${product.status}</td>
    </tr>
</c:forEach>

                    </tbody>

                </table>

            </div>

        </div>

    </div>
</div>

</body>
</html>