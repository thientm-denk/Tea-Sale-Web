/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;


public class UserDAO {

    private static final String LOGIN = "SELECT userID, roleID, userName, phone, address, email FROM tblUsers WHERE userID = ? AND password = ?";
    private static final String SEARCH = "SELECT userID, roleID, userName, phone, address, email FROM tblUsers WHERE userName like ?";
    
        
     public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user = null;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                

                rs = ptm.executeQuery();
                if (rs.next()) {
                    String userName = rs.getString("userName");
                    String roleID = rs.getString("roleID");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String email = rs.getString("email");

                    user = new UserDTO(userID, roleID, "***", userName,phone ,address ,email );
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
        return user;
    }
    
    
    
    
}
