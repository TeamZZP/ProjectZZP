package com.dto;

public class ReviewProductDTO {

	int REVIEW_ID;
	int ORDER_ID;
	int P_ID;
	String USERID;
	String REVIEW_TITLE;
	String REVIEW_CONTENT;
	String REVIEW_RATE;
	String REVIEW_IMG;
	String REVIEW_CREATED;
	String P_NAME;
	String P_CONTENT;
	int C_ID;
	int P_COST_PRICE;
	int P_SELLING_PRICE;
	int P_DISCOUNT;
	String P_CREATED;
	int P_STOCK;
	
	public ReviewProductDTO() {
		super();
	}
	public ReviewProductDTO(int rEVIEW_ID, int oRDER_ID, int p_ID, String uSERID, String rEVIEW_TITLE,
			String rEVIEW_CONTENT, String rEVIEW_RATE, String rEVIEW_IMG, String rEVIEW_CREATED, String p_NAME,
			String p_CONTENT, int c_ID, int p_COST_PRICE, int p_SELLING_PRICE, int p_DISCOUNT, String p_CREATED,
			int p_STOCK) {
		super();
		REVIEW_ID = rEVIEW_ID;
		ORDER_ID = oRDER_ID;
		P_ID = p_ID;
		USERID = uSERID;
		REVIEW_TITLE = rEVIEW_TITLE;
		REVIEW_CONTENT = rEVIEW_CONTENT;
		REVIEW_RATE = rEVIEW_RATE;
		REVIEW_IMG = rEVIEW_IMG;
		REVIEW_CREATED = rEVIEW_CREATED;
		P_NAME = p_NAME;
		P_CONTENT = p_CONTENT;
		C_ID = c_ID;
		P_COST_PRICE = p_COST_PRICE;
		P_SELLING_PRICE = p_SELLING_PRICE;
		P_DISCOUNT = p_DISCOUNT;
		P_CREATED = p_CREATED;
		P_STOCK = p_STOCK;
	}
	public int getREVIEW_ID() {
		return REVIEW_ID;
	}
	public void setREVIEW_ID(int rEVIEW_ID) {
		REVIEW_ID = rEVIEW_ID;
	}
	public int getORDER_ID() {
		return ORDER_ID;
	}
	public void setORDER_ID(int oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}
	public int getP_ID() {
		return P_ID;
	}
	public void setP_ID(int p_ID) {
		P_ID = p_ID;
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}
	public String getREVIEW_TITLE() {
		return REVIEW_TITLE;
	}
	public void setREVIEW_TITLE(String rEVIEW_TITLE) {
		REVIEW_TITLE = rEVIEW_TITLE;
	}
	public String getREVIEW_CONTENT() {
		return REVIEW_CONTENT;
	}
	public void setREVIEW_CONTENT(String rEVIEW_CONTENT) {
		REVIEW_CONTENT = rEVIEW_CONTENT;
	}
	public String getREVIEW_RATE() {
		return REVIEW_RATE;
	}
	public void setREVIEW_RATE(String rEVIEW_RATE) {
		REVIEW_RATE = rEVIEW_RATE;
	}
	public String getREVIEW_IMG() {
		return REVIEW_IMG;
	}
	public void setREVIEW_IMG(String rEVIEW_IMG) {
		REVIEW_IMG = rEVIEW_IMG;
	}
	public String getREVIEW_CREATED() {
		return REVIEW_CREATED;
	}
	public void setREVIEW_CREATED(String rEVIEW_CREATED) {
		REVIEW_CREATED = rEVIEW_CREATED;
	}
	public String getP_NAME() {
		return P_NAME;
	}
	public void setP_NAME(String p_NAME) {
		P_NAME = p_NAME;
	}
	public String getP_CONTENT() {
		return P_CONTENT;
	}
	public void setP_CONTENT(String p_CONTENT) {
		P_CONTENT = p_CONTENT;
	}
	public int getC_ID() {
		return C_ID;
	}
	public void setC_ID(int c_ID) {
		C_ID = c_ID;
	}
	public int getP_COST_PRICE() {
		return P_COST_PRICE;
	}
	public void setP_COST_PRICE(int p_COST_PRICE) {
		P_COST_PRICE = p_COST_PRICE;
	}
	public int getP_SELLING_PRICE() {
		return P_SELLING_PRICE;
	}
	public void setP_SELLING_PRICE(int p_SELLING_PRICE) {
		P_SELLING_PRICE = p_SELLING_PRICE;
	}
	public int getP_DISCOUNT() {
		return P_DISCOUNT;
	}
	public void setP_DISCOUNT(int p_DISCOUNT) {
		P_DISCOUNT = p_DISCOUNT;
	}
	public String getP_CREATED() {
		return P_CREATED;
	}
	public void setP_CREATED(String p_CREATED) {
		P_CREATED = p_CREATED;
	}
	public int getP_STOCK() {
		return P_STOCK;
	}
	public void setP_STOCK(int p_STOCK) {
		P_STOCK = p_STOCK;
	}
	@Override
	public String toString() {
		return "ReviewProductDTO [REVIEW_ID=" + REVIEW_ID + ", ORDER_ID=" + ORDER_ID + ", P_ID=" + P_ID + ", USERID="
				+ USERID + ", REVIEW_TITLE=" + REVIEW_TITLE + ", REVIEW_CONTENT=" + REVIEW_CONTENT + ", REVIEW_RATE="
				+ REVIEW_RATE + ", REVIEW_IMG=" + REVIEW_IMG + ", REVIEW_CREATED=" + REVIEW_CREATED + ", P_NAME="
				+ P_NAME + ", P_CONTENT=" + P_CONTENT + ", C_ID=" + C_ID + ", P_COST_PRICE=" + P_COST_PRICE
				+ ", P_SELLING_PRICE=" + P_SELLING_PRICE + ", P_DISCOUNT=" + P_DISCOUNT + ", P_CREATED=" + P_CREATED
				+ ", P_STOCK=" + P_STOCK + "]";
	}
	
}
