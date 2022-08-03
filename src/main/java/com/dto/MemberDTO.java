package com.dto;

public class MemberDTO {
	
	private String userid;
	private String passwd;
	private String username;
	private String email1; 
	private String email2; 
	private String phone; 
	private String created_at;
	private int role;
	
	public MemberDTO() {
		super();
	}

	public MemberDTO(String userid, String passwd, String username, String email1, String email2, String phone,
			String created_at, int role) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.username = username;
		this.email1 = email1;
		this.email2 = email2;
		this.phone = phone;
		this.created_at = created_at;
		this.role = role;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", passwd=" + passwd + ", username=" + username + ", email1=" + email1
				+ ", email2=" + email2 + ", phone=" + phone + ", created_at=" + created_at + ", role=" + role + "]";
	}

}
