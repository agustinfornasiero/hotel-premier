package gestores;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import daos.factories.GeograficoFactoryDao;
import daos.factories.PersonaFactoryDao;
import daos.interfaces.GeograficoDao;
import daos.interfaces.PersonaDao;
import dominio.Localidad;
import dominio.Pasajero;
import dominio.PosicionFrenteIVA;
import dominio.Profesion;
import dominio.TipoDocumento;
import dtos.AltaPasajeroDTO;
import dtos.BusquedaPasajeroDTO;
import dtos.PasajeroDTO;
import dtos.PasajerosDTO;
import dtos.TipoDocumentoDTO;
import excepciones.DatosNoValidosException;
import excepciones.ExistePasajeroException;

public final class GestorPersona {
	private static GestorPersona instancia;
	private PersonaFactoryDao personaFactory;
	private PersonaDao personaDao;
	private GeograficoFactoryDao geograficoFactory;
	private GeograficoDao geograficoDao;

	private GestorPersona() {
	}

	public synchronized static GestorPersona getInstance() {
		if(instancia == null)
			instancia= new GestorPersona();
		return instancia;
	}

	public PasajerosDTO buscarPasajerosSegunCriterio(BusquedaPasajeroDTO busquedaDTO) {
		personaFactory = PersonaFactoryDao.getFactory(PersonaFactoryDao.POSTGRESQL_FACTORY);
		personaDao = personaFactory.getPersonaDAO();
		PasajerosDTO pasajerosDTO = null;
		List<Pasajero> pasajeros = personaDao.buscarPasajeros(busquedaDTO);
		if(pasajeros.size() != 0) pasajerosDTO = convertirApasajerosDTO(pasajeros);
		return pasajerosDTO;
	}

	private PasajerosDTO convertirApasajerosDTO(List<Pasajero> pasajeros) {
		List<PasajeroDTO> listaPasajeros = new ArrayList<PasajeroDTO>();
		for(Pasajero unPasajero : pasajeros) {
			int id = unPasajero.getId();
			String nombre = unPasajero.getNombre();
			String apellido = unPasajero.getApellido();
			String tipoDoc = unPasajero.getTipoDocumento().getNombre();
			String numDoc = unPasajero.getNumDocumento();
			listaPasajeros.add(new PasajeroDTO(id,nombre,apellido,tipoDoc,numDoc));
		}
		PasajerosDTO pasajerosDTO = new PasajerosDTO(listaPasajeros);
		return pasajerosDTO;
	}

	public void altaPasajero(AltaPasajeroDTO altaPasajeroDto, boolean validarExistencia) throws DatosNoValidosException, ExistePasajeroException {
		boolean datosValidos = validarDatos(altaPasajeroDto);
		if(!datosValidos) throw new DatosNoValidosException();
		personaFactory = PersonaFactoryDao.getFactory(PersonaFactoryDao.POSTGRESQL_FACTORY);
		personaDao = personaFactory.getPersonaDAO();
		geograficoFactory = GeograficoFactoryDao.getFactory(GeograficoFactoryDao.POSTGRESQL_FACTORY);
		geograficoDao = geograficoFactory.getGeograficoDAO();
		boolean existePasajero = false;
		if(validarExistencia) existePasajero = personaDao.existePasajeroConMismoTipoYnumeroDocumento(altaPasajeroDto.getTipoDocumentoID(), altaPasajeroDto.getDocumento());
		if(existePasajero) throw new ExistePasajeroException();
		Pasajero p = new Pasajero();
		p.setApellido(altaPasajeroDto.getApellido());
		p.setNombre(altaPasajeroDto.getNombre());
		TipoDocumento tipo = personaDao.getTipoDocumentoById(altaPasajeroDto.getTipoDocumentoID());
		p.setTipoDocumento(tipo);
		p.setNumDocumento(altaPasajeroDto.getDocumento());
		PosicionFrenteIVA posicion = personaDao.getPosicionFrenteIVAById(altaPasajeroDto.getPosicionFrenteIVAID());
		p.setPosicionFrenteIva(posicion);
		if(!altaPasajeroDto.getCuit().equals("")) p.setCuit(altaPasajeroDto.getCuit());
		p.setFechaNac(altaPasajeroDto.getFechaNacimiento());
		p.setCalle(altaPasajeroDto.getCalle());
		p.setNumero(altaPasajeroDto.getNumero());
		if(!altaPasajeroDto.getDepartamento().equals("")) p.setDepartamento(altaPasajeroDto.getDepartamento());
		if(!altaPasajeroDto.getNumero().equals("")) p.setNumero(altaPasajeroDto.getNumero());
		Localidad localidad = geograficoDao.getLocalidadById(altaPasajeroDto.getLocalidadID());
		p.setLocalidad(localidad);
		p.setTelefono(altaPasajeroDto.getTelefono());
		p.setNacionalidad(altaPasajeroDto.getNacionalidad());
		Profesion profesion = personaDao.getProfesiondById(altaPasajeroDto.getProfesionID());
		p.setProfesion(profesion);
		personaDao.save(p);
	}

