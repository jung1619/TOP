package global.sesoc.TOPproject.VO;

public class Schedule {

	private String id;
	private int p_num;
	private String start_date;
	private String end_date;
	private String content;
	private String color;
	
	public Schedule(){}
	public Schedule(String id, String start_date, String end_date, String content, String color) {
		this.id = id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.content = content;
		this.color = color;
	}
	public Schedule(int p_num, String start_date, String end_date, String content, String color) {
		this.p_num = p_num;
		this.start_date = start_date;
		this.end_date = end_date;
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
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
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
	
	@Override
	public String toString() {
		return "Schedule [id=" + id + ", p_num=" + p_num + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", content=" + content + ", color=" + color + "]";
	}
	
}