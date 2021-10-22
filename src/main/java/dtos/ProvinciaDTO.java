package dtos;

import java.util.List;

public class ProvinciaDTO {
	private int id;
	private String nombre;
	private List<LocalidadDTO> localidades;

	public ProvinciaDTO(int id, String nombre, List<LocalidadDTO> localidades) {
		this.id = id;
		this.nombre = nombre;
		this.localidades = localidades;
	}

	public int getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}

	public List<LocalidadDTO> getLocalidades(){
		return localidades;
	}

	@Override
	public String toString() {
		return this.nombre;
	}
}
