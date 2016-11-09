package com.workshop.tradr.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 
 * @author aravind
 *
 */
@Controller
public class TradingController
{

	private static final Logger logger = LoggerFactory.getLogger(TradingController.class);
	
	/**
	 * 
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/buysell", method = RequestMethod.GET)
	public String buySell(final Locale locale, final Model model)
	{
		System.out.println("Inside user manage");
		TradingController.logger.info("Logged");

		return "buysell";
	}

	/**
	 * 
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getquote", method = RequestMethod.GET)
	public String getQuote(final Locale locale, final Model model)
	{
		System.out.println("Inside user manage");
		TradingController.logger.info("Logged");

		return "quote";
	}
}

