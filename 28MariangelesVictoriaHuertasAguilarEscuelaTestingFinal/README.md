# 28MariangelesVictoriaHuertasAguilarEscuelaTestingFinal

## Descripción del Proyecto

Proyecto de automatización de pruebas API utilizando Karate Framework sobre la API pública Swagger Petstore.

Se automatizaron los módulos:

- Store
- User

Incluye:

- Casos Happy Path
- Casos Unhappy Path
- Ejecución por tags
- Configuración centralizada con karate-config.js

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

## REPORTES

Los reportes se generan automáticamente en:

target/karate-reports/karate....html