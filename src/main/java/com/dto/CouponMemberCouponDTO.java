package com.dto;

public class CouponMemberCouponDTO {
	
	String userid;
	int coupon_id;
	String coupon_get;
	String coupon_status;
	String coupon_used;
	String coupon_img;
	int coupon_discount;
	String coupon_created;
	String coupon_validity;
	String coupon_name;
	
	public CouponMemberCouponDTO() {
		super();
	}

	public CouponMemberCouponDTO(String userid, int coupon_id, String coupon_get, String coupon_status,
			String coupon_used, String coupon_img, int coupon_discount, String coupon_created, String coupon_validity,
			String coupon_name) {
		super();
		this.userid = userid;
		this.coupon_id = coupon_id;
		this.coupon_get = coupon_get;
		this.coupon_status = coupon_status;
		this.coupon_used = coupon_used;
		this.coupon_img = coupon_img;
		this.coupon_discount = coupon_discount;
		this.coupon_created = coupon_created;
		this.coupon_validity = coupon_validity;
		this.coupon_name = coupon_name;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(int coupon_id) {
		this.coupon_id = coupon_id;
	}

	public String getCoupon_get() {
		return coupon_get;
	}

	public void setCoupon_get(String coupon_get) {
		this.coupon_get = coupon_get;
	}

	public String getCoupon_status() {
		return coupon_status;
	}

	public void setCoupon_status(String coupon_status) {
		this.coupon_status = coupon_status;
	}

	public String getCoupon_used() {
		return coupon_used;
	}

	public void setCoupon_used(String coupon_used) {
		this.coupon_used = coupon_used;
	}

	public String getCoupon_img() {
		return coupon_img;
	}

	public void setCoupon_img(String coupon_img) {
		this.coupon_img = coupon_img;
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

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	@Override
	public String toString() {
		return "CouponMemberCouponDTO [userid=" + userid + ", coupon_id=" + coupon_id + ", coupon_get=" + coupon_get
				+ ", coupon_status=" + coupon_status + ", coupon_used=" + coupon_used + ", coupon_img=" + coupon_img
				+ ", coupon_discount=" + coupon_discount + ", coupon_created=" + coupon_created + ", coupon_validity="
				+ coupon_validity + ", coupon_name=" + coupon_name + "]";
	}
}
