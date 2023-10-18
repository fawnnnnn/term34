package testWeb.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import testWeb.vo.*;
import testWeb.dao.UserDAO;
import testWeb.dao.impl.*;
import java.util.*;
//@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws IOException, ServletException{
		}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws IOException, ServletException{
			 UserInfo userinfo = new UserInfo();
			 userinfo.setUsername(req.getParameter("username"));
			 userinfo.setPassword(req.getParameter("password"));
			 
			 
			 UserDAO dao = new UserDAOImpl();
			 userVo userVo=new userVo();
		     try {
				 userVo = dao.queryByUserInfo(userinfo);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
			}
			 if(userVo.getFlag() == 1){
				 RobotInfo robot =new RobotInfo();
				 List<RobotInfo> r = dao.SelectRobot(userVo.getId());
				 System.out.println(robot.toString());
				 HttpSession session=req.getSession();
		         session.setAttribute("username", userinfo.getUsername());
				 session.setAttribute("userId", userVo.getId());
				 session.setAttribute("name",robot.getNAME());
		         session.setAttribute("weight",robot.getweight());
		         session.setAttribute("image",robot.getiamge());
		         session.setAttribute("size",robot.getsize());
		         session.setAttribute("r",r);
		         req.setAttribute("list", r);

		         res.sendRedirect("./users/users.jsp");
		        } else {
		         res.sendRedirect("./login/error.jsp");
		        }
		 }
}
