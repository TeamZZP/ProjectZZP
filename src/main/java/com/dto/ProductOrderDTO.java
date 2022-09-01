package com.dto;

public class ProductOrderDTO {

	int ORDER_ID;
	String USERID;
	int P_ID;
	int TOTAL_PRICE;
	String DELIVERY_ADDRESS;
	String DELIVERY_LOC;
	String DELIVERY_REQ;
	String ORDER_DATE;
	String ORDER_STATE;
	int P_AMOUNT;
	String P_NAME;
	String P_CONTENT;
	int C_ID;
	int P_COST_PRICE;
	int P_SELLING_PRICE;
	int P_DISCOUNT;
	String P_CREATED;
	int P_STOCK;
	
	public ProductOrderDTO() {
		super();
	}
	
	public ProductOrderDTO(int oRDER_ID, String uSERID, int p_ID, int tOTAL_PRICE, String dELIVERY_ADDRESS,
			String dELIVERY_LOC, String dELIVERY_REQ, String oRDER_DATE, String oRDER_STATE, int p_AMOUNT,
			String p_NAME, String p_CONTENT, int c_ID, int p_COST_PRICE, int p_SELLING_PRICE, int p_DISCOUNT,
			String p_CREATED, int p_STOCK) {
		super();
		ORDER_ID = oRDER_ID;
		USERID = uSERID;
		P_ID = p_ID;
		TOTAL_PRICE = tOTAL_PRICE;
		DELIVERY_ADDRESS = dELIVERY_ADDRESS;
		DELIVERY_LOC = dELIVERY_LOC;
		DELIVERY_REQ = dELIVERY_REQ;
		ORDER_DATE = oRDER_DATE;
		ORDER_STATE = oRDER_STATE;
		P_AMOUNT = p_AMOUNT;
		P_NAME = p_NAME;
		P_CONTENT = p_CONTENT;
		C_ID = c_ID;
		P_COST_PRICE = p_COST_PRICE;
		P_SELLING_PRICE = p_SELLING_PRICE;
		P_DISCOUNT = p_DISCOUNT;
		P_CREATED = p_CREATED;
		P_STOCK = p_STOCK;
	}
	public int getORDER_ID() {
		return ORDER_ID;
	}
	public void setORDER_ID(int oRDER_ID) {
		ORDER_ID = oRDER_ID;
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}
	public int getP_ID() {
		return P_ID;
	}
	public void setP_ID(int p_ID) {
		P_ID = p_ID;
	}
	public int getTOTAL_PRICE() {
		return TOTAL_PRICE;
	}
	public void setTOTAL_PRICE(int tOTAL_PRICE) {
		TOTAL_PRICE = tOTAL_PRICE;
	}
	public String getDELIVERY_ADDRESS() {
		return DELIVERY_ADDRESS;
	}
	public void setDELIVERY_ADDRESS(String dELIVERY_ADDRESS) {
		DELIVERY_ADDRESS = dELIVERY_ADDRESS;
	}
	public String getDELIVERY_LOC() {
		return DELIVERY_LOC;
	}
	public void setDELIVERY_LOC(String dELIVERY_LOC) {
		DELIVERY_LOC = dELIVERY_LOC;
	}
	public String getDELIVERY_REQ() {
		return DELIVERY_REQ;
	}
	public void setDELIVERY_REQ(String dELIVERY_REQ) {
		DELIVERY_REQ = dELIVERY_REQ;
	}
	public String getORDER_DATE() {
		return ORDER_DATE;
	}
	public void setORDER_DATE(String oRDER_DATE) {
		ORDER_DATE = oRDER_DATE;
	}
	public String getORDER_STATE() {
		return ORDER_STATE;
	}
	public void setORDER_STATE(String oRDER_STATE) {
		ORDER_STATE = oRDER_STATE;
	}
	public int getP_AMOUNT() {
		return P_AMOUNT;
	}
	public void setP_AMOUNT(int p_AMOUNT) {
		P_AMOUNT = p_AMOUNT;
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
		return "ProductOrderDTO [ORDER_ID=" + ORDER_ID + ", USERID=" + USERID + ", P_ID=" + P_ID + ", TOTAL_PRICE="
				+ TOTAL_PRICE + ", DELIVERY_ADDRESS=" + DELIVERY_ADDRESS + ", DELIVERY_LOC=" + DELIVERY_LOC
				+ ", DELIVERY_REQ=" + DELIVERY_REQ + ", ORDER_DATE=" + ORDER_DATE + ", ORDER_STATE=" + ORDER_STATE
				+ ", P_AMOUNT=" + P_AMOUNT + ", P_NAME=" + P_NAME + ", P_CONTENT=" + P_CONTENT + ", C_ID=" + C_ID
				+ ", P_COST_PRICE=" + P_COST_PRICE + ", P_SELLING_PRICE=" + P_SELLING_PRICE + ", P_DISCOUNT="
				+ P_DISCOUNT + ", P_CREATED=" + P_CREATED + ", P_STOCK=" + P_STOCK + "]";
	}
	
}
