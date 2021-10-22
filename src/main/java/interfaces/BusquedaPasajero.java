package interfaces;

import java.awt.Font;
import java.util.List;
import javax.swing.text.AbstractDocument;
import javax.swing.text.DocumentFilter;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import dtos.BusquedaPasajeroDTO;
import dtos.PasajerosDTO;
import dtos.TipoDocumentoDTO;
import gestores.GestorPersona;
import util.UppercaseDocumentFilter;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.border.LineBorder;
import java.awt.Color;

@SuppressWarnings("serial")
public class BusquedaPasajero extends JPanel {
	private GestorPersona gestorPersona = GestorPersona.getInstance();
	private JFrame ventana;
	private JPanel padre;
	private JLabel lblApellido, lblNombre, lblTipoDocumento, lblNroDocumento;
	private JTextField txtApellido, txtNombre, txtNroDocumento;
	private JComboBox<TipoDocumentoDTO> cbTipoDocumento;
	private JButton btnBuscar,btnLimpiar,btnSiguiente,btnCancelar;
	private JTable table;
	
	public BusquedaPasajero(JFrame ventana, JPanel padre) {
		this.ventana = ventana;
		this.padre = padre;
		this.setLayout(null);
		this.armarPanel();
	}

	private void armarPanel() {
		DocumentFilter filter = new UppercaseDocumentFilter();
		
		lblApellido = new JLabel("Apellido:");
		lblApellido.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblApellido.setBounds(10, 11, 62, 14);
		this.add(lblApellido);
		
		txtApellido = new JTextField();
		txtApellido.setFont(new Font("Tahoma", Font.BOLD, 12));
		txtApellido.setBounds(138, 8, 200, 20);
		((AbstractDocument) txtApellido.getDocument()).setDocumentFilter(filter);
		this.add(txtApellido);

		lblNombre = new JLabel("Nombre:");
		lblNombre.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblNombre.setBounds(385, 11, 69, 14);
		this.add(lblNombre);
		
		txtNombre = new JTextField();
		txtNombre.setFont(new Font("Tahoma", Font.BOLD, 12));
		txtNombre.setBounds(538, 8, 200, 20);
		((AbstractDocument) txtNombre.getDocument()).setDocumentFilter(filter);
		this.add(txtNombre);
		
		lblTipoDocumento = new JLabel("Tipo de Documento:");
		lblTipoDocumento.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblTipoDocumento.setBounds(10, 59, 131, 14);
		this.add(lblTipoDocumento);
		
		cbTipoDocumento = new JComboBox<TipoDocumentoDTO>();
		cbTipoDocumento.setFont(new Font("Tahoma", Font.BOLD, 12));
		cbTipoDocumento.setBounds(138, 55, 200, 24);
		this.add(cbTipoDocumento);
		llenarComboBoxTipoDocumentos();
		
		lblNroDocumento = new JLabel("Numero de Documento:");
		lblNroDocumento.setFont(new Font("Tahoma", Font.BOLD, 12));
		lblNroDocumento.setBounds(385, 59, 157, 14);
		this.add(lblNroDocumento);
		
		txtNroDocumento = new JTextField();
		txtNroDocumento.setFont(new Font("Tahoma", Font.BOLD, 12));
		txtNroDocumento.setBounds(538, 57, 200, 20);
		((AbstractDocument) txtNroDocumento.getDocument()).setDocumentFilter(filter);
		this.add(txtNroDocumento);
		
		btnBuscar = new JButton("Buscar");
		btnBuscar.addActionListener(
				e -> {
					String apellido = txtApellido.getText();
					String nombre = txtNombre.getText();
					String nroDocumento = txtNroDocumento.getText();
					int idDoc = ((TipoDocumentoDTO) cbTipoDocumento.getSelectedItem()).getId();
					BusquedaPasajeroDTO dto = new BusquedaPasajeroDTO(apellido,nombre,idDoc,nroDocumento);
					PasajerosDTO pasajeros = gestorPersona.buscarPasajerosSegunCriterio(dto);
					if(pasajeros != null) {
						llenarTable(pasajeros);
					}
				}
		);
		btnBuscar.setBounds(548, 96, 89, 23);
		this.add(btnBuscar);
		
		btnLimpiar = new JButton("Limpiar");
		btnLimpiar.setBounds(649, 96, 89, 23);
		this.add(btnLimpiar);
		btnLimpiar.addActionListener(
				e -> {
					txtApellido.setText("");
					txtNombre.setText("");
					txtNroDocumento.setText("");
				}
		);
		
		btnSiguiente = new JButton("Siguiente");
		btnSiguiente.setBounds(570, 412, 89, 23);
		this.add(btnSiguiente);
		btnSiguiente.addActionListener(
				e -> {
					ventana.setContentPane(new AltaPasajero(ventana, this));
					ventana.setVisible(true);
				}
		);
		
		btnCancelar = new JButton("Cancelar");
		btnCancelar.setBounds(669, 412, 89, 23);
		this.add(btnCancelar);
		btnCancelar.addActionListener(
				e -> {
					ventana.setContentPane(padre);
					ventana.pack();
					ventana.setVisible(true);
				}
		);
		
		crearTablePorDefecto();
	}

