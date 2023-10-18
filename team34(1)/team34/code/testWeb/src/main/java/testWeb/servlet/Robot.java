package testWeb.servlet;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import testWeb.dao.UserDAO;
import testWeb.dao.impl.UserDAOImpl;
import testWeb.db.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import testWeb.db.DBConnect;
import testWeb.vo.*;
import util.Util;

public class Robot extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");
        UserDAO dao = new UserDAOImpl();
        if ("addRobot".equals(action)) {
            int CheckName=dao.getByRobotName(req.getParameter("robotname"));
            if(CheckName==0){
            HttpSession session=req.getSession();
        	RobotInfo robot =new RobotInfo();
            int userid= (int) session.getAttribute("userId");
            robot.setNAME(req.getParameter("robotname"));
            robot.setweight(req.getParameter("robotweight"));
            robot.setsize(req.getParameter("robotsize"));
            PreparedStatement pstmt = null ;
            DBConnect dbc = null;
            String sql ="INSERT INTO `javawebdb`.`robot`  VALUES (NULL,?,?,?,'car1.jpg',?)";
            try{
                // 连接数据库
                dbc = new DBConnect() ;
                pstmt = dbc.getConnection().prepareStatement(sql) ;
                pstmt.setString(1,robot.getNAME());
                pstmt.setString(2,robot.getweight());
                pstmt.setString(3,robot.getsize());
                pstmt.setInt(4,userid);
                // 增
                int rs = pstmt.executeUpdate();

                pstmt.close() ;
                Util.init(req, res);
                res.sendRedirect("./users/users.jsp");
            }catch (SQLException e){
                System.out.println(e.getMessage());
            }finally{
                // 关闭数据库
                dbc.close() ;
            }
            }else{
                res.sendRedirect("./checkName.jsp");
            }
        } else if ("deleteRobot".equals(action)) {
        	RobotInfo robot =new RobotInfo();
            String ID =req.getParameter("robotID");
        	PreparedStatement pstmt = null ;
            DBConnect dbc = null;
            String sql ="DELETE FROM Robot WHERE id = ?";
;
            try{
                // 连接数据库
                dbc = new DBConnect() ;
                pstmt = dbc.getConnection().prepareStatement(sql) ;
                pstmt.setString(1,ID);
                // 删除
                int rs = pstmt.executeUpdate();

                pstmt.close() ;
                Util.init(req, res);
                res.sendRedirect("./users/users.jsp");
            }catch (SQLException e){
                System.out.println(e.getMessage());
            }finally{
                // 关闭数据库连接
                dbc.close() ;
            }
        } else if ("changeRobot".equals(action)) { //修改
        	RobotInfo robot =new RobotInfo();
            int CheckName=dao.getByRobotName(req.getParameter("robotname1"));
            if(CheckName==0){
        	String ID =req.getParameter("robotID1");
            robot.setNAME(req.getParameter("robotname1"));
            robot.setweight(req.getParameter("robotweight1"));
            robot.setsize(req.getParameter("robotsize1"));
            PreparedStatement pstmt = null ;
            DBConnect dbc = null;
            String sql ="UPDATE Robot SET NAME = ?, WEIGHT = ?, SIZE=? WHERE id =?";
;
            try{
                // 连接数据库
                dbc = new DBConnect() ;
                pstmt = dbc.getConnection().prepareStatement(sql) ;
                pstmt.setString(1,robot.getNAME());
                pstmt.setString(2,robot.getweight());
                pstmt.setString(3,robot.getsize());
                pstmt.setString(4, ID);
                // 改
                int rs = pstmt.executeUpdate();
                pstmt.close() ;
                Util.init(req, res);
                res.sendRedirect("./users/users.jsp");
            }catch (SQLException e){
                System.out.println(e.getMessage());
            }finally{
                // 关闭数据库连接
                dbc.close() ;

        }
            }else{
                res.sendRedirect("./checkName.jsp");
            }
        }

	}
}
