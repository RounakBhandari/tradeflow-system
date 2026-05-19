<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TradeFlow - User Approvals</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/topNav.css?v=2">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminUsers.css">
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
            <div class="nav-link">
                <a href="<%=request.getContextPath()%>/admin/orderApprovals">Order Approvals</a>
            </div>
            <div class="nav-link linkSelected">
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
 <div class="user-content">
          <h1>User Approvals</h1>
        <div class="user-section">

            <div class="user-header">
                <h2 class="user-title">User Approval Queue</h2>
            </div>

            <table class="user-table">

                <thead>
                    <tr>
                        <th>User ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>#U1001</td>
                        <td>Rounak Bhandari</td>
                        <td>rounak@email.com</td>
                        <td>Retailer</td>

                        <td>
                            <span class="user-status user-pending">Pending</span>
                        </td>

                        <td class="user-actions">
                            <span class="user-tick">✔</span>
                            <span class="user-cross">✖</span>
                        </td>
                    </tr>

                    <tr>
                        <td>#U1002</td>
                        <td>Binishaan Basnet</td>
                        <td>binishaan@email.com</td>
                        <td>Retailer</td>

                        <td>
                            <span class="user-status user-pending">Pending</span>
                        </td>

                        <td class="user-actions">
                            <span class="user-tick">✔</span>
                            <span class="user-cross">✖</span>
                        </td>
                    </tr>

                </tbody>

            </table>

        </div>

    </div>

</div>
</body>
</html>