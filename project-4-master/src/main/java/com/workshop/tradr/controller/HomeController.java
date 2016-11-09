package com.workshop.tradr.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
//import callhomeconrollerlogin.*;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController
{

    //loginmodel log=new loginmodel();
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
     * @param locale
     * @param model
     * @return 
	 */
	@RequestMapping(value = "/home" , method = RequestMethod.GET)
	public String home(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
		return "home";
	}
        
        
        
       @RequestMapping(value = "/adminpage" , method = RequestMethod.GET)
	public String adminpage(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
		return "adminpage";
	}
        
	
	/**
	 * 
	 * @param locale
	 * @param model
	 * @return
	 */
        @RequestMapping(value = "/userupdatetodb" , method = RequestMethod.GET)
        public String userupdatetodb(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
		return "userupdatetodb";
	}
        
        @RequestMapping(value = "/stockupdatetodb" , method = RequestMethod.GET)
        public String stockupdatetodb(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
		return "stockupdatetodb";
	}
	@RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
	public String login(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                    System.out.println("siddhant sharma");
		return "login";
	}
        
@RequestMapping(value = "/user_maintain", method = RequestMethod.GET)
	public String user_maintain(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                    System.out.println("siddhant sharma");
		return "user_maintain";
	}
        
        @RequestMapping(value = "/stock_manage", method = RequestMethod.GET)
	public String stock_manage(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                    System.out.println("siddhant sharma");
		return "stock_manage";
	}
        @RequestMapping(value = "/stock_update", method = RequestMethod.GET)
	public String stock_update(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                    System.out.println("siddhant sharma");
		return "stock_update";
	}
     
        
        @RequestMapping(value = "/getUserHome", method = RequestMethod.GET)
	public String getUserHome(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                   return "userHome";
	}
        
        @RequestMapping(value = "/user_update", method = RequestMethod.GET)
	public String user_update(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                    System.out.println("siddhant sharma");
		return "user_update";
	}
        @RequestMapping(value = "/user_control", method = RequestMethod.GET)
	public String user_control(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                    System.out.println("siddhant sharma");
		return "user_control";
	}
        @RequestMapping(value = "/stock_control", method = RequestMethod.GET)
	public String stock_control(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                    System.out.println("siddhant sharma");
		return "stock_control";
	}
        @RequestMapping(value = "/Forgetpass", method = RequestMethod.GET)
	public String Forgetpass(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                    System.out.println("siddhant sharma");
		return "Forgetpass";
	}
        @RequestMapping(value = "/Create_stock", method = RequestMethod.GET)
        public String Create_stock(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                    System.out.println("siddhant sharma");
		return "Create_stock";
	}
	/**
	 * 
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/userManage", method = RequestMethod.GET)
	public String userManage(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");

		return "about";
	}
        @RequestMapping(value = "/user", method = RequestMethod.GET)
        public String user(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                    
		return "user";
	}
        @RequestMapping(value = "/Register", method = RequestMethod.GET)
        public String Register(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                    
		return "Register";
	}
        @RequestMapping(value = "/changepass", method = RequestMethod.GET)
        public String changepass(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
                    
		return "changepass";
	}
          @RequestMapping(value = "/changepwd", method = RequestMethod.GET)
	public String changepwd(final Locale locale, final Model model)
	{
		HomeController.logger.info("Logged");
      		return "changepwd";
	}
        @RequestMapping(value = "/pswdupdatetodb", method = RequestMethod.GET)
        public String pswdupdatetodb(final Locale locale, final Model model)
	{
		HomeController.logger.info("PSWD Update");
		return "pswdupdatetodb";
	}
}

