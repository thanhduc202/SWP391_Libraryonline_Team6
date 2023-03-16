/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package UserDAO;

import Model.book;

/**
 *
 * @author thanh
 */
public class Item {
    private book book;
	private int quantity;

	public Item() {
	}

	public Item(book book, int quantity) {
		this.book = book;
		this.quantity = quantity;
	}

	public book getBook() {
		return book;
	}

	public void setBook(book book) {
		this.book = book;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
