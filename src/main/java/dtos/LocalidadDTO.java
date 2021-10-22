package dtos;

public class LocalidadDTO {
	private int id;
	private String nombre;
	private String codigoPostal;

	public LocalidadDTO(int id, String nombre, String codigoPostal) {
		this.id = id;
		this.nombre = nombre;
		this.codigoPostal = codigoPostal;
	}

	public int getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}

	public String getCodigoPostal() {
		return codigoPostal;
	}

	@Override
	public String toString() {
		return this.nombre;
	}
}
