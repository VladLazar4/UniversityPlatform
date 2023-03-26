package Conexiune;

import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import com.mysql.cj.jdbc.CallableStatement;

public class MyFrame extends JFrame implements ActionListener {

	JButton btnLogIn, btnBackAdmin, btnBackProf, btnBackStud;
	// Admin
	JButton btnCreareUserAfter, btnCreateNewUser, btnModificareUser, btnStergereUser, btnCreareUser,
			btnCautareUtilizatorTip, btnCautareUtilizatorNume, btnAsignareProfesorCurs, btnCautareNumeCurs,
			btnModificareUserAfter, btnStergereUserAfter, btnCautareUtilizatorTipAfter, btnCautareUtilizatorNumeAfter,
			btnAsignareProfesorCursAfter, btnCautareNumeCursAfter, btnDatePersonaleAdmin, btnLogOut;
	// Prof
	JButton btnImpartireProcentualaActivitati, btnImpartireProcentualaActivitatiAfter, btnProgramareActivitateDidactica,
			btnAfisareCatalog, btnAdaugaNote, btnAdaugaNoteAfter, btnActivitatiZiuaCurentaProfesor,
			btnCursuriPredateProf, btnDatePersonaleProf, btnLogOutProf, btnProgramareActivitateDidacticaAfter,
			btnAfisareCatalogAfter;
	// Student
	JButton btnDatePersonaleStud, btnCursuriStud, btnSugestiiGrupStudiu, btnSugestiiGrupStudiuAfter, btnInscriereCurs,
			btnRenuntareCurs, btnVizualizareNote, btnActivitatiZiuaCurentaStud, btnInscriereGrupStudiu,
			btnVizualizareMembriiGrup, btnMesaje, btnAdaugareActivitatiGrup, btnAdaugareActivitatiGrupAfter,
			btnVizualizareGrupuriStudiu, btnActiuniGrupuri, btnLogOutStud, btnInscriereCursAfter, btnRenuntareCursAfter,
			btnInscriereGrupStudiuAfter, btnMesajeAfter, btnVizualizareActivitatiGrup, btnInscriereActivitateDidactica,
			btnInscriereActivitateDidacticaAfter, btnVizualizareActivitatiGrupAfter, btnVizualizareMembriiGrupAfter,
			btnSugestiiActivitatiGrup;
	JPanel panelStart, panelCreare, panelAdmin, panelProf, panelStud, panelGrupStud, panelAdaugaNote,
			panelImpartireProcentuala, panelProgramareActivitateDidactica, panelAfisareCatalog, panelInscriereCurs,
			panelRenuntareCurs, panelInscriereGrupStudiu, panelMesaje, panelInscriereActivitateDidactica,
			panelAdaugaActivitate, panelVizualizareActivitatiGrup, panelVizualizareMembriiGrup, panelSugestiiGrup;
	JTextField tfUsername, tfPassword, tfCNP, tfNume, tfPrenume, tfAdresa, tfNumarDeTelefon, tfEmail, tfIBAN,
			tfNumarDeContract, tfPasswordCreate, tfOreMin, tfOreMax, tfDepartament, tfAnDeStudiu, tfNumarDeOre,
			tfNumeCautareUtilizatorNume, tfPrenumeCautareUtilizatorNume, tfNumeProfesor, tfPrenumeProfesor, tfCurs,
			tfMaterie, tfProcentCurs, tfProcentSeminar, tfProcentLab, tfProfesorProgramare, tfMaterieProgramare,
			tfNrMaxParticipantiProgramare, tfMaterieAdaugaNote, tfNumeAdaugaNote, tfPrenumeAdaugaNote,
			tfNotaCursAdaugaNote, tfNotaSeminarAdaugaNote, tfNotaLabAdaugaNote, tfMaterieAfisareCatalog,
			tfMaterieInscriereCurs, tfMaterieRenuntareCurs, tfNumeGrupStudiu, tfMaterieGrupStudiu, tfMesaj,
			tfGrupMesaje, tfDataInceputProgramare, tfDataFinalProgramare, tfNumeMaterieInscriereActivitateDidactica,
			tfNumeProfInscriereActivitateDidactica, tfPrenumeProfInscriereActivitateDidactica,
			tfDataInceputInscriereActivitateDidactica, tfDataFinalInscriereActivitateDidactica, tfNumeActivitate,
			tfNrMinActivitate, tfNrMaxActivitate, tfNrPersActivitate, tfNumeGrupActivitate, tfInceputActivitate,
			tfSfarsitActivitate, tfDataCreareActivitate, tfDataExpirareActivitate, tfNumeProfActivitate,
			tfPrenumeProfActivitate, tfNumeGrupVizualizareActivitatiGrup, tfNumeGrupVizualizareMembriiGrup,
			tfNumeGrupSugestiiGrup;
	JCheckBox cbCursProgramare, cbSeminarProgramare, cbLabProgramare, cbExamenProgramare, cbColocviuProgramare,
			cbCursInscriereActivitateDidactica, cbSeminarInscriereActivitateDidactica,
			cbLabInscriereActivitateDidactica, cbExamenInscriereActivitateDidactica,
			cbColocviuInscriereActivitateDidactica;
	JLabel lblTitleLogin, lblTitleCreateNewUser, lblWelcomeUser;
	JComboBox<String> cbUserList, cbUserListCreare, cbUserListAfiseaza;

	String[] allUsers = { "Administrator", "Profesor", "Student" };
	String user;
	String dataCurenta, oraCurenta;

