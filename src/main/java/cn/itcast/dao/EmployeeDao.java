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
    @Select("SELECT emp_id,emp_name,emp_position,emp_gender,emp_age,dep_name FROM employee LEFT JOIN department ON department.dep_id=employee.dep_id;")
    public List<Employee> findAll();
}
