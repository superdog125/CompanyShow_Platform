package com.domain;

public class User {
	private Integer uid;
	private String userName;
	private String loginName;
	private String loginPwd;
	private String telephone;

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String toString() {
		return "User [uid=" + uid + ", userName=" + userName + ", loginName="
				+ loginName + ", loginPwd=" + loginPwd + ", telephone="
				+ telephone + "]";
	}
	
	
}
