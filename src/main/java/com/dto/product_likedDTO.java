package com.dto;

public class product_likedDTO {
	
	String userid;
	int p_id;
	String p_image;
	String p_name;
	int p_selling_price;
	
	public product_likedDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public product_likedDTO(String userid, int p_id, String p_image, String p_name, int p_selling_price) {
		super();
		this.userid = userid;
		this.p_id = p_id;
		this.p_image = p_image;
		this.p_name = p_name;
		this.p_selling_price = p_selling_price;
	}

	@Override
	public String toString() {
		return "product_likedDTO [userid=" + userid + ", p_id=" + p_id + ", p_image=" + p_image + ", p_name=" + p_name
				+ ", p_selling_price=" + p_selling_price + "]";
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

	public String getP_image() {
		return p_image;
	}

	public void setP_image(String p_image) {
		this.p_image = p_image;
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
	
	
}
