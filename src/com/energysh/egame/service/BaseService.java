package com.energysh.egame.service;

import com.energysh.egame.dao.BaseDao;

public class BaseService {

	private BaseDao ssoDao;
	private BaseDao appstoreDao;
	private MemcachedService memProgrammer;

	public BaseDao getSsoDao() {
		return ssoDao;
	}

	public void setSsoDao(BaseDao ssoDao) {
		this.ssoDao = ssoDao;
	}

	public BaseDao getAppstoreDao() {
		return appstoreDao;
	}

	public void setAppstoreDao(BaseDao appstoreDao) {
		this.appstoreDao = appstoreDao;
	}

	public MemcachedService getMemProgrammer() {
		return memProgrammer;
	}

	public void setMemProgrammer(MemcachedService memProgrammer) {
		this.memProgrammer = memProgrammer;
	}
}
