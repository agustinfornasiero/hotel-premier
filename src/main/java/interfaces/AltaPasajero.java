package interfaces;

import java.awt.BorderLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.swing.BorderFactory;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.Border;
import javax.swing.border.EmptyBorder;
import javax.swing.text.AbstractDocument;
import javax.swing.text.DocumentFilter;
import javax.swing.text.MaskFormatter;

import dtos.LocalidadDTO;
import dtos.PaisDTO;
import dtos.PosicionFrenteIvaDTO;
import dtos.ProfesionDTO;
import dtos.ProvinciaDTO;
import dtos.TipoDocumentoDTO;
import gestores.GestorGeografico;
import gestores.GestorPersona;
import util.UppercaseDocumentFilter;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import javax.swing.JComboBox;
import javax.swing.JFormattedTextField;
import javax.swing.SwingConstants;
import javax.swing.JButton;
import com.toedter.calendar.JDateChooser;


@SuppressWarnings("serial")
public class AltaPasajero extends JPanel {

	private JFrame ventana;
	private JPanel padre;
	private GestorPersona gestorPersona = GestorPersona.getInstance();
	private GestorGeografico gestorGeografico = GestorGeografico.getInstance();
	private GridBagConstraints gbc;
	private JLabel lblApellido, lblNombre,lblTipoDocumento,lblNroDocumento,lblPosicionIVA,lblCUIT,lblFechaNac,lblCalle,lblNumero,lblDepto,lblPiso,lblPais,lblProvincia,lblLocalidad,
		lblCodigoPostal,lblTelefono,lblEmail,lblOcupacion,lblNacionalidad;
	private JTextField txtApellido,txtCalle,txtDepartamento,txtTelefono,txtNombre,txtNroDocumento,txtNumero,txtPiso,txtCodPostal,txtEmail,txtNacionalidad;
	JFormattedTextField txtCuit;
	private JComboBox<TipoDocumentoDTO> cbTipoDocumento;
	private JComboBox<PosicionFrenteIvaDTO> cbPosFrenteIVA;
	private JComboBox<PaisDTO> cbPais;
	private JComboBox<ProvinciaDTO> cbProvincia;
	private JComboBox<LocalidadDTO> cbLocalidad;
	private JComboBox<ProfesionDTO> cbOcupacion;
	private JDateChooser fechaNac;
	private JButton btnSiguiente, btnCancelar;
	MaskFormatter mascaraCuit = null;

	
	public AltaPasajero(JFrame ventana, JPanel padre) {
		this.ventana = ventana;
		this.padre = padre;
		gbc = new GridBagConstraints();
		this.setLayout(new GridBagLayout());
		this.armarPanel();
	}
	
	public void armarPanel() {
		DocumentFilter filter = new UppercaseDocumentFilter();
		
		lblApellido = new JLabel("Apellido (*)");
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblApellido, gbc);
		
		txtApellido = new JTextField();
		((AbstractDocument) txtApellido.getDocument()).setDocumentFilter(filter);
		gbc.gridx = 1;
		gbc.gridy = 0;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(txtApellido,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblNombre = new JLabel("Nombre (*)");
		gbc.gridx = 3;
		gbc.gridy = 0;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblNombre, gbc);
		
		txtNombre = new JTextField();
		((AbstractDocument) txtNombre.getDocument()).setDocumentFilter(filter);
		gbc.gridx = 4;
		gbc.gridy = 0;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(txtNombre,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblTipoDocumento = new JLabel("Tipo Documento (*)");
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblTipoDocumento,gbc);
		
		cbTipoDocumento = new JComboBox<TipoDocumentoDTO>();
		gbc.gridx = 1;
		gbc.gridy = 1;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(cbTipoDocumento,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		llenarComboBoxTipoDocumentos();
		cbTipoDocumento.setSelectedIndex(1);
		
		lblNroDocumento = new JLabel("N\u00FAmero Documento (*)");
		gbc.gridx = 3;
		gbc.gridy = 1;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblNroDocumento,gbc);
		