	MyFrame() {
		dataCurenta = "2023-01-13";
		oraCurenta = "00:00";

		lblTitleLogin = new JLabel("Login");
		lblTitleLogin.setBounds(180, 50, 250, 60);
		lblTitleLogin.setFont(new Font("Lucida Calligraphy", Font.BOLD, 30));
		lblTitleLogin.setHorizontalTextPosition(JLabel.CENTER);
		lblTitleLogin.setVerticalAlignment(JLabel.CENTER);
		lblTitleLogin.setVisible(true);

		lblTitleCreateNewUser = new JLabel("Create user");
		lblTitleCreateNewUser.setBounds(130, 50, 250, 60);
		lblTitleCreateNewUser.setFont(new Font("Lucida Calligraphy", Font.BOLD, 30));
		lblTitleCreateNewUser.setHorizontalTextPosition(JLabel.CENTER);
		lblTitleCreateNewUser.setVerticalAlignment(JLabel.CENTER);
		lblTitleCreateNewUser.setVisible(false);

		lblWelcomeUser = new JLabel();
		lblWelcomeUser.setBounds(30, 50, 400, 90);
		lblWelcomeUser.setFont(new Font("Lucida Calligraphy", Font.BOLD, 15));
		lblWelcomeUser.setHorizontalTextPosition(JLabel.CENTER);
		lblWelcomeUser.setVerticalAlignment(JLabel.CENTER);
		lblWelcomeUser.setVisible(false);

		btnLogIn = new JButton();
		btnLogIn.addActionListener(this);
		btnLogIn.setFocusable(false);
		btnLogIn.setText("Log in");
		btnLogIn.setVisible(true);
		btnLogIn.setBounds(180, 230, 80, 30);

		btnLogOut = new JButton("Log out");
		btnLogOut.addActionListener(this);
		btnLogOut.setVisible(true);

		btnLogOutProf = new JButton("Log out");
		btnLogOutProf.addActionListener(this);
		btnLogOutProf.setVisible(true);

		btnLogOutStud = new JButton("Log out");
		btnLogOutStud.addActionListener(this);
		btnLogOutStud.setVisible(true);

		btnBackAdmin = new JButton();
		btnBackAdmin.addActionListener(this);
		btnBackAdmin.setFocusable(false);
		btnBackAdmin.setText("Back");
		btnBackAdmin.setVisible(false);
		btnBackAdmin.setBounds(30, 30, 80, 30);

		btnBackProf = new JButton();
		btnBackProf.addActionListener(this);
		btnBackProf.setFocusable(false);
		btnBackProf.setText("Back");
		btnBackProf.setVisible(false);
		btnBackProf.setBounds(30, 30, 80, 30);

		btnBackStud = new JButton();
		btnBackStud.addActionListener(this);
		btnBackStud.setFocusable(false);
		btnBackStud.setText("Back");
		btnBackStud.setVisible(false);
		btnBackStud.setBounds(30, 30, 80, 30);

		btnCreateNewUser = new JButton();
		btnCreateNewUser.addActionListener(this);
		btnCreateNewUser.setFocusable(false);
		btnCreateNewUser.setText("Create new user");
		btnCreateNewUser.setVisible(false);
		btnCreateNewUser.setBounds(150, 280, 140, 30);

		btnCreareUserAfter = new JButton();
		btnCreareUserAfter.addActionListener(this);
		btnCreareUserAfter.setFocusable(false);
		btnCreareUserAfter.setText("Create user");
		btnCreareUserAfter.setVisible(false);
		btnCreareUserAfter.setBounds(150, 430, 140, 30);

		btnModificareUserAfter = new JButton("Modificare user");
		btnModificareUserAfter.addActionListener(this);
		btnModificareUserAfter.setFocusable(false);
		btnModificareUserAfter.setVisible(false);
		btnModificareUserAfter.setBounds(150, 430, 140, 30);

		btnAsignareProfesorCursAfter = new JButton("Asignare");
		btnAsignareProfesorCursAfter.addActionListener(this);
		btnAsignareProfesorCursAfter.setFocusable(false);
		btnAsignareProfesorCursAfter.setVisible(false);
		btnAsignareProfesorCursAfter.setBounds(150, 290, 140, 30);

		btnCautareNumeCursAfter = new JButton("Cautare");
		btnCautareNumeCursAfter.addActionListener(this);
		btnCautareNumeCursAfter.setFocusable(false);
		btnCautareNumeCursAfter.setVisible(false);
		btnCautareNumeCursAfter.setBounds(150, 290, 140, 30);

		btnStergereUserAfter = new JButton("Stergere user");
		btnStergereUserAfter.addActionListener(this);
		btnStergereUserAfter.setFocusable(false);
		btnStergereUserAfter.setVisible(false);
		btnStergereUserAfter.setBounds(150, 430, 140, 30);

		btnCautareUtilizatorTipAfter = new JButton("Afiseaza");
		btnCautareUtilizatorTipAfter.addActionListener(this);
		btnCautareUtilizatorTipAfter.setFocusable(false);
		btnCautareUtilizatorTipAfter.setVisible(false);
		btnCautareUtilizatorTipAfter.setBounds(150, 300, 140, 30);

		btnCautareUtilizatorNumeAfter = new JButton("Afiseaza");
		btnCautareUtilizatorNumeAfter.addActionListener(this);
		btnCautareUtilizatorNumeAfter.setFocusable(false);
		btnCautareUtilizatorNumeAfter.setVisible(false);
		btnCautareUtilizatorNumeAfter.setBounds(150, 300, 140, 30);

		btnImpartireProcentualaActivitatiAfter = new JButton("Imparte");
		btnImpartireProcentualaActivitatiAfter.addActionListener(this);
		btnImpartireProcentualaActivitatiAfter.setFocusable(false);
		btnImpartireProcentualaActivitatiAfter.setBounds(150, 300, 140, 30);

		btnProgramareActivitateDidacticaAfter = new JButton("Programare");
		btnProgramareActivitateDidacticaAfter.addActionListener(this);
		btnProgramareActivitateDidacticaAfter.setFocusable(false);
		btnProgramareActivitateDidacticaAfter.setBounds(150, 300, 140, 30);

		btnInscriereActivitateDidactica = new JButton("Inscriere activitate didactica");
		btnInscriereActivitateDidactica.addActionListener(this);
		btnInscriereActivitateDidactica.setFocusable(false);
		btnInscriereActivitateDidactica.setBounds(150, 300, 140, 30);

		btnModificareUser = new JButton("Modificare user");
		btnModificareUser.addActionListener(this);
		btnStergereUser = new JButton("Stergere user");
		btnStergereUser.addActionListener(this);
		btnCreareUser = new JButton("Creare user");
		btnCreareUser.addActionListener(this);
		btnCautareUtilizatorTip = new JButton("Cautare user tip");
		btnCautareUtilizatorTip.addActionListener(this);
		btnCautareUtilizatorNume = new JButton("Cautare user nume");
		btnCautareUtilizatorNume.addActionListener(this);
		btnAsignareProfesorCurs = new JButton("Asignare profesor curs");
		btnAsignareProfesorCurs.addActionListener(this);
		btnCautareNumeCurs = new JButton("Cautare dupa nume curs");
		btnCautareNumeCurs.addActionListener(this);
		btnDatePersonaleAdmin = new JButton("Afiseaza date personale");
		btnDatePersonaleAdmin.addActionListener(this);

		btnImpartireProcentualaActivitati = new JButton("Impartire procentuala activitati");
		btnImpartireProcentualaActivitati.addActionListener(this);
		btnProgramareActivitateDidactica = new JButton("Programare activitate didactica");
		btnProgramareActivitateDidactica.addActionListener(this);
		btnAfisareCatalog = new JButton("Afisare catalog");
		btnAfisareCatalog.addActionListener(this);
		btnAdaugaNote = new JButton("Adauga nota");
		btnAdaugaNote.addActionListener(this);
		btnActivitatiZiuaCurentaProfesor = new JButton("Activitati ziua curenta");
		btnActivitatiZiuaCurentaProfesor.addActionListener(this);
		btnCursuriPredateProf = new JButton("Cursuri predate");
		btnCursuriPredateProf.addActionListener(this);
		btnDatePersonaleProf = new JButton("Afiseaza date personale");
		btnDatePersonaleProf.addActionListener(this);

		btnDatePersonaleStud = new JButton("Afiseaza date personale");
		btnDatePersonaleStud.addActionListener(this);
		btnCursuriStud = new JButton("Afisare cursuri");
		btnCursuriStud.addActionListener(this);
		btnSugestiiGrupStudiu = new JButton("Sugestii grup studiu");
		btnSugestiiGrupStudiu.addActionListener(this);
		btnInscriereCurs = new JButton("Inscriere curs");
		btnInscriereCurs.addActionListener(this);
		btnRenuntareCurs = new JButton("Renuntare curs");
		btnRenuntareCurs.addActionListener(this);
		btnVizualizareNote = new JButton("Vizualizare note");
		btnVizualizareNote.addActionListener(this);
		btnActivitatiZiuaCurentaStud = new JButton("Activitati ziua curenta");
		btnActivitatiZiuaCurentaStud.addActionListener(this);
		btnInscriereActivitateDidactica = new JButton("Inscriere activitate didactica");
		btnInscriereActivitateDidactica.addActionListener(this);
		btnInscriereGrupStudiu = new JButton("Inscriere intr-un grup de studiu");
		btnInscriereGrupStudiu.addActionListener(this);
		btnVizualizareGrupuriStudiu = new JButton("Grupuri de studiu");
		btnVizualizareGrupuriStudiu.addActionListener(this);
		btnVizualizareMembriiGrup = new JButton("Vizualizare membrii grup");
		btnVizualizareMembriiGrup.addActionListener(this);
		btnMesaje = new JButton("Trimite mesaj");
		btnMesaje.addActionListener(this);
		btnAdaugareActivitatiGrup = new JButton("Adauga activitati grup");
		btnAdaugareActivitatiGrup.addActionListener(this);
		btnVizualizareActivitatiGrup = new JButton("Vizualizare activitati grup");
		btnVizualizareActivitatiGrup.addActionListener(this);
		btnSugestiiActivitatiGrup = new JButton("Sugestii activitati grup");
		btnSugestiiActivitatiGrup.addActionListener(this);
		btnActiuniGrupuri = new JButton("Actiuni grupuri curente");
		btnActiuniGrupuri.addActionListener(this);
		btnLogOutStud = new JButton("Log out");
		btnLogOutStud.addActionListener(this);

		tfMaterieAdaugaNote = new JTextField("Materie");
		tfNumeAdaugaNote = new JTextField("Nume student");
		tfPrenumeAdaugaNote = new JTextField("Prenume student");
		tfNotaCursAdaugaNote = new JTextField("Curs");
		tfNotaSeminarAdaugaNote = new JTextField("Seminar");
		tfNotaLabAdaugaNote = new JTextField("Laborator");
		btnAdaugaNoteAfter = new JButton("Adauga");
		btnAdaugaNoteAfter.addActionListener(this);

		tfMaterieInscriereCurs = new JTextField("Nume curs");
		btnInscriereCursAfter = new JButton("Inscriere");
		btnInscriereCursAfter.addActionListener(this);

		tfMaterieRenuntareCurs = new JTextField("Nume curs");
		btnRenuntareCursAfter = new JButton("Renunta");
		btnRenuntareCursAfter.addActionListener(this);

		tfNumeGrupStudiu = new JTextField("Nume grup de studiu");
		tfMaterieGrupStudiu = new JTextField("Materie grup de studiu");
		btnInscriereGrupStudiuAfter = new JButton("Inscriere");
		btnInscriereGrupStudiuAfter.addActionListener(this);

		tfMesaj = new JTextField("Mesaj");
		tfGrupMesaje = new JTextField("Grup");
		btnMesajeAfter = new JButton("Trimite");
		btnMesajeAfter.addActionListener(this);

		tfNumeActivitate = new JTextField("Nume activitate");
		tfNrMinActivitate = new JTextField("Nr min participanti");
		tfNrMaxActivitate = new JTextField("Nr max participanti");
		tfNumeGrupActivitate = new JTextField("Nume grup");
		tfInceputActivitate = new JTextField("Inceputul activitatii");
		tfSfarsitActivitate = new JTextField("Sfarsitul activitatii");
		tfDataExpirareActivitate = new JTextField("Data expirare");
		tfNumeProfActivitate = new JTextField("Nume profesor");
		tfPrenumeProfActivitate = new JTextField("Prenume profesor");
		btnAdaugareActivitatiGrupAfter = new JButton("Adauga");
		btnAdaugareActivitatiGrupAfter.addActionListener(this);

		tfNumeGrupVizualizareActivitatiGrup = new JTextField("Nume grup");
		btnVizualizareActivitatiGrupAfter = new JButton("Vezi");
		btnVizualizareActivitatiGrupAfter.addActionListener(this);

		tfNumeGrupVizualizareMembriiGrup = new JTextField("Nume grup");
		btnVizualizareMembriiGrupAfter = new JButton("Vezi");
		btnVizualizareMembriiGrupAfter.addActionListener(this);

		tfNumeGrupSugestiiGrup = new JTextField("Nume grup");
		btnSugestiiGrupStudiuAfter = new JButton("Vezi");
		btnSugestiiGrupStudiuAfter.addActionListener(this);

		tfUsername = new JTextField("Username");
		tfPassword = new JTextField("Password");

		tfCNP = new JTextField("CNP");
		tfNume = new JTextField("Nume");
		tfPrenume = new JTextField("Prenume");
		tfAdresa = new JTextField("Adresa");
		tfNumarDeTelefon = new JTextField("Numar de telefon");
		tfEmail = new JTextField("Email");
		tfIBAN = new JTextField("IBAN");
		tfNumarDeContract = new JTextField("Numar de contract");
		tfPasswordCreate = new JTextField("Password");
		tfOreMin = new JTextField("Ore minime");
		tfOreMax = new JTextField("Ore maxime");
		tfDepartament = new JTextField("Departament");
		tfAnDeStudiu = new JTextField("An de studiu");
		tfNumarDeOre = new JTextField("Numar de ore");

		tfNumeCautareUtilizatorNume = new JTextField("Nume");
		tfNumeCautareUtilizatorNume.setBounds(130, 160, 200, 30);
		tfNumeCautareUtilizatorNume.setVisible(false);
		tfPrenumeCautareUtilizatorNume = new JTextField("Prenume");
		tfPrenumeCautareUtilizatorNume.setBounds(130, 190, 200, 30);
		tfPrenumeCautareUtilizatorNume.setVisible(false);

		tfNumeProfesor = new JTextField("Nume profesor");
		tfNumeProfesor.setBounds(130, 160, 200, 30);
		tfNumeProfesor.setVisible(false);
		tfPrenumeProfesor = new JTextField("Prenume profesor");
		tfPrenumeProfesor.setBounds(130, 190, 200, 30);
		tfPrenumeProfesor.setVisible(false);
		tfCurs = new JTextField("Curs");
		tfCurs.setBounds(130, 220, 200, 30);
		tfCurs.setVisible(false);

		tfMaterie = new JTextField("Materie");
		tfMaterie.setBounds(130, 160, 200, 30);
		tfProcentCurs = new JTextField("Procent curs");
		tfProcentCurs.setBounds(130, 190, 200, 30);
		tfProcentSeminar = new JTextField("Procent seminar");
		tfProcentSeminar.setBounds(130, 220, 200, 30);
		tfProcentLab = new JTextField("Procent lab");
		tfProcentLab.setBounds(130, 250, 200, 30);

		tfProfesorProgramare = new JTextField("Profesor");
		tfMaterieProgramare = new JTextField("Materie");
		cbCursProgramare = new JCheckBox("Curs");
		cbSeminarProgramare = new JCheckBox("Seminar");
		cbLabProgramare = new JCheckBox("Lab");
		cbExamenProgramare = new JCheckBox("Examen");
		cbColocviuProgramare = new JCheckBox("Colocviu");
		tfDataInceputProgramare = new JTextField("Data inceput programare");
		tfDataFinalProgramare = new JTextField("Dara final programare");
		tfNrMaxParticipantiProgramare = new JTextField("Nr max participanti");

		tfMaterieAfisareCatalog = new JTextField("Materie");
		btnAfisareCatalogAfter = new JButton("Afisare");
		btnAfisareCatalogAfter.addActionListener(this);

		tfNumeMaterieInscriereActivitateDidactica = new JTextField("Nume materie");
		tfNumeProfInscriereActivitateDidactica = new JTextField("Nume profesor");
		tfPrenumeProfInscriereActivitateDidactica = new JTextField("Prenume profesor");
		cbCursInscriereActivitateDidactica = new JCheckBox("Curs");
		cbSeminarInscriereActivitateDidactica = new JCheckBox("Seminar");
		cbLabInscriereActivitateDidactica = new JCheckBox("Lab");
		cbExamenInscriereActivitateDidactica = new JCheckBox("Examen");
		cbColocviuInscriereActivitateDidactica = new JCheckBox("Colocviu");
		tfDataInceputInscriereActivitateDidactica = new JTextField("Data inceput programare");
		tfDataFinalInscriereActivitateDidactica = new JTextField("Dara final programare");
		btnInscriereActivitateDidacticaAfter = new JButton("Inscriere");
		btnInscriereActivitateDidacticaAfter.addActionListener(this);

		panelImpartireProcentuala = new JPanel();
		panelImpartireProcentuala.setLayout(new GridLayout(8, 1, 20, 5));
		panelImpartireProcentuala.setBackground(new Color(1f, 0f, 0f, .0f));
		panelImpartireProcentuala.setBounds(120, 120, 220, 300);
		panelImpartireProcentuala.add(tfMaterie);
		panelImpartireProcentuala.add(tfProcentCurs);
		panelImpartireProcentuala.add(tfProcentSeminar);
		panelImpartireProcentuala.add(tfProcentLab);
		panelImpartireProcentuala.add(btnImpartireProcentualaActivitatiAfter);
		panelImpartireProcentuala.setVisible(false);

		panelCreare = new JPanel();
		panelCreare.setLayout(new GridLayout(8, 1, 20, 5));
		panelCreare.setBackground(new Color(1f, 0f, 0f, .0f));
		panelCreare.setBounds(120, 120, 220, 300);
		panelCreare.add(tfCNP);
		panelCreare.add(tfNume);
		panelCreare.add(tfPrenume);
		panelCreare.add(tfAdresa);
		panelCreare.add(tfNumarDeTelefon);
		panelCreare.add(tfEmail);
		panelCreare.add(tfIBAN);
		panelCreare.add(tfNumarDeContract);
		panelCreare.add(tfPasswordCreate);
		panelCreare.add(tfOreMin);
		panelCreare.add(tfOreMax);
		panelCreare.add(tfDepartament);
		panelCreare.add(tfAnDeStudiu);
		panelCreare.add(tfNumarDeOre);
		panelCreare.setVisible(false);

		panelStart = new JPanel();
		panelStart.setLayout(new GridLayout(2, 1, 30, 5));
		panelStart.setBackground(new Color(1f, 0f, 0f, .0f));
		panelStart.setBounds(120, 120, 220, 60);
		panelStart.add(tfUsername);
		panelStart.add(tfPassword);
		panelStart.setVisible(true);

		panelAdmin = new JPanel();
		panelAdmin.setLayout(new GridLayout(9, 1, 50, 5));
		panelAdmin.setBackground(new Color(1f, 0f, 0f, .0f));
		panelAdmin.setBounds(120, 120, 220, 250);
		panelAdmin.add(btnModificareUser);
		panelAdmin.add(btnStergereUser);
		panelAdmin.add(btnCreareUser);
		panelAdmin.add(btnCautareUtilizatorTip);
		panelAdmin.add(btnCautareUtilizatorNume);
		panelAdmin.add(btnAsignareProfesorCurs);
		panelAdmin.add(btnCautareNumeCurs);
		panelAdmin.add(btnDatePersonaleAdmin);
		panelAdmin.add(btnLogOut);
		panelAdmin.setVisible(false);

		panelProf = new JPanel();
		panelProf.setLayout(new GridLayout(8, 1, 50, 5));
		panelProf.setBackground(new Color(1f, 0f, 0f, .0f));
		panelProf.setBounds(120, 120, 220, 200);
		panelProf.add(btnImpartireProcentualaActivitati);
		panelProf.add(btnProgramareActivitateDidactica);
		panelProf.add(btnAfisareCatalog);
		panelProf.add(btnAdaugaNote);
		panelProf.add(btnActivitatiZiuaCurentaProfesor);
		panelProf.add(btnCursuriPredateProf);
		panelProf.add(btnDatePersonaleProf);
		panelProf.add(btnLogOutProf);
		panelProf.setVisible(false);

		panelStud = new JPanel();
		panelStud.setLayout(new GridLayout(12, 1, 50, 5));
		panelStud.setBackground(new Color(1f, 0f, 0f, .0f));
		panelStud.setBounds(120, 120, 220, 280);
		panelStud.add(btnDatePersonaleStud);
		panelStud.add(btnCursuriStud);
		panelStud.add(btnInscriereCurs);
		panelStud.add(btnRenuntareCurs);
		panelStud.add(btnVizualizareNote);
		panelStud.add(btnActivitatiZiuaCurentaStud);
		panelStud.add(btnInscriereActivitateDidactica);
		panelStud.add(btnInscriereGrupStudiu);
		panelStud.add(btnVizualizareGrupuriStudiu);
		panelStud.add(btnSugestiiGrupStudiu);
		panelStud.add(btnActiuniGrupuri);
		panelStud.add(btnLogOutStud);
		panelStud.setVisible(false);

		panelGrupStud = new JPanel();
		panelGrupStud.setLayout(new GridLayout(5, 1, 50, 5));
		panelGrupStud.setBackground(new Color(1f, 0f, 0f, .0f));
		panelGrupStud.setBounds(120, 120, 220, 280);
		panelGrupStud.add(btnVizualizareMembriiGrup);
		panelGrupStud.add(btnMesaje);
		panelGrupStud.add(btnAdaugareActivitatiGrup);
		panelGrupStud.add(btnVizualizareActivitatiGrup);
		panelGrupStud.add(btnSugestiiActivitatiGrup);
		panelGrupStud.setVisible(false);

		panelProgramareActivitateDidactica = new JPanel();
		panelProgramareActivitateDidactica.setLayout(new GridLayout(10, 1, 50, 5));
		panelProgramareActivitateDidactica.setBackground(new Color(1f, 0f, 0f, .0f));
		panelProgramareActivitateDidactica.setBounds(120, 120, 220, 280);
		panelProgramareActivitateDidactica.add(tfMaterieProgramare);
		panelProgramareActivitateDidactica.add(cbCursProgramare);
		panelProgramareActivitateDidactica.add(cbSeminarProgramare);
		panelProgramareActivitateDidactica.add(cbLabProgramare);
		panelProgramareActivitateDidactica.add(cbExamenProgramare);
		panelProgramareActivitateDidactica.add(cbColocviuProgramare);
		panelProgramareActivitateDidactica.add(tfDataInceputProgramare);
		panelProgramareActivitateDidactica.add(tfDataFinalProgramare);
		panelProgramareActivitateDidactica.add(tfNrMaxParticipantiProgramare);
		panelProgramareActivitateDidactica.add(btnProgramareActivitateDidacticaAfter);
		panelProgramareActivitateDidactica.setVisible(false);

		panelAdaugaNote = new JPanel();
		panelAdaugaNote.setLayout(new GridLayout(7, 1, 50, 5));
		panelAdaugaNote.setBackground(new Color(1f, 0f, 0f, .0f));
		panelAdaugaNote.setBounds(120, 120, 220, 280);
		panelAdaugaNote.add(tfMaterieAdaugaNote);
		panelAdaugaNote.add(tfNumeAdaugaNote);
		panelAdaugaNote.add(tfPrenumeAdaugaNote);
		panelAdaugaNote.add(tfNotaCursAdaugaNote);
		panelAdaugaNote.add(tfNotaSeminarAdaugaNote);
		panelAdaugaNote.add(tfNotaLabAdaugaNote);
		panelAdaugaNote.add(btnAdaugaNoteAfter);
		panelAdaugaNote.setVisible(false);

		panelAfisareCatalog = new JPanel();
		panelAfisareCatalog.setLayout(new GridLayout(2, 1, 50, 5));
		panelAfisareCatalog.setBackground(new Color(1f, 0f, 0f, .0f));
		panelAfisareCatalog.setBounds(120, 120, 220, 170);
		panelAfisareCatalog.add(tfMaterieAfisareCatalog);
		panelAfisareCatalog.add(btnAfisareCatalogAfter);
		panelAfisareCatalog.setVisible(false);

		panelInscriereCurs = new JPanel();
		panelInscriereCurs.setLayout(new GridLayout(2, 1, 50, 5));
		panelInscriereCurs.setBackground(new Color(1f, 0f, 0f, .0f));
		panelInscriereCurs.setBounds(120, 120, 220, 170);
		panelInscriereCurs.add(tfMaterieInscriereCurs);
		panelInscriereCurs.add(btnInscriereCursAfter);
		panelInscriereCurs.setVisible(false);

		panelRenuntareCurs = new JPanel();
		panelRenuntareCurs.setLayout(new GridLayout(2, 1, 50, 5));
		panelRenuntareCurs.setBackground(new Color(1f, 0f, 0f, .0f));
		panelRenuntareCurs.setBounds(120, 120, 220, 170);
		panelRenuntareCurs.add(tfMaterieRenuntareCurs);
		panelRenuntareCurs.add(btnRenuntareCursAfter);
		panelRenuntareCurs.setVisible(false);

		panelInscriereActivitateDidactica = new JPanel();
		panelInscriereActivitateDidactica.setLayout(new GridLayout(11, 1, 50, 5));
		panelInscriereActivitateDidactica.setBackground(new Color(1f, 0f, 0f, .0f));
		panelInscriereActivitateDidactica.setBounds(120, 120, 220, 300);
		panelInscriereActivitateDidactica.add(tfNumeMaterieInscriereActivitateDidactica);
		panelInscriereActivitateDidactica.add(tfNumeProfInscriereActivitateDidactica);
		panelInscriereActivitateDidactica.add(tfPrenumeProfInscriereActivitateDidactica);
		panelInscriereActivitateDidactica.add(cbCursInscriereActivitateDidactica);
		panelInscriereActivitateDidactica.add(cbSeminarInscriereActivitateDidactica);
		panelInscriereActivitateDidactica.add(cbLabInscriereActivitateDidactica);
		panelInscriereActivitateDidactica.add(cbExamenInscriereActivitateDidactica);
		panelInscriereActivitateDidactica.add(cbColocviuInscriereActivitateDidactica);
		panelInscriereActivitateDidactica.add(tfDataInceputInscriereActivitateDidactica);
		panelInscriereActivitateDidactica.add(tfDataFinalInscriereActivitateDidactica);
		panelInscriereActivitateDidactica.add(btnInscriereActivitateDidacticaAfter);
		panelInscriereActivitateDidactica.setVisible(false);

		panelInscriereGrupStudiu = new JPanel();
		panelInscriereGrupStudiu.setLayout(new GridLayout(3, 1, 50, 5));
		panelInscriereGrupStudiu.setBackground(new Color(1f, 0f, 0f, .0f));
		panelInscriereGrupStudiu.setBounds(120, 120, 220, 170);
		panelInscriereGrupStudiu.add(tfNumeGrupStudiu);
		panelInscriereGrupStudiu.add(tfMaterieGrupStudiu);
		panelInscriereGrupStudiu.add(btnInscriereGrupStudiuAfter);
		panelInscriereGrupStudiu.setVisible(false);

		panelMesaje = new JPanel();
		panelMesaje.setLayout(new GridLayout(3, 1, 50, 5));
		panelMesaje.setBackground(new Color(1f, 0f, 0f, .0f));
		panelMesaje.setBounds(120, 120, 220, 170);
		panelMesaje.add(tfMesaj);
		panelMesaje.add(tfGrupMesaje);
		panelMesaje.add(btnMesajeAfter);
		panelMesaje.setVisible(false);

		panelAdaugaActivitate = new JPanel();
		panelAdaugaActivitate.setLayout(new GridLayout(10, 1, 50, 5));
		panelAdaugaActivitate.setBackground(new Color(1f, 0f, 0f, .0f));
		panelAdaugaActivitate.setBounds(120, 120, 220, 270);
		panelAdaugaActivitate.add(tfNumeActivitate);
		panelAdaugaActivitate.add(tfNrMinActivitate);
		panelAdaugaActivitate.add(tfNrMaxActivitate);
		panelAdaugaActivitate.add(tfNumeGrupActivitate);
		panelAdaugaActivitate.add(tfInceputActivitate);
		panelAdaugaActivitate.add(tfSfarsitActivitate);
		panelAdaugaActivitate.add(tfDataExpirareActivitate);
		panelAdaugaActivitate.add(tfNumeProfActivitate);
		panelAdaugaActivitate.add(tfPrenumeProfActivitate);
		panelAdaugaActivitate.add(btnAdaugareActivitatiGrupAfter);
		panelAdaugaActivitate.setVisible(false);

		panelVizualizareActivitatiGrup = new JPanel();
		panelVizualizareActivitatiGrup.setLayout(new GridLayout(2, 1, 50, 5));
		panelVizualizareActivitatiGrup.setBackground(new Color(1f, 0f, 0f, .0f));
		panelVizualizareActivitatiGrup.setBounds(120, 120, 220, 270);
		panelVizualizareActivitatiGrup.add(tfNumeGrupVizualizareActivitatiGrup);
		panelVizualizareActivitatiGrup.add(btnVizualizareActivitatiGrupAfter);
		panelVizualizareActivitatiGrup.setVisible(false);

		panelVizualizareMembriiGrup = new JPanel();
		panelVizualizareMembriiGrup.setLayout(new GridLayout(2, 1, 50, 5));
		panelVizualizareMembriiGrup.setBackground(new Color(1f, 0f, 0f, .0f));
		panelVizualizareMembriiGrup.setBounds(120, 120, 220, 270);
		panelVizualizareMembriiGrup.add(tfNumeGrupVizualizareMembriiGrup);
		panelVizualizareMembriiGrup.add(btnVizualizareMembriiGrupAfter);
		panelVizualizareMembriiGrup.setVisible(false);

		panelSugestiiGrup = new JPanel();
		panelSugestiiGrup.setLayout(new GridLayout(2, 1, 50, 5));
		panelSugestiiGrup.setBackground(new Color(1f, 0f, 0f, .0f));
		panelSugestiiGrup.setBounds(120, 120, 220, 270);
		panelSugestiiGrup.add(tfNumeGrupSugestiiGrup);
		panelSugestiiGrup.add(btnSugestiiGrupStudiuAfter);
		panelSugestiiGrup.setVisible(false);

		cbUserList = new JComboBox<>(allUsers);
		cbUserList.setBounds(120, 185, 220, 30);
		cbUserList.setVisible(true);

		cbUserListCreare = new JComboBox<>(allUsers);
		cbUserListCreare.setBounds(120, 390, 220, 30);
		cbUserListCreare.setVisible(false);

		cbUserListAfiseaza = new JComboBox<>(allUsers);
		cbUserListAfiseaza.setBounds(120, 200, 220, 30);
		cbUserListAfiseaza.setVisible(false);

		ImageIcon imgbg = new ImageIcon("utcn-logo-resize.png");
		JLabel picLabel = new JLabel();
		picLabel.setIcon(imgbg);
		picLabel.setBounds(400, 15, 50, 50);
		picLabel.setHorizontalAlignment(JLabel.CENTER);
		picLabel.setVerticalAlignment(JLabel.CENTER);

		this.setTitle("Facultate");
		ImageIcon imglogo = new ImageIcon("utcn-logo.png");
		this.setIconImage(imglogo.getImage());
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setResizable(false);
		this.setSize(500, 500);
		this.setLayout(null);
		this.setVisible(true);
		this.setLocationRelativeTo(null);

		this.add(lblWelcomeUser);
		this.add(lblTitleLogin);
		this.add(lblTitleCreateNewUser);
		this.add(panelStart);
		this.add(panelCreare);
		this.add(panelAdmin);
		this.add(panelProf);
		this.add(panelStud);
		this.add(panelGrupStud);
		this.add(panelImpartireProcentuala);
		this.add(panelProgramareActivitateDidactica);
		this.add(panelAdaugaNote);
		this.add(panelAfisareCatalog);
		this.add(panelInscriereCurs);
		this.add(panelRenuntareCurs);
		this.add(panelInscriereGrupStudiu);
		this.add(panelInscriereActivitateDidactica);
		this.add(panelMesaje);
		this.add(panelAdaugaActivitate);
		this.add(panelVizualizareActivitatiGrup);
		this.add(panelVizualizareMembriiGrup);
		this.add(panelSugestiiGrup);
		this.add(btnCreateNewUser);
		this.add(btnCreareUserAfter);
		this.add(btnModificareUserAfter);
		this.add(btnStergereUserAfter);
		this.add(btnCautareUtilizatorTipAfter);
		this.add(btnCautareUtilizatorNumeAfter);
		this.add(btnAsignareProfesorCursAfter);
		this.add(btnCautareNumeCursAfter);
		this.add(btnLogIn);
		this.add(btnBackAdmin);
		this.add(btnBackProf);
		this.add(btnBackStud);
		this.add(cbUserList);
		this.add(cbUserListCreare);
		this.add(cbUserListAfiseaza);
		this.add(tfNumeCautareUtilizatorNume);
		this.add(tfPrenumeCautareUtilizatorNume);
		this.add(tfNumeProfesor);
		this.add(tfPrenumeProfesor);
		this.add(tfCurs);
		this.add(picLabel);

		refresh();
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		Connection connection = null;
		if (tfUsername.getText().compareTo("Administrator") == 0) {
			try {
				connection = DriverManager.getConnection(
						"jdbc:mysql://localhost/facultate?user=administrator&password=ParolaAdministrator");
			} catch (SQLException e2) {
				JOptionPane.showMessageDialog(this, "Unable to connect at database");
			}
		} else if (tfUsername.getText().compareTo("Profesor") == 0) {
			try {
				connection = DriverManager
						.getConnection("jdbc:mysql://localhost/facultate?user=profesor&password=ParolaProfesor");
			} catch (SQLException e2) {
				JOptionPane.showMessageDialog(this, "Unable to connect at database");
			}
		} else {
			try {
				connection = DriverManager
						.getConnection("jdbc:mysql://localhost/facultate?user=student&password=ParolaStudent");
			} catch (SQLException e2) {
				JOptionPane.showMessageDialog(this, "Unable to connect at database");
			}
		}
		if (e.getSource() == btnLogIn) {
			try {
				String userType = cbUserList.getItemAt(cbUserList.getSelectedIndex());
				String pass;
				user = tfUsername.getText();
				pass = tfPassword.getText();
				if (userType.compareTo("Administrator") == 0) {

					String query = "{CALL facultate.CAUTARE_ADMINISTRATOR(?,?)}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);
					cs.setString(1, user);
					cs.setString(2, pass);
					ResultSet rs = cs.executeQuery();
					if (rs.next()) {
						panelAdmin.setVisible(true);
						afterLogIn(tfUsername.getText(), "Admin");
					} else {
						JOptionPane.showMessageDialog(this, "Unknown user");
					}
				} else if (userType.compareTo("Profesor") == 0) {

					String query = "{CALL facultate.CAUTARE_PROFESOR(?,?)}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);
					cs.setString(1, user);
					cs.setString(2, pass);
					ResultSet rs = cs.executeQuery();
					if (rs.next()) {
						panelProf.setVisible(true);
						afterLogIn(tfUsername.getText(), "Profesor");
					} else {
						JOptionPane.showMessageDialog(this, "Unknown user");
					}
				} else if (userType.compareTo("Student") == 0) {
					String query = "{CALL facultate.CAUTARE_STUDENT(?,?)}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);
					cs.setString(1, user);
					cs.setString(2, pass);
					ResultSet rs = cs.executeQuery();
					if (rs.next()) {
						panelStud.setVisible(true);
						afterLogIn(tfUsername.getText(), "Student");
					} else {
						JOptionPane.showMessageDialog(this, "Unknown user");
					}
				} else {
					JOptionPane.showMessageDialog(this, "Unknown user");
				}

			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Unknown user");
			}
		} else if (e.getSource() == btnCreateNewUser) {

			lblTitleLogin.setVisible(false);
			lblTitleCreateNewUser.setVisible(true);
			lblWelcomeUser.setVisible(false);
			cbUserList.setVisible(false);
			btnLogIn.setVisible(false);
			btnBackAdmin.setVisible(true);
			btnCreateNewUser.setVisible(false);
			btnCreareUserAfter.setVisible(true);
			btnCautareUtilizatorTipAfter.setVisible(false);
			panelCreare.setVisible(true);
			cbUserListCreare.setVisible(true);
			refresh();

			try {
				connection = DriverManager.getConnection("jdbc:mysql://localhost/PhoneBook?user=root&password=1234");
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Connection failed");
			}

		} else if (e.getSource() == btnLogOut || e.getSource() == btnLogOutProf || e.getSource() == btnLogOutStud) {
			afterLogOut();
		} else if (e.getSource() == btnBackAdmin) {
			afterLogOut();
			afterLogIn(user, "Admin");
			panelAdmin.setVisible(true);
		} else if (e.getSource() == btnBackProf) {
			afterLogOut();
			afterLogIn(user, "Profesor");
			panelProf.setVisible(true);
		} else if (e.getSource() == btnBackStud) {
			afterLogOut();
			afterLogIn(user, "Student");
			panelStud.setVisible(true);
		} else if (e.getSource() == btnModificareUser) {
			btnBackAdmin.setVisible(true);
			panelAdmin.setVisible(false);
			panelCreare.setVisible(true);
			cbUserListCreare.setVisible(true);
			btnModificareUserAfter.setVisible(true);
		} else if (e.getSource() == btnModificareUserAfter) {
			try {
				String userType = cbUserListCreare.getItemAt(cbUserListCreare.getSelectedIndex());
				String user, pass;
				user = tfUsername.getText();
				pass = tfPassword.getText();
				if (userType.compareTo("Administrator") == 0) {

					String query = "{CALL facultate.MODIFICARE_ADMINISTRATOR(?,?,?,?,?,?,?,?)}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);

					cs.setString(1, tfCNP.getText());
					cs.setString(2, tfNume.getText());
					cs.setString(3, tfPrenume.getText());
					cs.setString(4, tfAdresa.getText());
					cs.setString(5, tfNumarDeTelefon.getText());
					cs.setString(6, tfEmail.getText());
					cs.setString(7, tfIBAN.getText());
					cs.setString(8, tfNumarDeContract.getText());
					ResultSet rs = cs.executeQuery();
					JOptionPane.showMessageDialog(this, "Datele contului au fost modificate cu succes!");
				} else if (userType.compareTo("Profesor") == 0) {
					String query = "{CALL facultate.MODIFICARE_PROFESOR(?,?,?,?,?,?,?,?,?,?,?)}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);
					cs.setString(1, tfCNP.getText());
					cs.setString(2, tfNume.getText());
					cs.setString(3, tfPrenume.getText());
					cs.setString(4, tfAdresa.getText());
					cs.setString(5, tfNumarDeTelefon.getText());
					cs.setString(6, tfEmail.getText());
					cs.setString(7, tfIBAN.getText());
					cs.setString(8, tfNumarDeContract.getText());
					cs.setString(9, tfOreMin.getText());
					cs.setString(10, tfOreMax.getText());
					cs.setString(11, tfDepartament.getText());
					ResultSet rs = cs.executeQuery();
					JOptionPane.showMessageDialog(this, "Datele contului au fost modificate cu succes!");
				} else if (userType.compareTo("Student") == 0) {
					String query = "{CALL facultate.MODIFICARE_STUDENT(?,?,?,?,?,?,?,?,?,?)}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);
					cs.setString(1, tfCNP.getText());
					cs.setString(2, tfNume.getText());
					cs.setString(3, tfPrenume.getText());
					cs.setString(4, tfAdresa.getText());
					cs.setString(5, tfNumarDeTelefon.getText());
					cs.setString(6, tfEmail.getText());
					cs.setString(7, tfIBAN.getText());
					cs.setString(8, tfNumarDeContract.getText());
					cs.setString(9, tfAnDeStudiu.getText());
					cs.setString(10, tfNumarDeOre.getText());
					ResultSet rs = cs.executeQuery();
					JOptionPane.showMessageDialog(this, "Datele contului au fost modificate cu succes!");
				}
				btnBackAdmin.setVisible(false);
				panelAdmin.setVisible(true);
				panelCreare.setVisible(false);
				cbUserListCreare.setVisible(false);
				btnModificareUserAfter.setVisible(false);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare modificare date");
			}
		} else if (e.getSource() == btnCreareUser) {
			btnBackAdmin.setVisible(true);
			panelAdmin.setVisible(false);
			panelCreare.setVisible(true);
			cbUserListCreare.setVisible(true);
			btnCreareUserAfter.setVisible(true);
		} else if (e.getSource() == btnCreareUserAfter) {
			try {
				String userType = cbUserListCreare.getItemAt(cbUserListCreare.getSelectedIndex());
				String user, pass;
				user = tfUsername.getText();
				pass = tfPassword.getText();
				if (userType.compareTo("Administrator") == 0) {

					String query = "{CALL facultate.ADAUGA_ADMINISTRATOR(?,?,?,?,?,?,?,?,?,?,?,?)}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);

					cs.setString(1, tfCNP.getText());
					cs.setString(2, tfNume.getText());
					cs.setString(3, tfPrenume.getText());
					cs.setString(4, tfAdresa.getText());
					cs.setString(5, tfNumarDeTelefon.getText());
					cs.setString(6, tfEmail.getText());
					cs.setString(7, tfIBAN.getText());
					cs.setString(8, tfNumarDeContract.getText());
					cs.setString(9, tfPasswordCreate.getText());
					ResultSet rs = cs.executeQuery();
					JOptionPane.showMessageDialog(this, "Cont creat cu succes!");
				} else if (userType.compareTo("Profesor") == 0) {
					String query = "{CALL facultate.ADAUGA_PROFESOR(?,?,?,?,?,?,?,?,?,?,?,?)}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);

					cs.setString(1, tfCNP.getText());
					cs.setString(2, tfNume.getText());
					cs.setString(3, tfPrenume.getText());
					cs.setString(4, tfAdresa.getText());
					cs.setString(5, tfNumarDeTelefon.getText());
					cs.setString(6, tfEmail.getText());
					cs.setString(7, tfIBAN.getText());
					cs.setString(8, tfNumarDeContract.getText());
					cs.setString(9, tfOreMin.getText());
					cs.setString(10, tfOreMax.getText());
					cs.setString(11, tfDepartament.getText());
					cs.setString(12, tfPasswordCreate.getText());

					ResultSet rs = cs.executeQuery();
					JOptionPane.showMessageDialog(this, "Cont creat cu succes!");
				} else if (userType.compareTo("Student") == 0) {
					String query = "{CALL facultate.ADAUGA_STUDENT(?,?,?,?,?,?,?,?,?,?,?)}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);
					cs.setString(1, tfCNP.getText());
					cs.setString(2, tfNume.getText());
					cs.setString(3, tfPrenume.getText());
					cs.setString(4, tfAdresa.getText());
					cs.setString(5, tfNumarDeTelefon.getText());
					cs.setString(6, tfEmail.getText());
					cs.setString(7, tfIBAN.getText());
					cs.setString(8, tfNumarDeContract.getText());
					cs.setString(9, tfAnDeStudiu.getText());
					cs.setString(10, tfNumarDeOre.getText());
					cs.setString(11, tfPasswordCreate.getText());
					ResultSet rs = cs.executeQuery();
					JOptionPane.showMessageDialog(this, "Cont creat cu succes!");
				}
				btnBackAdmin.setVisible(false);
				panelAdmin.setVisible(true);
				panelCreare.setVisible(false);
				cbUserListCreare.setVisible(false);
				btnCreareUserAfter.setVisible(false);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare adaugare date");
			}
		} else if (e.getSource() == btnStergereUser) {
			btnBackAdmin.setVisible(true);
			panelAdmin.setVisible(false);
			panelCreare.setVisible(true);
			cbUserListCreare.setVisible(true);
			btnStergereUserAfter.setVisible(true);
		} else if (e.getSource() == btnStergereUserAfter) {
			try {
				String userType = cbUserListCreare.getItemAt(cbUserListCreare.getSelectedIndex());
				String user, pass;
				user = tfUsername.getText();
				pass = tfPassword.getText();
				if (userType.compareTo("Administrator") == 0) {
					String query = "{CALL facultate.STERGERE_ADMINISTRATOR(?,?,?)}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);
					cs.setString(1, tfCNP.getText());
					cs.setString(2, tfNume.getText());
					cs.setString(3, tfPrenume.getText());
					ResultSet rs = cs.executeQuery();
					JOptionPane.showMessageDialog(this, "Cont sters cu succes!");
				} else if (userType.compareTo("Profesor") == 0) {
					String query = "{CALL facultate.STERGERE_PROFESOR(?,?,?)}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);
					cs.setString(1, tfCNP.getText());
					cs.setString(2, tfNume.getText());
					cs.setString(3, tfPrenume.getText());
					ResultSet rs = cs.executeQuery();
					JOptionPane.showMessageDialog(this, "Cont sters cu succes!");
				} else if (userType.compareTo("Student") == 0) {
					String query = "{CALL facultate.STERGE_STUDENT(?,?,?)}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);
					cs.setString(1, tfCNP.getText());
					cs.setString(2, tfNume.getText());
					cs.setString(3, tfPrenume.getText());
					ResultSet rs = cs.executeQuery();
					JOptionPane.showMessageDialog(this, "Cont sters cu succes!");
				}
				btnBackAdmin.setVisible(false);
				panelAdmin.setVisible(true);
				panelCreare.setVisible(false);
				cbUserListCreare.setVisible(false);
				btnStergereUserAfter.setVisible(false);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare stergere date");
			}
		} else if (e.getSource() == btnCautareUtilizatorNume) {
			btnBackAdmin.setVisible(true);
			panelAdmin.setVisible(false);
			tfNumeCautareUtilizatorNume.setVisible(true);
			tfPrenumeCautareUtilizatorNume.setVisible(true);
			btnCautareUtilizatorNumeAfter.setVisible(true);
		} else if (e.getSource() == btnCautareUtilizatorNumeAfter) {
			try {
				String[][] content = new String[20][15];

				String query = "{CALL facultate.AFISARE_UTILIZATORI_NUME_ADMINISTRATOR(?,?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, tfNumeCautareUtilizatorNume.getText());
				cs.setString(2, tfPrenumeCautareUtilizatorNume.getText());
				ResultSet rs = cs.executeQuery();
				String[] data = new String[10];
				data[0] = "id";
				data[1] = "CNP";
				data[2] = "Nume";
				data[3] = "Prenume";
				data[4] = "Adresa";
				data[5] = "NumarDeTelefon";
				data[6] = "Email";
				data[7] = "IBAN";
				data[8] = "Superadministrator_bool";
				data[9] = "NrContract";
				for (int i = 0; rs.next(); i++) {
					for (int j = 0; j < 10; j++) {
						content[i][j] = rs.getString(data[j]);
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Administratori");
				rs.close();

				String query2 = "{CALL facultate.AFISARE_UTILIZATORI_NUME_PROFESOR(?,?)}";
				CallableStatement cs2 = (CallableStatement) connection.prepareCall(query2);
				cs2.setString(1, tfNumeCautareUtilizatorNume.getText());
				cs2.setString(2, tfPrenumeCautareUtilizatorNume.getText());
				ResultSet rs2 = cs2.executeQuery();
				String[] data2 = new String[12];
				data2[0] = "id";
				data2[1] = "CNP";
				data2[2] = "Nume";
				data2[3] = "Prenume";
				data2[4] = "Adresa";
				data2[5] = "NrDeTelefon";
				data2[6] = "Email";
				data2[7] = "IBAN";
				data2[8] = "NrContract";
				data2[9] = "OreMin";
				data2[10] = "OreMax";
				data2[11] = "Departament";
				for (int i = 0; rs2.next(); i++) {
					for (int j = 0; j < 12; j++) {
						content[i][j] = rs2.getString(data2[j]);
					}
				}
				System.out.println(12);
				FrameAfisare frameAfisareProfesor = new FrameAfisare(content, data2, "Profesori");
				rs2.close();

				String query3 = "{CALL facultate.AFISARE_UTILIZATORI_NUME_STUDENT(?,?)}";
				CallableStatement cs3 = (CallableStatement) connection.prepareCall(query3);
				cs3.setString(1, tfNumeCautareUtilizatorNume.getText());
				cs3.setString(2, tfPrenumeCautareUtilizatorNume.getText());
				ResultSet rs3 = cs3.executeQuery();
				String[] data3 = new String[11];
				data3[0] = "id";
				data3[1] = "CNP";
				data3[2] = "Nume";
				data3[3] = "Prenume";
				data3[4] = "Adresa";
				data3[5] = "NrDeTelefon";
				data3[6] = "Email";
				data3[7] = "IBAN";
				data3[8] = "NrContract";
				data3[9] = "AnDeStudiu";
				data3[10] = "NrDeOre";
				for (int i = 0; rs3.next(); i++) {
					for (int j = 0; j < 11; j++) {
						content[i][j] = rs3.getString(data3[j]);
					}
				}
				FrameAfisare frameAfisareStudent = new FrameAfisare(content, data3, "Studenti");
				rs3.close();

				btnBackAdmin.setVisible(false);
				panelAdmin.setVisible(true);
				tfNumeCautareUtilizatorNume.setVisible(false);
				tfPrenumeCautareUtilizatorNume.setVisible(false);
				btnCautareUtilizatorNumeAfter.setVisible(false);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare afisare date");
			}
		} else if (e.getSource() == btnCautareUtilizatorTip) {
			btnBackAdmin.setVisible(true);
			panelAdmin.setVisible(false);
			cbUserListAfiseaza.setVisible(true);
			btnCautareUtilizatorTipAfter.setVisible(true);
		} else if (e.getSource() == btnCautareUtilizatorTipAfter) {
			try {
				String userType = cbUserListAfiseaza.getItemAt(cbUserListAfiseaza.getSelectedIndex());
				String user, pass;
				user = tfUsername.getText();
				pass = tfPassword.getText();
				String[][] content = new String[20][15];
				int width;
				// TODO: Latimea coloanelor, sa afiseze tot continutul
				// Capul de tabel

				if (userType.compareTo("Administrator") == 0) {

					String query = "{CALL facultate.AFISARE_ADMINISTRATOR()}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);
					ResultSet rs = cs.executeQuery();
					String[] data = new String[10];
					data[0] = "id";
					data[1] = "CNP";
					data[2] = "Nume";
					data[3] = "Prenume";
					data[4] = "Adresa";
					data[5] = "NumarDeTelefon";
					data[6] = "Email";
					data[7] = "IBAN";
					data[8] = "Superadministrator_bool";
					data[9] = "NrContract";
					for (int i = 0; rs.next(); i++) {
						for (int j = 0; j < 10; j++) {
							content[i][j] = rs.getString(data[j]);
						}
					}
					FrameAfisare frameAfisare = new FrameAfisare(content, data, "Administratori");
					rs.close();
				} else if (userType.compareTo("Profesor") == 0) {
					String query = "{CALL facultate.AFISARE_PROFESOR()}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);
					ResultSet rs = cs.executeQuery();
					String[] data = new String[12];
					data[0] = "id";
					data[1] = "CNP";
					data[2] = "Nume";
					data[3] = "Prenume";
					data[4] = "Adresa";
					data[5] = "NrDeTelefon";
					data[6] = "Email";
					data[7] = "IBAN";
					data[8] = "NrContract";
					data[9] = "OreMin";
					data[10] = "OreMax";
					data[11] = "Departament";
					for (int i = 0; rs.next(); i++) {
						for (int j = 0; j < 12; j++) {
							content[i][j] = rs.getString(data[j]);
						}
					}
					FrameAfisare frameAfisare = new FrameAfisare(content, data, "Profesori");
					rs.close();
				} else if (userType.compareTo("Student") == 0) {
					String query = "{CALL facultate.AFISARE_STUDENT()}";
					CallableStatement cs = (CallableStatement) connection.prepareCall(query);
					ResultSet rs = cs.executeQuery();
					String[] data = new String[11];
					data[0] = "id";
					data[1] = "CNP";
					data[2] = "Nume";
					data[3] = "Prenume";
					data[4] = "Adresa";
					data[5] = "NrDeTelefon";
					data[6] = "Email";
					data[7] = "IBAN";
					data[8] = "NrContract";
					data[9] = "AnDeStudiu";
					data[10] = "NrDeOre";
					for (int i = 0; rs.next(); i++) {
						for (int j = 0; j < 11; j++) {
							content[i][j] = rs.getString(data[j]);
						}
					}
					FrameAfisare frameAfisare = new FrameAfisare(content, data, "Studenti");
					rs.close();
				}

				btnBackAdmin.setVisible(false);
				panelAdmin.setVisible(true);
				cbUserListAfiseaza.setVisible(false);
				btnCautareUtilizatorTipAfter.setVisible(false);

			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare afisare date");
			}
		} else if (e.getSource() == btnAsignareProfesorCurs) {
			btnBackAdmin.setVisible(true);
			panelAdmin.setVisible(false);
			tfNumeProfesor.setVisible(true);
			tfPrenumeProfesor.setVisible(true);
			tfCurs.setVisible(true);
			btnAsignareProfesorCursAfter.setVisible(true);
		} else if (e.getSource() == btnAsignareProfesorCursAfter) {
			try {
				String query = "{CALL facultate.ASIGNARE_PROFESOR_MATERIE(?,?,?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, tfNumeProfesor.getText());
				cs.setString(2, tfPrenumeProfesor.getText());
				cs.setString(3, tfCurs.getText());
				ResultSet rs = cs.executeQuery();
				rs.close();
				JOptionPane.showMessageDialog(this, "Profesor asignat la curs cu succes");
				btnBackAdmin.setVisible(false);
				panelAdmin.setVisible(true);
				tfNumeProfesor.setVisible(false);
				tfPrenumeProfesor.setVisible(false);
				tfCurs.setVisible(false);
				btnAsignareProfesorCursAfter.setVisible(false);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare asignare date");
			}

		} else if (e.getSource() == btnCautareNumeCurs) {
			btnBackAdmin.setVisible(true);
			panelAdmin.setVisible(false);
			tfCurs.setVisible(true);
			btnCautareNumeCursAfter.setVisible(true);
		} else if (e.getSource() == btnCautareNumeCursAfter) {
			try {
				String[][] content = new String[20][15];

				String query = "{CALL facultate.CAUTARE_NUME_CURS_PROFESOR(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, tfCurs.getText());
				ResultSet rs = cs.executeQuery();

				String[] data = new String[12];
				data[0] = "id";
				data[1] = "CNP";
				data[2] = "Nume";
				data[3] = "Prenume";
				data[4] = "Adresa";
				data[5] = "NrDeTelefon";
				data[6] = "Email";
				data[7] = "IBAN";
				data[8] = "NrContract";
				data[9] = "OreMin";
				data[10] = "OreMax";
				data[11] = "Departament";
				for (int i = 0; rs.next(); i++) {
					for (int j = 0; j < 12; j++) {
						content[i][j] = rs.getString(data[j]);
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Profesori");

				String[][] content2 = new String[20][15];
				String query2 = "{CALL facultate.CAUTARE_NUME_CURS_STUDENT(?)}";
				CallableStatement cs2 = (CallableStatement) connection.prepareCall(query2);
				cs2.setString(1, tfCurs.getText());
				ResultSet rs2 = cs2.executeQuery();
				String[] data2 = new String[11];
				data2[0] = "id";
				data2[1] = "CNP";
				data2[2] = "Nume";
				data2[3] = "Prenume";
				data2[4] = "Adresa";
				data2[5] = "NrDeTelefon";
				data2[6] = "Email";
				data2[7] = "IBAN";
				data2[8] = "NrContract";
				data2[9] = "AnDeStudiu";
				data2[10] = "NrDeOre";
				for (int i = 0; rs2.next(); i++) {
					for (int j = 0; j < 11; j++) {
						content2[i][j] = rs2.getString(data2[j]);
					}
				}
				FrameAfisare frameAfisare2 = new FrameAfisare(content2, data2, "Studenti");
				rs2.close();

				btnBackAdmin.setVisible(false);
				panelAdmin.setVisible(true);
				tfCurs.setVisible(false);
				btnCautareNumeCursAfter.setVisible(false);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare cautare date");
			}
		} else if (e.getSource() == btnDatePersonaleAdmin) {
			try {
				String query = "{CALL facultate.DATE_PERSONALE_ADMINISTRATOR(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				ResultSet rs = cs.executeQuery();

				String[][] content = new String[1][15];
				String[] data = new String[10];
				data[0] = "id";
				data[1] = "CNP";
				data[2] = "Nume";
				data[3] = "Prenume";
				data[4] = "Adresa";
				data[5] = "NumarDeTelefon";
				data[6] = "Email";
				data[7] = "IBAN";
				data[8] = "Superadministrator_bool";
				data[9] = "NrContract";
				for (int i = 0; rs.next(); i++) {
					for (int j = 0; j < 10; j++) {
						content[i][j] = rs.getString(data[j]);
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Date personale:");

			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare afisare date personale");
			}
		} else if (e.getSource() == btnImpartireProcentualaActivitati) {
			btnBackProf.setVisible(true);
			panelProf.setVisible(false);
			panelImpartireProcentuala.setVisible(true);
		} else if (e.getSource() == btnImpartireProcentualaActivitatiAfter) {
			try {
				String query = "{CALL facultate.IMPARTIRE_PROCENTUALA_ACTIVITATI(?,?,?,?)}";
				CallableStatement cs;
				cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, tfMaterie.getText());
				cs.setString(2, tfProcentCurs.getText());
				cs.setString(3, tfProcentSeminar.getText());
				cs.setString(4, tfProcentLab.getText());
				ResultSet rs = cs.executeQuery();
				JOptionPane.showMessageDialog(this, "Impartire procentuala realizata cu succes");
				btnBackProf.setVisible(false);
				panelProf.setVisible(true);
				panelImpartireProcentuala.setVisible(false);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare impartire procentuala");
			}

		} else if (e.getSource() == btnProgramareActivitateDidactica) {
			btnBackProf.setVisible(true);
			panelProf.setVisible(false);
			panelProgramareActivitateDidactica.setVisible(true);
			btnProgramareActivitateDidacticaAfter.setVisible(true);

		} else if (e.getSource() == btnProgramareActivitateDidacticaAfter) {// NU MERGE
			try {
				String curs, seminar, lab, examen, colocviu;
				if (cbCursProgramare.isSelected() == true)
					curs = "1";
				else
					curs = "0";
				if (cbSeminarProgramare.isSelected() == true)
					seminar = "1";
				else
					seminar = "0";
				if (cbLabProgramare.isSelected() == true)
					lab = "1";
				else
					lab = "0";
				if (cbExamenProgramare.isSelected() == true)
					examen = "1";
				else
					examen = "0";
				if (cbColocviuProgramare.isSelected() == true)
					colocviu = "1";
				else
					colocviu = "0";
				String query = "{CALL facultate.PROGRAMARE_ACTIVITATE_DIDACTICA(?,?,?,?,?,?,?,?,?,?)}";
				CallableStatement cs;
				cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, tfUsername.getText());
				cs.setString(2, tfMaterieProgramare.getText());
				cs.setString(3, curs);
				cs.setString(4, seminar);
				cs.setString(5, lab);
				cs.setString(6, examen);
				cs.setString(7, colocviu);
				cs.setString(8, tfDataInceputProgramare.getText());
				cs.setString(9, tfDataFinalProgramare.getText());
				cs.setString(10, tfNrMaxParticipantiProgramare.getText());
				ResultSet rs = cs.executeQuery();
				JOptionPane.showMessageDialog(this, "Activitate didactica programata cu succes");
				btnBackProf.setVisible(false);
				panelProf.setVisible(true);
				panelProgramareActivitateDidactica.setVisible(false);
				btnProgramareActivitateDidacticaAfter.setVisible(false);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare programare activitate didactica");
			}
		} else if (e.getSource() == btnAfisareCatalog) {
			btnBackProf.setVisible(true);
			panelAfisareCatalog.setVisible(true);
			panelProf.setVisible(false);
		} else if (e.getSource() == btnAfisareCatalogAfter) {
			try {
				String query = "{CALL facultate.STUDENTII_UNUI_PROFESOR_LA_MATERIE(?,?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, tfUsername.getText());
				cs.setString(2, tfMaterieAfisareCatalog.getText());

				ResultSet rs = cs.executeQuery();

				String[][] content = new String[20][15];
				String[] data = new String[2];
				data[0] = "Nume";
				data[1] = "Prenume";
				for (int i = 0; rs.next(); i++) {
					for (int j = 0; j < 2; j++) {
						content[i][j] = rs.getString(data[j]);
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Studentii inscrisi la materie sunt:");

			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare generare catalog");
			}
		} else if (e.getSource() == btnAdaugaNote) {
			btnBackProf.setVisible(true);
			panelAdaugaNote.setVisible(true);
			panelProf.setVisible(false);
		} else if (e.getSource() == btnAdaugaNoteAfter) {
			try {
				String query = "{CALL facultate.SALVARE_NOTA_CATALOG_PROFESOR_LA_STUDENT_LA_MATERIE(?,?,?,?,?,?,?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				cs.setString(2, tfMaterieAdaugaNote.getText());
				cs.setString(3, tfNumeAdaugaNote.getText());
				cs.setString(4, tfPrenumeAdaugaNote.getText());
				cs.setString(5, tfNotaCursAdaugaNote.getText());
				cs.setString(6, tfNotaSeminarAdaugaNote.getText());
				cs.setString(7, tfNotaLabAdaugaNote.getText());
				ResultSet rs = cs.executeQuery();

				try {
					String query2 = "{CALL facultate.CALCUL_NOTA(?,?)}";
					CallableStatement cs2 = (CallableStatement) connection.prepareCall(query2);
					cs2.setString(1, user);
					cs2.setString(2, tfMaterieAdaugaNote.getText());
					ResultSet rs2 = cs2.executeQuery();
					JOptionPane.showMessageDialog(this, "Nota adaugata cu succes");
				} catch (SQLException e1) {
					JOptionPane.showMessageDialog(this, "Eroare calculare medie");
				}
				btnBackProf.setVisible(false);
				panelAdaugaNote.setVisible(false);
				panelProf.setVisible(true);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare adaugare nota");
			}
		} else if (e.getSource() == btnActivitatiZiuaCurentaProfesor) {
			try {
				String query = "{CALL facultate.ACTIVITATI_DIDACTICE_ZIUA_CURENTA_PROFESOR(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				ResultSet rs = cs.executeQuery();

				String[][] content = new String[20][15];
				String[] data = new String[4];
				data[0] = "Nume";
				data[1] = "Tip";
				data[2] = "DataInceput";
				data[3] = "DataFinal";
				for (int i = 0; rs.next(); i++) {

					String tip = "";
					if (rs.getString("Curs") != null && Integer.valueOf(rs.getString("Curs")) == 1) {
						tip = "Curs";
					} else if (rs.getString("Seminar") != null && Integer.valueOf(rs.getString("Seminar")) == 1) {
						tip = "Seminar";
					} else if (rs.getString("Laborator") != null && Integer.valueOf(rs.getString("Laborator")) == 1) {
						tip = "Laborator";
					} else if (rs.getString("Examen") != null && Integer.valueOf(rs.getString("Examen")) == 1) {
						tip = "Examen";
					} else if (rs.getString("Colocviu") != null && Integer.valueOf(rs.getString("Colocviu")) == 1) {
						tip = "Colocviu";
					}
					content[i][0] = rs.getString(data[0]);
					content[i][1] = tip;
					content[i][2] = rs.getString(data[2]);
					content[i][3] = rs.getString(data[3]);
				}

				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Activitatile din ziua curenta sunt:");

			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare afisare activitati");
			}
		} else if (e.getSource() == btnCursuriPredateProf) {
			try {
				String query = "{CALL facultate.MATERII_PREDATE_DE_PROFESOR(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				ResultSet rs = cs.executeQuery();

				String[] data = new String[1];
				String[][] content = new String[20][15];
				data[0] = "Materie";
				for (int i = 0; rs.next(); i++) {
					content[i][0] = rs.getString("Nume");
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Materii predate:");
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare afisare materii");
			}
		} else if (e.getSource() == btnDatePersonaleProf) {
			try {
				String query = "{CALL facultate.DATE_PERSONALE_PROFESOR(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				ResultSet rs = cs.executeQuery();

				String[][] content = new String[20][15];
				String[] data = new String[12];
				data[0] = "id";
				data[1] = "CNP";
				data[2] = "Nume";
				data[3] = "Prenume";
				data[4] = "Adresa";
				data[5] = "NrDeTelefon";
				data[6] = "Email";
				data[7] = "IBAN";
				data[8] = "NrContract";
				data[9] = "OreMin";
				data[10] = "OreMax";
				data[11] = "Departament";
				for (int i = 0; rs.next(); i++) {
					for (int j = 0; j < 12; j++) {
						content[i][j] = rs.getString(data[j]);
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Date personale:");

			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare afisare date personale");
			}
		} else if (e.getSource() == btnDatePersonaleStud) {
			try {
				String query = "{CALL facultate.DATE_PERSONALE_STUDENT(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				ResultSet rs = cs.executeQuery();

				String[][] content = new String[20][15];
				String[] data = new String[11];
				data[0] = "id";
				data[1] = "CNP";
				data[2] = "Nume";
				data[3] = "Prenume";
				data[4] = "Adresa";
				data[5] = "NrDeTelefon";
				data[6] = "Email";
				data[7] = "IBAN";
				data[8] = "NrContract";
				data[9] = "AnDeStudiu";
				data[10] = "NrDeOre";
				for (int i = 0; rs.next(); i++) {
					for (int j = 0; j < 11; j++) {
						content[i][j] = rs.getString(data[j]);
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Date personale:");

			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare afisare date personale");
			}
		} else if (e.getSource() == btnCursuriStud) {
			try {
				String query = "{CALL facultate.AFISARE_TOATE_CURSURILE(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				ResultSet rs = cs.executeQuery();

				String[][] content = new String[20][15];
				String[] data = new String[9];
				data[0] = "Nume";
				data[1] = "oreCurs";
				data[2] = "oreSeminar";
				data[3] = "oreLaborator";
				data[4] = "procentCurs";
				data[5] = "procentSeminar";
				data[6] = "procentLaborator";
				data[7] = "descriere";
				data[8] = "nrMaxStudenti";
				for (int i = 0; rs.next(); i++) {
					for (int j = 0; j < 9; j++) {
						content[i][j] = rs.getString(data[j]);
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Cursuri:");

			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare afisare cursuri");
			}
		} else if (e.getSource() == btnSugestiiGrupStudiu) {
			btnBackStud.setVisible(true);
			panelSugestiiGrup.setVisible(true);
			panelStud.setVisible(false);
		} else if (e.getSource() == btnSugestiiGrupStudiuAfter) {
			try {
				String query = "{CALL facultate.AFISARE_SUGESTII_PARTICIPANTI_GRUP_STUDIU_TOTI(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, tfNumeGrupSugestiiGrup.getText());
				ResultSet rs = cs.executeQuery();

				String query2 = "{CALL facultate.AFISARE_SUGESTII_PARTICIPANTI_GRUP_STUDIU_EXCLUSI(?)}";
				CallableStatement cs2 = (CallableStatement) connection.prepareCall(query2);
				cs2.setString(1, tfNumeGrupSugestiiGrup.getText());
				ResultSet rs2 = cs2.executeQuery();

				String[][] content = new String[20][15];
				String[] data = new String[4];
				data[0] = "Id";
				data[1] = "Nume";
				data[2] = "Prenume";
				data[3] = "Email";
				for (int i = 0; rs.next(); i++) {
					boolean nuExista = true;
					ResultSet rs2aux = rs2;
					for (int j = 0; rs2.next(); j++) {
						if (rs.getString(data[0]) == rs2.getString(data[0])) {
							nuExista = false;
						}
					}
					rs2 = rs2aux;

					if (nuExista == true) {
						for (int j = 0; j < 4; j++) {
							content[i][j] = rs.getString(data[j]);
						}
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Sugestii participanti:");

			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare afisare sugestii participanti");
			}
			btnBackStud.setVisible(false);
			panelSugestiiGrup.setVisible(false);
			panelStud.setVisible(true);
		} else if (e.getSource() == btnInscriereCurs) {
			btnBackStud.setVisible(true);
			panelInscriereCurs.setVisible(true);
			panelStud.setVisible(false);
		} else if (e.getSource() == btnInscriereCursAfter) {
			try {
				String query = "{CALL facultate.INSCRIERE_STUDENT_LA_CURS(?,?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				cs.setString(2, tfMaterieInscriereCurs.getText());
				ResultSet rs = cs.executeQuery();

				String query2 = "{CALL facultate.INSCRIERE_AUTOMATA_STUDENTI_ACT_DIDACTICA(?,?)}";
				CallableStatement cs2 = (CallableStatement) connection.prepareCall(query2);
				cs2.setString(1, tfMaterieInscriereCurs.getText());
				cs2.setString(2, user);
				ResultSet rs2 = cs2.executeQuery();

				JOptionPane.showMessageDialog(this, "Inscriere curs realizata cu succes");
				btnBackStud.setVisible(false);
				panelInscriereCurs.setVisible(false);
				panelStud.setVisible(true);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare inscriere curs");
			}
		} else if (e.getSource() == btnRenuntareCurs) {
			btnBackStud.setVisible(true);
			panelRenuntareCurs.setVisible(true);
			panelStud.setVisible(false);
		} else if (e.getSource() == btnRenuntareCursAfter) {
			try {
				String query = "{CALL facultate.RENUNTARE_STUDENT_LA_CURS(?,?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				cs.setString(2, tfMaterieRenuntareCurs.getText());
				ResultSet rs = cs.executeQuery();
				JOptionPane.showMessageDialog(this, "Renuntare curs realizata cu succes");
				btnBackStud.setVisible(false);
				panelRenuntareCurs.setVisible(false);
				panelStud.setVisible(true);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare renuntare curs");
			}
		} else if (e.getSource() == btnVizualizareNote) {

			try {
				String query = "{CALL facultate.VIZUALIZARE_NOTE_DE_STUDENT(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				ResultSet rs = cs.executeQuery();

				String[][] content = new String[20][15];
				String[] data = new String[5];
				data[0] = "Nume";
				data[1] = "NotaCurs";
				data[2] = "NotaSeminar";
				data[3] = "NotaLaborator";
				data[4] = "NotaFinala";
				for (int i = 0; rs.next(); i++) {
					for (int j = 0; j < 5; j++) {
						content[i][j] = rs.getString(data[j]);
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Note:");
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare vizualizare note");
			}

		} else if (e.getSource() == btnActivitatiZiuaCurentaStud) {
			try {
				String query = "{CALL facultate.ACTIVITATI_DIDACTICE_ZIUA_CURENTA_STUDENT(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				ResultSet rs = cs.executeQuery();

				String[][] content = new String[20][15];
				String[] data = new String[4];
				data[0] = "Nume";
				data[1] = "Tip";
				data[2] = "DataInceput";
				data[3] = "DataFinal";
				for (int i = 0; rs.next(); i++) {

					String tip = "";
					if (rs.getString("Curs") != null && Integer.valueOf(rs.getString("Curs")) == 1) {
						tip = "Curs";
					} else if (rs.getString("Seminar") != null && Integer.valueOf(rs.getString("Seminar")) == 1) {
						tip = "Seminar";
					} else if (rs.getString("Laborator") != null && Integer.valueOf(rs.getString("Laborator")) == 1) {
						tip = "Laborator";
					} else if (rs.getString("Examen") != null && Integer.valueOf(rs.getString("Examen")) == 1) {
						tip = "Examen";
					} else if (rs.getString("Colocviu") != null && Integer.valueOf(rs.getString("Colocviu")) == 1) {
						tip = "Colocviu";
					}
					content[i][0] = rs.getString(data[0]);
					content[i][1] = tip;
					content[i][2] = rs.getString(data[2]);
					content[i][3] = rs.getString(data[3]);
				}

				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Activitatile din ziua curenta sunt:");

			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare afisare activitati");
			}
		} else if (e.getSource() == btnInscriereActivitateDidactica) {
			panelStud.setVisible(false);
			panelInscriereActivitateDidactica.setVisible(true);
			btnBackStud.setVisible(true);
		} else if (e.getSource() == btnInscriereActivitateDidacticaAfter) {
			try {
				String curs, seminar, lab, examen, colocviu;
				if (cbCursProgramare.isSelected() == true)
					curs = "1";
				else
					curs = "0";
				if (cbSeminarProgramare.isSelected() == true)
					seminar = "1";
				else
					seminar = "0";
				if (cbLabProgramare.isSelected() == true)
					lab = "1";
				else
					lab = "0";
				if (cbExamenProgramare.isSelected() == true)
					examen = "1";
				else
					examen = "0";
				if (cbColocviuProgramare.isSelected() == true)
					colocviu = "1";
				else
					colocviu = "0";
				String query = "{CALL facultate.INSCRIERE_ACTIVITATE_DIDACTICA(?,?,?,?,?,?,?,?,?,?,?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, tfUsername.getText());
				cs.setString(2, tfNumeMaterieInscriereActivitateDidactica.getText());
				cs.setString(3, tfNumeProfInscriereActivitateDidactica.getText());
				cs.setString(4, tfPrenumeProfInscriereActivitateDidactica.getText());
				cs.setString(5, curs);
				cs.setString(6, seminar);
				cs.setString(7, lab);
				cs.setString(8, examen);
				cs.setString(9, colocviu);
				cs.setString(10, tfDataInceputInscriereActivitateDidactica.getText());
				cs.setString(11, tfDataFinalInscriereActivitateDidactica.getText());
				ResultSet rs = cs.executeQuery();
				JOptionPane.showMessageDialog(this, "Inscriere la activitatea didactica realizata cu succes");
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare inscriere activitate didactica");
			}

			panelStud.setVisible(true);
			panelInscriereActivitateDidactica.setVisible(false);
			btnBackStud.setVisible(false);
		} else if (e.getSource() == btnInscriereGrupStudiu) {
			btnBackStud.setVisible(true);
			panelInscriereGrupStudiu.setVisible(true);
			panelStud.setVisible(false);
		} else if (e.getSource() == btnInscriereGrupStudiuAfter) {
			try {
				String query2 = "{CALL facultate.INSCRIERE_GRUP_STUDIU(?,?,?)}";
				CallableStatement cs2 = (CallableStatement) connection.prepareCall(query2);
				cs2.setString(1, user);
				cs2.setString(2, tfNumeGrupStudiu.getText());
				cs2.setString(3, tfMaterieGrupStudiu.getText());
				ResultSet rs2 = cs2.executeQuery();
				JOptionPane.showMessageDialog(this, "Inscriera in grupul de studiu realizata cu succes");
				/*
				 * String query = "{CALL facultate.VERIFICARE_STUDENT_INSCRIS_MATERIE(?,?,?)}";
				 * CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				 * cs.setString(1, user); cs.setString(2, tfNumeGrupStudiu.getText());
				 * cs.setString(3, tfMaterieGrupStudiu.getText()); System.out.println(user);
				 * System.out.println(tfNumeGrupStudiu.getText());
				 * System.out.println(tfMaterieGrupStudiu.getText()); ResultSet rs =
				 * cs.executeQuery(); if (rs.next()) { JOptionPane.showMessageDialog(this,
				 * "Studentul este deja inscris in grupul de studiu"); } else { String query2 =
				 * "{CALL facultate.INSCRIERE_GRUP_STUDIU(?,?,?)}"; CallableStatement cs2 =
				 * (CallableStatement) connection.prepareCall(query); cs2.setString(1, user);
				 * cs2.setString(2, tfNumeGrupStudiu.getText()); cs2.setString(3,
				 * tfMaterieGrupStudiu.getText()); ResultSet rs2 = cs.executeQuery();
				 * JOptionPane.showMessageDialog(this,
				 * "Inscriera in grupul de studiu realizata cu succes"); }
				 */
				btnBackStud.setVisible(false);
				panelInscriereGrupStudiu.setVisible(false);
				panelStud.setVisible(true);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare inscriere grup de studiu");
			}
		} else if (e.getSource() == btnSugestiiActivitatiGrup) {
			try {
				String query = "{CALL facultate.SUGESTI_FERESTRE_ACTIVITATI_GRUP(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, tfUsername.getText());
				ResultSet rs = cs.executeQuery();

				String[][] content = new String[20][15];
				String[] data = new String[3];
				data[0] = "activitate_grup.nume";
				data[1] = "activitate_grup.inceputActivitate";
				data[2] = "activitate_grup.sfarsitActivitate";
				for (int i = 0; rs.next(); i++) {
					for (int j = 0; j < 3; j++) {
						content[i][j] = rs.getString(data[j]);
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Activitati la care puteti participa:");

				panelVizualizareMembriiGrup.setVisible(false);
				panelGrupStud.setVisible(true);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare afisare sugestii activitati");
			}
		} else if (e.getSource() == btnVizualizareMembriiGrup) {
			btnBackStud.setVisible(true);
			btnVizualizareMembriiGrupAfter.setVisible(true);
			panelVizualizareMembriiGrup.setVisible(true);
			panelGrupStud.setVisible(false);
		} else if (e.getSource() == btnVizualizareMembriiGrupAfter) {
			try {
				String query = "{CALL facultate.VIZUALIZARE_MEMBRII_GRUP_STUDIU(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, tfNumeGrupVizualizareMembriiGrup.getText());
				ResultSet rs = cs.executeQuery();

				String[][] content = new String[20][15];
				String[] data = new String[3];
				data[0] = "Nume";
				data[1] = "Prenume";
				data[2] = "Email";
				for (int i = 0; rs.next(); i++) {
					for (int j = 0; j < 3; j++) {
						content[i][j] = rs.getString(data[j]);
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Membrii grupului:");

				panelVizualizareMembriiGrup.setVisible(false);
				panelGrupStud.setVisible(true);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare vizualizare membrii");
			}
		} else if (e.getSource() == btnMesaje) {
			btnBackStud.setVisible(true);
			panelMesaje.setVisible(true);
			panelGrupStud.setVisible(false);
		} else if (e.getSource() == btnMesajeAfter) {
			try {
				String query = "{CALL facultate.TRIMITE_MESAJ(?,?,?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				cs.setString(2, tfMesaj.getText());
				cs.setString(3, tfGrupMesaje.getText());
				ResultSet rs = cs.executeQuery();
				JOptionPane.showMessageDialog(this, "Mesaj trimis cu succes");
				btnBackStud.setVisible(true);
				panelMesaje.setVisible(false);
				panelGrupStud.setVisible(true);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare trimitere mesaj");
			}
		} else if (e.getSource() == btnAdaugareActivitatiGrup) {
			btnBackStud.setVisible(true);
			panelAdaugaActivitate.setVisible(true);
			panelGrupStud.setVisible(false);
		} else if (e.getSource() == btnAdaugareActivitatiGrupAfter) {
			try {
				String query = "{CALL facultate.ADAUGA_ACTIVITATE_GRUP_STUDIU(?,?,?,?,?,?,?,?,?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, tfNumeActivitate.getText());
				cs.setString(2, tfNrMinActivitate.getText());
				cs.setString(3, tfNrMaxActivitate.getText());
				cs.setString(4, tfNumeGrupActivitate.getText());
				cs.setString(5, tfInceputActivitate.getText());
				cs.setString(6, tfSfarsitActivitate.getText());
				cs.setString(7, tfDataExpirareActivitate.getText());
				cs.setString(8, tfNumeProfActivitate.getText());
				cs.setString(9, tfPrenumeProfActivitate.getText());
				ResultSet rs = cs.executeQuery();
				JOptionPane.showMessageDialog(this, "Activitate adaugata cu succes");
				btnBackStud.setVisible(false);
				panelAdaugaActivitate.setVisible(false);
				panelGrupStud.setVisible(true);
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare adaugare activitate");
			}
		} else if (e.getSource() == btnVizualizareActivitatiGrup) {
			btnBackStud.setVisible(true);
			panelVizualizareActivitatiGrup.setVisible(true);
			panelGrupStud.setVisible(false);
		} else if (e.getSource() == btnVizualizareActivitatiGrupAfter) {

			try {
				String query = "{CALL facultate.VIZUALIZARE_ACTIVITATI_GRUP_STUDIU(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, tfNumeGrupVizualizareActivitatiGrup.getText());
				ResultSet rs = cs.executeQuery();

				String[][] content = new String[20][15];
				String[] data = new String[5];
				data[0] = "Nume";
				data[1] = "NrMax";
				data[2] = "NrPersInscrise";
				data[3] = "InceputActivitate";
				data[4] = "SfarsitActivitate";
				for (int i = 0; rs.next(); i++) {
					for (int j = 0; j < 5; j++) {
						content[i][j] = rs.getString(data[j]);
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Activitati:");
			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare vizualizare activitati");
			}

			btnBackStud.setVisible(false);
			panelVizualizareActivitatiGrup.setVisible(false);
			panelGrupStud.setVisible(true);
		} else if (e.getSource() == btnVizualizareGrupuriStudiu) {
			try {
				String query = "{CALL facultate.AFISARE_TOATE_GRUPURILE_DE_STUDENTI(?)}";
				CallableStatement cs = (CallableStatement) connection.prepareCall(query);
				cs.setString(1, user);
				ResultSet rs = cs.executeQuery();

				String[][] content = new String[20][15];
				String[] data = new String[2];
				data[0] = "grup_studenti.nume";
				data[1] = "materie.nume";
				for (int i = 0; rs.next(); i++) {
					for (int j = 0; j < 2; j++) {
						content[i][j] = rs.getString(data[j]);
					}
				}
				FrameAfisare frameAfisare = new FrameAfisare(content, data, "Grupuri de studiu:");

			} catch (SQLException e1) {
				JOptionPane.showMessageDialog(this, "Eroare afisare grupuri de studiu");
			}
		} else if (e.getSource() == btnActiuniGrupuri) {
			btnBackStud.setVisible(true);
			panelStud.setVisible(false);
			panelGrupStud.setVisible(true);

		}
	}

	public void afterLogIn(String username, String userType) {
		lblTitleLogin.setVisible(false);
		lblTitleCreateNewUser.setVisible(false);
		btnLogIn.setVisible(false);
		btnCreareUserAfter.setVisible(false);
		panelStart.setVisible(false);
		cbUserList.setVisible(false);

		lblWelcomeUser.setText("Welcome, " + userType + ", " + username);
		lblWelcomeUser.setVisible(true);

		refresh();
	}

	public void afterLogOut() {
		lblTitleLogin.setVisible(true);
		lblTitleCreateNewUser.setVisible(false);
		lblWelcomeUser.setVisible(false);
		btnLogIn.setVisible(true);
		btnBackAdmin.setVisible(false);
		btnBackProf.setVisible(false);
		btnBackStud.setVisible(false);
		btnCreareUserAfter.setVisible(false);
		btnModificareUserAfter.setVisible(false);
		btnStergereUserAfter.setVisible(false);
		btnCautareUtilizatorTipAfter.setVisible(false);
		btnCreateNewUser.setVisible(false);
		btnCautareUtilizatorNumeAfter.setVisible(false);
		btnAsignareProfesorCursAfter.setVisible(false);
		btnCautareNumeCursAfter.setVisible(false);
		btnProgramareActivitateDidacticaAfter.setVisible(false);
		btnInscriereActivitateDidacticaAfter.setVisible(false);
		panelStart.setVisible(true);
		panelAdmin.setVisible(false);
		panelProf.setVisible(false);
		panelStud.setVisible(false);
		panelGrupStud.setVisible(false);
		panelImpartireProcentuala.setVisible(false);
		panelProgramareActivitateDidactica.setVisible(false);
		panelInscriereActivitateDidactica.setVisible(false);
		panelCreare.setVisible(false);
		panelAdaugaNote.setVisible(false);
		panelAfisareCatalog.setVisible(false);
		panelInscriereCurs.setVisible(false);
		panelRenuntareCurs.setVisible(false);
		panelInscriereGrupStudiu.setVisible(false);
		panelMesaje.setVisible(false);
		panelAdaugaActivitate.setVisible(false);
		panelVizualizareActivitatiGrup.setVisible(false);
		panelVizualizareMembriiGrup.setVisible(false);
		panelSugestiiGrup.setVisible(false);
		cbUserList.setVisible(true);
		cbUserListCreare.setVisible(false);
		cbUserListAfiseaza.setVisible(false);
		tfNumeCautareUtilizatorNume.setVisible(false);
		tfPrenumeCautareUtilizatorNume.setVisible(false);
		tfNumeProfesor.setVisible(false);
		tfPrenumeProfesor.setVisible(false);
		tfCurs.setVisible(false);
		refresh();
	}

	public void refresh() {
		this.setVisible(true);
	}

	public void setData(String x) {
		dataCurenta = "2023-01-" + x;
	}

	public void setOra(String x) {
		oraCurenta = x + ":00";
	}

	public String getDataOra() {
		return dataCurenta + " " + oraCurenta;
	}

	public void verificareTimp(String timp, Connection connection) {

		try {
			String query = "{CALL facultate.VERIFICARE_TIMP(?)}";
			CallableStatement cs = (CallableStatement) connection.prepareCall(query);
			cs.setString(1, timp);
			ResultSet rs = cs.executeQuery();

		} catch (SQLException e1) {
			JOptionPane.showMessageDialog(this, "Eroare verificare timp");
		}
	}

}
