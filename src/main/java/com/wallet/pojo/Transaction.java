package com.wallet.pojo;

import java.util.Date;

public class Transaction {
	
	private int id;
	
	private double amount;
	
	private String comments;
	
	private Date time;
	
	private int user;
	
	public Transaction() {
		
	}
	
	public Transaction(double amount, String comments) {
		super();
		this.amount = amount;
		this.comments = comments;
	}

	public Transaction(int id, double amount, String comments, Date time, int user) {
		super();
		this.id = id;
		this.amount = amount;
		this.comments = comments;
		this.time = time;
		this.user = user;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public int getUser() {
		return user;
	}

	public void setUser(int user) {
		this.user = user;
	}
	
	
}
