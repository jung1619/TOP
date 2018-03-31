package global.sesoc.TOPproject.DAO;
 
import global.sesoc.TOPproject.VO.Memo;
import global.sesoc.TOPproject.VO.Project;
import global.sesoc.TOPproject.VO.Schedule;

public interface ProjectMapperInterface {

	public int insertProject(Project project);
	public int insertProjectSchedule(Schedule schedule);
	public int insertProjectNotice(Memo memo);
	
	public int updateProject(Project project);
	public int updateProjectSchedule(Schedule schedule);
	public int updateProjectNotice(Memo memo);
	
	public int deleteProjectNotice(Memo memo);
	
}
