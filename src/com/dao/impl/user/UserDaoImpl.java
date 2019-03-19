package com.dao.impl.user;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.dao.user.UserDao;
import com.domain.User;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {

	@Override
	public void insertUser(User user) {
		this.getHibernateTemplate().save(user);
	}

	@Override
	public User findUserById(Integer cid) {
		ArrayList<User> userlist = new ArrayList<User>();
		userlist = (ArrayList<User>) this.getHibernateTemplate().find("from User where aid=?", cid);
		return userlist.get(0);	}

	@Override
	public void updateUser(User user) {
		this.getHibernateTemplate().update(user);
	}

	@Override
	public void deleteUser(User user) {
		this.getHibernateTemplate().delete(user);
	}

	@Override
	public List<User> findAllUser() {
		ArrayList<User> userlist = new ArrayList<User>();
		userlist = (ArrayList<User>) this.getHibernateTemplate().find("from User");
		return userlist;
	}

	@Override
//	public User findUserByName(String cname) {
//		ArrayList<User> userlist = new ArrayList<User>();
//		userlist = (ArrayList<User>) this.getHibernateTemplate().find("from User where aname=?", cname);
//		return userlist.get(0);
//		
//	}
	public User findUserByName(String name, String pwd) {
		ArrayList<User> userlist = new ArrayList<User>();
		String hql= "from User where aname=? and apassword=?";
		userlist = (ArrayList<User>)this.getHibernateTemplate().find(hql, new String[]{name, pwd});
		if (userlist.size()>0){
			return userlist.get(0);
		}
		return null;
	}

}
