class Bicicleta {
	var property rodado
	var property largo
	var property marca
	var property accesorios = []
	
	method altura(){return rodado * 2.5 + 15}
	method velocidadCrucero(){return if (largo > 120) rodado + 6 else rodado + 2}
	method carga(){
		return accesorios.sum({accesorio => accesorio.carga()})
	}
	method peso(){
		return rodado/2 + accesorios.sum({accesorio => accesorio.peso()})
	}
	method tieneLuz(){
		return accesorios.any({accesorio => accesorio.esLuminoso()})
	}
	
	method cantidadDeAccesoriosLivianos(){
		return accesorios.count({accesorio => accesorio.peso() < 1})
	}
}

/*Punto 5: Para agregar un nuevo tipo de accesorio, hay que crear un nuevo objeto teniendo en cuenta que debe
 * contar con los mismos metodos para mantener el poliformismo. Para el caso del porta-botellitas
 * 
 * object porta-botellitas{
 * 	var property largo
 *  var property peso
 * 	var property carga
 * 
 * 	method peso(){return peso}
	method carga(){return carga}
	method esLuminoso(){return false}
 * }
 */