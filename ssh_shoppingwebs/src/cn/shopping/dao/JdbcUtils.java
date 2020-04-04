package cn.shopping.dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtils {
	// 必须给出c3p0-config.xml文件
	private static ComboPooledDataSource dataSource = new ComboPooledDataSource();

	// 事务专用连接
	private static ThreadLocal<Connection> t1 = new ThreadLocal<Connection>();

	/*
	 * 使用连接池返回一个连接对象
	 */
	public static Connection getConnection() throws SQLException {
		Connection con = t1.get();
		// 当con不等于null，说明已经调用过beginTransaction()，表示开启了事务！
		if (con != null) {
			return con;
		}
		return dataSource.getConnection();
	}

	/*
	 * 返回连接池对象
	 */
	public static DataSource getDataSource() {
		return dataSource;
	}

	/*
	 * 开启事务 获取一个Connection,设置它的setAutoCommit(false) 还要保证dao中使用的连接时我们刚刚创建的
	 */
	public static void beginTransaction() throws SQLException {
		Connection con = t1.get();
		if (con != null)
			throw new SQLException("已经开启了事务，不要需要再次开启！");
		con = getConnection();
		con.setAutoCommit(false);
		t1.set(con);// 把当前线程的连接保存起来
	}

	/*
	 * 提交事务 获取beginTransaction提供的Connection，然后调用commit方法
	 */
	public static void commitTransaction() throws SQLException {
		Connection con = t1.get();
		if (con == null)
			throw new SQLException("还没有开启事务，不能提交！");
		con.commit();
		con.close();
		t1.remove();// 从t1中移除连接
	}

	/*
	 * 提交事务 获取beginTransaction提供的Connection，然后调用rollback方法
	 */
	public static void rollbackTransaction() throws SQLException {
		Connection con = t1.get();
		if (con == null)
			throw new SQLException("还没有开启事务，不能回滚！");
		con.rollback();
		con.close();
		t1.remove();
	}

	/*
	 * 释放连接
	 */
	public static void releaseConnection(Connection connection) throws SQLException {
		Connection con = t1.get();
		/*
		 * 判断它是不是事务专用，如果是，就不关闭！ 如果不是，就关闭！
		 */
		if (con == null) {
			// con为null，说明没有事务，一定不是事务专业连接
			connection.close();
		}
		if (con != connection) {
			// 如果不等于null，说明有事务，那么判断连接与从是否相等，不等，不是事务专用连接
			connection.close();
		}

	}
}
