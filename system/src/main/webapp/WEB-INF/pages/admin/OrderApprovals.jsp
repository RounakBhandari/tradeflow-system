<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>TradeFlow - Order Approvals</title>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/topNav.css?v=2">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminOrderApprovals.css">
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
            <div class="nav-link">
                <a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a>
            </div>
            <div class="nav-link">
                <a href="<%=request.getContextPath()%>/admin/inventory">Inventory</a>
            </div>
            <div class="nav-link linkSelected">
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
            <img src="<%= request.getContextPath() %>/resources/logvector.jpeg" alt="Profile" onerror="this.style.display='none'">
            <div class="profileDetails">
                <span class="userName profile"><a href="<%=request.getContextPath()%>/profile">Admin</a></span>
                <span class="userRole">Sales Manager</span>
            </div>
        </div>
        <button class="logoutBtn" onclick="location.href='<%=request.getContextPath()%>/login'">Logout</button>
    </div>
</div>
<div class="order-content">
    <h1>Order Approvals</h1>
    <!-- OVERVIEW CARDS -->
<div class="order-overview">

    <div class="order-card">
        <h2>24</h2>
        <span>Total Orders</span>
    </div>

    <div class="order-card">
        <h2>12</h2>
        <span>Pending</span>
    </div>

    <div class="order-card">
        <h2>8</h2>
        <span>Approved</span>
    </div>

    <div class="order-card">
        <h2>4</h2>
        <span>Rejected</span>
    </div>

</div>
        <div class="order-section">
            

            <div class="order-header">
                <h2 class="order-title">Order Approval Queue</h2>
                
            </div>

            <table class="order-table">

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

                    <tr>
                        <td>#12345</td>
                        <td>2023-10-01</td>
                        <td>Rounak Bhandari</td>

                        <td>
                            <span class="order-status order-pending">Pending</span>
                        </td>

                        <td class="action-icons">
                            <span class="tick">✔</span>
                            <span class="cross">✖</span>
                        </td>

                        <td><span class="order-view">View Details</span></td>
                    </tr>

                    <tr>
                        <td>#12346</td>
                        <td>2023-10-02</td>
                        <td>Piyush Yadav</td>

                        <td>
                            <span class="order-status order-pending">Pending</span>
                        </td>

                        <td class="action-icons">
                            <span class="tick">✔</span>
                            <span class="cross">✖</span>
                        </td>

                        <td><span class="order-view">View Details</span></td>
                    </tr>

                </tbody>

            </table>

        </div>

    </div>
</div>
</body>
</html>