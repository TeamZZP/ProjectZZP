package com.dto;

public class CouponDTO {
	
	int coupon_id; 
	String coupon_img; 
	String coupon_name; 
	int coupon_discount;
	String coupon_created;
	String coupon_validity; 
	
	public CouponDTO() {
		super();
	}

	public CouponDTO(int coupon_id, String coupon_img, String coupon_name, int coupon_discount, String coupon_created,
			String coupon_validity) {
		super();
		this.coupon_id = coupon_id;
		this.coupon_img = coupon_img;
		this.coupon_name = coupon_name;
		this.coupon_discount = coupon_discount;
		this.coupon_created = coupon_created;
		this.coupon_validity = coupon_validity;
	}

	public int getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}

	public String getCoupon_img() {
		return coupon_img;
	}

	public void setCoupon_img(String coupon_img) {
		this.coupon_img = coupon_img;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public int getCoupon_discount() {
		return coupon_discount;
	}

	public void setCoupon_discount(int coupon_discount) {
		this.coupon_discount = coupon_discount;
	}

	public String getCoupon_created() {
		return coupon_created;
	}

	public void setCoupon_created(String coupon_created) {
		this.coupon_created = coupon_created;
	}

	public String getCoupon_validity() {
		return coupon_validity;
	}

	public void setCoupon_validity(String coupon_validity) {
		this.coupon_validity = coupon_validity;
	}

	@Override
	public String toString() {
		return "CouponDTO [coupon_id=" + coupon_id + ", coupon_img=" + coupon_img + ", coupon_name=" + coupon_name
				+ ", coupon_discount=" + coupon_discount + ", coupon_created=" + coupon_created + ", coupon_validity="
				+ coupon_validity + "]";
	}
	
}
