package daos.interfaces.implementaciones;

import java.util.List;
import javax.persistence.NoResultException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import daos.interfaces.PersonaDao;
import dominio.Pasajero;
import dominio.PosicionFrenteIVA;
import dominio.Profesion;
import dominio.TipoDocumento;
import dtos.BusquedaPasajeroDTO;
import util.HibernateUtil;

public class PersonaPostgreSQLDao implements PersonaDao {

	public PersonaPostgreSQLDao() {
	}

	@Override
	public boolean existePasajeroConMismoTipoYnumeroDocumento(int tipoDocumentoID, String documento) {
		Session session = HibernateUtil.getSession();
		Query<Pasajero> query = session.createQuery("SELECT p FROM Pasajero p WHERE p.tipoDocumento.id = :id and p.numDocumento = :doc", Pasajero.class);
		query.setParameter("id", tipoDocumentoID);
		query.setParameter("doc", documento);
		Pasajero pasajero = null;
		try {
			pasajero = query.getSingleResult();
		} catch (NoResultException e) {
		}
		return pasajero != null;
	}

	@Override
	public List<Pasajero> buscarPasajeros(BusquedaPasajeroDTO pasajeroDTO) {
		Session session = HibernateUtil.getSession();
		String consulta = "SELECT p FROM Pasajero p WHERE p.nombre like :nombre and p.apellido like :apellido ";
		if(!pasajeroDTO.getDocumento().equals("")) consulta += "and p.numDocumento = :doc ";
		if(pasajeroDTO.getTipoDocumentoID() != 0) consulta += "and p.tipoDocumento.id = :tipoDoc";
		Query<Pasajero >query = session.createQuery(consulta, Pasajero.class);
		query.setParameter("nombre", pasajeroDTO.getNombre()+"%");
		query.setParameter("apellido", pasajeroDTO.getApellido()+"%");
		if(!pasajeroDTO.getDocumento().equals("")) query.setParameter("doc", pasajeroDTO.getDocumento());
		if(pasajeroDTO.getTipoDocumentoID() != 0) query.setParameter("tipoDoc", pasajeroDTO.getTipoDocumentoID());
		List<Pasajero> pasajeros = query.list();
		return pasajeros;
	}

	@Override
	public TipoDocumento getTipoDocumentoById(int tipoDocumentoID) {
		Session session = HibernateUtil.getSession();
		TipoDocumento tipoDocumento = session.get(TipoDocumento.class, tipoDocumentoID);
		return tipoDocumento;
	}

	@Override
	public PosicionFrenteIVA getPosicionFrenteIVAById(int posicionFrenteIVAID) {
		Session session = HibernateUtil.getSession();
		PosicionFrenteIVA posicionFrenteIVA = session.get(PosicionFrenteIVA.class, posicionFrenteIVAID);
		return posicionFrenteIVA;
	}

	@Override
	public Profesion getProfesiondById(int profesionID) {
		Session session = HibernateUtil.getSession();
		Profesion profesion = session.get(Profesion.class, profesionID);
		return profesion;
	}

	@Override
	public List<TipoDocumento> getAllTipoDocumentos(){
		Session session = HibernateUtil.getSession();
		Query<TipoDocumento> query = session.createQuery("SELECT t FROM TipoDocumento t", TipoDocumento.class);
		List<TipoDocumento> tiposDoc = query.list();
		return tiposDoc;
	}

	@Override
	public int save(Pasajero pasajero) {
		Session session = HibernateUtil.getSession();
		session.beginTransaction();
		session.saveOrUpdate(pasajero);
		session.getTransaction().commit();
		return pasajero.getId();
	}
}
