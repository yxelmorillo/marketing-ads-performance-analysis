# Análisis de Performance de Marketing Ads

🌐 Idiomas: [English](README.md) | [Español](README.es.md)

---

## Proyecto de Marketing Analytics orientado a Negocio

Este proyecto analiza el desempeño de campañas de publicidad digital para una empresa del rubro beauty/cosmetics utilizando SQL y Looker Studio.

El objetivo del análisis es entender cómo se comportaron las campañas de marketing, comparar canales de adquisición, identificar oportunidades de eficiencia y traducir los datos publicitarios en insights y recomendaciones de negocio.

> Nota: Este proyecto está basado en un caso real de negocio con datos anonimizados. La información sensible del cliente, identificadores de campañas y datos privados fueron removidos o generalizados para esta versión pública.

---

## Contexto de Negocio

La empresa invirtió en campañas de publicidad digital paga en plataformas como Google Ads y Meta/Facebook Ads.

Desde una perspectiva de negocio, el desafío no era solamente revisar métricas de campaña, sino entender:

- Qué campañas generaron mejor desempeño.
- Qué canales fueron más eficientes.
- Dónde se podía mejorar la asignación de presupuesto.
- Qué métricas eran realmente útiles para la toma de decisiones.
- Qué acciones podían mejorar el rendimiento futuro de marketing.

Este proyecto aborda el análisis desde una mirada estratégica y de negocio, no solamente desde una perspectiva técnica de SQL.

---

## Preguntas de Negocio

El análisis fue guiado por preguntas como:

1. ¿Qué campañas generaron la mayor cantidad de resultados?
2. ¿Qué campañas tuvieron mejor eficiencia de costo?
3. ¿Qué canal tuvo mejor desempeño: Google Ads o Meta/Facebook Ads?
4. ¿Cómo cambió el rendimiento de las campañas a lo largo del tiempo?
5. ¿Qué campañas o grupos de anuncios deberían recibir más presupuesto?
6. ¿Qué campañas mostraron bajo rendimiento y deberían revisarse?
7. ¿Qué recomendaciones pueden hacerse para mejorar la toma de decisiones de marketing?

---

## Herramientas Utilizadas

- SQL
- Google Sheets
- Looker Studio
- Métricas de marketing digital
- Análisis de negocio
- Diseño de dashboards
- Storytelling con datos

---

## Dataset

El dataset incluye información de publicidad digital relacionada con el desempeño de campañas.

Principales tipos de campos analizados:

- Nombre de campaña
- Canal / plataforma
- Fecha
- Impresiones
- Clics
- Costo
- Conversiones / resultados
- CTR
- CPC
- CPA / costo por resultado
- Tendencias de performance

Los campos sensibles fueron anonimizados o excluidos de la versión pública de este proyecto.

---

## Proceso de Análisis

El proyecto siguió este proceso:

1. Comprender el contexto del negocio.
2. Definir preguntas relevantes de marketing y negocio.
3. Revisar y limpiar el dataset.
4. Escribir queries SQL para responder preguntas de negocio.
5. Analizar performance por campaña, canal y costo.
6. Construir dashboards visuales en Looker Studio.
7. Extraer insights.
8. Traducir los hallazgos en recomendaciones de negocio.

---

## Métricas Clave

Las principales métricas analizadas fueron:

- Inversión total
- Impresiones
- Clics
- CTR
- CPC
- Conversiones / resultados
- CPA / costo por resultado
- Performance por campaña
- Performance por canal
- Evolución temporal

---

## Análisis SQL

El análisis SQL fue utilizado para responder preguntas de negocio relacionadas con:

- Ranking de performance por campaña
- Comparación entre canales
- Eficiencia de costos
- Performance de conversiones
- Tendencias por período
- Identificación de campañas con alto y bajo desempeño

Los archivos SQL estarán incluidos en la carpeta `/sql`.

---

## Dashboard

El dashboard fue creado en Looker Studio para comunicar los resultados visualmente y apoyar la toma de decisiones de negocio.

Secciones del dashboard:

- Resumen general de performance de marketing
- Performance por campaña
- Comparación entre canales
- Eficiencia de costos
- Tendencias en el tiempo
- Insights clave para tomadores de decisión

Link del dashboard en Looker Studio:

[Agrega aquí el link del dashboard de Looker Studio]

Las capturas del dashboard estarán incluidas en la carpeta `/images`.

---

## Insights Principales

Principales insights identificados durante el análisis:

1. [Agrega insight sobre la campaña con mejor desempeño]
2. [Agrega insight sobre eficiencia de costos]
3. [Agrega insight sobre comparación entre Google Ads y Meta/Facebook Ads]
4. [Agrega insight sobre tendencias de campaña]
5. [Agrega insight sobre asignación de presupuesto u optimización]

---

## Recomendaciones de Negocio

A partir del análisis, se recomiendan las siguientes acciones:

1. [Agrega recomendación relacionada con asignación de presupuesto]
2. [Agrega recomendación relacionada con optimización de campañas]
3. [Agrega recomendación relacionada con campañas de bajo rendimiento]
4. [Agrega recomendación relacionada con medición o reporting]
5. [Agrega recomendación relacionada con decisiones futuras de marketing]

---

## Estructura del Repositorio

```text
marketing-ads-performance-analysis/
│
├── README.md
├── README.es.md
│
├── sql/
│   ├── 01_business_questions.sql
│   ├── 02_data_cleaning.sql
│   └── 03_marketing_analysis.sql
│
├── dashboard/
│   └── looker_studio_link.md
│
├── images/
│   ├── dashboard_overview.png
│   ├── campaign_performance.png
│   └── channel_comparison.png
│
└── data/
    └── data_dictionary.md
