package com.dto;

public class ReportDTO {
	private int report_id;
	private String userid;
	private String report_category;
	private int chall_id;
	private int comment_id;
	private String report_reason;
	private String report_status;
	private String report_created;
	public ReportDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReportDTO(int report_id, String userid, String report_category, int chall_id, int comment_id,
			String report_reason, String report_status, String report_created) {
		super();
		this.report_id = report_id;
		this.userid = userid;
		this.report_category = report_category;
		this.chall_id = chall_id;
		this.comment_id = comment_id;
		this.report_reason = report_reason;
		this.report_status = report_status;
		this.report_created = report_created;
	}
	public int getReport_id() {
		return report_id;
	}
	public void setReport_id(int report_id) {
		this.report_id = report_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getReport_category() {
		return report_category;
	}
	public void setReport_category(String report_category) {
		this.report_category = report_category;
	}
	public int getChall_id() {
		return chall_id;
	}
	public void setChall_id(int chall_id) {
		this.chall_id = chall_id;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getReport_reason() {
		return report_reason;
	}
	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}
	public String getReport_status() {
		return report_status;
	}
	public void setReport_status(String report_status) {
		this.report_status = report_status;
	}
	public String getReport_created() {
		return report_created;
	}
	public void setReport_created(String report_created) {
		this.report_created = report_created;
	}
	@Override
	public String toString() {
		return "ReportDTO [report_id=" + report_id + ", userid=" + userid + ", report_category=" + report_category
				+ ", chall_id=" + chall_id + ", comment_id=" + comment_id + ", report_reason=" + report_reason
				+ ", report_status=" + report_status + ", report_created=" + report_created + "]";
	}
	
	
}
