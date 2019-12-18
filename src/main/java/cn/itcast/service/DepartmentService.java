package cn.itcast.service;

import cn.itcast.domain.Department;

import java.util.List;

public interface DepartmentService {

    /**
     * 查询所有部门的数据
     * @return
     */
    public List<Department> findAll();
}
