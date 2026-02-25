# 28MariangelesVictoriaHuertasAguilarEscuelaTestingFinal

## Descripción del Proyecto

Este proyecto consiste en la automatización de pruebas API utilizando Karate Framework sobre la API pública de Swagger Petstore.
La automatización valida el correcto funcionamiento de los endpoints de los módulos Store y User, verificando:

- Códigos de respuesta HTTP

- Estructura del cuerpo de respuesta (JSON)

- Datos esperados en escenarios positivos y negativos

- Manejo adecuado de errores

Se implementaron:

- Casos Happy Path (flujo exitoso)

- Casos Unhappy Path (validaciones negativas)

- Ejecución por tags

- Configuración centralizada mediante karate-config.js

---

##  Tecnologías Utilizadas

- Java
- Maven
- Karate Framework
- JUnit 5

---

##  Cómo Ejecutar
## Ejecutar todos los tests

- mvn clean test

## Ejecutar solo Happy Path

- mvn test -Dkarate.options="--tags @happy"

## Ejecutar solo Unhappy Path

- mvn test -Dkarate.options="--tags @unhappy"

## Ejecutar solo Store

- mvn test -Dkarate.options="--tags @store"

## Ejecutar solo User

- mvn test -Dkarate.options="--tags @user"

## Ejecutar solo User Happy Path

- mvn test -Dkarate.options="--tags @user --tags @happy"

## Ejecutar solo User Unhappy Path

- mvn test -Dkarate.options="--tags @user --tags @unhappy"

## REPORTES

Los reportes se generan automáticamente en:

target/karate-reports/karate....html
