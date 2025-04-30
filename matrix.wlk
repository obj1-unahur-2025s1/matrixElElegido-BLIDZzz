object nave {
  const property pasajeros = #{neo, morfeo, trinity}
  
  method cantidadPasajeros() = self.pasajeros().size()
  
  method estaVacia() = self.pasajeros().size() == 0
  
  method pasajeroMayorVitalidad() {
    if (self.estaVacia()) {
      return 0
    } else {
      self.pasajeros().map({ x => x.vitalidad() }).max()
    }
  }
  
  method pasajeroMenorVitalidad() {
    if (self.estaVacia()) {
      return 0
    } else {
      self.pasajeros().map({ x => x.vitalidad() }).min()
    }
  }
  
  method estaEquilibrada() = (self.pasajeroMenorVitalidad() * 2) < self.pasajeroMayorVitalidad()
  
  method hayElegido() = self.pasajeros().map({ x => x.esElegido() }).any(
    { x => true }
  )
  
  // method hayElegido() = neo.estoyEnLaNave()
  method choca() {
    self.pasajeros().forEach({ x => x.saltar() })
    pasajeros.clear()
  }
  
  method acelera() {
    self.pasajeros().filter({ x => not x.esElegido() }).forEach(
      { x => x.saltar() }
    )
  }
}

object neo {
  var property energia = 100
  
  method esElegido() = true
  // method estoyEnLaNave() = nave.pasajeros().any({x=> self})
  
  method vitalidad() = self.energia() / 10
  
  method salta() {
    self.energia(self.energia() / 2)
  }
}

object morfeo {
  var property estaDescansado = true
  // method estoyEnLaNave() = nave.pasajeros().any({x=> self})
  var property vitalidad = 8
  
  method esElegido() = false
  
  method salta() {
    if (self.vitalidad() > 0) {
      self.vitalidad(vitalidad - 1)
      
      self.estaDescansado(not self.estaDescansado())
    }
  }
}

object trinity {
  method vitality() = 0
  
  method esElegido() = false
  
  method saltar() {
    
    // equisde
  }
}