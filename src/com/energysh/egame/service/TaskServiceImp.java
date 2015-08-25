package com.energysh.egame.service;

import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.energysh.egame.po.appstore.TSearchHot;
import com.energysh.egame.util.MyConfigurer;
import com.energysh.egame.util.Utils;

;

public class TaskServiceImp extends BaseService implements TaskService {

	private static Logger logger = Logger.getLogger(TaskServiceImp.class);

	public boolean isMaster() {
		if ("Y".equalsIgnoreCase(MyConfigurer.getEvn("is_master")))
			return true;
		return false;
	}

	public void getQihooApiData() {
		if (!isMaster())
			return;
	}

	public void doIncome() {
		if (!isMaster())
			return;
		System.out.println("=======================>start doIncome<=======================");
		this.getAppstoreDao().excuteBySql("UPDATE t_partners_income_conf SET cpa_price = cpa_price_nextday, cps_divide_ratio = cps_divide_ratio_nextday");

		this.getSsoDao().excuteBySql("INSERT IGNORE INTO appstore.t_cpa_income(id, cdate, app_id, user_id, user_type, batch_id, active_num, cpa_income, pub_status) SELECT t1.id, t1.cdate, t1.app_id, t1.user_id, 4 user_type, t1.batch_id, count(t1.batch_id) active_num, 0 cpa_income, 0 pub_status FROM (SELECT CONCAT(DATE_FORMAT(t1.ctime,'%Y-%m-%d'), '_', t1.app_id, '_', t3.user_id, '_', t1.batch_id) id, DATE_FORMAT(t1.ctime,'%Y-%m-%d') cdate, t1.app_id, t3.user_id, t1.batch_id FROM (SELECT * FROM appstore.t_device_mac_info WHERE ctime LIKE CONCAT(DATE_ADD(CURRENT_DATE, INTERVAL -1 DAY), '%')) t1 INNER JOIN appstore.t_device_batch t2 ON t1.batch_id = t2.batch_id INNER JOIN (SELECT * FROM sso.permit_user WHERE user_type = 4) t3 ON t2.name = t3.nickname) t1 WHERE t1.id IS NOT NULL GROUP BY t1.id");
		this.getSsoDao().excuteBySql("INSERT IGNORE INTO appstore.t_cps_income(id, cdate, app_id, user_id, user_type, batch_id, down_num, cps_income, pub_status) SELECT t1.id, t1.cdate, t1.app_id, t1.user_id, 4 user_type, t1.batch_id, count(t1.batch_id) down_num, 0 cps_income, 0 pub_status FROM (SELECT CONCAT(DATE_FORMAT(t1.ctime,'%Y-%m-%d'), '_', t1.app_id, '_', t3.user_id, '_', t1.batch_id) id, DATE_FORMAT(t1.ctime,'%Y-%m-%d') cdate, t1.app_id, t3.user_id, 4 user_type, t1.batch_id, 0 cps_income, 0 pub_status FROM (SELECT * FROM appstore.t_down_complete_log WHERE ctime LIKE CONCAT(DATE_ADD(CURRENT_DATE, INTERVAL -1 DAY), '%')) t1 INNER JOIN appstore.t_device_batch t2 ON t1.batch_id = t2.batch_id INNER JOIN (SELECT * FROM sso.permit_user WHERE user_type = 4) t3 ON t2.name = t3.nickname) t1 WHERE t1.id IS NOT NULL GROUP BY t1.id");

		this.getAppstoreDao().excuteBySql("UPDATE t_cpa_income t1 LEFT JOIN t_partners_income_conf t2 ON t1.user_id = t2.user_id SET t1.cpa_income = t1.active_num * IFNULL(t2.cpa_price, 0), t1.pub_status = 1");

		// this.getSsoDao().excuteBySql("INSERT IGNORE INTO appstore.t_user_income(id, cdate, user_id, user_type, batch_id, income, down_sum) SELECT t1.* FROM (SELECT CONCAT(DATE_FORMAT(t1.ctime,'%Y-%m-%d'), '_', t2.user_id, '_', t1.batch_id) id, DATE_FORMAT(t1.ctime,'%Y-%m-%d') cdate, t2.user_id, 3 user_type, t1.batch_id, 0 income, count(t1.batch_id) down_sum FROM (SELECT * FROM appstore.t_down_complete_log WHERE ctime LIKE CONCAT(DATE_ADD(CURRENT_DATE, INTERVAL -1 DAY), '%')) t1 INNER JOIN appstore.t_sale_batch_relation t2 ON t2.del = 0 AND t1.batch_id = t2.batch_id GROUP BY t1.batch_id, t2.user_id, date(t1.ctime)) t1");
		// this.getSsoDao().excuteBySql("INSERT IGNORE INTO appstore.t_user_income(id, cdate, user_id, user_type, batch_id, income, down_sum) SELECT t1.* FROM (SELECT CONCAT(DATE_FORMAT(t1.ctime,'%Y-%m-%d'), '_', t3.user_id, '_', t1.batch_id) id, DATE_FORMAT(t1.ctime,'%Y-%m-%d') cdate, t3.user_id, 4 user_type, t1.batch_id, 0 income, count(t1.batch_id) down_sum FROM (SELECT * FROM appstore.t_down_complete_log WHERE ctime LIKE CONCAT(DATE_ADD(CURRENT_DATE, INTERVAL -1 DAY), '%')) t1 INNER JOIN appstore.t_device_batch t2 ON t1.batch_id = t2.batch_id INNER JOIN (SELECT * FROM permit_user WHERE user_type = 4) t3 ON t2.name = t3.nickname GROUP BY t1.batch_id, t3.user_id, date(t1.ctime)) t1");
		System.out.println("=======================>end doIncome<=======================");
	}

	@Override
	public void hotSearch() {
		if (!isMaster())
			return;
		logger.info("start hotSearch");
		try {
			String startDate = Utils.getPreviousWeekday();
			String endDate = Utils.getPreviousWeekSunday();
			Date ctime = new Date();
			List<Map<String, Object>> list = this.getAppstoreDao().findListMapBySql("select key_name,count(*) as count from t_search_log where ctime BETWEEN ? and ? and key_name !='' GROUP BY key_name order by count desc LIMIT 10", new Object[] { startDate, endDate });
			// if(list.size() > 0) this.getAppstoreDao().excuteBySql("delete from t_search_hot");
			Collections.reverse(list);
			for (Map<String, Object> mm : list) {
				TSearchHot hot = new TSearchHot();
				hot.setAppType("1");
				hot.setKeyName(mm.get("key_name").toString());
				hot.setCtime(ctime);
				this.getAppstoreDao().save(hot);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		logger.info("end hotSearch");
	}

}
