package com.energysh.egame.web.ad;

import org.springframework.web.servlet.ModelAndView;

import com.energysh.egame.web.BaseController;

public class Up extends BaseController {

	public ModelAndView excute() {
		try {
			this.setJsonResult(this.getAdService().up(this.getAjaxPara()));
		} catch (Exception e) {
			this.errorAjax(e);
		}
		return null;
	}
}
