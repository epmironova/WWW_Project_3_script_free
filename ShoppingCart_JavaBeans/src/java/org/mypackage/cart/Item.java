/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.cart;

/**
 *
 * @author Eli
 */
public class Item {

    //declare the price field of an item
    private String price;
    
    //declare the quantity field of an item
    private String quantity;

    //constructor
    public Item() {
        price = "0.0";
        quantity = "0";
    }

    /**
     * @return the price
     */
    public String getPrice() {
        return price;
    }

    /**
     * @param price the price to set, if price is not a number, we set it to 0
     */
    public void setPrice(String price) {
        if (price.matches("([0-9]+(\\.[0-9]+)?)+")) {
            this.price = price;
        } else {
            this.price = "0.0";
        }
    }

    /**
     * @return the quantity
     */
    public String getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set, if quantity is not an integer, we set it to 0
     */
    public void setQuantity(String quantity) {
        if (quantity.matches("\\d+")) {
            this.quantity = quantity;
        } else {
            this.quantity = "0";
        }
    }

    //method to calculate the total price of an item
    public String calculateItemTotal() {
        Double itemPrice = Double.valueOf(price);
        Double itemQuantity = Double.valueOf(quantity);
        Double total = itemPrice * itemQuantity;
        return total.toString();
    }
}
