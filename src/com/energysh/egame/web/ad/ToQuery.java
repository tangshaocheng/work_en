package com.energysh.egame.web.ad;

import org.springframework.web.servlet.ModelAndView;

import com.energysh.egame.web.BaseController;

public class ToQuery extends BaseController {
	
	public ModelAndView excute() {
		try {
			this.getRequest().setAttribute("batchList", this.getGenBatchService().findAll());
			return new ModelAndView(this.getJsp());
		} catch (Exception e) {
			return this.error(e);
		}
	}
	
}