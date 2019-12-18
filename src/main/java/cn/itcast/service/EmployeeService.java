package cn.itcast.service;

import cn.itcast.dao.EmployeeDao;
import cn.itcast.domain.Employee;

import java.util.List;

public interface EmployeeService {

    /**
     * 获取所有员工数据
     * @return
     */
    public List<Employee> findAll();
}
