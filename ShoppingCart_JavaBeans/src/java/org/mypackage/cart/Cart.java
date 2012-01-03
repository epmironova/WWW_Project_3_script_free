/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.cart;

/**
 *
 * @author Eli
 */
import java.util.*;

public class Cart {

    private ArrayList<Item> items = new ArrayList<Item>();

    public Cart() {
        items = null;
    }
  
    /**
     * @return the items
     */
    public ArrayList<Item> getItems() {
        return items;
    }

    /**
     * @param items the items to set
     */
    public void setItems(ArrayList<Item> items) {
        this.items = items;
    }

    public String isCartCreated() {
        if (getItems() == null) {
            return "no";
        } else {
            return "yes";
        }
    }

    public void createItems(String itemsNum) {
        ArrayList<Item> itemsList = new ArrayList<Item>();
        int num = Integer.parseInt(itemsNum);
        for (int i = 0; i < num; i++) {
            itemsList.add(new Item());
        }
        setItems(itemsList);
    }

    public Item getItem(int index) {
        return getItems().get(index);
    }

    public String calculateAllItemsTotal() {
        Double allItemsTotal = 0.0;
        for (int i = 0; i < getItems().size(); i++) {
            allItemsTotal += Double.valueOf(getItem(i).calculateItemTotal());
        }
        return allItemsTotal.toString();
    }
}
