package com.cips.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cips.dao.RoleMapper;
import com.cips.model.Role;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

	private RoleMapper roleMapper;
	
	@Autowired
	public void setRoleMapper(RoleMapper roleMapper) {
		this.roleMapper = roleMapper;
	}

	
	@Override
	public List<Role> getRoleList() {
		// TODO Auto-generated method stub
		return roleMapper.getRoleList();
	}

	@Override
	public void insertRole(Role role) {
		// TODO Auto-generated method stub
		roleMapper.insertSelective(role);
	}

	@Override
	public void updateRole(Role role) {
		// TODO Auto-generated method stub
		roleMapper.updateByPrimaryKeySelective(role);
	}

	@Override
	public void deleteRoleById(String roleId) {
		// TODO Auto-generated method stub
		roleMapper.deleteByPrimaryKey(roleId);
	}

	@Override
	public Role selectRoleById(String roleId) {
		// TODO Auto-generated method stub
		return roleMapper.selectByPrimaryKey(roleId);
	}
	
	public List<Role> getRoleListByUserId(String userId){
		return roleMapper.getRoleListByUserId(userId);
	}

}