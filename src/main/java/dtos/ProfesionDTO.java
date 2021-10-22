package dtos;

public class ProfesionDTO {
	private int id;
	private String nombre;

	public ProfesionDTO(int id, String nombre) {
		this.id = id;
		this.nombre = nombre;
	}

	public int getId() {
		return id;
	}

	public String getNombre() {
		return nombre;
	}

	@Override
	public String toString() {
		return this.nombre;
	}
}
