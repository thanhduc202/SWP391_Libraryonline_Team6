/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package AdminModel;

/**
 *
 * @author win
 */
public class quantitybook {
    private int quantity;

    public quantitybook() {
    }

    public quantitybook(int quantity) {
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "quantitybook{" + "quantity=" + quantity + '}';
    }
    
    
}
