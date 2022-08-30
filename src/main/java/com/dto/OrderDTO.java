package com.dto;

public class OrderDTO {
	private int order_id;
	private String userid;
	private String p_id;
	private int total_price;
	private String delivery_address;
	private String delivery_loc;
	private String delivery_req;
	private String order_date;
	private int order_quantity;
	
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDTO(int order_id, String userid, String p_id, int total_price, String delivery_address,
			String delivery_loc, String delivery_req, String order_date, int order_quantity, String entrance_passwd) {
		super();
		this.order_id = order_id;
		this.userid = userid;
		this.p_id = p_id;
		this.total_price = total_price;
		this.delivery_address = delivery_address;
		this.delivery_loc = delivery_loc;
		this.delivery_req = delivery_req;
		this.order_date = order_date;
		this.order_quantity = order_quantity;
		
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
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
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
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	
	@Override
	public String toString() {
		return "OrderDTO [order_id=" + order_id + ", userid=" + userid + ", p_id=" + p_id + ", total_price="
				+ total_price + ", delivery_address=" + delivery_address + ", delivery_loc=" + delivery_loc
				+ ", delivery_req=" + delivery_req + ", order_date=" + order_date + ", order_quantity=" + order_quantity
				+  "]";
	}
	
	
	
}
