package com.energysh.egame.po.appstore;

import java.util.Date;

/**
 * TAdSwitchConf entity. @author MyEclipse Persistence Tools
 */

public class TAdSwitchConf implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String batchId;
	private Integer switch_;
	private String language;
	private Integer appType;
	private Integer day;
	private Date ctime;

	// Constructors

	/** default constructor */
	public TAdSwitchConf() {
	}

	/** full constructor */
	public TAdSwitchConf(String batchId, Integer switch_, String language,
			Integer appType, Integer day, Date ctime) {
		this.batchId = batchId;
		this.switch_ = switch_;
		this.language = language;
		this.appType = appType;
		this.day = day;
		this.ctime = ctime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBatchId() {
		return this.batchId;
	}

	public void setBatchId(String batchId) {
		this.batchId = batchId;
	}

	public Integer getSwitch_() {
		return this.switch_;
	}

	public void setSwitch_(Integer switch_) {
		this.switch_ = switch_;
	}

	public String getLanguage() {
		return this.language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Integer getAppType() {
		return this.appType;
	}

	public void setAppType(Integer appType) {
		this.appType = appType;
	}

	public Integer getDay() {
		return this.day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	public Date getCtime() {
		return this.ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

}