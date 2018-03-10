# Preguntas adicionales de la rúbrica

***1. ¿Qué son los campos reservados de Odoo?***

Campos que el sistema genera de forma automática para poder tener en cada entidad una serie de propiedades y métodos útiles para la gestión en la base de datos.

***2. ¿Cómo redefinir el campo índice del modelo para que tenga adicionalmente una label y sea indexado en la base de datos?***

Añadiendo las etiquetas de:
```python
String="NombreDelLabel", index=True
```
