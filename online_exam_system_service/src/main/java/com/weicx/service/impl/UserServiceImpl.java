package com.weicx.service.impl;/**
 * @author weicx
 * @create 2021-09-14 14:36
 */

import com.weicx.dao.IUsersDao;
import com.weicx.domain.Station;
import com.weicx.domain.Users;
import com.weicx.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName UserServiceImpl
 * @Description 用户服务实现类
 * @Author weicx
 * @date 14:36
 * @Version 1.0
 */
@Service("userService")
@Transactional
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUsersDao usersDao;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    /**
     * 将返回的用户对象封装成UserDetails,供spring security调拨
     * @param username
     * @return
     * @throws UsernameNotFoundException
     */
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Users userInfo = null;
        try {
            userInfo = usersDao.findById(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        List<Role> roles = userInfo.getRoles();

        //userInfo的status状态为1能登录，否则不能登录。role的状态为ROLE_USER,ROLE_ADMIN才能登录
//        List<SimpleGrantedAuthority> authorities = getAuthority(roles);

        //将自己的用户对象封装成UserDetails（User实现UserDetails）
        //创建一个SpringSecurity frame的User对象  User（用户名，密码，权限）

        //只有管理员可以登录
//        User user = new User(userInfo.getName(), userInfo.getPassword(), userInfo.getAdmin() == 0 ?false:true, true, true, true, getAuthority(userInfo));
        //所有人都可以登录
        User user = new User(userInfo.getName(), userInfo.getPassword(), true, true, true, true, getAuthority(userInfo));


        return user;
    }

//    private List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {
//        ArrayList<SimpleGrantedAuthority> authoritys = new ArrayList<>();
//        for (Role role:roles ) {
//            //创建一个springSecurity frame的public SimpleGrantedAuthority(String role)
//            authoritys.add(new SimpleGrantedAuthority(role.getRoleName()));
//
//        }
//        return authoritys;
//    }
    private List<SimpleGrantedAuthority> getAuthority(Users userInfo) {
        ArrayList<SimpleGrantedAuthority> authoritys = new ArrayList<>();
        if (null!=userInfo){
            if (userInfo.getAdmin()==1){
                authoritys.add(new SimpleGrantedAuthority("ROLE_ADMIN")) ;
            }else{
                authoritys.add(new SimpleGrantedAuthority("ROLE_USER")) ;
            }

        }
        return authoritys;
    }

    @Override
    public List<Users> findAll() throws Exception {
        return usersDao.findAll();
    }

    @Override
    public void save(Users userInfo) throws Exception {
        //通过SpringSecurity对密码进行加密
        String encodePassWord = bCryptPasswordEncoder.encode(userInfo.getPassword());
        userInfo.setPassword(encodePassWord);
        usersDao.save(userInfo);
    }

    @Override
    public Users findById(String userId) throws Exception {
        Users userInfo = usersDao.findById(userId);
        List<Integer> ownList =new ArrayList<>();
        List<Integer> powerList =new ArrayList<>();
        List<Integer> makerList =new ArrayList<>();
        for( Station own :userInfo.getOwnStations()){
            ownList.add(own.getId());
        }

        for( Station own :userInfo.getPowerStations()){
            powerList.add(own.getId());
        }  for( Station own :userInfo.getQmakerStations()){
            makerList.add(own.getId());
        }
        userInfo.setOwnStationsId(ownList);
        userInfo.setPowerStationsId(powerList);
        userInfo.setQmakerStationsId(makerList);
        return userInfo;
    }

    @Override
    public void deleteUser(String userId) throws Exception {

        //删除关联表
        usersDao.deleteUserStation(userId);
        usersDao.deleteUserPower(userId);
        usersDao.deleteUserMaker(userId);
        //todo :删除关联表
        //DELETE FROM history_answers WHERE hid IN (SELECT id FROM history WHERE uid='$uid')");
        //DELETE FROM history WHERE uid='$uid'");

        // DELETE FROM users  WHERE id='$uid
        usersDao.deleteUser(userId);

    }

    @Override
    public void modifyStationByUser(String userId, Integer[] oids, Integer[] pids, Integer[] mids) throws Exception {
        //DELETE FROM user_stations WHERE uid='$uid'");
        usersDao.deleteUserStation(userId);
        if (oids.length>1){
            for(Integer oid:oids){
                if (oid!=999){
                    usersDao.insertUserStation(userId,oid);
                }
            }
        }
        //DELETE FROM user_powers WHERE uid='$uid'");
        usersDao.deleteUserPower(userId);
        if (pids.length>1){
            for(Integer pid:pids){
                if (pid!=999){
                    usersDao.insertUserPower(userId,pid);
                }
            }
        }
        //DELETE FROM user_qmakers WHERE uid='$uid'");
        usersDao.deleteUserMaker(userId);
        if (mids.length>1){
            for(Integer mid:mids){
                if (mid!=999){
                    usersDao.insertUserMaker(userId,mid);
                }
            }
        }
    }
}
