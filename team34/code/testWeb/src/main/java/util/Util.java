package util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import testWeb.dao.UserDAO;
import testWeb.dao.impl.UserDAOImpl;
import testWeb.vo.RobotInfo;

public class Util{
	public static void  init(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session=req.getSession();
		 UserDAO dao = new UserDAOImpl();
		 RobotInfo robot =new RobotInfo();
        int userid= (int) session.getAttribute("userId");
		 List<RobotInfo> r = dao.SelectRobot(userid);
		 System.out.println(robot.toString());


         session.setAttribute("name",robot.getNAME());
         session.setAttribute("weight",robot.getweight());
         session.setAttribute("image",robot.getiamge());
         session.setAttribute("size",robot.getsize());
         session.setAttribute("r",r);
         req.setAttribute("list", r);

	}

}