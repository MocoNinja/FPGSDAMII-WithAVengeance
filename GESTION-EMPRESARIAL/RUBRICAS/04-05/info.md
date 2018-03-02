#Clausulas del *ondelete* de Odoo
---

* ```RESTRICT```: Evita que se borre la fila referenciada
* ```NO ACTION```: Si existen filas referenciadas, se lanza un error (comportamiento por defecto)
* ```CASCADE```: Si existen filas referenciadas, se borran todas.
* ```SET NULL```: Si existen filas referenciadas, se establecen a *null*
* ```SET DEFAULT```: Si existen filas referenciadas, se establecen al *valor por defecto*
