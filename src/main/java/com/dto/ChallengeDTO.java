package com.dto;

public class ChallengeDTO {
	private int chall_id;
	private String userid;
	private String chall_title;
	private String chall_content;
	private String chall_category;
	private int chall_hits;
	private int chall_liked;
	private String chall_created;
	private String chall_img;
	private int chall_comments;
	private int chall_this_month;
	public ChallengeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChallengeDTO(int chall_id, String userid, String chall_title, String chall_content, String chall_category,
			int chall_hits, int chall_liked, String chall_created, String chall_img, int chall_comments,
			int chall_this_month) {
		super();
		this.chall_id = chall_id;
		this.userid = userid;
		this.chall_title = chall_title;
		this.chall_content = chall_content;
		this.chall_category = chall_category;
		this.chall_hits = chall_hits;
		this.chall_liked = chall_liked;
		this.chall_created = chall_created;
		this.chall_img = chall_img;
		this.chall_comments = chall_comments;
		this.chall_this_month = chall_this_month;
	}
	public int getChall_id() {
		return chall_id;
	}
	public void setChall_id(int chall_id) {
		this.chall_id = chall_id;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getChall_title() {
		return chall_title;
	}
	public void setChall_title(String chall_title) {
		this.chall_title = chall_title;
	}
	public String getChall_content() {
		return chall_content;
	}
	public void setChall_content(String chall_content) {
		this.chall_content = chall_content;
	}
	public String getChall_category() {
		return chall_category;
	}
	public void setChall_category(String chall_category) {
		this.chall_category = chall_category;
	}
	public int getChall_hits() {
		return chall_hits;
	}
	public void setChall_hits(int chall_hits) {
		this.chall_hits = chall_hits;
	}
	public int getChall_liked() {
		return chall_liked;
	}
	public void setChall_liked(int chall_liked) {
		this.chall_liked = chall_liked;
	}
	public String getChall_created() {
		return chall_created;
	}
	public void setChall_created(String chall_created) {
		this.chall_created = chall_created;
	}
	public String getChall_img() {
		return chall_img;
	}
	public void setChall_img(String chall_img) {
		this.chall_img = chall_img;
	}
	public int getChall_comments() {
		return chall_comments;
	}
	public void setChall_comments(int chall_comments) {
		this.chall_comments = chall_comments;
	}
	public int getChall_this_month() {
		return chall_this_month;
	}
	public void setChall_this_month(int chall_this_month) {
		this.chall_this_month = chall_this_month;
	}
	@Override
	public String toString() {
		return "ChallengeDTO [chall_id=" + chall_id + ", userid=" + userid + ", chall_title=" + chall_title
				+ ", chall_content=" + chall_content + ", chall_category=" + chall_category + ", chall_hits="
				+ chall_hits + ", chall_liked=" + chall_liked + ", chall_created=" + chall_created + ", chall_img="
				+ chall_img + ", chall_comments=" + chall_comments + ", chall_this_month=" + chall_this_month + "]";
	}
	
	
}
