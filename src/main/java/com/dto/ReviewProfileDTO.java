package com.dto;

public class ReviewProfileDTO {

	String USERID;
	String PROFILE_IMG;
	String PROFILE_TXT;
	int REVIEW_ID;
	int ORDER_ID;
	int P_ID;
	String REVIEW_TITLE;
	String REVIEW_CONTENT;
	String REVIEW_RATE;
	String REVIEW_IMG;
	String REVIEW_CREATED;
	
	public ReviewProfileDTO() {
		super();
	}

	public ReviewProfileDTO(String uSERID, String pROFILE_IMG, String pROFILE_TXT, int rEVIEW_ID, int oRDER_ID,
			int p_ID, String rEVIEW_TITLE, String rEVIEW_CONTENT, String rEVIEW_RATE, String rEVIEW_IMG,
			String rEVIEW_CREATED) {
		super();
		USERID = uSERID;
		PROFILE_IMG = pROFILE_IMG;
		PROFILE_TXT = pROFILE_TXT;
		REVIEW_ID = rEVIEW_ID;
		ORDER_ID = oRDER_ID;
		P_ID = p_ID;
		REVIEW_TITLE = rEVIEW_TITLE;
		REVIEW_CONTENT = rEVIEW_CONTENT;
		REVIEW_RATE = rEVIEW_RATE;
		REVIEW_IMG = rEVIEW_IMG;
		REVIEW_CREATED = rEVIEW_CREATED;
	}

	public String getUSERID() {
		return USERID;
	}

	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}

	public String getPROFILE_IMG() {
		return PROFILE_IMG;
	}

	public void setPROFILE_IMG(String pROFILE_IMG) {
		PROFILE_IMG = pROFILE_IMG;
	}

	public String getPROFILE_TXT() {
		return PROFILE_TXT;
	}

	public void setPROFILE_TXT(String pROFILE_TXT) {
		PROFILE_TXT = pROFILE_TXT;
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

	@Override
	public String toString() {
		return "ReviewProfileDTO [USERID=" + USERID + ", PROFILE_IMG=" + PROFILE_IMG + ", PROFILE_TXT=" + PROFILE_TXT
				+ ", REVIEW_ID=" + REVIEW_ID + ", ORDER_ID=" + ORDER_ID + ", P_ID=" + P_ID + ", REVIEW_TITLE="
				+ REVIEW_TITLE + ", REVIEW_CONTENT=" + REVIEW_CONTENT + ", REVIEW_RATE=" + REVIEW_RATE + ", REVIEW_IMG="
				+ REVIEW_IMG + ", REVIEW_CREATED=" + REVIEW_CREATED + "]";
	}
	
}
