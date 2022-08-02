package com.dto;

public class ReviewDTO {
	int REVIEW_ID;
	int ORDER_ID;
	String P_ID;
	String USERID;
	String REVIEW_TITLE;
	String REVIEW_CONTENT;
	int REVIEW_RATE;
	String REVIEW_IMG;
	
	public ReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewDTO(int rEVIEW_ID, int oRDER_ID, String p_ID, String uSERID, String rEVIEW_TITLE,
			String rEVIEW_CONTENT, int rEVIEW_RATE, String rEVIEW_IMG) {
		super();
		REVIEW_ID = rEVIEW_ID;
		ORDER_ID = oRDER_ID;
		P_ID = p_ID;
		USERID = uSERID;
		REVIEW_TITLE = rEVIEW_TITLE;
		REVIEW_CONTENT = rEVIEW_CONTENT;
		REVIEW_RATE = rEVIEW_RATE;
		REVIEW_IMG = rEVIEW_IMG;
	}

	@Override
	public String toString() {
		return "ReviewDTO [REVIEW_ID=" + REVIEW_ID + ", ORDER_ID=" + ORDER_ID + ", P_ID=" + P_ID + ", USERID=" + USERID
				+ ", REVIEW_TITLE=" + REVIEW_TITLE + ", REVIEW_CONTENT=" + REVIEW_CONTENT + ", REVIEW_RATE="
				+ REVIEW_RATE + ", REVIEW_IMG=" + REVIEW_IMG + "]";
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

	public String getP_ID() {
		return P_ID;
	}

	public void setP_ID(String p_ID) {
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

	public int getREVIEW_RATE() {
		return REVIEW_RATE;
	}

	public void setREVIEW_RATE(int rEVIEW_RATE) {
		REVIEW_RATE = rEVIEW_RATE;
	}

	public String getREVIEW_IMG() {
		return REVIEW_IMG;
	}

	public void setREVIEW_IMG(String rEVIEW_IMG) {
		REVIEW_IMG = rEVIEW_IMG;
	}
	
	
}
