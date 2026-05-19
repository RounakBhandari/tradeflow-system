<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TradeFlow - Update Product</title>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/css/topNav.css?v=2">

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap');

            body {
                background: #f4f7fc;
                min-height: 100vh;
                margin: 0;
                font-family: 'Outfit', sans-serif;
            }

            .add-product-wrapper {
                background: #ffffff;
                border: 1px solid #e2e8f0;
                width: 100%;
                max-width: 800px;
                border-radius: 24px;
                padding: 50px;
                box-shadow: 0 20px 40px rgba(0, 0, 0, 0.05);
                color: #0f172a;
                margin: 40px auto;
            }

            .form-header {
                text-align: center;
                margin-bottom: 40px;
            }

            .form-header h2 {
                font-size: 36px;
                font-weight: 700;
                margin: 0 0 10px 0;
                color: #000000;
            }

            .form-header p {
                color: #94a3b8;
                font-size: 16px;
                margin: 0;
            }

            .form-grid {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 25px;
                margin-bottom: 40px;
            }

            .form-group {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            .form-group.full-width {
                grid-column: span 2;
            }

            .form-group label {
                font-size: 14px;
                font-weight: 500;
                color: #475569;
                letter-spacing: 0.5px;
            }

            .form-group input {
                background: #f8fafc;
                border: 1px solid #e2e8f0;
                padding: 16px 20px;
                border-radius: 12px;
                color: #0f172a;
                font-size: 16px;
                font-family: 'Outfit', sans-serif;
                transition: all 0.3s ease;
                outline: none;
            }

            .form-group input::placeholder {
                color: #94a3b8;
            }

            .form-group input:focus:not(:read-only) {
                border-color: #38bdf8;
                box-shadow: 0 0 0 4px rgba(56, 189, 248, 0.1);
                background: #ffffff;
            }

            .form-group input:read-only {
                background: #f1f5f9;
                color: #64748b;
                cursor: not-allowed;
                border-color: transparent;
            }

            .button-group {
                display: flex;
                gap: 20px;
                justify-content: flex-end;
                align-items: center;
                border-top: 1px solid rgba(255, 255, 255, 0.1);
                padding-top: 30px;
            }

            .btn {
                padding: 16px 32px;
                border-radius: 12px;
                font-size: 16px;
                font-weight: 600;
                font-family: 'Outfit', sans-serif;
                cursor: pointer;
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
                text-decoration: none;
                border: none;
                display: inline-flex;
                align-items: center;
                justify-content: center;
            }

            .btn-cancel {
                background: transparent;
                color: #475569;
                border: 1px solid #e2e8f0;
            }

            .btn-submit {
                background: #1079b9;
                color: white;
            }

            .btn-submit:hover {
                background: #059669;
            }

            .btn-submit:active {
                transform: translateY(0);
            }

            @media (max-width: 600px) {
                .form-grid {
                    grid-template-columns: 1fr;
                }

                .add-product-wrapper {
                    padding: 30px 20px;
                }
            }

            .error-alert {
                background: #fef2f2;
                border: 1px solid #fca5a5;
                color: #b91c1c;
                padding: 16px 20px;
                border-radius: 12px;
                margin-bottom: 25px;
                display: flex;
                align-items: center;
                gap: 12px;
                font-size: 15px;
                font-weight: 500;
            }
            .error-alert svg {
                flex-shrink: 0;
            }
        </style>
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
            <div class="add-product-wrapper">
            <div class="form-header">
                <h2>Update Product</h2>
                <p>Modify product details to instantly update your inventory.</p>
            </div>

            <c:if test="${not empty error}">
                <div class="error-alert">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="lucide lucide-alert-circle"><circle cx="12" cy="12" r="10"/><line x1="12" x2="12" y1="8" y2="12"/><line x1="12" x2="12.01" y1="16" y2="16"/></svg>
                    <span>${error}</span>
                </div>
            </c:if>

            <form action="<%=request.getContextPath()%>/admin/updateProduct" method="post">
                <div class="form-grid">

                    <div class="form-group">
                        <label>Product ID</label>
                        <input type="number" name="productId" value="${product.productId}" readonly required>
                    </div>

                    <div class="form-group">
                        <label>Status</label>
                        <input type="text" value="${product.stockQuantity == 0 ? 'Out of Stock' : (product.stockQuantity <= product.minStockQuantity ? 'Low Stock' : 'In Stock')}" readonly>
                    </div>

                    <div class="form-group full-width">
                        <label>Product Name</label>
                        <input type="text" name="productName" placeholder="e.g. Wireless Mechanical Keyboard" value="${not empty param.productName ? param.productName : product.productName}" required>
                    </div>

                    <div class="form-group">
                        <label>Brand</label>
                        <input type="text" name="productBrand" placeholder="e.g. Keychron" value="${not empty param.productBrand ? param.productBrand : product.productBrand}" required>
                    </div>

                    <div class="form-group">
                        <label>Category</label>
                        <input type="text" name="category" placeholder="e.g. Electronics" value="${not empty param.category ? param.category : product.category}" required>
                    </div>

                    <div class="form-group">
                        <label>Price (Rs)</label>
                        <input type="number" name="price" placeholder="0" min="0" value="${not empty param.price ? param.price : product.price}" required>
                    </div>

                    <div class="form-group">
                        <label>Stock Quantity</label>
                        <input type="number" name="stockQuantity" placeholder="0" min="0" value="${not empty param.stockQuantity ? param.stockQuantity : product.stockQuantity}" required>
                    </div>

                    <div class="form-group">
                        <label>Min Stock Alert Level</label>
                        <input type="number" name="minStockQuantity" placeholder="e.g. 20" min="0" value="${not empty param.minStockQuantity ? param.minStockQuantity : product.minStockQuantity}" required>
                    </div>

                </div>

                <div class="button-group">
                    <a href="<%=request.getContextPath()%>/admin/inventory" class="btn btn-cancel">Cancel</a>
                    <button type="submit" class="btn btn-submit">Update Product</button>
                </div>
            </form>
        </div>
        </div>

    </body>

    </html>
