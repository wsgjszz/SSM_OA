package cn.itcast.dao;

import cn.itcast.domain.Department;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentDao {

    /**
     * 查询department表的所有数据
     * @return
     */
    @Select("select * from department")
    public List<Department> findAll();

}
