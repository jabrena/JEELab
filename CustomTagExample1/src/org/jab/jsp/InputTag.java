package org.jab.jsp;

import javax.servlet.jsp.tagext.*;
import javax.servlet.jsp.*;
import java.io.*;

public class InputTag extends SimpleTagSupport {

	private Boolean readonly;

	public void setReadonly(Boolean flag) {
		this.readonly = flag;
	}
	
	public void doTag() throws JspException, IOException {

		JspWriter out = getJspContext().getOut();
		
		if (readonly != null) {
			out.println(readonly);
		}
		out.println("Hello Custom Tag!");
	}
	
}