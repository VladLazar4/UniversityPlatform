/*
 * package Conexiune;
 * 
 * import java.awt.Color; import java.awt.GridLayout; import java.sql.ResultSet;
 * import java.sql.SQLException;
 * 
 * import javax.swing.JFrame; import javax.swing.JOptionPane; import
 * javax.swing.JPanel; import javax.swing.JTextField;
 * 
 * import com.mysql.cj.jdbc.CallableStatement;
 * 
 * public class CreareUserFrame extends JFrame { JTextField tfUsername,
 * tfPassword, tfCNP, tfNume, tfPrenume, tfAdresa, tfNumarDeTelefon, tfEmail,
 * tfIBAN, tfNumarDeContract, tfPasswordCreate, tfOreMin, tfOreMax,
 * tfDepartament, tfAnDeStudiu, tfNumarDeOre; JPanel panelCreare;
 * 
 * CreareUserFrame() { tfCNP = new JTextField("CNP"); tfNume = new
 * JTextField("Nume"); tfPrenume = new JTextField("Prenume"); tfAdresa = new
 * JTextField("Adresa"); tfNumarDeTelefon = new JTextField("Numar de telefon");
 * tfEmail = new JTextField("Email"); tfIBAN = new JTextField("IBAN");
 * tfNumarDeContract = new JTextField("Numar de contract"); tfPasswordCreate =
 * new JTextField("Password"); tfOreMin = new JTextField("Ore minime"); tfOreMax
 * = new JTextField("Ore maxime"); tfDepartament = new
 * JTextField("Departament"); tfAnDeStudiu = new JTextField("An de studiu");
 * tfNumarDeOre = new JTextField("Numar de ore");
 * 
 * panelCreare = new JPanel(); panelCreare.setLayout(new GridLayout(8, 1, 20,
 * 5)); panelCreare.setBackground(new Color(1f, 0f, 0f, .0f));
 * panelCreare.setBounds(120, 120, 220, 300); panelCreare.add(tfCNP);
 * panelCreare.add(tfNume); panelCreare.add(tfPrenume);
 * panelCreare.add(tfAdresa); panelCreare.add(tfNumarDeTelefon);
 * panelCreare.add(tfEmail); panelCreare.add(tfIBAN);
 * panelCreare.add(tfNumarDeContract); panelCreare.add(tfPasswordCreate);
 * panelCreare.add(tfOreMin); panelCreare.add(tfOreMax);
 * panelCreare.add(tfDepartament); panelCreare.add(tfAnDeStudiu);
 * panelCreare.add(tfNumarDeOre); panelCreare.setVisible(true);
 * 
 * this.add(panelCreare); }
 * 
 * public void functie() { try { String userType =
 * cbUserList.getItemAt(cbUserList.getSelectedIndex()); String user, pass; user
 * = tfUsername.getText(); pass = tfPassword.getText(); if
 * (userType.compareTo("Administrator") == 0) {
 * 
 * String query = "{CALL facultate.ADAUGA_ADMINISTRATOR(?,?,?,?,?,?,?,?,?)}";
 * CallableStatement cs = (CallableStatement) connection.prepareCall(query);
 * 
 * cs.setString(1, tfCNP.getText()); cs.setString(2, tfNume.getText());
 * cs.setString(3, tfPrenume.getText()); cs.setString(4, tfAdresa.getText());
 * cs.setString(5, tfNumarDeTelefon.getText()); cs.setString(6,
 * tfEmail.getText()); cs.setString(7, tfIBAN.getText()); cs.setString(8,
 * tfNumarDeContract.getText()); cs.setString(9, tfPasswordCreate.getText());
 * ResultSet rs = cs.executeQuery(); JOptionPane.showMessageDialog(this,
 * "Cont creat cu succes!"); } else if (userType.compareTo("Profesor") == 0) {
 * String query = "{CALL facultate.ADAUGA_STUDENT(?,?,?,?,?,?,?,?,?)}";
 * CallableStatement cs = (CallableStatement) connection.prepareCall(query);
 * cs.setString(1, user); cs.setString(2, pass); ResultSet rs =
 * cs.executeQuery(); JOptionPane.showMessageDialog(this,
 * "Cont creat cu succes!"); } else if (userType.compareTo("Student") == 0) {
 * String query = "{CALL facultate.ADAUGA_STUDENT(?,?,?,?,?,?,?,?,?)}";
 * CallableStatement cs = (CallableStatement) connection.prepareCall(query);
 * cs.setString(1, user); cs.setString(2, pass); ResultSet rs =
 * cs.executeQuery(); JOptionPane.showMessageDialog(this,
 * "Cont creat cu succes!"); } } catch (SQLException e1) {
 * JOptionPane.showMessageDialog(this, "Eroare adaugare date"); }
 * 
 * }
 */