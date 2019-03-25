package de.ivu.util.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

public class HSTSFilter implements Filter {

  @Override
  public void init(FilterConfig filterConfig) throws ServletException {
    System.out.println("HSTSFilter is beeing installed"); //$NON-NLS-1$
  }

  @Override
  public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
      throws IOException, ServletException {
    HttpServletResponse resp = (HttpServletResponse) res;

    resp.setHeader("Strict-Transport-Security", "max-age=31622400; includeSubDomains"); //$NON-NLS-1$ //$NON-NLS-2$

    chain.doFilter(req, resp);
  }

  @Override
  public void destroy() {
    // do nothing
  }
}