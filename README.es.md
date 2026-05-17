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

## Dashboards

El proyecto incluye tres dashboards en Looker Studio, cada uno conectado a una pregunta específica de negocio.

### 1. Eficiencia de inversión en marketing a lo largo del tiempo

**Pregunta de negocio:**  
¿Las campañas están gastando de forma eficiente a lo largo del tiempo o el crecimiento del presupuesto no está generando una mejora proporcional en performance?

**Dashboard:**  
[Ver Dashboard 1 - Eficiencia de inversión en marketing](https://datastudio.google.com/s/qabtK41N-C0)

---

### 2. Campañas recomendadas para mayor inversión

**Pregunta de negocio:**  
¿En qué campañas conviene invertir más según CTR, CPC, clics, estado de campaña y participación del presupuesto?

**Dashboard:**  
[Ver Dashboard 2 - Decisión de inversión por campaña](https://datastudio.google.com/s/kqm1veof1H4)

---

### 3. Mejores campañas de 2025

**Pregunta de negocio:**  
¿Cuáles fueron las mejores campañas de 2025 según su objetivo y eficiencia?

**Dashboard:**  
[Ver Dashboard 3 - Mejores campañas de 2025](https://datastudio.google.com/s/hCU4Dfa7BEs)

---

> Si algún link del dashboard es privado o tiene acceso restringido, las capturas estarán incluidas abajo y en la carpeta `/images`.

---
## Insights Principales

Principales insights identificados durante el análisis:

1. **La inversión en marketing aumentó de forma significativa a lo largo del tiempo.**  
   El análisis mostró un crecimiento importante de la inversión anual. En 2025, la inversión creció aproximadamente un 77% en comparación con 2024.

2. **El aumento de inversión estuvo acompañado por una mejora fuerte en clics durante 2025.**  
   Aunque el gasto aumentó considerablemente, los clics crecieron aproximadamente un 111% frente al año anterior. Esto sugiere que el presupuesto adicional no necesariamente fue desperdiciado, ya que el crecimiento de clics superó el crecimiento de inversión.

3. **La decisión de invertir más en una campaña no debe basarse solamente en clics totales.**  
   El análisis tomó en cuenta CTR, CPC, clics, estado de campaña, costo y participación del presupuesto para identificar campañas con mayor potencial de inversión.

4. **La mejor campaña depende del objetivo de la campaña.**  
   Las campañas orientadas a alcance y las campañas orientadas a clics no deben evaluarse con la misma regla. El análisis separó las campañas por objetivo para identificar mejores performers de forma más justa.

5. **La asignación de presupuesto debe revisarse de forma continua.**  
   Algunas campañas pueden justificar mayor inversión, pero el escalamiento debe monitorearse para evitar aumentos de CPC o pérdida de eficiencia.
---

## Recomendaciones de Negocio

A partir del análisis, se recomiendan las siguientes acciones:

1. **Aumentar presupuesto de forma gradual en campañas con señales fuertes de eficiencia.**  
   Las campañas con buen CTR, bajo CPC, buen volumen de clics y estado activo deberían considerarse para inversión adicional.

2. **Evitar aumentar presupuesto solo porque una campaña tiene alto volumen.**  
   Tener muchos clics o mucho alcance no es suficiente. La campaña también debe mostrar eficiencia de costo y alineación con su objetivo.

3. **Separar la evaluación según el objetivo de campaña.**  
   Las campañas de alcance deben evaluarse principalmente por alcance, eficiencia de inversión y balance de costo. Las campañas enfocadas en clics deben evaluarse por clics al enlace, CPC y generación de tráfico.

4. **Monitorear CPC y performance después de escalar inversión.**  
   Antes de aumentar presupuesto de forma agresiva, las campañas deben monitorearse para confirmar que la mayor inversión no reduzca la eficiencia.

5. **Usar el dashboard como herramienta recurrente de decisión.**  
   El dashboard de Looker Studio debería utilizarse para revisar periódicamente inversión, clics, CTR, CPC y performance de campañas.
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
