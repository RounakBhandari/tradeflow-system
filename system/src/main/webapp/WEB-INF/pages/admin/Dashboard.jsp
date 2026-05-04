<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/leftNav.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminDashboard.css">
<title>Admin Dashboard</title>
</head>
<body>

<div class="main-container">
    
    <div class="left-nav">
        <div class="logo">
            <img src="">
            <span>TradeFlow</span>
        </div>

        <div class="nav-links">
            <div class="nav-link linkSelected"><a href="#">Dashboard</a></div>
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/inventory">Inventory</a></div>
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/orderApprovals">Order Approvals</a></div>
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/pendingUsers">User Approvals</a></div>
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
        
        <div class="title">Overview</div>

        <div class="cards">
            <div class="card">TOTAL REVENUE</div>
            <div class="card">ORDER APPROVALS</div>
            <div class="card">LOW STOCK ALERTS</div>
            <div class="card">OUTSTANDING DUES</div>
        </div>

        <div class="section">
            <div class="section-header">
                <div class="section-title">Order Approval Queue</div>
                <button class="view-btn">View All</button>
            </div>

            <table class="table">
                <thead>
                    <tr>
                        <th>RETAILER</th>
                        <th>ORDER ID</th>
                        <th>VALUE</th>
                        <th>STATUS</th>
                        <th>ACTIONS</th>
                    </tr>
                </thead>
                <tr>
                    <td>Rounak Bhandari</td>
                    <td>#ORD-9921</td>
                    <td>Rs. 12,450.00</td>
                    <td><span class="status">Review</span></td>
                    <td>
                        <div class="actions">
                            <button class="action-btn">❌</button>
                            <button class="action-btn">✔️</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>Binishaan Basnet</td>
                    <td>#ORD-9925</td>
                    <td>Rs. 8,120.00</td>
                    <td><span class="status">Review</span></td>
                    <td>
                        <div class="actions">
                            <button class="action-btn">❌</button>
                            <button class="action-btn">✔️</button>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

        <div class="inventory">
            <div class="section-title">Inventory</div>
        </div>

    </div>

</div>

</body>
</html>