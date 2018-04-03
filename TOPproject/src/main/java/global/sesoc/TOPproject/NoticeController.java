package global.sesoc.TOPproject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class NoticeController {
	
	private final static Logger logger= LoggerFactory.getLogger(JoinController.class);
	
	@RequestMapping(value="NoticeInsert", method=RequestMethod.POST)
	public String boardinsert(@RequestBody String context){
		System.out.println("게시판내용 : "+context);
		
		
		return"redirect:/group";
	}
}
