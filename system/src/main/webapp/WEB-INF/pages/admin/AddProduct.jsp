<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/leftNav.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/addProduct.css">
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
            <div class="nav-link linkSelected"><a href="<%=request.getContextPath()%>/admin/addProduct">Add Product</a></div>            
            <div class="nav-link"><a href="<%=request.getContextPath()%>/admin/orderApprovals">Order Approvals</a></div>
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
            <p>Admin > Inventory > Add Product</p>
        </div>
    </div>

    <div class="form-container">
        <h3>Add New Product</h3>

        <form action="<%=request.getContextPath()%>/admin/addProduct" method="post">

            <div class="form-group">
                <label>Product Name</label>
                <input type="text" name="productName" required>
            </div>

            <div class="form-group">
                <label>Brand</label>
                <input type="text" name="productBrand" required>
            </div>

            <div class="form-group">
                <label>Category</label>
                <input type="text" name="category">
            </div>

            <div class="form-group">
                <label>Price</label>
                <input type="number" name="price" required>
            </div>

            <div class="form-group">
                <label>Stock Quantity</label>
                <input type="number" name="stockQuantity" required>
            </div>

            <div class="button-group">
                <button type="submit" class="submitBtn">Add Product</button>
                <a href="<%=request.getContextPath()%>/admin/inventory">
                    <button type="button" class="cancelBtn">Cancel</button>
                </a>
            </div>

        </form>
    </div>

</div>
</div>


</body>
</html>