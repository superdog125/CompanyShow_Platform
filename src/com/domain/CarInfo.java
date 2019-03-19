package com.domain;

import java.util.Date;

public class CarInfo {
	private Integer ciid;
	private String cistart;
	private String ciend;
	private Integer cicost;
	private Integer cioil;
	private String citime;
	private Car car;
	private Driver driver;
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public Driver getDriver() {
		return driver;
	}
	public void setDriver(Driver driver) {
		this.driver = driver;
	}
	public Integer getCiid() {
		return ciid;
	}
	public void setCiid(Integer ciid) {
		this.ciid = ciid;
	}
	public String getCistart() {
		return cistart;
	}
	public void setCistart(String cistart) {
		this.cistart = cistart;
	}
	public String getCiend() {
		return ciend;
	}
	public void setCiend(String ciend) {
		this.ciend = ciend;
	}
	public Integer getCicost() {
		return cicost;
	}
	public void setCicost(Integer cicost) {
		this.cicost = cicost;
	}
	public Integer getCioil() {
		return cioil;
	}
	public void setCioil(Integer cioil) {
		this.cioil = cioil;
	}
	public String getCitime() {
		return citime;
	}
	public void setCitime(String citime) {
		this.citime = citime;
	}
	@Override
	public String toString() {
		return "CarInfo [ciid=" + ciid + ", cistart=" + cistart + ", ciend="
				+ ciend + ", cicost=" + cicost + ", cioil=" + cioil
				+ ", citime=" + citime + ", car=" + car + ", driver=" + driver
				+ "]";
	}
	
	
	
}
