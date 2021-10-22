package daos.interfaces;

import java.util.List;
import dominio.Pasajero;
import dominio.PosicionFrenteIVA;
import dominio.Profesion;
import dominio.TipoDocumento;
import dtos.BusquedaPasajeroDTO;

public interface PersonaDao {
	public boolean existePasajeroConMismoTipoYnumeroDocumento(int tipoDocumentoID, String documento);
	public List<Pasajero> buscarPasajeros(BusquedaPasajeroDTO pasajeroDTO);
	public TipoDocumento getTipoDocumentoById(int tipoDocumentoID);
	public PosicionFrenteIVA getPosicionFrenteIVAById(int posicionFrenteIVAID);
	public Profesion getProfesiondById(int profesionID);
	public List<TipoDocumento> getAllTipoDocumentos();
	public int save(Pasajero pasajero);
}
