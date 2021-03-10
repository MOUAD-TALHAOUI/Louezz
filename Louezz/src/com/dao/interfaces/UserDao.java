package com.dao.interfaces;

import java.sql.SQLException;

import com.modules.User;

public interface UserDao {

	public Boolean findSpecificByEmail(String email) throws SQLException;

	public int insertUser(User user) throws SQLException;

//    public boolean updateUser(User user) throws SQLException;
//    public boolean deleteUser(User user) throws SQLException;
//    public String getImageProfile(User user) throws SQLException;
//    public void setImageProfile(User user) throws  SQLException;
	public int UpdateUser(User user) throws SQLException;

	public User findSpecificUserByEmail(String email) throws SQLException;

	public void DeleteUser(String email) throws SQLException;

	public int getMax() throws SQLException;

	void ChangePassword(String email, String password) throws SQLException;

	User findSpecificUserById(int id) throws SQLException;
}
