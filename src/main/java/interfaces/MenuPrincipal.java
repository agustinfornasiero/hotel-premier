package interfaces;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ImageIcon;
import javax.swing.SwingConstants;
import java.awt.Toolkit;

public class MenuPrincipal extends JFrame {

	private JPanel contentPane;
	
	/**
	 * Create the frame.
	 */
	public MenuPrincipal() {
		setIconImage(Toolkit.getDefaultToolkit().getImage(MenuPrincipal.class.getResource("/icons/HotelPremier.png")));
		setResizable(false);
		setTitle("Hotel Premier - Men\u00FA Principal");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 719, 401);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JButton btnGestionPasajero = new JButton("Gestionar Pasajero");
		btnGestionPasajero.setHorizontalAlignment(SwingConstants.LEFT);
		btnGestionPasajero.setIcon(new ImageIcon(MenuPrincipal.class.getResource("/icons/GestionarPasajero.png")));
		btnGestionPasajero.setFont(new Font("Dialog", Font.BOLD, 14));
		btnGestionPasajero.setBounds(90, 28, 243, 43);
		contentPane.add(btnGestionPasajero);
		
		JButton btnGestionarRespPago = new JButton("Gestionar Responsable Pago");
		btnGestionarRespPago.setIcon(new ImageIcon(MenuPrincipal.class.getResource("/icons/ResponsablePago.png")));
		btnGestionarRespPago.setHorizontalAlignment(SwingConstants.LEFT);
		btnGestionarRespPago.setFont(new Font("Dialog", Font.BOLD, 14));
		btnGestionarRespPago.setBounds(388, 30, 240, 43);
		contentPane.add(btnGestionarRespPago);
		
		JButton btnFacturar = new JButton("Facturar");
		btnFacturar.setHorizontalAlignment(SwingConstants.LEFT);
		btnFacturar.setIcon(new ImageIcon(MenuPrincipal.class.getResource("/icons/Factura.png")));
		btnFacturar.setFont(new Font("Dialog", Font.BOLD, 14));
		btnFacturar.setBounds(90, 82, 243, 43);
		contentPane.add(btnFacturar);
		
		JButton btnOcuparHab = new JButton("Ocupar Habitaci\u00F3n");
		btnOcuparHab.setHorizontalAlignment(SwingConstants.LEFT);
		btnOcuparHab.setIcon(new ImageIcon(MenuPrincipal.class.getResource("/icons/OcuparHabitacion.png")));
		btnOcuparHab.setFont(new Font("Dialog", Font.BOLD, 14));
		btnOcuparHab.setBounds(90, 142, 243, 43);
		contentPane.add(btnOcuparHab);
		
		JButton btnCancelarReserva = new JButton("Cancelar Reserva");
		btnCancelarReserva.setIcon(new ImageIcon(MenuPrincipal.class.getResource("/icons/CancelarReserva.png")));
		btnCancelarReserva.setHorizontalAlignment(SwingConstants.LEFT);
		btnCancelarReserva.setFont(new Font("Dialog", Font.BOLD, 14));
		btnCancelarReserva.setBounds(388, 206, 240, 42);
		contentPane.add(btnCancelarReserva);
		
		JButton btnReservarHab = new JButton("Reservar Habitaci\u00F3n");
		btnReservarHab.setIcon(new ImageIcon(MenuPrincipal.class.getResource("/icons/ReservarHabitacion.png")));
		btnReservarHab.setHorizontalAlignment(SwingConstants.LEFT);
		btnReservarHab.setFont(new Font("Dialog", Font.BOLD, 14));
		btnReservarHab.setBounds(388, 84, 240, 42);
		contentPane.add(btnReservarHab);
		
		JButton btnIngresarNC = new JButton("Ingresar Nota de Cr\u00E9dito");
		btnIngresarNC.setIcon(new ImageIcon(MenuPrincipal.class.getResource("/icons/NotadeCredito.png")));
		btnIngresarNC.setHorizontalAlignment(SwingConstants.LEFT);
		btnIngresarNC.setFont(new Font("Dialog", Font.BOLD, 14));
		btnIngresarNC.setBounds(90, 206, 243, 43);
		contentPane.add(btnIngresarNC);
		
		JButton btnIngresarPago = new JButton("Ingresar Pago");
		btnIngresarPago.setIcon(new ImageIcon(MenuPrincipal.class.getResource("/icons/IngresarPago.png")));
		btnIngresarPago.setHorizontalAlignment(SwingConstants.LEFT);
		btnIngresarPago.setFont(new Font("Dialog", Font.BOLD, 14));
		btnIngresarPago.setBounds(388, 142, 240, 42);
		contentPane.add(btnIngresarPago);
		
		JButton btnSalir = new JButton("Salir");
		btnSalir.setIcon(new ImageIcon(MenuPrincipal.class.getResource("/icons/LogOut.png")));
		btnSalir.setFont(new Font("Dialog", Font.BOLD, 14));
		btnSalir.setBounds(305, 322, 137, 29);
		contentPane.add(btnSalir);
		
		JButton btnListarCheques = new JButton("Listar Cheques");
		btnListarCheques.setIcon(new ImageIcon(MenuPrincipal.class.getResource("/icons/ListarCheques.png")));
		btnListarCheques.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnListarCheques.setHorizontalAlignment(SwingConstants.LEFT);
		btnListarCheques.setBounds(93, 260, 240, 42);
		contentPane.add(btnListarCheques);
		
		JButton btnListarIngresos = new JButton("Listar Ingresos");
		btnListarIngresos.setFont(new Font("Tahoma", Font.BOLD, 14));
		btnListarIngresos.setIcon(new ImageIcon(MenuPrincipal.class.getResource("/icons/ListarIngresos.png")));
		btnListarIngresos.setHorizontalAlignment(SwingConstants.LEFT);
		btnListarIngresos.setBounds(388, 259, 240, 40);
		contentPane.add(btnListarIngresos);
		

		//Acciones de los botones
		btnGestionPasajero.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				MenuGestionPasajeros frmGestionPasajeros = new MenuGestionPasajeros();
				frmGestionPasajeros.setVisible(true);
			}
		});
		
		btnSalir.addActionListener(e -> 
		{
			Object[] opciones = {"No", "S�"};
			
			if 
			(	
				opciones
				[JOptionPane.showOptionDialog(
					MenuPrincipal.this, 
					"�Desea salir del sistema?", 
					"", 
					JOptionPane.DEFAULT_OPTION, 
					JOptionPane.QUESTION_MESSAGE, 
					null, 
					opciones,
					opciones[0]
				)] == opciones[1]
			)
				System.exit(0);  // TODO: volver al menu anterior
		});
	
	}
}
