package cn.itcast.dao;

import cn.itcast.domain.User;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao {

    /**
     * 根据用户id来查询记录
     * @param id
     * @return
     */
    @Select("select * from user where id=#{id}")
    public User findOneById(int id);

    /**
     * 根据用户名和密码来查询用户
     * @param user
     * @return
     */
    @Select("select * from user where username=#{username} and password=#{password}")
    public User findByUsernameAndPassword(User user);
}