	private void llenarComboBoxTipoDocumentos() {
		List<TipoDocumentoDTO> listasDoc = gestorPersona.getTiposDocumentos();
		cbTipoDocumento.removeAllItems();
		listasDoc.sort((t1,t2) -> t1.getNombre().compareTo(t2.getNombre()));
		for(TipoDocumentoDTO unTipoDoc : listasDoc) {
			cbTipoDocumento.addItem(unTipoDoc);
		}
	}

	private void llenarTable(PasajerosDTO pasajeros) {
		String[] columnNames = {"Apellido", "Nombre", "Tipo Documento", "Nro. Documento"};
		Object[][] data = new Object[pasajeros.getPasajeros().size()][columnNames.length];
		for(int i = 0; i < pasajeros.getPasajeros().size() ;i++) {
			data[i][0] = pasajeros.getPasajeros().get(i).getApellido();
			data[i][1] = pasajeros.getPasajeros().get(i).getNombre();
			data[i][2] = pasajeros.getPasajeros().get(i).getTipoDocumento();
			data[i][3] = pasajeros.getPasajeros().get(i).getDocumento();
		}
		DefaultTableModel modelo = new DefaultTableModel(data, columnNames);
		table.setModel(modelo);
	}

	private void crearTablePorDefecto() {
		JScrollPane scrollPane = new JScrollPane();
		scrollPane.setViewportBorder(new LineBorder(new Color(0, 0, 0)));
		scrollPane.setBounds(10, 162, 748, 229);
		this.add(scrollPane);
		
		table = new JTable(){
			@Override
			public boolean isCellEditable(int rowIndex, int colIndex) {
				return false;
			}
		};
		scrollPane.setViewportView(table);
		table.setModel(new DefaultTableModel(
			new Object[][] {
				{null, null, null, null},
				{null, null, null, null},
				{null, null, null, null},
				{null, null, null, null},
				{null, null, null, null},
				{null, null, null, null},
				{null, null, null, null},
				{null, null, null, null},
				{null, null, null, null},
				{null, null, null, null},
				{null, null, null, null},
				{null, null, null, null},
				{null, null, null, null},
				{null, null, null, null},
			},
			new String[] {
				"Apellido", "Nombre", "Tipo Documento", "Nro. Documento"
			}
		));
		table.getColumnModel().getColumn(0).setPreferredWidth(90);
		table.getColumnModel().getColumn(1).setPreferredWidth(90);
		table.getColumnModel().getColumn(2).setPreferredWidth(90);
		table.getColumnModel().getColumn(3).setPreferredWidth(90);
	}
}
