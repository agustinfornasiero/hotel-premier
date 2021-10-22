package gestores;

import java.util.ArrayList;
import java.util.List;
import daos.factories.GeograficoFactoryDao;
import daos.factories.PersonaFactoryDao;
import daos.interfaces.GeograficoDao;
import dominio.Localidad;
import dominio.Pais;
import dominio.Provincia;
import dtos.LocalidadDTO;
import dtos.PaisDTO;
import dtos.ProvinciaDTO;


public final class GestorGeografico {
	private static GestorGeografico instancia;
	private GeograficoFactoryDao geograficoFactory;
	private GeograficoDao geograficoDao;
	
	private GestorGeografico() {
	}

	public synchronized static GestorGeografico getInstance() {
		if(instancia == null)
			instancia= new GestorGeografico();
		return instancia;
	}

	public List<PaisDTO> getUbicaciones() {
		geograficoFactory = GeograficoFactoryDao.getFactory(PersonaFactoryDao.POSTGRESQL_FACTORY);
		geograficoDao = geograficoFactory.getGeograficoDAO();
		List<Pais> listaPaises = geograficoDao.getPaises();
		List<PaisDTO> listaPaisesDTO = new ArrayList<PaisDTO>();
		for(Pais pais : listaPaises) {
			List<Provincia> listaProvincias = pais.getProvincias();
			List<ProvinciaDTO> listaProvinciasDTO = new ArrayList<ProvinciaDTO>();
			for(Provincia provincia : listaProvincias) {
				List<Localidad> listaLocalidades = provincia.getLocalidades();
				List<LocalidadDTO> listaLocalidadesDTO = new ArrayList<LocalidadDTO>();
				for(Localidad localidad : listaLocalidades)
					listaLocalidadesDTO.add(new LocalidadDTO(localidad.getId(), localidad.getNombre(), localidad.getCodigoPostal()));
				listaProvinciasDTO.add(new ProvinciaDTO(provincia.getId(),provincia.getNombre(), listaLocalidadesDTO));
			}
			listaPaisesDTO.add(new PaisDTO(pais.getId(), pais.getNombre(), listaProvinciasDTO));
		}
		return listaPaisesDTO;
	}
}
