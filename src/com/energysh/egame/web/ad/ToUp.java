package com.energysh.egame.web.ad;

import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.energysh.egame.po.appstore.TAdSwitchConf;
import com.energysh.egame.web.BaseController;

public class ToUp extends BaseController {

	public ModelAndView excute() {
		try {
			Map<String, String> para = this.getAjaxPara();
			this.getRequest().setAttribute("batchList", this.getGenBatchService().findAll());
			TAdSwitchConf adConf = this.getAdService().get(para);
			this.getRequest().setAttribute("adConf",adConf);
			this.getRequest().setAttribute("bbList",this.getAdService().getBatchList(adConf.getBatchId()));
			this.getRequest().setAttribute("aaList",this.getAdService().getAppTypeList(adConf.getBatchId()));
			return new ModelAndView(this.getJsp());
		} catch (Exception e) {
			return this.error(e);
		}
	}
}
