package com.dto;

public class CartDTO {
	int cart_id;
	String userid;
	int p_id;
	String p_name;
	int p_selling_price;
	int p_amount;
	String p_image;
	String cart_created;
	
	
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public CartDTO(int cart_id, String userid, int p_id, String p_name, int p_selling_price, int p_amount,
			String p_image, String cart_created) {
		super();
		this.cart_id = cart_id;
		this.userid = userid;
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_selling_price = p_selling_price;
		this.p_amount = p_amount;
		this.p_image = p_image;
		this.cart_created = cart_created;
	}


	@Override
	public String toString() {
		return "CartDTO [cart_id=" + cart_id + ", userid=" + userid + ", p_id=" + p_id + ", p_name=" + p_name
				+ ", p_selling_price=" + p_selling_price + ", p_amount=" + p_amount + ", p_image=" + p_image
				+ ", cart_created=" + cart_created + "]";
	}


	public int getCart_id() {
		return cart_id;
	}


	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public int getP_id() {
		return p_id;
	}


	public void setP_id(int p_id) {
		this.p_id = p_id;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public int getP_selling_price() {
		return p_selling_price;
	}


	public void setP_selling_price(int p_selling_price) {
		this.p_selling_price = p_selling_price;
	}


	public int getP_amount() {
		return p_amount;
	}


	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}


	public String getP_image() {
		return p_image;
	}


	public void setP_image(String p_image) {
		this.p_image = p_image;
	}


	public String getCart_created() {
		return cart_created;
	}


	public void setCart_created(String cart_created) {
		this.cart_created = cart_created;
	}

	
}
