package com.lmsu.orderdata.orderitems;

import com.lmsu.utils.DBHelpers;

import javax.crypto.Cipher;
import javax.naming.NamingException;
import javax.print.attribute.standard.MediaSize;
import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDAO implements Serializable {

    private Connection conn;
    private List<OrderItemDTO> orderItemList;

    public List<OrderItemDTO> getOrderItemList() {
        return this.orderItemList;
    }

    public OrderItemDAO() {
    }

    public OrderItemDAO(Connection conn) {
        this.conn = conn;
    }

    public void viewOrderItems(String memberID) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "SELECT OrderItems.id, [orderID], OrderItems.memberID, [bookID], [lendStatus], [returnDeadline], [lendDate], [returnDate] " +
                        "FROM OrderItems, Orders " +
                        "WHERE OrderItems.memberID = ? " +
                        "AND OrderItems.orderID = Orders.id " +
                        "AND Orders.activeStatus = 1 AND OrderItems.lendStatus = 2";
                stm = con.prepareStatement(sql);
                stm.setString(1, memberID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    int orderID = rs.getInt("orderID");
                    String memberIDval = rs.getString("memberID");
                    String bookID = rs.getString("bookID");
                    int lendStatus = rs.getInt("lendStatus");
                    Date returnDeadline = rs.getDate("returnDeadline");
                    Date lendDate = rs.getDate("lendDate");
                    Date returnDate = rs.getDate("returnDate");
                    OrderItemDTO dto = new OrderItemDTO(id, orderID, memberIDval, bookID, lendStatus, returnDeadline, lendDate, returnDate);

                    if (this.orderItemList == null) {
                        this.orderItemList = new ArrayList<OrderItemDTO>();
                    }
                    this.orderItemList.add(dto);
                }
            }

        } finally {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (con != null) con.close();
        }
    }

    public boolean addOrderItems(List<OrderItemDTO> orderItems)
            throws SQLException, NamingException {
        PreparedStatement stm = null;
        try {
            if (conn != null) {
                String sql = "INSERT INTO [OrderItems] " +
                        "([orderID], [memberID], [bookID], [lendStatus], [returnDeadline], [lendDate]) " +
                        "VALUES(?, ?, ?, ?, CURRENT_TIMESTAMP + 14, ?) ";
                stm = conn.prepareStatement(sql);
                for (OrderItemDTO orderItem : orderItems) {
                    stm.setInt(1, orderItem.getOrderID());
                    stm.setString(2, orderItem.getMemberID());
                    stm.setString(3, orderItem.getBookID());
                    stm.setInt(4, orderItem.getLendStatus());
                    stm.setDate(5, orderItem.getLendDate());
                    stm.addBatch();
                    stm.clearParameters();
                }
                int[] rows = stm.executeBatch();
                boolean addFailed = false;
                for (int row : rows) {
                    if (row == 0) addFailed = true;
                }
                if (!addFailed) return true;
            }
        } finally {
            if (stm != null) stm.close();
        }
        return false;
    }

    public boolean returnBook(String orderItemsPk, int lendStatus) throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            //1. Connect DB using method built
            con = DBHelpers.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "UPDATE [OrderItems] " +
                        "SET [lendStatus] = ? " +
                        "WHERE [id] = ? ";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setInt(1, lendStatus);
                stm.setString(2, orderItemsPk);
                //4. Execute Query and get rows affected
                int rows = stm.executeUpdate();
                //5. Process result
                if (rows > 0) return true;
            }
        } finally {
            if (stm != null) stm.close();
            if (con != null) con.close();
        }
        return false;
    }

    public OrderItemDTO searchItemsByMemberID(String memberID) throws SQLException, NamingException{

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try{
            con = DBHelpers.makeConnection();
            if(con != null){
                String sql = "SELECT [id], [orderID], [memberID], [bookID], [lendStatus], [returnDeadline], [lendDate], [returnDate] " +
                        "FROM [OrderItems] " +
                        "WHERE [memberID] = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, memberID);

                rs = stm.executeQuery();
                if(rs.next()){
                    int orderItemsID = rs.getInt("id");
                    int orderID = rs.getInt("orderID");
                    String memberIDVal = rs.getString("memberID");
                    String bookID = rs.getString("bookID");
                    int lendStatus  = rs.getInt("lendStatus");
                    Date returnDeadline = rs.getDate("returnDeadline");
                    Date lendDate = rs.getDate("lendDate");
                    Date returnDate = rs.getDate("returnDate");
                    OrderItemDTO dto = new OrderItemDTO(orderItemsID, orderID, memberIDVal, bookID, lendStatus,
                            returnDeadline, lendDate, returnDate);
                    return dto;
                }
            }

        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return null;
    }

    public OrderItemDTO getItemsByBookID(String bookID, String memberID) throws SQLException, NamingException{

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelpers.makeConnection();
            if (con != null) {
                String sql = "SELECT [id], [orderID], [memberID], [bookID], [lendStatus], [returnDeadline], [lendDate], [returnDate] " +
                        "FROM [OrderItems] " +
                        "WHERE [bookID] = ? " +
                        "AND [memberID] = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, bookID);
                stm.setString(2, memberID);

                rs = stm.executeQuery();
                if (rs.next()) {
                    int orderItemsID = rs.getInt("id");
                    int orderID = rs.getInt("orderID");
                    String memberIDVal = rs.getString("memberID");
                    String bookIDVal = rs.getString("bookID");
                    int lendStatus = rs.getInt("lendStatus");
                    Date returnDeadline = rs.getDate("returnDeadline");
                    Date lendDate = rs.getDate("lendDate");
                    Date returnDate = rs.getDate("returnDate");
                    OrderItemDTO dto = new OrderItemDTO(orderItemsID, orderID, memberIDVal, bookIDVal, lendStatus,
                            returnDeadline, lendDate, returnDate);
                    return dto;

                }

            }
        } finally {
            if(rs != null) rs.close();
            if(stm != null) stm.close();
            if(con != null) con.close();
        }
        return null;
    }
}