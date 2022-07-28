package com.dto;

public class ProductDTO {
	
	String p_id;
	String p_name;
	String p_content;
	String p_category;
	int p_cost_price;
	int p_selling_price;
	int p_discount;
	String p_created;
	int p_stock;
	String p_img;
	
	
	public ProductDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getP_id() {
		return p_id;
	}


	public void setP_id(String p_id) {
		this.p_id = p_id;
	}


	public String getP_name() {
		return p_name;
	}


	public void setP_name(String p_name) {
		this.p_name = p_name;
	}


	public String getP_content() {
		return p_content;
	}


	public void setP_content(String p_content) {
		this.p_content = p_content;
	}


	public String getP_category() {
		return p_category;
	}


	public void setP_category(String p_category) {
		this.p_category = p_category;
	}


	public int getP_cost_price() {
		return p_cost_price;
	}


	public void setP_cost_price(int p_cost_price) {
		this.p_cost_price = p_cost_price;
	}


	public int getP_selling_price() {
		return p_selling_price;
	}


	public void setP_selling_price(int p_selling_price) {
		this.p_selling_price = p_selling_price;
	}


	public int getP_discount() {
		return p_discount;
	}


	public void setP_discount(int p_discount) {
		this.p_discount = p_discount;
	}


	public String getP_created() {
		return p_created;
	}


	public void setP_created(String p_created) {
		this.p_created = p_created;
	}


	public int getP_stock() {
		return p_stock;
	}


	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}


	public String getP_img() {
		return p_img;
	}


	public void setP_img(String p_img) {
		this.p_img = p_img;
	}


	@Override
	public String toString() {
		return "ProductDTO [p_id=" + p_id + ", p_name=" + p_name + ", p_content=" + p_content + ", p_category="
				+ p_category + ", p_cost_price=" + p_cost_price + ", p_selling_price=" + p_selling_price
				+ ", p_discount=" + p_discount + ", p_created=" + p_created + ", p_stock=" + p_stock + ", p_img="
				+ p_img + "]";
	}
	
	

}
