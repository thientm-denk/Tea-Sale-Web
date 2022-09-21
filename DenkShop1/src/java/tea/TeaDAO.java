
package tea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sample.utils.DBUtils;


public class TeaDAO {
    
    private static final String DELETE = "DELETE tblProduct WHERE productID = ?";
    private static final String UPDATE = "UPDATE tblProduct SET productID=?, name=?, price=?, quantity=?, categoyID=? WHERE productID = ?";
    private static final String SEARCH_TEA = "SELECT productID, name, price, quantity, categoyID FROM tblProduct WHERE name like ?";
    private static final String INSERT_NEW_TEA = "INSERT INTO tblProduct (productID, name, price, quantity, categoyID) VALUES (?,?,?,?,?)";


    private static final String CHECK_ENOUGH = "SELECT productID, quantity FROM tblProduct WHERE productID like ?";
    private static final String INSERT_ORDER = "INSERT INTO tblOrder(UserID, total) Values(?,?)";
    private static final String GET_ID_DETAIL_ORDER = "SELECT oderID FROM tblOrder WHERE UserID = ? AND total =?";
    private static final String INSERT_ORDER_DETAIL = "INSERT INTO tblOrderDetail(orderID, productID, price, quantity) Values(?,?,?,?)";
    private static final String UPDATE_PRODUCT = "UPDATE tblproduct SET quantity = ? WHERE productID = ?";
    public List<Tea> getListTea(String search) throws SQLException {
        List<Tea> listTea = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH_TEA);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String name = rs.getString("name");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String categoyID = rs.getString("categoyID");
                    
                    
                    listTea.add(new Tea(productID, name, price, quantity, categoyID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return listTea;
    }

    public boolean delete(String teaID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, teaID);
                check = ptm.executeUpdate()> 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                ptm.close();
            }
        }

        return check;
    }
    
    public boolean update(Tea tea) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);
                ptm.setString(1, tea.getProductID());
                ptm.setString(2, tea.getName());
                ptm.setFloat(3, tea.getPrice());
                ptm.setInt(4, tea.getQuantity());
                ptm.setString(5, tea.getCategoyID());
                ptm.setString(6, tea.getProductID());
                check = ptm.executeUpdate()> 0 ? true : false;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                ptm.close();
            }
        }

        return check;
    }

    
    

    public boolean insertNewTea(Tea tea) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_NEW_TEA);
                String ID = tea.getProductID();
                ptm.setString(1, tea.getProductID());
                ptm.setString(2, tea.getName());
                ptm.setFloat(3, tea.getPrice());
                ptm.setInt(4, tea.getQuantity());
                ptm.setString(5, tea.getCategoyID());
                check = check = ptm.executeUpdate()> 0 ? true : false;
                
            }
        }
        finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    public Tea checkEnough(Tea tea) throws SQLException {
        Tea teaError = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String id = tea.getProductID();
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_ENOUGH);
                ptm.setString(1,id );
                rs = ptm.executeQuery();
                if(rs.next()){
                    
                }else{
                    teaError = new Tea();
                }
                int quantity = tea.getQuantity();
                if (rs.getInt("quantity") < quantity) {
                    teaError = new Tea(tea.getProductID(), tea.getName(), tea.getPrice(), rs.getInt("quantity"), tea.getCategoyID());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            
        }

        return teaError;
    }
    
    public int getID(String userID, float total) throws SQLException {
        
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int id = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {

                ptm = conn.prepareStatement(GET_ID_DETAIL_ORDER);
                ptm.setString(1,userID);
                ptm.setFloat(2,total);
                rs = ptm.executeQuery();
                
                if(rs.next()){
                    id = rs.getInt("oderID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            
        }
        return id;
    }
    
    public int insert_Oder(String userID, float total) throws SQLException {
        
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        int id = -1;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER);
                ptm.setString(1,userID);
                ptm.setFloat(2,total);
                ptm.executeUpdate();

                ptm = conn.prepareStatement(GET_ID_DETAIL_ORDER);
                ptm.setString(1,userID);
                ptm.setFloat(2,total);
                rs = ptm.executeQuery();
                
                if(rs.next()){
                    id = rs.getInt("oderID");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            
        }
        
        return id;
    }
    
    public boolean checkOut(int id, Tea tea) throws SQLException {
        Tea teaError = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT_ORDER_DETAIL);
                ptm.setInt(1, id);
                ptm.setString(2,tea.getProductID());
                ptm.setFloat(3,tea.getPrice());
                ptm.setInt(4, tea.getQuantity());
                ptm.executeQuery();
                
                check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
            
        }

        return check;
    }
    
}
