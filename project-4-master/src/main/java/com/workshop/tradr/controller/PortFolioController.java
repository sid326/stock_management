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
public class PortFolioController
{

	private static final Logger logger = LoggerFactory.getLogger(PortFolioController.class);
	/**
	 * 
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getHshReports", method = RequestMethod.GET)
	public String getHouseholdReports(final Locale locale, final Model model)
	{
		PortFolioController.logger.info("Logged");

		return "hshreports";
	}

	/**
	 * 
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getIndReports", method = RequestMethod.GET)
	public String getIndustryReports(final Locale locale, final Model model)
	{
		PortFolioController.logger.info("Logged");

		return "indreports";
	}
	
	/**
	 * 
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getStatement", method = RequestMethod.GET)
	public String getStatement(final Locale locale, final Model model)
	{
		PortFolioController.logger.info("Logged");

		return "statement";
	}

	/**
	 * 
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/watchlist", method = RequestMethod.GET)
	public String getWatchlist(final Locale locale, final Model model)
	{
		PortFolioController.logger.info("Logged");

		return "watchlist";
	}
}

