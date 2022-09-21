/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea;

public class Tea {
    
    private String productID;
    private String name;
    private float price;
    private int quantity;
    private String categoyID;

    public Tea() {
        this.productID = "";
        this.name = "";
        this.price = 0;
        this.quantity = 0;
        this.categoyID = "";
    }

    public Tea(String productID, String name, float price, int quantity, String categoyID) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.categoyID = categoyID;
    }

    Tea(String productID, int aInt) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getCategoyID() {
        return categoyID;
    }

    public void setCategoyID(String categoyID) {
        this.categoyID = categoyID;
    }

    

    
}
