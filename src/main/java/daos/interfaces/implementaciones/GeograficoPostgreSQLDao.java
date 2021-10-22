package daos.interfaces.implementaciones;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.query.Query;
import daos.interfaces.GeograficoDao;
import dominio.Localidad;
import dominio.Pais;
import dominio.Provincia;
import util.HibernateUtil;

public class GeograficoPostgreSQLDao implements GeograficoDao {

	public GeograficoPostgreSQLDao() {
	}

	@Override
	public Localidad getLocalidadById(int localidadID) {
		Session session = HibernateUtil.getSession();
		Localidad localidad = session.get(Localidad.class, localidadID);
		return localidad;
	}

	@Override
	public List<Pais> getPaises() {
		Session session = HibernateUtil.getSession();
		Query<Pais> query = session.createQuery("SELECT p FROM Pais p", Pais.class);
		List<Pais> paises = query.list();
		return paises;
	}

	@Override
	public List<Provincia> getProvinciasByIdPais(int paisID) {
		Session session = HibernateUtil.getSession();
		Query<Provincia> query = session.createQuery("SELECT pr FROM Provincia pr WHERE pr.pais.id = :id", Provincia.class);
		query.setParameter("id", paisID);
		List<Provincia> provincias = query.list();
		return provincias;
	}

	@Override
	public List<Localidad> getLocalidadesByIdProvincia(int provinciaID) {
		Session session = HibernateUtil.getSession();
		Query<Localidad> query = session.createQuery("SELECT l FROM Localidad l WHERE l.provincia.id = :id", Localidad.class);
		query.setParameter("id", provinciaID);
		List<Localidad> localidades = query.list();
		return localidades;
	}
}
