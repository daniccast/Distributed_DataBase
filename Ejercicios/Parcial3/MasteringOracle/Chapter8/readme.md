Resumen cápitulo OCHO.
Información recuperada de Mishra S., Beaulieu A. (2002). Chapter 8 Hierarchical Queries. en Mastering Oracle SQL (pp. 157-174).Gravenstein Highway North, Sebastopol, CA 95472. 		

# Chapter 8 Hierarchical Queries

## START WITH... CONNECT BY AND PRIOR.
En algunas ocasiones tendremos que utilizar operaciones especialmente diseñadas para trabajar con jerarquías, Oracle nos provee de estas extensiones.

Estás son:

* The START WITH...CONNECT BY clause
* The PRIOR operator
* The LEVEL pseudocolumn

Para extraer información podemos usar START WITH...CONNECT BY. Con la siguiente sintaxis.

```
[[START WITH condition1]
CONNECT BY condition2]
```
**STAR WITH.**
Especifica la fila raíz con la que empezaremos la operación.

**Connect By.**
Especifica la relación entre los nodos hijo y padre de la jerarquía.

**Prior.**
Es un operador que se usa en la cláusula connect by para denotar el nodo padre de la fila. Prácticamente es quien marca la dirección en la que se recorrerá el árbol (ascendente o descendente), según dónde lo coloquemos.

## The LEVEL Pseudocolumn

Devuelve el número de nivel en la jerarquía que tiene una fila. 
Ejemplo (Mishra y Beaulieu, 2002):
```
SELECT LEVEL, LNAME, EMP_ID, MANAGER_EMP_ID
FROM EMPLOYEE
START WITH MANAGER_EMP_ID IS NULL
CONNECT BY MANAGER_EMP_ID = PRIOR EMP_ID;

```
