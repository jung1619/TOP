package global.sesoc.TOPproject.VO;

public class Schedule {

	private String id;
	private int p_num;
	private String startdate;
	private String enddate;
	private String content;
	private String color;
	private String deldate;
	
	public Schedule(){}
	public Schedule(String id, String start_date, String end_date, String content, String color) {
		this.id = id;
		this.startdate = start_date;
		this.enddate = end_date;
		this.content = content;
		this.color = color;
	}
	public Schedule(int p_num, String start_date, String end_date, String content, String color) {
		this.p_num = p_num;
		this.startdate = start_date;
		this.enddate = end_date;
		this.content = content;
		this.color = color;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getDeldate() {
		return deldate;
	}
	public void setDeldate(String deldate) {
		this.deldate = deldate;
	}
	
	@Override
	public String toString() {
		return "Schedule [id=" + id + ", p_num=" + p_num + ", startdate=" + startdate + ", enddate=" + enddate
				+ ", content=" + content + ", color=" + color + ", deldate=" + deldate + "]";
	}
	
}