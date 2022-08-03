package com.dto;

public class QuestionDTO {

	int Q_ID;
	int Q_BOARD_CATEGORY;
    String Q_CATEGORY;
    String Q_TITLE;
    String Q_CONTENT;
    String Q_CREATED;
    String Q_IMG;
    String Q_STATUS;
    String USERID;
    String P_ID;
    
	public QuestionDTO() {
		super();
	}
	
	public QuestionDTO(int q_ID, int q_BOARD_CATEGORY, String q_CATEGORY, String q_TITLE, String q_CONTENT,
			String q_CREATED, String q_IMG, String q_STATUS, String uSERID, String p_ID) {
		super();
		Q_ID = q_ID;
		Q_BOARD_CATEGORY = q_BOARD_CATEGORY;
		Q_CATEGORY = q_CATEGORY;
		Q_TITLE = q_TITLE;
		Q_CONTENT = q_CONTENT;
		Q_CREATED = q_CREATED;
		Q_IMG = q_IMG;
		Q_STATUS = q_STATUS;
		USERID = uSERID;
		P_ID = p_ID;
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
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}
	public String getP_ID() {
		return P_ID;
	}
	public void setP_ID(String p_ID) {
		P_ID = p_ID;
	}
	@Override
	public String toString() {
		return "QuestionDTO [Q_ID=" + Q_ID + ", Q_BOARD_CATEGORY=" + Q_BOARD_CATEGORY + ", Q_CATEGORY=" + Q_CATEGORY
				+ ", Q_TITLE=" + Q_TITLE + ", Q_CONTENT=" + Q_CONTENT + ", Q_CREATED=" + Q_CREATED + ", Q_IMG=" + Q_IMG
				+ ", Q_STATUS=" + Q_STATUS + ", USERID=" + USERID + ", P_ID=" + P_ID + "]";
	}
    
}
