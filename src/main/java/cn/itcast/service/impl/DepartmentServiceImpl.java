package cn.itcast.service.impl;

import cn.itcast.dao.DepartmentDao;
import cn.itcast.domain.Department;
import cn.itcast.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    DepartmentDao departmentDao;

    @Override
    public List<Department> findAll() {
        return departmentDao.findAll();
    }
}
