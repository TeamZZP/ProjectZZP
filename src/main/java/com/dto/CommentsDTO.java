package com.dto;

public class CommentsDTO {
	private int comment_id;
	private int chall_id;
	private String comment_content;
	private String comment_created;
	private String userid;
	private int parent_id;
	public CommentsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CommentsDTO(int comment_id, int chall_id, String comment_content, String comment_created, String userid,
			int parent_id) {
		super();
		this.comment_id = comment_id;
		this.chall_id = chall_id;
		this.comment_content = comment_content;
		this.comment_created = comment_created;
		this.userid = userid;
		this.parent_id = parent_id;
	}
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getChall_id() {
		return chall_id;
	}
	public void setChall_id(int chall_id) {
		this.chall_id = chall_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_created() {
		return comment_created;
	}
	public void setComment_created(String comment_created) {
		this.comment_created = comment_created;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	@Override
	public String toString() {
		return "CommentsDTO [comment_id=" + comment_id + ", chall_id=" + chall_id + ", comment_content="
				+ comment_content + ", comment_created=" + comment_created + ", userid=" + userid + ", parent_id="
				+ parent_id + "]";
	}
	
	
	
}
