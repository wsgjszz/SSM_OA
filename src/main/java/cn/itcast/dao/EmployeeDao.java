package cn.itcast.dao;

import cn.itcast.domain.Employee;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeDao {

    /**
     * 查询employee表的所有数据
     */
    @Select("select * from employee")
    public List<Employee> findAll();
}
