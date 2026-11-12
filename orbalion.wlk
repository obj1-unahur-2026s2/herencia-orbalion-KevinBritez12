class Equipos {
    const nombre
    var nivelDeEnergiaBase
    var entrenador
    var tecnologiasComplementarias = []
    method energiaTotal() = self.energiaBase() + tecnologiasComplementarias.filter({t=>t.estaActiva()}).sum({t=>t.valorEnergetico()})
    method energiaBase()=nivelDeEnergiaBase
}
class Luminicos inherits Equipos {
 var nivelRadiacion 
 var cristalesSolares=[] 
 override method energiaTotal() = if(nivelRadiacion < 5000) super() * 1.1 else super()
}
class Sinteticos inherits Equipos {
   const nivelProcesamientoCentral
   const cantidadModulos
   method estanCertificados(){}
   override method energiaTotal() = if(cantidadModulos > 5) super() * 0.8 else super()
}
class Etericos inherits Equipos {
    const nivelFluctuacionDimencional
    const cantidadPortalesAbiertos
}
class Entrenadores {
    const cantidadCiclosSolares
    var estaEnSintonia
    const nivelPrecision 
    var rol 
    method estaHomologado(unRol) = ["Estratega Cuantico","Arquitecto De Energia","Guia Mental"].contains(unRol)
    method cambiarRol(nuevoRol) = if(not self.estaHomologado(nuevoRol)) self.error("Rol no homologado por la FOZ") else rol = nuevoRol
}
class Tecnologias {
    const nombre
    var valorEnergetico
    var activa 
    method estaActiva()=activa
    method valorEnergetico()=valorEnergetico
}