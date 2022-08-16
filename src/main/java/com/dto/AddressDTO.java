package com.dto;


public class AddressDTO {
	private int address_id;
	private String userid;
	private String address_name;	
	private String receiver_name;	
	private String receiver_phone;	
	private String post_num;		
	private String addr1;	
	private String addr2;	
	private int default_chk;
	
	public AddressDTO() {
		super();
	}

	public AddressDTO(int address_id, String userid, String address_name, String receiver_name, String receiver_phone,
			String post_num, String addr1, String addr2, int default_chk) {
		super();
		this.address_id = address_id;
		this.userid = userid;
		this.address_name = address_name;
		this.receiver_name = receiver_name;
		this.receiver_phone = receiver_phone;
		this.post_num = post_num;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.default_chk = default_chk;
	}

	public int getAddress_id() {
		return address_id;
	}

	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getAddress_name() {
		return address_name;
	}

	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}

	public String getReceiver_name() {
		return receiver_name;
	}

	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}

	public String getReceiver_phone() {
		return receiver_phone;
	}

	public void setReceiver_phone(String receiver_phone) {
		this.receiver_phone = receiver_phone;
	}

	public String getPost_num() {
		return post_num;
	}

	public void setPost_num(String post_num) {
		this.post_num = post_num;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public int getDefault_chk() {
		return default_chk;
	}

	public void setDefault_chk(int default_chk) {
		this.default_chk = default_chk;
	}

	@Override
	public String toString() {
		return "AddressDTO [address_id=" + address_id + ", userid=" + userid + ", address_name=" + address_name
				+ ", receiver_name=" + receiver_name + ", receiver_phone=" + receiver_phone + ", post_num=" + post_num
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", default_chk=" + default_chk + "]";
	}
	
}
