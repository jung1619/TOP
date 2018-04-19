package global.sesoc.TOPproject.VO;

public class Context {
	
	private String p_num;
	private String title;
	private String context;
	public Context(String p_num, String title, String context) {
		super();
		this.p_num = p_num;
		this.title = title;
		this.context = context;
	}
	public Context() {
		super();
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	@Override
	public String toString() {
		return "Context [p_num=" + p_num + ", title=" + title + ", context=" + context + "]";
	}
	
	
	
		
	
	
}
