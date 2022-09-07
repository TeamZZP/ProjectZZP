package com.dto;

public class CouponDTO {
	
	int COUPON_ID;
	String COUPON_IMG;
	String COUPON_NAME;
	int COUPON_DISCOUNT;
	String COUPON_CREATED;
	String COUPON_VALIDITY;
	
	public CouponDTO() {
		super();
	}
	
	public CouponDTO(int cOUPON_ID, String cOUPON_IMG, String cOUPON_NAME, int cOUPON_DISCOUNT, String cOUPON_CREATED,
			String cOUPON_VALIDITY) {
		super();
		COUPON_ID = cOUPON_ID;
		COUPON_IMG = cOUPON_IMG;
		COUPON_NAME = cOUPON_NAME;
		COUPON_DISCOUNT = cOUPON_DISCOUNT;
		COUPON_CREATED = cOUPON_CREATED;
		COUPON_VALIDITY = cOUPON_VALIDITY;
	}
	public int getCOUPON_ID() {
		return COUPON_ID;
	}
	public void setCOUPON_ID(int cOUPON_ID) {
		COUPON_ID = cOUPON_ID;
	}
	public String getCOUPON_IMG() {
		return COUPON_IMG;
	}
	public void setCOUPON_IMG(String cOUPON_IMG) {
		COUPON_IMG = cOUPON_IMG;
	}
	public String getCOUPON_NAME() {
		return COUPON_NAME;
	}
	public void setCOUPON_NAME(String cOUPON_NAME) {
		COUPON_NAME = cOUPON_NAME;
	}
	public int getCOUPON_DISCOUNT() {
		return COUPON_DISCOUNT;
	}
	public void setCOUPON_DISCOUNT(int cOUPON_DISCOUNT) {
		COUPON_DISCOUNT = cOUPON_DISCOUNT;
	}
	public String getCOUPON_CREATED() {
		return COUPON_CREATED;
	}
	public void setCOUPON_CREATED(String cOUPON_CREATED) {
		COUPON_CREATED = cOUPON_CREATED;
	}
	public String getCOUPON_VALIDITY() {
		return COUPON_VALIDITY;
	}
	public void setCOUPON_VALIDITY(String cOUPON_VALIDITY) {
		COUPON_VALIDITY = cOUPON_VALIDITY;
	}
	@Override
	public String toString() {
		return "CouponDTO [COUPON_ID=" + COUPON_ID + ", COUPON_IMG=" + COUPON_IMG + ", COUPON_NAME=" + COUPON_NAME
				+ ", COUPON_DISCOUNT=" + COUPON_DISCOUNT + ", COUPON_CREATED=" + COUPON_CREATED + ", COUPON_VALIDITY="
				+ COUPON_VALIDITY + "]";
	}

}
