

package sample.user;


public class UserError {
    private String userID;
    private String fullname;
    private String roleID;
    private String password;
    private String confirm;
    private String error;

    public UserError() {
        this.userID = "";
        this.fullname = "";
        this.roleID = "";
        this.password = "";
        this.confirm = "";
        this.error = "";
    }

    public UserError(String userID, String fullname, String roleID, String password, String confirm, String error) {
        this.userID = userID;
        this.fullname = fullname;
        this.roleID = roleID;
        this.password = password;
        this.confirm = confirm;
        this.error = error;
    }
    
    

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
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

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }
    
    
}
