package dtos;

import java.util.List;

public class PaisDTO {
	private int id;
	private String nombre;
	private List<ProvinciaDTO> provincias;

	public PaisDTO(int id, String nombre, List<ProvinciaDTO> provincias) {
		this.id = id;
		this.nombre = nombre;
		this.provincias = provincias;
	}

	public int getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}

	public List<ProvinciaDTO> getProvincias(){
		return provincias;
	}

	@Override
	public String toString() {
		return this.nombre;
	}
}
