/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.cart;

/**
 *
 * @author Eli
 */
public class Functions {

    public static void createItems(Cart object, String itemsNum) {
        object.createItems(itemsNum);
    }

    public static String isCartCreated(Cart object) {
        return object.isCartCreated();
    }

    public static void setItemPrice(Cart object, String index, String price) {
        int i = Integer.parseInt(index);
        object.getItem(i).setPrice(price);
    }

    public static String getItemQuantity(Cart object, String index) {
        int i = Integer.parseInt(index);
        return object.getItem(i).getQuantity();
    }

    public static void setItemQuantity(Cart object, String index, String quantity) {
        int i = Integer.parseInt(index);
        object.getItem(i).setQuantity(quantity);
    }

    public static String calculateItemTotal(Cart object, String index) {
        int i = Integer.parseInt(index);
        return object.getItem(i).calculateItemTotal();
    }
    
    public static String calculateAllItemsTotal(Cart object){
        return object.calculateAllItemsTotal();
    }
}
