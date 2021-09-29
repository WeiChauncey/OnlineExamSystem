package com.weicx.domain;

import org.springframework.security.core.userdetails.User;

import java.util.List;

/**
 * @author weicx
 * @create 2020-07-09 19:29
 * 角色表，本项目DB中不存在
 */
public class Role {
    private String id;
    private String roleName;
    private String roleDesc;
    private List<Permission> permissions;
    private List<Users> users;

    public Role() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }

    public List<Users> getUsers() {
        return users;
    }

    public void setUsers(List<Users> users) {
        this.users = users;
    }
}
