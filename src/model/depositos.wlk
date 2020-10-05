import bicicletas.*

class Deposito {
	
	var property coleccion = []
	
	method agregarAlDeposito(unaBici){
		coleccion.add(unaBici)
	}
	
	method bicisRapidas() {
		return coleccion.filter({bici => bici.velocidadCrucero() > 25}).asSet()
	}
	
	method marcas(){
		return coleccion.map({bici => bici.marca()}).asSet()
	}
	
	method esNocturno(){
		return coleccion.all({bici => bici.tieneLuz()})
	}
	
	method puedeLlevarPeso(unPeso){
		return coleccion.any({bici => bici.carga() > unPeso})
	}
	
	method marcaDeBiciMasRapida(){
		return coleccion.max({bici => bici.velocidadCrucero()}).marca()
	}
	
	method cargaTotalDeBicisLargas(){
		return coleccion.filter({bici => bici.largo() > 170}).sum({bici => bici.carga()})
	}
	
	method bicisSinAccesorios(){
		return coleccion.count({bici => bici.accesorios().isEmpty()})
	}
	
	method diferenciaDeLargos(bici1, bici2){
		return if (bici1.largo() > bici2.largo()) {bici1.largo() - bici2.largo()} else {bici2.largo() - bici1.largo()}
	}
	
	method sonCompanieras(bici1, bici2){
		var companieras = false
		if(bici1 != bici2 and (self.diferenciaDeLargos(bici1, bici2) > 10)){
			companieras = true
		}
		return companieras
	}
	
	method companierasEnDepositoDe(unaBici){
		return coleccion.forEach({bici => self.sonCompanieras(bici, unaBici)}).asSet()
	}
}
