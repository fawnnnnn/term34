package testWeb.dao.impl;
import java.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import testWeb.dao.UserDAO;
import testWeb.db.DBConnect;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
import testWeb.vo.*;
public class UserDAOImpl implements UserDAO {

	public userVo queryByUserInfo(UserInfo userinfo) throws Exception {
		userVo userVo=new userVo();
		String sql = "select * from userinfo where username=?";
        PreparedStatement pstmt = null ;
        DBConnect dbc = null;

        // 下面是针对数据库的具体操作
        try{
            // 连接数据库
            dbc = new DBConnect() ;
            pstmt = dbc.getConnection().prepareStatement(sql) ;
            pstmt.setString(1,userinfo.getUsername()) ;
            // 进行数据库查询操作
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()){
                // 查询出内容，将其与用户提交的内容对比
                if(rs.getString("password").equals(userinfo.getPassword())){
                    userVo.setFlag(1);
                    int id = rs.getInt("userinfoid"); // 获取ID
                    userVo.setId(id);
                }
            }
            rs.close() ;
            pstmt.close() ;
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally{
            // 关闭数据库连接
            dbc.close() ;
        }
		return userVo;
	}

	public List<RobotInfo> SelectRobot(int id){

		String sql = "select * from Robot where `userinfo.ID`=?";
        PreparedStatement pstmt = null ;
        DBConnect dbc = null;
        List<RobotInfo> res = new ArrayList();
        try{
            // 连接数据库
            dbc = new DBConnect() ;
            pstmt = dbc.getConnection().prepareStatement(sql) ;
            pstmt.setInt(1,id) ;
            // 进行数据库查询操作
            ResultSet rs = pstmt.executeQuery();


            while(rs.next()){
            	 RobotInfo r = new RobotInfo();
                // 查询出内容，将其与用户提交的内容对比
                r.setID(rs.getInt("ID"));
                r.setNAME(rs.getString("NAME"));
                r.setweight(rs.getString("WEIGHT"));
                r.setimage(rs.getString("IMAGE"));
                r.setsize(rs.getString("SIZE"));
                res.add(r);
                System.out.println(r.toString());
            }
            rs.close() ;
            pstmt.close() ;
            return res;
        }catch (SQLException e){
            System.out.println(e.getMessage());
        }finally{
            // 关闭数据库连接
            dbc.close() ;

        }
		return res;
	}

    public int getByRobotName(String name) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM robot WHERE name = ?";
        PreparedStatement pstmt = null;
        DBConnect dbc = null;

        try {
            dbc = new DBConnect();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, name);

            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            dbc.close();
        }

        return count;
    }

}