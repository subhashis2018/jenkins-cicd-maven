package com.myapp.jenkins_cicd_maven.service;

import java.util.List;

import com.myapp.jenkins_cicd_maven.entity.Department;
import com.myapp.jenkins_cicd_maven.exception.DepartmentNotFoundException;

public interface DepartmentService {
	public Department saveDepartment(Department department);

	public List<Department> fetchDepartmentList();

	public Department fetchDepartmentById(Long departmentId) throws DepartmentNotFoundException;

	public void deleteDepartmentById(Long departmentId);

	public Department updateDepartment(Long departmentId, Department department);

	Department fetchDepartmentByName(String departmentName);
}