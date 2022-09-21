/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.user;

public class UserDTO {
    private String userID;
    private String roleID;
    private String password;
    private String userName;
    private String phone;
    private String address;
    private String email;

    public UserDTO() {
        this.userID = "";
        this.roleID = "";;
        this.password = "";;
        this.userName = "";;
        this.phone = "";;
        this.address = "";;
        this.email = "";;
    }

    public UserDTO(String userID, String roleID, String password, String userName, String phone, String address, String email) {
        this.userID = userID;
        this.roleID = roleID;
        this.password = password;
        this.userName = userName;
        this.phone = phone;
        this.address = address;
        this.email = email;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    
    
}
