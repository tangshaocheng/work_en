package com.energysh.egame.service;

import java.util.List;
import java.util.Map;

import com.energysh.egame.po.appstore.TAdSwitchConf;
import com.energysh.egame.util.PageBar;

public interface AdService {

	public Map<String, String> add(Map<String, String> para) throws Exception;

	public Map<String, String> del(Map<String, String> para) throws Exception;
	public Map<String, String> switch_(Map<String, String> para) throws Exception;

	public Map<String, String> up(Map<String, String> para) throws Exception;

	public PageBar query(Map<String, String> para) throws Exception;
	
	public TAdSwitchConf get(Map<String, String> para) throws Exception;
	
	public List<TAdSwitchConf> getBatchList(String batchId) throws Exception;
	public List<TAdSwitchConf> getAppTypeList(String batchId) throws Exception;

}
