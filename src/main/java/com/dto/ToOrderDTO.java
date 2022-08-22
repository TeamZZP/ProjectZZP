package com.dto;

public class ToOrderDTO {
	
	String userid;
	String p_name;
	int p_id;
	int p_selling_price;
	String p_image;
	int p_amount;
	public ToOrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ToOrderDTO(String userid, String p_name, int p_id, int p_selling_price, String p_image, int p_amount) {
		super();
		this.userid = userid;
		this.p_name = p_name;
		this.p_id = p_id;
		this.p_selling_price = p_selling_price;
		this.p_image = p_image;
		this.p_amount = p_amount;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getP_selling_price() {
		return p_selling_price;
	}
	public void setP_selling_price(int p_selling_price) {
		this.p_selling_price = p_selling_price;
	}
	public String getP_image() {
		return p_image;
	}
	public void setP_image(String p_image) {
		this.p_image = p_image;
	}
	public int getP_amount() {
		return p_amount;
	}
	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}
	
	

}