	private boolean validarDatos(AltaPasajeroDTO altaPasajeroDto) {
		personaFactory = PersonaFactoryDao.getFactory(PersonaFactoryDao.POSTGRESQL_FACTORY);
		personaDao = personaFactory.getPersonaDAO();
		if(altaPasajeroDto.getApellido().equals("") || altaPasajeroDto.getNombre().equals("") || altaPasajeroDto.getTipoDocumentoID() == 0
				|| altaPasajeroDto.getDocumento().equals("") || altaPasajeroDto.getFechaNacimiento() == null || altaPasajeroDto.getCalle().equals("")
				|| altaPasajeroDto.getNumero().equals("") || altaPasajeroDto.getLocalidadID() == 0 || altaPasajeroDto.getTelefono().equals("")
				|| altaPasajeroDto.getProfesionID() == 0 || altaPasajeroDto.getNacionalidad().equals("")) return false;
		if(personaDao.getPosicionFrenteIVAById(altaPasajeroDto.getPosicionFrenteIVAID()).getNombre().equalsIgnoreCase("responsable inscripto")
				&& altaPasajeroDto.getCuit().equals("")) return false;
		if(altaPasajeroDto.getFechaNacimiento().isAfter(LocalDate.now())) return false;
		if(altaPasajeroDto.getApellido().length() > 50 || altaPasajeroDto.getNombre().length() > 50 || altaPasajeroDto.getDocumento().length() > 10
				|| altaPasajeroDto.getCuit().length() > 13 || altaPasajeroDto.getCalle().length() > 50 || altaPasajeroDto.getNumero().length() > 10
				|| altaPasajeroDto.getDepartamento().length() > 10 || altaPasajeroDto.getPiso().length() > 10 || altaPasajeroDto.getTelefono().length() > 30
				|| altaPasajeroDto.getEmail().length() > 70 || altaPasajeroDto.getNacionalidad().length() > 30) return false;
		if(!altaPasajeroDto.getEmail().equals("")) {
			Pattern pat = Pattern.compile("^[\\w-]+(\\.[\\w-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");   
		    Matcher mat = pat.matcher(altaPasajeroDto.getEmail());
		    if(!mat.find()) return false;
		}
		return true;
	}

	public List<TipoDocumentoDTO> getTiposDocumentos() {
		personaFactory = PersonaFactoryDao.getFactory(PersonaFactoryDao.POSTGRESQL_FACTORY);
		personaDao = personaFactory.getPersonaDAO();
		List<TipoDocumento> listaDocumentos = personaDao.getAllTipoDocumentos();
		List<TipoDocumentoDTO> listaDocumentosDTO = new ArrayList<TipoDocumentoDTO>();
		for(TipoDocumento tipo : listaDocumentos) {
			listaDocumentosDTO.add(new TipoDocumentoDTO(tipo.getId(), tipo.getNombre()));
		}
		return listaDocumentosDTO;
	}
}
