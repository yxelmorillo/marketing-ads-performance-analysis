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

## Evidencia Visual

![Tabla de inversión y clics](images/marketing-investment-trend-table.png)

Esta tabla muestra la relación entre la inversión anual en marketing y el crecimiento de clics.  
Sirve como evidencia para analizar si los aumentos de presupuesto estuvieron acompañados por una mejora proporcional o superior en performance.

---

### 2. Campañas recomendadas para mayor inversión

**Pregunta de negocio:**  
¿En qué campañas conviene invertir más según CTR, CPC, clics, estado de campaña y participación del presupuesto?

**Dashboard:**  
[Ver Dashboard 2 - Decisión de inversión por campaña](https://datastudio.google.com/s/kqm1veof1H4)

## Evidencia Visual

#### 2.1 Vista general de costo y performance por campaña

![Vista general de costo por campaña 2025](images/campaign-cost-overview-2025.png)

Esta tabla muestra una vista general de la performance de las campañas y el gasto anual.  
Compara campañas usando clics, CTR, estado de campaña, costo total, participación del presupuesto, costo por clic y ranking de costos.

Esta primera vista ayuda a entender cómo se distribuyó el presupuesto entre campañas antes de tomar una recomendación de inversión.

#### 2.2 Campañas recomendadas para mayor inversión

![Campañas recomendadas para mayor inversión top 5](images/campaign-investment-recommendations-top5.png)

Esta tabla muestra las cinco campañas recomendadas para recibir mayor inversión.  
La recomendación se basa en una combinación de CTR, CPC, clics totales, estado de campaña, costo y porcentaje que representa sobre el presupuesto total.

El objetivo no es invertir más solamente en campañas con alto volumen, sino identificar campañas que muestran un mejor equilibrio entre performance, eficiencia y potencial de escalamiento.

---

### 3. Mejores campañas de 2025

**Pregunta de negocio:**  
¿Cuáles fueron las mejores campañas de 2025 según su objetivo y eficiencia?

**Dashboard:**  
[Ver Dashboard 3 - Mejores campañas de 2025](https://datastudio.google.com/s/hCU4Dfa7BEs)

## Evidencia Visual

### 3. Mejores campañas de 2025 según objetivo y eficiencia

#### 3.1 Vista general de performance de campañas

![Vista general de campañas 2025](images/campaigns-2025-performance-overview.png)

Esta tabla muestra una vista general de la performance de campañas de 2025, incluyendo inversión, alcance, clics al enlace y costo por clic.

Esta primera vista permite comparar las campañas a nivel general antes de separarlas según su objetivo.

#### 3.2 Mejores campañas enfocadas en alcance

![Mejores campañas de alcance 2025](images/best-reach-campaigns-2025.png)

Esta tabla identifica las campañas más fuertes cuyo objetivo principal fue el alcance.

Estas campañas fueron evaluadas según el balance entre alcance, nivel de inversión y eficiencia de costo.  
El objetivo fue identificar campañas que generaron buena visibilidad sin requerir una inversión desproporcionadamente alta.

#### 3.3 Mejores campañas enfocadas en clics

![Mejores campañas de clics 2025](images/best-clics-campaigns-2025.png)

Esta tabla identifica las campañas más fuertes cuyo objetivo principal fue generar clics al enlace o interacción.

Estas campañas fueron evaluadas según clics al enlace, CPC, nivel de inversión y generación de tráfico.  
El objetivo fue identificar campañas que generaron tráfico de forma eficiente.

Este enfoque evita comparar todas las campañas con la misma regla y permite tomar mejores decisiones de asignación de presupuesto.

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
