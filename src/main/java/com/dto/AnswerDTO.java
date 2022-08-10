package com.dto;

public class AnswerDTO {

	int ANSWER_ID;
	String ANSWER_CONTENT;
	int Q_ID;
	String ANSWER_CREATED;
	
	public AnswerDTO() {
		super();
	}
	
	public AnswerDTO(int aNSWER_ID, String aNSWER_CONTENT, int q_ID, String aNSWER_CREATED) {
		super();
		ANSWER_ID = aNSWER_ID;
		ANSWER_CONTENT = aNSWER_CONTENT;
		Q_ID = q_ID;
		ANSWER_CREATED = aNSWER_CREATED;
	}
	
	public int getANSWER_ID() {
		return ANSWER_ID;
	}
	public void setANSWER_ID(int aNSWER_ID) {
		ANSWER_ID = aNSWER_ID;
	}
	public String getANSWER_CONTENT() {
		return ANSWER_CONTENT;
	}
	public void setANSWER_CONTENT(String aNSWER_CONTENT) {
		ANSWER_CONTENT = aNSWER_CONTENT;
	}
	public int getQ_ID() {
		return Q_ID;
	}
	public void setQ_ID(int q_ID) {
		Q_ID = q_ID;
	}
	public String getANSWER_CREATED() {
		return ANSWER_CREATED;
	}
	public void setANSWER_CREATED(String aNSWER_CREATED) {
		ANSWER_CREATED = aNSWER_CREATED;
	}
	@Override
	public String toString() {
		return "AnswerDTO [ANSWER_ID=" + ANSWER_ID + ", ANSWER_CONTENT=" + ANSWER_CONTENT + ", Q_ID=" + Q_ID
				+ ", ANSWER_CREATED=" + ANSWER_CREATED + "]";
	}
	
}
