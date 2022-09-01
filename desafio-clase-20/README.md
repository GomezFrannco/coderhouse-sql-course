# Desafío clase 20 (Sublenguaje TCL)

En el desafío de la clase 20 se han elegido 2 tablas para modificarlas y usar el sublenguaje TCL para acompañar los cambios.

La primer tabla elegida es CLIENT y en la cual se eliminan registros. (Además se modificó una tabla hija ya que, de lo contrario, obtendría un error al querer modificarla)
La siguiente tabla que elegí fue CARS. En esta tabla se insertaron 4 registros, se creó un primer SAVEPOINT y luego se crearon 4 registros más, con su respectivo SAVEPOINT también.

Se ha escrito un pequeño script en donde está el código TCL con su respectiva funcionalidad. El mismo se encuentra comentado y explicado para que, quien lo lea, pueda entender lo escrito en SQL.<a href="https://github.com/GomezFrannco/coderhouse-sql-course/blob/master/desafio-clase-20/TCL.sql"> Ver script.</a>