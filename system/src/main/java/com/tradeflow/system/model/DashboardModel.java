package com.tradeflow.system.model;

import java.util.List;

public class DashboardModel {

    // Overview cards
    private double totalRevenue;
    private int pendingApprovals;
    private int lowStockCount;
    private double outstandingDues;

    // Summary tables (max 2 rows each for dashboard preview)
    private List<OrderSummary> recentOrders;
    private List<ProductSummary> lowStockProducts;

    // ─── Getters & Setters ───────────────────────────────────────────────────

    public double getTotalRevenue() { return totalRevenue; }
    public void setTotalRevenue(double totalRevenue) { this.totalRevenue = totalRevenue; }

    public int getPendingApprovals() { return pendingApprovals; }
    public void setPendingApprovals(int pendingApprovals) { this.pendingApprovals = pendingApprovals; }

    public int getLowStockCount() { return lowStockCount; }
    public void setLowStockCount(int lowStockCount) { this.lowStockCount = lowStockCount; }

    public double getOutstandingDues() { return outstandingDues; }
    public void setOutstandingDues(double outstandingDues) { this.outstandingDues = outstandingDues; }

    public List<OrderSummary> getRecentOrders() { return recentOrders; }
    public void setRecentOrders(List<OrderSummary> recentOrders) { this.recentOrders = recentOrders; }

    public List<ProductSummary> getLowStockProducts() { return lowStockProducts; }
    public void setLowStockProducts(List<ProductSummary> lowStockProducts) { this.lowStockProducts = lowStockProducts; }

    // ─── Inner class: OrderSummary ───────────────────────────────────────────
    // Represents a row in the Order Approval Queue table

    public static class OrderSummary {
        private int orderId;
        private String date;
        private String retailerName;
        private String status;

        public int getOrderId() { return orderId; }
        public void setOrderId(int orderId) { this.orderId = orderId; }

        public String getDate() { return date; }
        public void setDate(String date) { this.date = date; }

        public String getRetailerName() { return retailerName; }
        public void setRetailerName(String retailerName) { this.retailerName = retailerName; }

        public String getStatus() { return status; }
        public void setStatus(String status) { this.status = status; }
    }

    // ─── Inner class: ProductSummary ─────────────────────────────────────────
    // Represents a row in the Inventory (low stock) table

    public static class ProductSummary {
        private int productId;
        private String productName;
        private String category;
        private int stock;
        private String status;
    

        public int getProductId() { return productId; }
        public void setProductId(int productId) { this.productId = productId; }

        public String getProductName() { return productName; }
        public void setProductName(String productName) { this.productName = productName; }

        public String getCategory() { return category; }
        public void setCategory(String category) { this.category = category; }

        public int getStock() { return stock; }
        public void setStock(int stock) { this.stock = stock; }

        public String getStatus() { return status; }
        public void setStatus(String status) { this.status = status; }

  
    }
}