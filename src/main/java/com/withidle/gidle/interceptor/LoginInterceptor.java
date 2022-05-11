package com.withidle.gidle.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.withidle.gidle.vo.Admin;
import com.withidle.gidle.vo.Users;


public class LoginInterceptor implements HandlerInterceptor {


	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String url = request.getContextPath();
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("users");
		Admin admin = (Admin) session.getAttribute("admin");
		// /member/list.do �� admin ���Ǿ�Ʈ����Ʈ�� null�� �ƴҶ��� ��û �����ϱ�
		// �� �׷��� ������ alert ����

		/*
		 * if (admin == null) { String msg = "������ �α��� �ϼ���."; // String
		 * url=request.getContextPath();
		 * response.setContentType("text/html;charset=utf-8"); PrintWriter out =
		 * response.getWriter(); StringBuilder alerts = new
		 * StringBuilder("<script>alert('").append(msg).append("');")
		 * .append("location.href='").append(url).append("';").append("</script>");
		 * out.print(alerts.toString()); // out.flush(); //��¹��� ����
		 * 
		 * return false; } else if (request.getRequestURI().equals(url +
		 * "/member/list.do") && admin != null) { return true; }
		 */

		if (users == null && admin ==null) { // �α��� ���� ���� �˻�
			String msg = "�α��� �ϼ���.";
//			String url=request.getContextPath();
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			StringBuilder alerts = new StringBuilder("<script>alert('").append(msg).append("');")
					.append("location.href='").append(url).append("'").append("</script>");
			out.print(alerts.toString());
			// out.flush(); //��¹��� ����

			return false; // ��û�� ������ handler �޼ҵ�� ����(����)�� �̵����� �ʽ��ϴ�.
		} else {
			// �α��� �� �����̹Ƿ� ��û�� ���� handler �޼ҵ�� �̵��մϴ�.
			return true;
		}
	}
}
