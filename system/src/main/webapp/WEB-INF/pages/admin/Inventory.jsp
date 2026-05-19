<%@ page isELIgnored="false" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>TradeFlow - Sales Manager</title>
            <link rel="stylesheet" href="<%=request.getContextPath()%>/css/adminInventory.css">
            <link rel="stylesheet" href="<%=request.getContextPath()%>/css/topNav.css?v=2">
        </head>
        
        <body>
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
                        <div class="nav-link linkSelected">
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
                            <a href="#">Transactions</a>
                        </div>
                    </div>
                </div>
            
                <!-- RIGHT -->
                <div class="nav-right">
                    <div class="profile">
                        <img src="<%= request.getContextPath() %>/resources/logvector.jpeg" alt="Profile" onerror="this.style.display='none'">
                        <div class="profileDetails">
                            <span class="userName">Admin</span>
                            <span class="userRole">Sales Manager</span>
                        </div>
                    </div>
                    <button class="logoutBtn" onclick="location.href='<%=request.getContextPath()%>/login'">Logout</button>
                </div>
            </div>

            <div class="main-container">

                <div class="inventory-content">

                    <!-- HERO -->
                    <div class="inventory-hero">
                        <h1>Inventory Management</h1>

                    </div>

                    <!-- CARDS -->
                    <div class="inventory-cards">

                        <div class="inventory-card">
                            <h2>
                                <c:choose>
                                    <c:when test="${empty totalProducts or totalProducts == 0}">-</c:when>
                                    <c:otherwise>${totalProducts}</c:otherwise>
                                </c:choose>
                            </h2>
                            <span>Total Products</span>
                        </div>

                        <div class="inventory-card">
                            <h2>
                                <c:choose>
                                    <c:when test="${empty lowStockItems or lowStockItems == 0}">-</c:when>
                                    <c:otherwise>${lowStockItems}</c:otherwise>
                                </c:choose>
                            </h2>
                            <span>Low Stock Items</span>
                        </div>

                        <div class="inventory-card">
                            <h2>
                                <c:choose>
                                    <c:when test="${empty outOfStock or outOfStock == 0}">-</c:when>
                                    <c:otherwise>${outOfStock}</c:otherwise>
                                </c:choose>
                            </h2>
                            <span>Out of Stock</span>
                        </div>

                    </div>

                    <!-- TABLE -->
                    <div class="inventory-table-section">

                        <div class="inventory-table-header">

                            <h2 class="inventory-table-title">Inventory List</h2>

                            <div class="inventory-actions">

                                <input type="text" class="inventory-search" placeholder="Search products...">

                                <a href="<%=request.getContextPath()%>/admin/addProduct" style="text-decoration: none;">
                                    <button type="button" class="add-product-btn">+ Add Product</button>
                                </a>

                            </div>

                        </div>

                        <table class="inventory-table">

                            <thead>
                                <tr>
                                    <th>Product ID</th>
                                    <th>Product Name</th>
                                    <th>Category</th>
                                    <th>Stock</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>

                            <tbody>

                                <c:choose>
                                    <c:when test="${not empty productList}">
                                        <c:forEach var="product" items="${productList}">
                                            <tr>
                                                <td>B-${product.productId}</td>
                                                <td>${product.productName}</td>
                                                <td>${product.category}</td>
                                                <td>${product.stockQuantity}</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${product.stockQuantity == 0}">
                                                            <span class="stock-status stock-out">Out of Stock</span>
                                                        </c:when>
                                                        <c:when test="${product.stockQuantity <= product.minStockQuantity}">
                                                            <span class="stock-status stock-low">Low Stock</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="stock-status stock-available">In Stock</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="<%=request.getContextPath()%>/admin/updateProduct?id=${product.productId}" class="inventory-btn" style="text-decoration: none; display: inline-block;">Update</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="6"
                                                style="text-align: center; padding: 20px; font-size: 24px; color: #94a3b8;">
                                                -</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>

                            </tbody>

                        </table>

                    </div>

                </div>

            </div>
           
        </body>

        </html>