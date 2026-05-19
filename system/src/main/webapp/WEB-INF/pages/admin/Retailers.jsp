<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TradeFlow - Retailers</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/topNav.css?v=2">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminRetailers.css?v=1">
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

        <div class="hero">
            <div>
                <h1>Retailers</h1>
                <p>Manage all registered retailers</p>
            </div>
            <a href="<%=request.getContextPath()%>/admin/addRetailer" class="add-btn">+ Add Retailer</a>
        </div>

        <!-- ALERTS -->
        <c:if test="${not empty successMessage}">
            <div class="alert success">${successMessage}</div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="alert error">${errorMessage}</div>
        </c:if>

        <div class="section">
    <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Shop Name</th>
                        <th>Owner</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Due Amount</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${empty retailers}">
                            <tr>
                                <td colspan="6" class="empty-msg">No retailers found.</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="r" items="${retailers}">
                                <tr>
                                    <td>#${r.retailerId}</td>
                                    <td>${r.shopName}</td>
                                    <td>${r.ownerName}</td>
                                    <td>${r.phone}</td>
                                    <td>${r.address}</td>
                                    <td>Rs. ${r.dueAmount}</td>
                                    <td>
    <form method="post" action="<%=request.getContextPath()%>/admin/retailers">
        <input type="hidden" name="action" value="delete" />
        <input type="hidden" name="retailerId" value="${r.retailerId}" />
        <button type="submit" class="delete-btn">Delete</button>
    </form>
</td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>

    </div>
</div>
</body>
</html>
