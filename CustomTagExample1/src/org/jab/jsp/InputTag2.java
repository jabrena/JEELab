package org.jab.jsp;

import java.io.*;
import java.util.*;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class InputTag2 extends BodyTagSupport implements DynamicAttributes {

	private Boolean readonly;

	public void setReadonly(Boolean flag) {
		this.readonly = flag;
	}
	
    private Map<String,Object> dynamicAttrs = new HashMap<String,Object>();

    public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {
    	dynamicAttrs.put(localName.toLowerCase(), value);
    }

    // pass-thru all other attributes
    public int doStartTag() throws JspException {
	try {
	    StringBuilder sb = new StringBuilder();
	    sb.append("<input type=\"submit\" ");

	    for (String s: dynamicAttrs.keySet()) {
		sb.append(String.format("%s=\"%s\" ", s, dynamicAttrs.get(s)));
	    }
	    sb.append(">");

	    JspWriter out = pageContext.getOut();
	    out.print(sb.toString());
	}
	catch (java.io.IOException e) {
	    throw new JspException(e);
	}

	return EVAL_BODY_BUFFERED;
    }

    public int doAfterBody() throws JspException {
	try {
	    BodyContent bc = getBodyContent();
	    bc.writeOut(getPreviousOut());
	}
	catch (IOException e) {
	    throw new JspException(e);
	}
	return SKIP_BODY;
    }

    public int doEndTag() throws JspException {
	try {
	    JspWriter out = pageContext.getOut();
	    out.print(String.format("</%s>", ""));
	}
	catch (IOException e) {
	    throw new JspException(e);
	}
	return EVAL_PAGE;
    }
}
