package testWeb.dao;
import java.util.List;

import testWeb.vo.*;
public interface UserDAO {
	public userVo queryByUserInfo (UserInfo userinfo) throws Exception;
    public List<RobotInfo> SelectRobot(int id);


	public  int getByRobotName(String name); //判断机器人名字是否重复
}
