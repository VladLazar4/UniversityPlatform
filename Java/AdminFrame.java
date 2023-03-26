package Conexiune;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JFrame;

public class AdminFrame extends JFrame implements ActionListener {

	AdminFrame() {
		this.setTitle("Administrator");
		ImageIcon imglogo = new ImageIcon("utcn-logo.png");
		this.setIconImage(imglogo.getImage());
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setResizable(false);
		this.setSize(500, 900);
		this.setLayout(null);
		this.setVisible(true);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub

	}

}
