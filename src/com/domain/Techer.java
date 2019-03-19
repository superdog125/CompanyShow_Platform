package com.domain;

import java.util.Date;

public class Techer {
	private Integer tid;
	private String tname;
	private String tphone;
	private String tpassword;
	private String tworkyear;
	private String tsex;
	private Integer tage;
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getTphone() {
		return tphone;
	}
	public void setTphone(String tphone) {
		this.tphone = tphone;
	}
	public String getTpassword() {
		return tpassword;
	}
	public void setTpassword(String tpassword) {
		this.tpassword = tpassword;
	}
	public String getTworkyear() {
		return tworkyear;
	}
	public void setTworkyear(String tworkyear) {
		this.tworkyear = tworkyear;
	}
	public String getTsex() {
		return tsex;
	}
	public void setTsex(String tsex) {
		this.tsex = tsex;
	}
	public Integer getTage() {
		return tage;
	}
	public void setTage(Integer tage) {
		this.tage = tage;
	}
	@Override
	public String toString() {
		return "Techer [tid=" + tid + ", tname=" + tname + ", tphone=" + tphone
				+ ", tpassword=" + tpassword + ", tworkyear=" + tworkyear
				+ ", tsex=" + tsex + ", tage=" + tage + "]";
	}
	
}
