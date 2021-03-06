package global.sesoc.github;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	
	
	/* test by uj */
	@RequestMapping(value="uj", method=RequestMethod.GET)
	public void uj(){
		logger.info("ujuj");
		logger.info("!@#$%^&*()_+");
	}
	
	
	/* test by sungbin */
	@RequestMapping(value="sungbin", method=RequestMethod.GET)
	public void sungbin(){
		logger.info("sungbin");
		logger.info("sungbinsungbin");
	}
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	public void test1(){
		String test = "test";
	}
	
}
