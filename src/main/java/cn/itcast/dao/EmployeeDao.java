package cn.itcast.dao;

import cn.itcast.domain.Employee;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EmployeeDao {

    /**
     * 查询所有员工数据
     * @return
     */
    @Select("SELECT * FROM employee")
    public List<Employee> findAll();

    /**
     * 查询员工总记录数
     * @return
     */
    @Select("SELECT COUNT(*) FROM employee")
    public int findTotalCount();

    /**
     * 根据员工id查询对应员工数据
     * @param emp_id
     * @return
     */
    @Select("SELECT * FROM employee WHERE emp_id=#{emp_id}")
    public Employee findOneById(int emp_id);

    /**
     * 查询employee表的所有数据外联department表
     */
    @Select("SELECT emp_id,emp_name,emp_position,emp_gender,emp_age,dep_name FROM employee LEFT JOIN department ON department.dep_id=employee.dep_id")
    public List<Employee> findAllWithDepartName();

    /**
     * 分页查询带部门名称的员工数据
     * @param startPage
     * @param endPage
     * @return
     */
    @Select("SELECT emp_id,emp_name,emp_position,emp_gender,emp_age,dep_name FROM employee LEFT JOIN department ON department.dep_id=employee.dep_id LIMIT #{startPage},#{endPage}")
    public List<Employee> findPageWithDepartName(int startPage,int endPage);

}
