<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/leftNav.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/adminOrderApprovals.css">
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
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/inventory">Inventory</a></div>
            <div class="nav-link linkSelected"><a href="<%=request.getContextPath()%>/admin/orderApprovals">Order Approvals</a></div>
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
            <p>Admin > Order Approvals</p>
        </div>
      </div>
      <div class="orderQueue">
        <div class="header">
            <h3>Order Approval Queue</h3>
        </div>
            <table class="pendingTable">
    <tr>
        <th>Email</th>
        <th>Role</th>
        <th>Action</th>
    </tr>

    <c:choose>

        <c:when test="${not empty pendingUsers}">
            <c:forEach var="u" items="${pendingUsers}">
                <tr>
                    <td>${u.email}</td>
                    <td>${u.role}</td>
                    <td>
                       <a href="<%=request.getContextPath()%>/admin/updateUserStatus?id=${u.userId}&action=approve">
                            <button>Approve</button>
                        </a>

                        <a href="<%=request.getContextPath()%>/admin/updateUserStatus?id=${u.userId}&action=reject">
                            <button>Reject</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </c:when>

        <c:otherwise>
            <tr>
                <td colspan="3">No pending users</td>
            </tr>
        </c:otherwise>

    </c:choose>
</table>
        </div>

      </div>

</div>

</body>
</html>