package dtos;

public class TipoDocumentoDTO {
	private int id;
	private String nombre;

	public TipoDocumentoDTO(int id, String nombre) {
		this.id = id;
		this.nombre = nombre;
	}

	public int getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}
}
