package com.dto;

public class StampDTO {
	private int stamp_id;
	private int chall_id;
	private String stamp_img;
	private String stamp_name;
	public StampDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public StampDTO(int stamp_id, int chall_id, String stamp_img, String stamp_name) {
		super();
		this.stamp_id = stamp_id;
		this.chall_id = chall_id;
		this.stamp_img = stamp_img;
		this.stamp_name = stamp_name;
	}
	public int getStamp_id() {
		return stamp_id;
	}
	public void setStamp_id(int stamp_id) {
		this.stamp_id = stamp_id;
	}
	public int getChall_id() {
		return chall_id;
	}
	public void setChall_id(int chall_id) {
		this.chall_id = chall_id;
	}
	public String getStamp_img() {
		return stamp_img;
	}
	public void setStamp_img(String stamp_img) {
		this.stamp_img = stamp_img;
	}
	public String getStamp_name() {
		return stamp_name;
	}
	public void setStamp_name(String stamp_name) {
		this.stamp_name = stamp_name;
	}
	@Override
	public String toString() {
		return "StampDTO [stamp_id=" + stamp_id + ", chall_id=" + chall_id + ", stamp_img=" + stamp_img
				+ ", stamp_name=" + stamp_name + "]";
	}

}
