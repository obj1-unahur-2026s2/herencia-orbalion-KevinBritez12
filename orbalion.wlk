class Equipos {
    const nombre
    var nivelDeEnergiaBase
    var entrenador
    var tecnologiasComplementarias = []
    method energiaTotal() = self.energiaBase() + tecnologiasComplementarias.filter({t=>t.estaActiva()}).sum({t=>t.valorEnergetico()})
    method energiaBase()=nivelDeEnergiaBase
    method esDePrestigioUniversal()
}
class Luminicos inherits Equipos {
 var nivelRadiacion 
 var cristalesSolares
 override method energiaTotal() = if(nivelRadiacion < 5000) super() * 1.1 else super()
 override method esDePrestigioUniversal() = cristalesSolares >= 3 && entrenador.esDeEliteGalactica() && tecnologiasComplementarias.filter({t=>t.estaActiva()}).size()>=1
}
class Sinteticos inherits Equipos {
   const nivelProcesamientoCentral
   const cantidadModulos
   var estaCertificado = true
   override method energiaTotal() = if(cantidadModulos > 5) super() * 0.8 else super()
   override method esDePrestigioUniversal() = estaCertificado && cantidadModulos > 3 && tecnologiasComplementarias.all({t=>t.estaActiva()})
   method caambiarEstado(nuevoEstado){ estaCertificado = nuevoEstado}
}
class Etericos inherits Equipos {
    const nivelFluctuacionDimencional
    const cantidadPortalesAbiertos
   override method esDePrestigioUniversal()=nivelFluctuacionDimencional > 75 && cantidadPortalesAbiertos >= 2 && tecnologiasComplementarias.filter({t=>t.estaActiva()}).size() >= 2
   override method energiaTotal() = if(self.esDePrestigioUniversal())super()* 1.15 else super()
}
class Entrenadores {
    const cantidadCiclosSolares
    var estaEnSintonia
    const nivelPrecision 
    var rol 
    const condicionesAdicionales = []
    method estaHomologado(unRol) = ["Estratega Cuantico","Arquitecto De Energia","Guia Mental"].contains(unRol)
    method cambiarRol(nuevoRol) = if(not self.estaHomologado(nuevoRol)) self.error("Rol no homologado por la FOZ") else rol = nuevoRol
    method esDeEliteGalactica() = cantidadCiclosSolares > 10 && self.cumpleSegunSuRol(rol)
    method cumpleSegunSuRol(unRol) = if(unRol == "Estratega Cuantico") nivelPrecision > 80 else if(unRol=="Arquitecto De Energia") estaEnSintonia else if(unRol == "Guia Mental") condicionesAdicionales.size() == 0 else false
    method estaEnSintonia()= estaEnSintonia
    method cambiarEstado(nuevoEstado){estaEnSintonia = nuevoEstado }
}
class Tecnologias {
    const nombre
    var valorEnergetico
    var activa 
    method estaActiva()=activa
    method valorEnergetico()=valorEnergetico
}