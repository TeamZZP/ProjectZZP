package com.dto;

public class ProfileDTO {
	private String userid;
	private String profile_img;
	private String profile_txt;
	public ProfileDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProfileDTO(String userid, String profile_img, String profile_txt) {
		super();
		this.userid = userid;
		this.profile_img = profile_img;
		this.profile_txt = profile_txt;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getProfile_img() {
		return profile_img;
	}
	public void setProfile_img(String profile_img) {
		this.profile_img = profile_img;
	}
	public String getProfile_txt() {
		return profile_txt;
	}
	public void setProfile_txt(String profile_txt) {
		this.profile_txt = profile_txt;
	}
	@Override
	public String toString() {
		return "ProfileDTO [userid=" + userid + ", profile_img=" + profile_img + ", profile_txt=" + profile_txt + "]";
	}
	
}
