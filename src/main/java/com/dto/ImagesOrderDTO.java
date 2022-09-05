package com.dto;

public class ImagesOrderDTO {

	private int p_id;
	private int image_rnk;
	private String image_route;
	private String userid;
	private String update_date;
	private String p_name;
	private String p_content;
	private int c_id;
	private int p_cost_price;
	private int p_selling_price;
	private int p_discount;
	private String p_created;
	private int p_stock;
	
	public ImagesOrderDTO() {
		super();
	}
	
	public ImagesOrderDTO(int p_id, int image_rnk, String image_route, String userid, String update_date, String p_name,
			String p_content, int c_id, int p_cost_price, int p_selling_price, int p_discount, String p_created,
			int p_stock) {
		super();
		this.p_id = p_id;
		this.image_rnk = image_rnk;
		this.image_route = image_route;
		this.userid = userid;
		this.update_date = update_date;
		this.p_name = p_name;
		this.p_content = p_content;
		this.c_id = c_id;
		this.p_cost_price = p_cost_price;
		this.p_selling_price = p_selling_price;
		this.p_discount = p_discount;
		this.p_created = p_created;
		this.p_stock = p_stock;
	}
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public int getImage_rnk() {
		return image_rnk;
	}
	public void setImage_rnk(int image_rnk) {
		this.image_rnk = image_rnk;
	}
	public String getImage_route() {
		return image_route;
	}
	public void setImage_route(String image_route) {
		this.image_route = image_route;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
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
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
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
	@Override
	public String toString() {
		return "ImagesOrderDTO [p_id=" + p_id + ", image_rnk=" + image_rnk + ", image_route=" + image_route
				+ ", userid=" + userid + ", update_date=" + update_date + ", p_name=" + p_name + ", p_content="
				+ p_content + ", c_id=" + c_id + ", p_cost_price=" + p_cost_price + ", p_selling_price="
				+ p_selling_price + ", p_discount=" + p_discount + ", p_created=" + p_created + ", p_stock=" + p_stock
				+ "]";
	}

}
