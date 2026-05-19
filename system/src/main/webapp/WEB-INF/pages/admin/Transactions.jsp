<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TradeFlow - Transaction History</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/topNav.css?v=2">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminTransactions.css">
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
            <div class="nav-link">
                <a href="<%=request.getContextPath()%>/admin/pendingUsers">User Approvals</a>
            </div>
            <div class="nav-link">
                <a href="<%=request.getContextPath()%>/admin/retailers">Retailers</a>
            </div>
            <div class="nav-link linkSelected">
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
 <div class="transaction-content">

        <!-- HEADER -->
        <div class="transaction-header">
            <h1>Transaction History</h1>
            <p>Select a retailer to view their payment records</p>
        </div>

        <!-- FILTERS -->
        <div class="transaction-filters">

            <input type="text" class="transaction-search" placeholder="Search retailer...">


        </div>

        <!-- CARDS -->
        <div class="transaction-cards">

            <div class="transaction-card">
                <h2>Rs. 1,20,000</h2>
                <span>Total Paid</span>
            </div>

            <div class="transaction-card">
                <h2>Rs. 25,000</h2>
                <span>Pending Amount</span>
            </div>

            <div class="transaction-card">
                <h2>18</h2>
                <span>Total Transactions</span>
            </div>

        </div>

        <!-- TABLE -->
        <div class="transaction-table-section">

            <div class="section-header">
                <h2 class="section-title">Payment Records</h2>
               
            </div>

            <table class="table">

                <thead>
                    <tr>
                        <th>Txn ID</th>
                        <th>Date</th>
                        <th>Amount</th>
                        <th>Method</th>
          
                        <th>Invoice</th>
                    </tr>
                </thead>

                <tbody>

                    <tr>
                        <td>#TXN001</td>
                        <td>2026-01-12</td>
                        <td>Rs. 12,500</td>
                        <td>Bank Transfer</td>
                        
                        <td><span class="txn-link">View</span></td>
                    </tr>

                    <tr>
                        <td>#TXN002</td>
                        <td>2026-01-15</td>
                        <td>Rs. 8,000</td>
                        <td>Cash</td>
                        
                        <td><span class="txn-link">View</span></td>
                    </tr>

                </tbody>

            </table>

        </div>

    </div>

</div>

</body>
</html>