package com.dto;

public class OrderDTO {
	private int order_id;
	private String p_id;
	private String userid;
	private int order_quantity;
	private String entrance_passwd;
	private String order_request;
	private String order_date;
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDTO(int order_id, String p_id, String userid, int order_quantity, String entrance_passwd,
			String order_request, String order_date) {
		super();
		this.order_id = order_id;
		this.p_id = p_id;
		this.userid = userid;
		this.order_quantity = order_quantity;
		this.entrance_passwd = entrance_passwd;
		this.order_request = order_request;
		this.order_date = order_date;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getOrder_quantity() {
		return order_quantity;
	}
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	public String getEntrance_passwd() {
		return entrance_passwd;
	}
	public void setEntrance_passwd(String entrance_passwd) {
		this.entrance_passwd = entrance_passwd;
	}
	public String getOrder_request() {
		return order_request;
	}
	public void setOrder_request(String order_request) {
		this.order_request = order_request;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	@Override
	public String toString() {
		return "OrderDTO [order_id=" + order_id + ", p_id=" + p_id + ", userid=" + userid + ", order_quantity="
				+ order_quantity + ", entrance_passwd=" + entrance_passwd + ", order_request=" + order_request
				+ ", order_date=" + order_date + "]";
	}
}
