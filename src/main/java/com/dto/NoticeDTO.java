package com.dto;

public class NoticeDTO {

	int NOTICE_ID;
	String NOTICE_TITTLE;
	String NOTICE_CONTENT;
	String NOTICE_CREATED;
	String USERID;
	String NOTICE_CATEGORY;
	int NOTICE_HITS;
	
	public NoticeDTO() {
		super();
	}
	
	public NoticeDTO(int nOTICE_ID, String nOTICE_TITTLE, String nOTICE_CONTENT, String nOTICE_CREATED, String uSERID,
			String nOTICE_CATEGORY, int nOTICE_HITS) {
		super();
		NOTICE_ID = nOTICE_ID;
		NOTICE_TITTLE = nOTICE_TITTLE;
		NOTICE_CONTENT = nOTICE_CONTENT;
		NOTICE_CREATED = nOTICE_CREATED;
		USERID = uSERID;
		NOTICE_CATEGORY = nOTICE_CATEGORY;
		NOTICE_HITS = nOTICE_HITS;
	}
	
	public int getNOTICE_ID() {
		return NOTICE_ID;
	}
	public void setNOTICE_ID(int nOTICE_ID) {
		NOTICE_ID = nOTICE_ID;
	}
	public String getNOTICE_TITTLE() {
		return NOTICE_TITTLE;
	}
	public void setNOTICE_TITTLE(String nOTICE_TITTLE) {
		NOTICE_TITTLE = nOTICE_TITTLE;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}
	public String getNOTICE_CREATED() {
		return NOTICE_CREATED;
	}
	public void setNOTICE_CREATED(String nOTICE_CREATED) {
		NOTICE_CREATED = nOTICE_CREATED;
	}
	public String getUSERID() {
		return USERID;
	}
	public void setUSERID(String uSERID) {
		USERID = uSERID;
	}
	public String getNOTICE_CATEGORY() {
		return NOTICE_CATEGORY;
	}
	public void setNOTICE_CATEGORY(String nOTICE_CATEGORY) {
		NOTICE_CATEGORY = nOTICE_CATEGORY;
	}
	public int getNOTICE_HITS() {
		return NOTICE_HITS;
	}
	public void setNOTICE_HITS(int nOTICE_HITS) {
		NOTICE_HITS = nOTICE_HITS;
	}
	@Override
	public String toString() {
		return "NoticeDTO [NOTICE_ID=" + NOTICE_ID + ", NOTICE_TITTLE=" + NOTICE_TITTLE + ", NOTICE_CONTENT="
				+ NOTICE_CONTENT + ", NOTICE_CREATED=" + NOTICE_CREATED + ", USERID=" + USERID + ", NOTICE_CATEGORY="
				+ NOTICE_CATEGORY + ", NOTICE_HITS=" + NOTICE_HITS + "]";
	}
	
}
