
package Conexiune;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

import javax.swing.JFrame;

public class JdbcConnection extends JFrame {
	public static void main(String[] args) {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception ex) {
			System.err.println("An Exception occured during JDBC Driver loading." + " Details are provided below:");
			ex.printStackTrace(System.err);
		}
		Connection connection = null;
		Statement selectStatement = null, insertStatement = null;
		ResultSet rs = null;
		ResultSetMetaData rsmd = null;
		try {
			connection = DriverManager
					.getConnection("jdbc:mysql://localhost/PhoneBook?user=VladL&password=ParolaBD2002!");

			MyFrame frame = new MyFrame();

			insertStatement = connection.createStatement();
			insertStatement.execute("INSERT INTO Contacts (FirstName, LastName, HomePhone, MobilePhone, EmailAddress) "
					+ "VALUES ('John','Doe','0040264123456','0040722123456','john.doe@example.com')");
			insertStatement.execute("INSERT INTO Contacts (FirstName, LastName, HomePhone, MobilePhone, EmailAddress) "
					+ "VALUES ('Jane','Doe','0040264123456','0040744123456','jane.doe@example.com')");
			selectStatement = connection.createStatement();
			selectStatement.execute("SELECT * FROM Contacts");
			rs = selectStatement.getResultSet();
			rsmd = rs.getMetaData();

		} catch (SQLException sqlex) {
			System.err.println("An SQL Exception occured. Details are provided below:");
			sqlex.printStackTrace(System.err);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
				}
				rs = null;
			}
			if (selectStatement != null) {
				try {
					selectStatement.close();
				} catch (SQLException e) {
				}
				selectStatement = null;
			}
			if (insertStatement != null) {
				try {
					insertStatement.close();
				} catch (SQLException e) {
				}
				insertStatement = null;
			}
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
				connection = null;
			}
		}
	}
}
