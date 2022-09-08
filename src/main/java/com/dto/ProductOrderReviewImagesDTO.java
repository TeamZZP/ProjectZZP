package com.dto;

public class ProductOrderReviewImagesDTO {

	private int order_id;
	private String userid;
	private int p_id;
	private int total_price;
	private String delivery_address;
	private String delivery_loc;
	private String delivery_req;
	private String order_date;
	private String order_state;
	private int order_quantity;
	private String p_name;
	private String p_content;
	private int c_id;
	private int p_cost_price;
	private int p_selling_price;
	private int p_discount;
	private String p_created;
	private int p_stock;
	private int review_id; 
	private String review_title; 
	private String review_content; 
	private String review_rate; 
	private String review_img; 
	private String review_create;
	private int image_rnk;
	private String image_route;
	private String update_date;
	
	public ProductOrderReviewImagesDTO() {
		super();
	}

	public ProductOrderReviewImagesDTO(int order_id, String userid, int p_id, int total_price, String delivery_address,
			String delivery_loc, String delivery_req, String order_date, String order_state, int order_quantity,
			String p_name, String p_content, int c_id, int p_cost_price, int p_selling_price, int p_discount,
			String p_created, int p_stock, int review_id, String review_title, String review_content,
			String review_rate, String review_img, String review_create, int image_rnk, String image_route,
			String update_date) {
		super();
		this.order_id = order_id;
		this.userid = userid;
		this.p_id = p_id;
		this.total_price = total_price;
		this.delivery_address = delivery_address;
		this.delivery_loc = delivery_loc;
		this.delivery_req = delivery_req;
		this.order_date = order_date;
		this.order_state = order_state;
		this.order_quantity = order_quantity;
		this.p_name = p_name;
		this.p_content = p_content;
		this.c_id = c_id;
		this.p_cost_price = p_cost_price;
		this.p_selling_price = p_selling_price;
		this.p_discount = p_discount;
		this.p_created = p_created;
		this.p_stock = p_stock;
		this.review_id = review_id;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_rate = review_rate;
		this.review_img = review_img;
		this.review_create = review_create;
		this.image_rnk = image_rnk;
		this.image_route = image_route;
		this.update_date = update_date;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
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

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public String getDelivery_address() {
		return delivery_address;
	}

	public void setDelivery_address(String delivery_address) {
		this.delivery_address = delivery_address;
	}

	public String getDelivery_loc() {
		return delivery_loc;
	}

	public void setDelivery_loc(String delivery_loc) {
		this.delivery_loc = delivery_loc;
	}

	public String getDelivery_req() {
		return delivery_req;
	}

	public void setDelivery_req(String delivery_req) {
		this.delivery_req = delivery_req;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public int getOrder_quantity() {
		return order_quantity;
	}

	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
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

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_rate() {
		return review_rate;
	}

	public void setReview_rate(String review_rate) {
		this.review_rate = review_rate;
	}

	public String getReview_img() {
		return review_img;
	}

	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}

	public String getReview_create() {
		return review_create;
	}

	public void setReview_create(String review_create) {
		this.review_create = review_create;
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

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	@Override
	public String toString() {
		return "ProductOrderReviewImagesDTO [order_id=" + order_id + ", userid=" + userid + ", p_id=" + p_id
				+ ", total_price=" + total_price + ", delivery_address=" + delivery_address + ", delivery_loc="
				+ delivery_loc + ", delivery_req=" + delivery_req + ", order_date=" + order_date + ", order_state="
				+ order_state + ", order_quantity=" + order_quantity + ", p_name=" + p_name + ", p_content=" + p_content
				+ ", c_id=" + c_id + ", p_cost_price=" + p_cost_price + ", p_selling_price=" + p_selling_price
				+ ", p_discount=" + p_discount + ", p_created=" + p_created + ", p_stock=" + p_stock + ", review_id="
				+ review_id + ", review_title=" + review_title + ", review_content=" + review_content + ", review_rate="
				+ review_rate + ", review_img=" + review_img + ", review_create=" + review_create + ", image_rnk="
				+ image_rnk + ", image_route=" + image_route + ", update_date=" + update_date + "]";
	}

}
