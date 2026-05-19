<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
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
        <div class="logo">TradeFlow</div>
        <div class="nav-links">
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/dashboard">Dashboard</a></div>
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/inventory">Inventory</a></div>
            <div class="nav-link linkSelected"><a href="<%=request.getContextPath()%>/admin/orderApprovals">Order Approvals</a></div>
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/pendingUsers">User Approvals</a></div>
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/retailers">Retailers</a></div>
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/transactions">Transactions</a></div>
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

<div class="order-content">
    <h1>Order Approvals</h1>

    <!-- ALERTS -->
    <c:if test="${not empty errorMessage}">
        <div class="alert error">${errorMessage}</div>
    </c:if>

    <!-- OVERVIEW CARDS -->
    <div class="order-overview">
        <div class="order-card">
            <h2>${totalOrders}</h2>
            <span>Total Orders</span>
        </div>
        <div class="order-card">
            <h2>${pendingCount}</h2>
            <span>Pending</span>
        </div>
        <div class="order-card">
            <h2>${approvedCount}</h2>
            <span>Approved</span>
        </div>
        <div class="order-card">
            <h2>${rejectedCount}</h2>
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
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Actions</th>
                    <th>Details</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${empty orders}">
                        <tr>
                            <td colspan="7" class="empty-msg">No orders found.</td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="order" items="${orders}">
                            <tr>
                                <td>#${order.orderId}</td>
                                <td>${order.orderDate}</td>
                                <td>${order.retailerName}</td>
                                <td>Rs. ${order.totalAmount}</td>

                                <td>
                                    <span class="order-status 
                                        ${order.status == 'pending' ? 'order-pending' : 
                                          order.status == 'approved' ? 'order-approved' : 'order-rejected'}">
                                        ${order.status}
                                    </span>
                                </td>

                                <!-- Approve / Reject — only show buttons for pending orders -->
                                <td class="action-icons">
                                    <c:choose>
                                        <c:when test="${order.status == 'pending'}">
                                            <form method="post" action="<%=request.getContextPath()%>/admin/orderApprovals" style="display:inline;">
                                                <input type="hidden" name="orderId" value="${order.orderId}" />
                                                <input type="hidden" name="action" value="approve" />
                                                <button type="submit" class="tick" title="Approve">✔</button>
                                            </form>
                                            <form method="post" action="<%=request.getContextPath()%>/admin/orderApprovals" style="display:inline;">
                                                <input type="hidden" name="orderId" value="${order.orderId}" />
                                                <input type="hidden" name="action" value="reject" />
                                                <button type="submit" class="cross" title="Reject">✖</button>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="action-done">—</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>

                                <td><span class="order-view">View Details</span></td>
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
