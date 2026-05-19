<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TradeFlow - Add Retailer</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/topNav.css?v=2">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/addRetailer.css?v=1">
</head>
<body>
<div class="main-container">

    <div class="top-nav">
        <div class="nav-left">
            <div class="logo">TradeFlow</div>
            <div class="nav-links">
                <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a></div>
                <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/inventory">Inventory</a></div>
                <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/orderApprovals">Order Approvals</a></div>
                <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/pendingUsers">User Approvals</a></div>
                <div class="nav-link linkSelected"><a href="<%=request.getContextPath()%>/admin/retailers">Retailers</a></div>
                <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/transactions">Transactions</a></div>
            </div>
        </div>
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

    <div class="content-container">

        <div class="hero">
            <h1>Add Retailer</h1>
            <p>Fill in the details to register a new retailer</p>
        </div>

        <!-- ALERTS -->
        <c:if test="${not empty errorMessage}">
            <div class="alert error">${errorMessage}</div>
        </c:if>
<div class="form-container">
        <div class="form-card">

            <div class="form-card-header">
                <h2>Retailer Details</h2>
                <a href="<%=request.getContextPath()%>/admin/retailers" class="back-btn">← Back to Retailers</a>
            </div>

            <form method="post" action="<%=request.getContextPath()%>/admin/retailers">

                <div class="form-row">
                    <div class="form-group">
                        <label>Shop Name</label>
                        <input type="text" name="shopName" placeholder="Enter shop name" required />
                    </div>
                    <div class="form-group">
                        <label>Owner Name</label>
                        <input type="text" name="ownerName" placeholder="Enter owner name" required />
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Phone</label>
                        <input type="text" name="phone" placeholder="Enter phone number" required />
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input type="text" name="address" placeholder="Enter address" required />
                    </div>
       
                </div>

                <div class="form-actions">
                    <a href="<%=request.getContextPath()%>/admin/retailers" class="cancel-btn">Cancel</a>
                    <button type="submit" class="submit-btn">Add Retailer</button>
                </div>

            </form>
        </div>
    </div>
   </div>
 
 </div>
</body>
</html>
