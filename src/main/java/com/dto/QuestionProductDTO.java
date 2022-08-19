package com.dto;

public class QuestionProductDTO {

	int P_ID;
	String P_NAME;
	String P_CONTENT;
	int C_ID;
	int P_COST_PRICE;
	int P_SELLING_PRICE;
	int P_DISCOUNT;
	String P_CREATED;
	int P_STOCK;
	String USERID;
	int Q_ID;
	int Q_BOARD_CATEGORY;
	String Q_CATEGORY;
	String Q_TITLE;
	String Q_CONTENT;
	String Q_CREATED;
	String 	Q_IMG;
	String 	Q_STATUS;
	
	public QuestionProductDTO() {
		super();
	}

	public QuestionProductDTO(int p_ID, String p_NAME, String p_CONTENT, int c_ID, int p_COST_PRICE,
			int p_SELLING_PRICE, int p_DISCOUNT, String p_CREATED, int p_STOCK, String uSERID, int q_ID,
			int q_BOARD_CATEGORY, String q_CATEGORY, String q_TITLE, String q_CONTENT, String q_CREATED, String q_IMG,
			String q_STATUS) {
		super();
		P_ID = p_ID;
		P_NAME = p_NAME;
		P_CONTENT = p_CONTENT;
		C_ID = c_ID;
		P_COST_PRICE = p_COST_PRICE;
		P_SELLING_PRICE = p_SELLING_PRICE;
		P_DISCOUNT = p_DISCOUNT;
		P_CREATED = p_CREATED;
		P_STOCK = p_STOCK;
		USERID = uSERID;
		Q_ID = q_ID;
		Q_BOARD_CATEGORY = q_BOARD_CATEGORY;
		Q_CATEGORY = q_CATEGORY;
		Q_TITLE = q_TITLE;
		Q_CONTENT = q_CONTENT;
		Q_CREATED = q_CREATED;
		Q_IMG = q_IMG;
		Q_STATUS = q_STATUS;
	}

	public int getP_ID() {
		return P_ID;
	}

	public void setP_ID(int p_ID) {
		P_ID = p_ID;
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

	public String getUSERID() {
		return USERID;
	}

	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}

	public int getQ_ID() {
		return Q_ID;
	}

	public void setQ_ID(int q_ID) {
		Q_ID = q_ID;
	}

	public int getQ_BOARD_CATEGORY() {
		return Q_BOARD_CATEGORY;
	}

	public void setQ_BOARD_CATEGORY(int q_BOARD_CATEGORY) {
		Q_BOARD_CATEGORY = q_BOARD_CATEGORY;
	}

	public String getQ_CATEGORY() {
		return Q_CATEGORY;
	}

	public void setQ_CATEGORY(String q_CATEGORY) {
		Q_CATEGORY = q_CATEGORY;
	}

	public String getQ_TITLE() {
		return Q_TITLE;
	}

	public void setQ_TITLE(String q_TITLE) {
		Q_TITLE = q_TITLE;
	}

	public String getQ_CONTENT() {
		return Q_CONTENT;
	}

	public void setQ_CONTENT(String q_CONTENT) {
		Q_CONTENT = q_CONTENT;
	}

	public String getQ_CREATED() {
		return Q_CREATED;
	}

	public void setQ_CREATED(String q_CREATED) {
		Q_CREATED = q_CREATED;
	}

	public String getQ_IMG() {
		return Q_IMG;
	}

	public void setQ_IMG(String q_IMG) {
		Q_IMG = q_IMG;
	}

	public String getQ_STATUS() {
		return Q_STATUS;
	}

	public void setQ_STATUS(String q_STATUS) {
		Q_STATUS = q_STATUS;
	}

	@Override
	public String toString() {
		return "QuestionProductDTO [P_ID=" + P_ID + ", P_NAME=" + P_NAME + ", P_CONTENT=" + P_CONTENT + ", C_ID=" + C_ID
				+ ", P_COST_PRICE=" + P_COST_PRICE + ", P_SELLING_PRICE=" + P_SELLING_PRICE + ", P_DISCOUNT="
				+ P_DISCOUNT + ", P_CREATED=" + P_CREATED + ", P_STOCK=" + P_STOCK + ", USERID=" + USERID + ", Q_ID="
				+ Q_ID + ", Q_BOARD_CATEGORY=" + Q_BOARD_CATEGORY + ", Q_CATEGORY=" + Q_CATEGORY + ", Q_TITLE="
				+ Q_TITLE + ", Q_CONTENT=" + Q_CONTENT + ", Q_CREATED=" + Q_CREATED + ", Q_IMG=" + Q_IMG + ", Q_STATUS="
				+ Q_STATUS + "]";
	}
	
}
