package com.workshop.tradr.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 * 
 * @author aravind
 *
 */
@Controller
public class StocksController
{

	private static final Logger logger = LoggerFactory.getLogger(StocksController.class);

	/**
	 * 
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getNseData", method = RequestMethod.GET)
	public String home(final Locale locale, final Model model)
	{
		StocksController.logger.info("Logged");
		return "nse";
	}

	/**
	 * 
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getMoneyControlData", method = RequestMethod.GET)
	public String login(final Locale locale, final Model model)
	{
		StocksController.logger.info("Logged");

		return "moneycontrol";
	}

	/**
	 * 
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getYahooFinData", method = RequestMethod.GET)
	public String userManage(final Locale locale, final Model model)
	{
		StocksController.logger.info("Logged");

		return "yahoofin";
	}
}