		txtNroDocumento = new JTextField();
		((AbstractDocument) txtNroDocumento.getDocument()).setDocumentFilter(filter);
		gbc.gridx = 4;
		gbc.gridy = 1;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(txtNroDocumento,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblPosicionIVA = new JLabel("Posicion Frente IVA");
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblPosicionIVA,gbc);
		
		cbPosFrenteIVA = new JComboBox<PosicionFrenteIvaDTO>();
		gbc.gridx = 1;
		gbc.gridy = 2;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(cbPosFrenteIVA,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblCUIT = new JLabel("CUIT");
		gbc.gridx = 3;
		gbc.gridy = 2;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblCUIT,gbc);
		
		try {
			mascaraCuit = new MaskFormatter("##-########-#");
			mascaraCuit.setPlaceholderCharacter('9');
		} catch (ParseException e) {
			e.printStackTrace();
		}
		txtCuit = new JFormattedTextField(mascaraCuit);
		gbc.gridx = 4;
		gbc.gridy = 2;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(txtCuit,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblFechaNac = new JLabel("Fecha de Nacimiento (*):");
		gbc.gridx = 0;
		gbc.gridy = 3;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblFechaNac, gbc);
		
		fechaNac = new JDateChooser("dd/MM/yyyy","##/##/####",'_');
		fechaNac.getJCalendar().setMaxSelectableDate(new Date());
		gbc.anchor = GridBagConstraints.WEST;
		gbc.gridx = 1;
		gbc.gridy = 3;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(fechaNac,gbc);
		gbc.anchor = GridBagConstraints.CENTER;
		
