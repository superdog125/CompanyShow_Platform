package com.domain;

import java.util.HashSet;
import java.util.Set;

public class Car {
	private Integer cid;
	private String cbrand;
	private Integer cnumber;
	private String cfix;
	private String cproblem;
	private String ccheck;
	private Set<CarInfo> carinfo = new HashSet<CarInfo>();
	public Set<CarInfo> getCarinfo() {
		return carinfo;
	}
	public void setCarinfo(Set<CarInfo> carinfo) {
		this.carinfo = carinfo;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCbrand() {
		return cbrand;
	}
	public void setCbrand(String cbrand) {
		this.cbrand = cbrand;
	}
	public Integer getCnumber() {
		return cnumber;
	}
	public void setCnumber(Integer cnumber) {
		this.cnumber = cnumber;
	}
	public String getCfix() {
		return cfix;
	}
	public void setCfix(String cfix) {
		this.cfix = cfix;
	}
	public String getCproblem() {
		return cproblem;
	}
	public void setCproblem(String cproblem) {
		this.cproblem = cproblem;
	}
	public String getCcheck() {
		return ccheck;
	}
	public void setCcheck(String ccheck) {
		this.ccheck = ccheck;
	}
	@Override
	public String toString() {
		return "{" + "\"cid\"" + ":" + cid + ","
				+ "\"cbrand\"" + ":" + cbrand + "," 
				+ "\"cnumber\"" + ":" + cnumber + "," 
				+"\"cfix\"" + ":" + cfix + "," 
				+"\"cproblem\"" + ":" + cproblem + "," 
				+"\"ccheck\"" + ":" + ccheck 
				+ "}";
				
	}
//	@Override
//	public String toString() {
//		return "Car [cid=" + cid + ", cbrand=" + cbrand + ", cnumber="
//				+ cnumber + ", cfix=" + cfix + ", cproblem=" + cproblem
//				+ ", ccheck=" + ccheck + "]";
//	}

	
	
}
