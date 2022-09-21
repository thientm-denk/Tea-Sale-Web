/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tea;

import java.util.HashMap;

public class Cart {
    
    private HashMap<String, Tea> cart = new HashMap<>();

    public Cart() {
    }

    public HashMap<String, Tea> getCart() {
        return cart;
    }

    public void setCart(HashMap<String, Tea> cart) {
        this.cart = cart;
    }
    
    
    public boolean add(Tea tea){
        boolean check = false;
        if(this.cart == null){
            this.cart = new HashMap<>();
        }
        
        if (this.cart.containsKey(tea.getProductID())) {
            int currentQuantity = this.cart.get(tea.getProductID()).getQuantity();
            tea.setQuantity(currentQuantity + tea.getQuantity());
        }
        this.cart.put(tea.getProductID(), tea);
        
        return check;
    }

    public boolean remove(String id) {
        boolean check = false;
        
        if (this.cart !=null) {
            if (this.cart.containsKey(id)) {
                this.cart.remove(id);
                check = true;
            }
            
        }
        
        return check;
    }

    public boolean update(String id, Tea tea) {
        boolean check = false;
        
        if (this.cart !=null) {
            
            if (this.cart.containsKey(id)) {
                this.cart.replace(id, tea);
                check = true;
            }
            
        }
        
        return check;
    }
}