		lblCalle = new JLabel("Calle (*)");
		gbc.gridx = 0;
		gbc.gridy = 4;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblCalle,gbc);
		
		txtCalle = new JTextField();
		((AbstractDocument) txtCalle.getDocument()).setDocumentFilter(filter);
		gbc.gridx = 1;
		gbc.gridy = 4;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(txtCalle,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblNumero = new JLabel("N\u00FAmero (*)");
		gbc.gridx = 3;
		gbc.gridy = 4;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblNumero,gbc);
		
		txtNumero = new JTextField();
		((AbstractDocument) txtNumero.getDocument()).setDocumentFilter(filter);
		gbc.gridx = 4;
		gbc.gridy = 4;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(txtNumero,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblDepto = new JLabel("Departamento");
		gbc.gridx = 0;
		gbc.gridy = 5;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblDepto,gbc);
		
		txtDepartamento = new JTextField();
		((AbstractDocument) txtDepartamento.getDocument()).setDocumentFilter(filter);
		gbc.gridx = 1;
		gbc.gridy = 5;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(txtDepartamento, gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblPiso = new JLabel("Piso");
		gbc.gridx = 3;
		gbc.gridy = 5;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblPiso,gbc);
		
		txtPiso = new JTextField();
		((AbstractDocument) txtPiso.getDocument()).setDocumentFilter(filter);
		gbc.gridx = 4;
		gbc.gridy = 5;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(txtPiso,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblPais = new JLabel("Pais (*)");
		gbc.gridx = 0;
		gbc.gridy = 6;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblPais,gbc);
		
		cbPais = new JComboBox<PaisDTO>();
		gbc.gridx = 1;
		gbc.gridy = 6;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(cbPais,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		llenarComboBoxPais();
		cbPais.addActionListener(
				e -> {
					llenarComboBoxProvincias((PaisDTO) cbPais.getSelectedItem());
				}
		);
		
		lblProvincia = new JLabel("Provincia (*)");
		gbc.gridx = 3;
		gbc.gridy = 6;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblProvincia,gbc);
		
		cbProvincia = new JComboBox<ProvinciaDTO>();
		gbc.gridx = 4;
		gbc.gridy = 6;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(cbProvincia,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
	/*	llenarComboBoxProvincias((PaisDTO) cbPais.getSelectedItem());
		cbProvincia.setSelectedIndex(19);
		cbProvincia.addActionListener(
				e -> {
					llenarComboBoxLocalidades((ProvinciaDTO) cbProvincia.getSelectedItem());
				}
		);*/
		
		lblLocalidad = new JLabel("Localidad (*)");
		gbc.gridx = 0;
		gbc.gridy = 7;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblLocalidad,gbc);
		
		cbLocalidad = new JComboBox<LocalidadDTO>();
		gbc.gridx = 1;
		gbc.gridy = 7;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(cbLocalidad, gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		//llenarComboBoxLocalidades((ProvinciaDTO) cbProvincia.getSelectedItem());

		lblCodigoPostal = new JLabel("C\u00F3digo Postal (*)");
		gbc.gridx = 3;
		gbc.gridy = 7;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblCodigoPostal,gbc);
		
		txtCodPostal = new JTextField();
		txtCodPostal.setEditable(false);
		gbc.gridx = 4;
		gbc.gridy = 7;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(txtCodPostal,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblTelefono = new JLabel("Tel\u00E9fono (*)");
		gbc.gridx = 0;
		gbc.gridy = 8;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblTelefono,gbc);
		
		txtTelefono = new JTextField();
		((AbstractDocument) txtTelefono.getDocument()).setDocumentFilter(filter);
		gbc.gridx = 1;
		gbc.gridy = 8;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(txtTelefono,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblEmail = new JLabel("Email");
		gbc.gridx = 3;
		gbc.gridy = 8;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblEmail,gbc);
		
		txtEmail = new JTextField();
		((AbstractDocument) txtEmail.getDocument()).setDocumentFilter(filter);
		gbc.gridx = 4;
		gbc.gridy = 8;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(txtEmail,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblOcupacion = new JLabel("Ocupaci\u00F3n (*)");
		gbc.gridx = 0;
		gbc.gridy = 9;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblOcupacion,gbc);
		
		cbOcupacion = new JComboBox<ProfesionDTO>();
		gbc.gridx = 1;
		gbc.gridy = 9;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(cbOcupacion, gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		lblNacionalidad = new JLabel("Nacionalidad (*)");
		gbc.gridx = 3;
		gbc.gridy = 9;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(lblNacionalidad,gbc);
		
		txtNacionalidad = new JTextField();
		((AbstractDocument) txtNacionalidad.getDocument()).setDocumentFilter(filter);
		gbc.gridx = 4;
		gbc.gridy = 9;
		gbc.gridwidth = 2;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		gbc.weightx = 1.0;
		gbc.fill = GridBagConstraints.HORIZONTAL;
		this.add(txtNacionalidad,gbc);
		gbc.weightx = 0.0;
		gbc.fill = GridBagConstraints.NONE;
		
		btnSiguiente = new JButton("Siguiente");
		gbc.gridx = 4;
		gbc.gridy = 10;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(btnSiguiente,gbc);
		
		btnCancelar = new JButton("Cancelar");
		gbc.anchor = GridBagConstraints.WEST;
		gbc.gridx = 5;
		gbc.gridy = 10;
		gbc.gridwidth = 1;
		gbc.gridheight = 1;
		gbc.insets = new Insets(10, 10, 10, 10);
		this.add(btnCancelar,gbc);
		gbc.anchor = GridBagConstraints.CENTER;
		
/*		//Acciones de los botones
		
		//Botón Siguiente
		//Validamos los campos
		btnSiguiente.addActionListener(l ->{
			CamposVacios();
		});
		
		
		
		//Botón cancelar
		btnCancelar.addActionListener(e -> 
		{
			Object[] opciones = {"No", "Sí"};
			
			if 
			(	
				opciones
				[JOptionPane.showOptionDialog(
					AltaPasajero.this, 
					"¿Desea cancelar la operación?", 
					"", 
					JOptionPane.DEFAULT_OPTION, 
					JOptionPane.QUESTION_MESSAGE, 
					null, 
					opciones,
					opciones[0]
				)] == opciones[1]
			)
				this.setVisible(false);
				
			
			// TODO: volver al menu anterior
		});*/
	}

	private void llenarComboBoxLocalidades(ProvinciaDTO selectedItem) {
		List<LocalidadDTO> listaLocalidades = selectedItem.getLocalidades();
		cbLocalidad.removeAllItems();
		listaLocalidades.sort((t1,t2) -> t1.getNombre().compareTo(t2.getNombre()));
		for(LocalidadDTO unaLocalidad : listaLocalidades) {
			cbLocalidad.addItem(unaLocalidad);
		}
	}

	private void llenarComboBoxProvincias(PaisDTO selectedItem) {
		List<ProvinciaDTO> listaProvincias = selectedItem.getProvincias();
		cbProvincia.removeAllItems();
		listaProvincias.sort((t1,t2) -> t1.getNombre().compareTo(t2.getNombre()));
		for(ProvinciaDTO unaProvincia : listaProvincias) {
			cbProvincia.addItem(unaProvincia);
		}
	}

	private void llenarComboBoxPais() {
		List<PaisDTO> listaPaises = gestorGeografico.getUbicaciones();
		cbPais.removeAllItems();
		listaPaises.sort((t1,t2) -> t1.getNombre().compareTo(t2.getNombre()));
		for(PaisDTO unPais : listaPaises) {
			cbPais.addItem(unPais);
		}
	}

	private void llenarComboBoxTipoDocumentos() {
		List<TipoDocumentoDTO> listaDoc = gestorPersona.getTiposDocumentos();
		cbTipoDocumento.removeAllItems();
		listaDoc.sort((t1,t2) -> t1.getNombre().compareTo(t2.getNombre()));
		for(TipoDocumentoDTO unTipoDoc : listaDoc) {
			cbTipoDocumento.addItem(unTipoDoc);
		}
	}
	
	protected void CamposVacios() {
		if(txtApellido.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo Apellido es requerido.");
		}
		if(txtNombre.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo Nombre es requerido.");
		}
		//VER ESTO, NO FUNCIONA
		if(cbTipoDocumento.getSelectedItem()== null) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "Debe seleccionar un Tipo de Documento. Es campo requerido.");
		}
		if(txtNroDocumento.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo Número de Documento es requerido.");
		}
		//VER ESTO, NO FUNCIONA
		
		if(cbPosFrenteIVA.getSelectedItem()== null) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "Debe seleccionar una Posición en IVA. Es campo requerido.");
		}
		
		if(txtCuit.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo CUIT es requerido.");
		}
		//VER FECHA NACIMIENTO
//		if(dateChooser.getDate() == null) {
//			JOptionPane.showMessageDialog(AltaPasajero.this, "Debe seleccionar una Posición en IVA. Es campo requerido.");
//		}
		if(txtCalle.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo Calle es requerido.");
		}
		if(txtNumero.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo Número es requerido.");
		}
		//VER NO FUNCIONA
		if(cbPais.getSelectedItem()== null) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "Debe seleccionar un País. Es campo requerido.");
		}
/*		if(txtProvincia.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo Provincia es requerido.");
		}
		if(txtLocalidad.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo Localidad es requerido.");
		}*/
		if(txtCodPostal.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo Código Postal es requerido.");
		}
		if(txtTelefono.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo Telefono es requerido.");
		}
		if(txtNumero.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo Número de Teléfono es requerido.");
		}
/*		if(txtOcupacion.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo Ocupación es requerido.");
		}*/
		if(txtNacionalidad.getText().isBlank()) {
			JOptionPane.showMessageDialog(AltaPasajero.this, "El campo Nacionalidad es requerido.");
		}
	}
}
