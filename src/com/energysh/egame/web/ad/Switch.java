package com.energysh.egame.web.ad;

import org.springframework.web.servlet.ModelAndView;

import com.energysh.egame.web.BaseController;

public class Switch extends BaseController {

	public ModelAndView excute() {
		try {
			return this.setJsonResult(this.getAdService().switch_(this.getAjaxPara()));
		} catch (Exception e) {
			return this.errorAjax(e);
		}
	}
}
