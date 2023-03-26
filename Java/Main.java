package Conexiune;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.concurrent.TimeUnit;

import javax.swing.JOptionPane;

public class Main {

	public static void main(String[] args) {
		MyFrame frame = new MyFrame();
		Connection connection = null;
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost/facultate?user=root&password=1234");
		} catch (SQLException e2) {
			JOptionPane.showMessageDialog(frame, "Unable to connect at database");
		}
		for (int i = 13; 1 != 0; i++) {
			frame.setData(String.valueOf(i));
			for (int j = 0; j < 24; j++) {
				if (j < 10) {
					frame.setOra("0" + String.valueOf(j));
				} else {
					frame.setOra(String.valueOf(j));
				}

				System.out.println(frame.getDataOra());
				frame.verificareTimp(frame.getDataOra(), connection);
				try {
					TimeUnit.SECONDS.sleep(1);
				} catch (InterruptedException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

}
