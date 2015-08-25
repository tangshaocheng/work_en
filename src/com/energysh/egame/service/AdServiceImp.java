package com.energysh.egame.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.energysh.egame.po.appstore.TAdSwitchConf;
import com.energysh.egame.util.MyUtil;
import com.energysh.egame.util.PageBar;

@SuppressWarnings("unchecked")
public class AdServiceImp extends BaseService implements AdService {

	@Override
	public Map<String, String> add(Map<String, String> para) throws Exception {
		Map<String, String> rmap = new HashMap<String, String>();
		MyUtil mu = MyUtil.getInstance();
		Date ctime = new Date();
		
		
		String[] languageArr = mu.splitStr(para.get("language"));
		String[] appTypeArr = mu.splitStr(para.get("appType"));
		

		List<Object> ll = this.getAppstoreDao().findList("from TAdSwitchConf a where a.batchId=?", new Object[] {para.get("batchId")});
		if(ll.size() > 0) {
			rmap.put("info", "exist");
			return rmap;
		}
		for(String la : languageArr) {
			for(String ap : appTypeArr) {
				TAdSwitchConf conf = new TAdSwitchConf();
				mu.map2Object(para, conf);
				conf.setBatchId(para.get("batchId"));
				conf.setSwitch_(Integer.valueOf(para.get("switch")));
				conf.setCtime(ctime);
				conf.setAppType(Integer.valueOf(ap));
				conf.setLanguage(la);
				this.getAppstoreDao().save(conf);
			}
		}
		
		rmap.put("info", "ok");
		return rmap;
	}

	@Override
	public Map<String, String> del(Map<String, String> para) throws Exception {
		Map<String, String> rmap = new HashMap<String, String>();
		MyUtil mu = MyUtil.getInstance();
		String id = para.get("id");
		if (mu.isNotBlank(id)) {
			this.getAppstoreDao().excute("DELETE TAdSwitchConf WHERE id = ?", new Object[] { Integer.parseInt(id) });
			rmap.put("info", "ok");
		} else {
			rmap.put("info", "error");
		}
		return rmap;
	}
	@Override
	public Map<String, String> switch_(Map<String, String> para) throws Exception {
		Map<String, String> rmap = new HashMap<String, String>();
		String switch_ = para.get("switch");
		TAdSwitchConf cc = this.get(para);
		
		this.getAppstoreDao().excute("update TAdSwitchConf set  switch_=? where batchId=?", new Object[] {Integer.valueOf(switch_),cc.getBatchId()});
//		
//		cc.setSwitch_(Integer.valueOf(switch_));
//		this.getAppstoreDao().update(cc);
		rmap.put("info", "ok");
		return rmap;
	}

	@Override
	public Map<String, String> up(Map<String, String> para) throws Exception {
		Map<String, String> rmap = new HashMap<String, String>();
		
		this.getAppstoreDao().excute("DELETE TAdSwitchConf WHERE batchId = ?", new Object[] {para.get("bb")});
		
//		conf.setSwitch_(Integer.valueOf(para.get("switch")));
//		conf.setDay(Integer.valueOf(para.get("day")));
//		conf.setCtime(new Date());
//		this.getAppstoreDao().update(conf);
//		rmap.put("info", "ok");
		
		MyUtil mu = MyUtil.getInstance();
		Date ctime = new Date();
		
		
		String[] languageArr = mu.splitStr(para.get("language"));
		String[] appTypeArr = mu.splitStr(para.get("appType"));
		

		for(String la : languageArr) {
			for(String ap : appTypeArr) {
				TAdSwitchConf conf = new TAdSwitchConf();
				mu.map2Object(para, conf);
				conf.setBatchId(para.get("bb"));
				conf.setSwitch_(Integer.valueOf(para.get("switch")));
				conf.setCtime(ctime);
				conf.setAppType(Integer.valueOf(ap));
				conf.setLanguage(la);
				this.getAppstoreDao().save(conf);
			}
		}
		rmap.put("info", "ok");
		return rmap;
	}

	
	@Override
	public TAdSwitchConf get(Map<String, String> para) throws Exception {
		TAdSwitchConf conf  = (TAdSwitchConf)this.getAppstoreDao().findObject("from TAdSwitchConf where id=?", new Object[]{Integer.valueOf(para.get("id"))});
		return conf;
	}
	
	@Override
	public List<TAdSwitchConf> getBatchList(String batchId) throws Exception {
		return this.getAppstoreDao().findList("from TAdSwitchConf where batchId=? group by language", new Object[]{batchId});
	}
	@Override
	public List<TAdSwitchConf> getAppTypeList(String batchId) throws Exception {
		return this.getAppstoreDao().findList("from TAdSwitchConf where batchId=? group by appType", new Object[]{batchId});
	}
	
	@Override
	public PageBar query(Map<String, String> para) throws Exception {
		PageBar pb = new PageBar(para);
		MyUtil mu = MyUtil.getInstance();
		StringBuilder sql = new StringBuilder("FROM TAdSwitchConf t1 where 1=1");
		List<Object> plist = new ArrayList<Object>();
		if (mu.isNotBlank(para.get("batchId"))) {
			sql.append(" AND t1.batchId = ?");
			plist.add(para.get("batchId"));
		}
		if (mu.isNotBlank(para.get("language"))) {
			sql.append(" AND t1.language = ?");
			plist.add(para.get("language"));
		}
		if (mu.isNotBlank(para.get("appType"))) {
			sql.append(" AND t1.appType = ?");
			plist.add(Integer.valueOf(para.get("appType")));
		}
		pb.setTotalNum(this.getAppstoreDao().findList(sql + " group by batchId)", plist.toArray()).size());
		if (pb.getTotalNum() == 0)
			return pb;
		List<Map<String, Object>> rList = this.getAppstoreDao().findListPage(sql.toString() + " group by batchId", plist.toArray(), pb);
		pb.setResultList(rList);
		return pb;
	}

}
