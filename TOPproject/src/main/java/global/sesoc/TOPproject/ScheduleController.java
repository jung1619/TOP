package global.sesoc.TOPproject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired
	UserDAO userDAO;
	
	Schedule schedule;

	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	//시간의 형식을 바꿔줌   
	public String times(String taskS){
		String reStr = "";
		for (int i = 0; i < taskS.length(); i++) {
			if(taskS.charAt(i) == 'T' || taskS.charAt(i) == '-' || taskS.charAt(i) == ':'){
				reStr += "";
			} else{
				reStr += taskS.charAt(i);
			}
		}
		return reStr;
	}
	
	//일정 등록
	@RequestMapping(value = "/insertSchedule", method = RequestMethod.POST)
	public String insertTimeForm(Model model, Schedule schedule) {

		schedule.setStartdate(times(schedule.getStartdate()));
		schedule.setEnddate(times(schedule.getEnddate()));
		int result = userDAO.insertUserSchedule(schedule);
		
		return "redirect:/group";
	}
	
	//일정 수정
	@RequestMapping(value = "/updateUserSchedule", method = RequestMethod.POST)
	public String updateUserSchedule(Model model, Schedule schedule) {

		schedule.setStartdate(times(schedule.getStartdate()));
		schedule.setEnddate(times(schedule.getEnddate()));
		int result = userDAO.insertUserSchedule(schedule);
		
		return "redirect:/group";
	}
	
	
}
