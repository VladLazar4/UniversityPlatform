package Conexiune;

import java.awt.BorderLayout;
import java.awt.Component;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumnModel;

public class FrameAfisare extends JFrame implements ActionListener {
	JButton btnDownload;
	JTable tabel;
	String numeTabel;
	int nrRows;

	FrameAfisare(String[][] content, String[] columnNames, String tableName) {

		this.numeTabel = tableName;

		btnDownload = new JButton();
		btnDownload.addActionListener(this);
		btnDownload.setFocusable(false);
		btnDownload.setText("Download");
		btnDownload.setVisible(true);
		btnDownload.setBounds(650, 410, 150, 50);

		JLabel lblTableName = new JLabel(tableName);
		lblTableName.setBounds(30, 0, 450, 90);
		lblTableName.setFont(new Font("Lucida Calligraphy", Font.BOLD, 20));
		lblTableName.setHorizontalTextPosition(JLabel.CENTER);
		lblTableName.setVerticalAlignment(JLabel.CENTER);
		lblTableName.setVisible(true);

		tabel = new JTable(content, columnNames);
		tabel.setBounds(30, 80, 1370, 500);
		final TableColumnModel columnModel = tabel.getColumnModel();

		boolean ok = true;
		for (int row = 0; row < tabel.getRowCount() && ok == true; row++) {
			if (tabel.getModel().getValueAt(row, 0) == "\0" || tabel.getModel().getValueAt(row, 0) == "null") {
				ok = false;
			} else {
				nrRows++;
			}
		}

		for (int column = 0; column < tabel.getColumnCount(); column++) {
			int width = 15;
			for (int row = 0; row < nrRows; row++) {
				TableCellRenderer renderer = tabel.getCellRenderer(row, column);
				Component comp = tabel.prepareRenderer(renderer, row, column);
				width = Math.max(comp.getPreferredSize().width + 1, width);
			}
			if (width > 300)
				width = 300;
			columnModel.getColumn(column).setPreferredWidth(width);
		}
		this.add(tabel);
		this.add(lblTableName);
		this.add(btnDownload);
		ImageIcon imglogo = new ImageIcon("utcn-logo.png");
		this.setIconImage(imglogo.getImage());
		this.setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
		this.setResizable(false);
		this.setSize(1400, 500);
		this.setLayout(null);
		this.setVisible(true);
		this.add(tabel, BorderLayout.CENTER);
		this.setLocationRelativeTo(null);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == btnDownload) {
			try {
				numeTabel = numeTabel.substring(0, numeTabel.length() - 1);
				String numeFisier = (numeTabel + ".xls");
				FileOutputStream fos = new FileOutputStream(numeFisier, true);
				String str = "";
				for (int column = 0; column < tabel.getColumnCount(); column++) {
					str = str + tabel.getColumnName(column) + "\t";
				}
				str += '\n';
				for (int row = 0; row < nrRows; row++) {
					for (int column = 0; column < tabel.getColumnCount(); column++) {
						str = str + tabel.getModel().getValueAt(row, column) + "\t";
					}
					str += '\n';
				}

				try {
					byte[] b = str.getBytes();
					fos.write(b);
					fos.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			} catch (FileNotFoundException e1) {
				e1.printStackTrace();
			}

		}

	}
}
