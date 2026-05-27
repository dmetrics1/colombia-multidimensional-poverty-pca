N° 44

Sep - dic  2021

Perspectiva multidimensional de la pobreza
en los hogares colombianos

Multidimensional Perspective of Poverty in Colombian Households

Edith Johana Medina-Hernández1
Universidad de Salamanca, Salamanca, España

edith.medina@usal.es

https://orcid.org/0000-0003-4207-0333

Luis Francisco Sierra-Ibáñez2
Colegio Salesiano San Pedro Claver de Cartagena, Cartagena, Colombia

luis.sierra@salesianoscartagena.edu.co

https://orcid.org/0000-0003-4745-8978

Andy Rafael Domínguez-Monterrosa3
Universidad Tecnológica de Bolívar, Cartagena, Colombia

adominguez@utb.edu.co

https://orcid.org/0000-0002-5274-7443

1  Magíster en Análisis Avanzado de Datos Multivariantes.

2  Magíster en Estadística Aplicada.

3  Magíster en Matemáticas Aplicadas.

Recibido: 07-11-2020
Aceptado: 26-02-2021
Publicado: 01-09-2021

2

Resumen
En este estudio, se analizan los últimos datos del Índice de Pobreza Multidimensional (IPM) en Colombia,
publicados por el Departamento Administrativo Nacional de Estadística (DANE); examinando privaciones en
los hogares del país y variables sociodemográficas de las personas que los integran. Se busca caracterizar
los factores condicionantes de la pobreza según regiones, a través de un análisis cuantitativo de carácter
descriptivo y mediante la aplicación de la técnica multivariante: Análisis de Componentes Principales (PCA).
Los resultados obtenidos muestran que variables como el número de integrantes del hogar, su logro edu-
cativo y el acceso al empleo formal, determinan diferencias considerables entre los hogares considerados
como pobres y no pobres. Adicionalmente, se observa preponderancia de circunstancias de pobreza en las
regiones costeras del país y la región amazónica.

Palabras clave: pobreza; análisis multivariado; investigación demográfica; política pública.

Clasificación JEL: I32, C30, C65, J11, I38.

Abstract
This  study  analyzes  the  latest  data  of  the  Multidimensional  Poverty  Index  (IPM)  in  Colombia,  published
by  the  National  Administrative  Department  of  Statistics  (DANE);  examining  deprivations  in  the  country’s
households and sociodemographic variables of the people who are part of them. The aim is to characterize
the conditioning factors of poverty according to regions, through a descriptive quantitative analysis and by
applying  the  multivariate  technique:  Principal  Component  Analysis  (PCA).  The  results  obtained  show  that
variables  such  as  the  number  of  household  members,  their  educational  attainment  and  access  to  formal
employment  determine  considerable  differences  between  households  considered  poor  and  non-poor.  In
addition, a preponderance of poverty circumstances is observed in the coastal regions of the country and
the Amazon region.

Keywords: poverty; multivariate analysis; demographic research; public policy.

JEL Classification: I32, C30, C65, J11, I38.

Financiación
Este trabajo no tuvo ningún tipo de financiamiento institucional.

Conflicto de interés
Los autores declaran no tener ningún conflicto de interés en la publicación de este artículo.

Este trabajo está bajo la licencia Atribución-No-Comercial 4.0
Internacional

¿Cómo citar este artículo?
Medina-Hernández, E. J., Sierra-Ibáñez, L. F. y Domínguez-Monterrosa, A. R. (2021). Perspectiva
multidimensional  de  la  pobreza  en  los  hogares  colombianos.  Sociedad  y  economía,  (44),
e10310734. https://doi.org/10.25100/sye.v0i44.10734

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Edith Johana Medina-Hernández, Luis Francisco Sierra-Ibáñez y Andy Rafael Domínguez-Monterrosa3

1. Introducción

¿Por  qué  estudiar  los  factores  o  condiciones
que  determinan  la  pobreza  asumiendo  que
es  un  fenómeno  multidimensional?,  ¿por  qué
hacerlo analizando los hogares colombianos?,
y ¿por qué buscar si existen diferencias esta-
dísticamente significativas por regiones? Estas
son las preguntas articuladoras por responder
para contextualizar esta investigación.

La pobreza es un fenómeno social, y específi-
camente en el contexto de los países latinoa-
mericanos, o de todos los países en vía de de-
sarrollo,  afecta  la  economía  de  las  naciones.
Munévar (2019) afirma al respecto: “la pobreza
y exclusión social de los países latinoamerica-
nos es un problema persistente en el contexto
de la economía mundial” (p. 1). Por ello, es im-
portante entender las posibles causas y conse-
cuencias de esta problemática que afecta a la
economía doméstica.

En la mayoría de los países latinoamericanos,
la  población  tiene  elevados  índices  de  priva-
ción en el acceso a condiciones adecuadas de
empleabilidad  formal,  alimentación,  servicios
de salud y educación, que llevan a las personas
a  ser  consideradas  pobres.  Esta  condición  no
significa únicamente tener limitaciones econó-
micas  o  ingresos  básicos  de  subsistencia  por
encima de cierto umbral, porque, como especi-
fican Gamboa et al. (2020), “la pobreza se con-
ceptualiza  cada  vez  más  como  un  fenómeno
que  implica  la  privación  en  diferentes  dimen-
siones” (p. 1).

Tejero-Pérez  (2018),  analizando  la  relación
existente  entre  la  pobreza  y  el  acceso  al  em-
pleo  formal,  sostiene  que  “los estudios  sobre
pobreza han mostrado la relevancia que tiene
la participación laboral de los miembros adul-
tos del hogar en la probabilidad de caer o de
evitar dicha situación” (p. 2). No obstante, ac-
ceder  al  mercado  del  trabajo  no  debe  consi-
derarse  como  una  condición  suficiente  para
evitar la pobreza.

Sacchidanand  y  Biswas  (2017)  argumentan
frente a la relación entre la pobreza y la edu-
cación formal, que “el número de miembros al-
fabetizados o la presencia de un miembro gra-

duado  o  con  educación  superior  en  el  hogar,
disminuye la probabilidad de que sea pobre. El
aumento  de  la  inversión  en  educación  puede
llevar a un hogar de ser pobre a no pobre” (p.
151). Por lo cual, la inversión en educación de
calidad contribuye a disminuir las condiciones
de pobreza en los hogares, porque con ella se
mejoran  los  medios  para  satisfacer  las  nece-
sidades  básicas,  disminuyendo  la  carencia  de
recursos.

Rajeev (2012) relaciona la pobreza con las posi-
bilidades de adquisición de los alimentos en el
hogar,  cuando  argumenta:  “fundamentalmen-
te,  para  grandes  segmentos  de  la  población
mundial,  las  raíces  del  problema  del  hambre
y  la  desnutrición  no  es  la  falta  de  alimentos,
sino la falta de acceso a alimentos disponibles
y  adecuados,  entre  otros,  debido  a  la  pobre-
za” (p. 155). Así pues, la falta de alimentación
apropiada es otro de los factores condicionan-
tes de la pobreza, porque, al menos en el caso
colombiano, es común entre los hogares cuyos
integrantes no cuentan con un empleo formal
o no tienen mayores logros educativos; que no
puedan tener una buena alimentación y, como
consecuencia, en tales hogares prevalecen si-
tuaciones de pobreza.

En razón a lo expuesto, diversos factores con-
dicionan  la  pobreza  de  las  personas  y  diver-
sas  metodologías  se  han  implementado  para
buscar cuantificarla. Una de las más utilizadas
en  el  contexto  internacional  es  la  de  Alkire  y
Foster (2007), que considera el cálculo de un
indicador  multidimensional  compuesto  por
distintos factores de privación de los hogares.
Según  como  especifica  Corbelle-Cacabelos  y
Troitiño-Cobas  (2021),  “esta  metodología  es
referente para el análisis de la pobreza, espe-
cialmente por su capacidad para desagregar la
pobreza  por  dimensiones,  por  características
personales, del hogar o geográficas” (p. 57).

También el Índice de Desarrollo Humano (IDH)
y el Índice de Necesidades Básicas Insatisfechas
(NBI),  se  consideran  como  referentes  para  la
medición  y  comparación  de  la  pobreza  entre
países del mundo, pero desde un enfoque de
capacidades  y  bienestar.  Tanto  el  IPM,  como
el  IDH  y  el  NBI,  no  se  limitan  a  considerar  la

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Perspectiva multidimensional de la pobreza en los hogares colombianos4

porque

precisamente

condición  de  ser  pobre  o  no,  según  valores
económicos,
otro
enfoque para la cuantificación de la pobreza es
justamente el monetario. Según como especifica
Fagnola  y  Moneta-Pizarro  (2021),  “no  se  puede
negar  la  ventaja  de  la  simplicidad  del  enfoque
la  pobreza  monetaria,
unidimensional  de
los  hacedores  de
particularmente  cuando
políticas  públicas
información
periódica  para  poder  proveer  de  soluciones
rápidas  a  la  población”  (p.  5).  Sin  embargo,  la
pobreza es un fenómeno estructural e involucra
múltiples dimensiones.

requieren

Específicamente  en  Colombia,  la  fuente  oficial
de  datos  sobre  la  pobreza  multidimensional  y
monetaria  es  el  Departamento  Administrativo
Nacional de Estadística (DANE) y, en consecuen-
cia,  para  el  desarrollo  de  este  análisis,  se  utili-
za la última información oficial publicada en su
web  de  microdatos.  Específicamente  se  analiza
la información de hogares y personas, registra-
dos  en  la  base  de  datos  del  Índice  de  Pobreza
Multidimensional (DANE, 2019), con el fin de lle-
gar a una conclusión respecto a cuáles son las
variables que determinan la pobreza en el país,
cómo estas se asocian entre sí y cuáles generan
diferencias por regiones.

El  interés  por  analizar  diferencias  entre  territo-
rios  radica  en  estudios  y  noticias  que  exponen
disparidades  por  zonas  geográficas.  Por  ejem-
plo,  González  (2019),  analizando  la  tendencia
del IPM en Colombia del 2010 al 2018, encuen-
tra que mientras en el Caribe y el Pacífico la inci-
dencia de la pobreza multidimensional supera el
33%, en Bogotá es del 4,3%, afirmando que estas
desigualdades  no  disminuyeron  en  el  periodo
analizado, porque tanto en el 2010 como en el
2018, las dos regiones con mayor prevalencia de
población pobre son las costeras.

En consecuencia de lo anterior, el principal ob-
jetivo de esta investigación es analizar los facto-
res determinantes de la pobreza en los hogares
colombianos,  a  partir  de  datos  de  la  encuesta
IPM  (DANE,  2019),  identificando  diferencias  y
similitudes  por  regiones.  Como  objetivos  es-
pecíficos,  se  busca  caracterizar  los  hogares
según  si  son  considerados  pobres  o  no,  deter-
minando  los  principales  factores  que  condicio-

nan esta clasificación. Adicionalmente, se busca
concluir sobre aspectos útiles para el diseño de
estrategias y acciones de políticas públicas que
busquen  disminuir  la  pobreza  a  nivel  nacional
y/o regional.

A  diferencia  de  las  propuestas  que  internacio-
nalmente  se  utilizan  para  medir  y  describir  la
pobreza de forma multidimensional en los hoga-
res, como la de Alkire y Foster (2007), el análisis
que  se  propone  en  esta  investigación  combina
información de privaciones en los hogares y ca-
racterísticas  de  las  personas  que  los  integran,
mientras que el IPM solo considera característi-
cas  de  los  hogares.  Esto  constituye  una  de  las
ventajas o diferenciales de este estudio frente a
otras  investigaciones  de  la  pobreza  en  el  país.
Puntualmente se estudian géneros, edades y ni-
veles educativos de las personas. En contraste,
la  metodología  propuesta  no  necesariamente
podría aplicarse en otros países, por ejemplo la-
tinoamericanos, puesto que en sus mediciones
del IPM, podrían no incluirse las variables de per-
sonas que aquí resultan de interés.

Para terminar estas notas introductorias, es me-
nester indicar la estructura organizativa de este
documento. Inicialmente, se presentan aspectos
metodológicos de la investigación definiendo las
variables  y  muestra  en  estudio,  para  posterior-
mente  señalar  aspectos  técnicos  de  la  técnica
estadística  usada  para  obtener  los  resultados.
Estos últimos, se estructuran desde una explo-
ración descriptiva de variables individuales que
caracterizan  la  pobreza  en  los  hogares  colom-
bianos, junto a resultados de correlaciones biva-
riadas y asociaciones multivariantes resultantes
de  un  análisis  de  componentes  principales.  Se
finaliza discutiendo los principales hallazgos de
la investigación.

2. Antecedentes

Antes de presentar los aspectos metodológicos
del estudio, es conveniente delimitar a modo de
antecedentes, el ámbito legal histórico en el que
se enmarca esta investigación, y referenciar in-
vestigaciones que fundamentan el análisis de las
condiciones de pobreza desde técnicas cuantita-
tivas de análisis de datos, específicamente en el
contexto latinoamericano y de Colombia.

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Edith Johana Medina-Hernández, Luis Francisco Sierra-Ibáñez y Andy Rafael Domínguez-Monterrosa5

En  cuanto  al  primer  aspecto,  dos  de  las  leyes
que recientemente ha implementado el gobierno
nacional  para  hacer  frente  a  la  superación  de
la  pobreza  en  el  país  son  la  ley  1785  del  21
de  junio  2016  (Congreso  de  la  República  de
Colombia, 2016) y la ley 1948 del 08 de enero
2019  (Congreso  de  la  República  de  Colombia,
2019). La primera tiene como objeto establecer
una red de instituciones para la superación de la
pobreza extrema, facultando el funcionamiento
de  la  denominada  Red  Unidos.  Esta  red  está
conformada  por
las  entidades  del  Estado
que  prestan  servicio  social  a  las  personas  en
extrema  pobreza,  como  lo  son  las  alcaldías
y  gobernaciones,  el  sector  privado  y
las
organizaciones de la sociedad civil.

La  segunda  ley,  por  su  parte,  se  asocia  a  la
creación  del  programa  Familias  en  Acción,  el
cual  consiste  en  la  entrega  condicionada  y
periódica  de  una  transferencia  monetaria  di-
recta a las familias en condición de pobreza y
pobreza  extrema.  Este  programa  tiene  como
objetivo  apoyar  la  culminación  del  ciclo  de
educación de los jóvenes pobres, contribuir a
la  prevención  del  embarazo  a  temprana  edad
o  en  la  adolescencia,  y  promover  factores  de
movilidad  social  entre  las  familias  beneficia-
rías, en aras de estimular la superación de sus
condiciones  de  pobreza.  Estas  leyes  o  accio-
nes  políticas  implementadas  por  el  gobierno
nacional actual, se ven fortalecidas por el tra-
bajo  de  organismos  como  la  Agencia  Nacio-
nal para la Superación de la Pobreza Extrema
(ANSPE),  creada  a  partir  del  Decreto  4160  de
2011 (Congreso de la República de Colombia,
2011); y las acciones de La Subdirección Gene-
ral para la Superación de la Pobreza de Prospe-
ridad Social.

Ahora bien, no en el marco de las acciones para
la superación de la pobreza, sino en el contex-
to legal que demarca la necesidad de hacer se-
guimiento a la situación de pobreza en el país,
es preciso mencionar el Conpes Social 150 pro-
puesto por el Departamento Nacional de Planea-
ción  (DNP,  2012).  Este  documento  regula  las
metodologías oficiales y arreglos institucionales
para la medición de la pobreza en Colombia, en-
focándose  en  clarificar  los  instrumentos,  técni-
cas de recolección de datos y responsables del

cálculo  monetario  y  multidimensional  de  este
fenómeno  social.  Así,  esta  investigación  se  en-
marca en el análisis aplicado de datos del IPM en
los hogares colombianos, que publica el DANE,
según lineamientos de esta normativa.

Pasando a referenciar las investigaciones sobre
la pobreza en las que se utilizan datos y técnicas
de  modelación,  a  nivel  latinoamericano  es  pre-
ciso mencionar los trabajos de Chacón-Mejía et
al. (2021), Arias-Ramírez et al. (2020), Barahona
(2018) y Fuentes et al. (2018). Los primeros au-
tores, analizan las ruralidades en la región desde
la perspectiva multidimensional de la pobreza, a
partir de un Análisis de Componentes Principa-
les y un Análisis de Correspondencia Canónica.
Estos autores concluyen que, a pesar de que se
observa  heterogeneidad  entre  las  múltiples  di-
mensiones que determinan la pobreza, esta pre-
senta homogeneidad al comparar entre países.

Arias-Ramírez et al. (2020) analizan la pobreza
y desigualdad en Costa Rica, dando una mirada
más allá de la distribución de los ingresos. Estos
autores  se  enfocan  en  comparar  las  necesida-
des básicas insatisfechas (NBI) y las característi-
cas espaciales de la pobreza, mediante análisis
descriptivos,  técnicas  de  georreferenciación  y
regresión  ponderada.  En  esta  investigación,  se
concluye: “El país necesita redefinir su estrategia
de desarrollo para gestar un círculo virtuoso de
crecimiento económico con mayores niveles de
desarrollo humano” (p. 24).

Barahona  (2018)  compara  indicadores  de  po-
breza en México entre 2000 y 2010, analizando
correlaciones  entre  variables  como  desempleo,
horas  tv,  asesinatos,  muertes,  consultas  en  bi-
blioteca,  oportunidades  (programa  de  gobier-
no),  cantidad  de  lugares  históricos  visitados,
bienes y capacidades de la pobreza. Las técnicas
de análisis usadas en esta investigación fueron:
análisis de componentes principales (PCA), aná-
lisis factorial de mínimos cuadrados ponderados
(WLS),  y  KMO  (Kaiser-Meyer-Olkin),  a  través  de
las cuales se contrastó si las correlaciones par-
ciales entre las variables eran lo suficientemente
pequeñas  para  ser  consideradas  significativas.
Gracias a esta investigación, el gobierno mexica-
no asignó recursos del programa Oportunidades
a las provincias más pobres del país.

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Perspectiva multidimensional de la pobreza en los hogares colombianos6

Por su parte, Fuentes et al. (2018), analizando la
medición  multidimensional  de  la  pobreza  en
México, usaron la metodología que desarrolló
el Consejo Nacional de Evaluación de la Política
de Desarrollo Social de México (CONEVAL) en
2010, para comparar la pobreza a nivel muni-
cipal.  Con  el  fin  de  aplicar  la  metodología  de
Coneval a nivel intraurbano, se propuso como
alternativa la construcción de unidades de aná-
lisis  territorial,  seleccionando  muestras  espe-
cíficas para la aplicación de encuestas. En este
estudio, se concluyó que la metodología a ni-
vel intraurbano permite identificar a las perso-
nas que viven en la pobreza de forma más lo-
calizada,  además  de  entender  las  privaciones
sociales  que  más  contribuyen  a  su  condición
de ser pobres.

Pasando  al  contexto  de  Colombia,  es  preci-
so referenciar a Mayorga-Henao et al. (2021),
Marrugo et al. (2015) y Cardona et al. (2014).
El primer autor estudia los patrones de distri-
bución de la pobreza multidimensional en las
principales  aglomeraciones  urbanas  del  país,
mediante  la  aplicación  de  múltiples  métodos
de análisis espacial y estadísticos. En esta in-
vestigación,  se  concluye  que  la  segregación
de la pobreza en el país muestra una relación
compleja entre variables espaciales y variables
socioeconómicas, aunque a la distribución de
la  pobreza  al  interior  de  las  ciudades  cumple
con el principio de autocorrelación espacial.

Marrugo et al. (2015), mediante un análisis des-
criptivo, se centra en el comportamiento de la
pobreza en una región en específico: la Caribe.
En  esta  investigación,  se  utilizan  los  datos  de
la Gran Encuesta Integrada de Hogares (GEIH),
realizada por el DANE en el año 2012, usando
como variable explicada la línea de pobreza (LP)
delimitada a tres valores: 1) cuando el hogar es
no pobre; 2) cuando el hogar es moderadamen-
te  pobre;  y  3)  cuando  el  hogar  vive  en  condi-
ciones de pobreza extrema. Posteriormente, se
analiza el comportamiento de esta variable y su
relación con características socioeconómicas de
la población en la región Caribe. Los resultados
mostraron que una menor educación y estar en
condición  de  desempleo  son  los  factores  que
más contribuyen a la probabilidad de ser pobre
en la región (Marrugo et al., 2015).

Para terminar, Cardona et al. (2014) analizan
mediante  regresión  lineal  simple,  datos  del
porcentaje  de  pobreza,  pobreza  extrema  y
el  coeficiente  de  Gini  (indicador  de  la  des-
igualdad  económica  en  una  población),  en
los  años  2010  y  2011,  para  las  trece  prin-
cipales  ciudades  de  Colombia.  Los  autores
realizaron  una  gráfica  de  dispersión  donde
se  muestra  que  existe  una  relación  entre  la
variable  independiente  (porcentaje  de  po-
breza  en  2010),  y  la  variable  dependiente
(porcentaje de pobreza en 2011). Adicional-
mente, se hallaron los coeficientes de regre-
sión, intervalos de confianza, coeficientes de
correlación  y  pruebas  de  significancia,  para
concluir que los valores observados y estima-
dos están por debajo de la meta de pobreza
nacional.

3. Metodología

Este estudio es de análisis cuantitativo y pue-
de  considerarse  como  descriptivo  y  explora-
torio porque se busca analizar las relaciones
existentes  entre  distintas  variables  de  ho-
gares  y  personas,  identificando  qué  deter-
mina  la  condición  de  pobreza  en  Colombia,
cuáles  son  los  factores  más  preponderantes
y  aquellos  que  determinan  las  diferencias  y
similitudes  por  regiones.  Para  la  obtención
y  explicación  de  los  resultados,  se  utilizan
análisis  descriptivos,  pruebas  de  hipótesis
para diferencias de proporciones y la técnica
multivariante  PCA  (análisis  de  componentes
principales), interpretando los datos desde el
comportamiento  de  variables  individuales  y
desde asociaciones bivariantes y multidimen-
sionales.

Las  hipótesis  en  evaluación  son  dos.  La  pri-
mera: existen diferencias entre los niveles de
pobreza de los hogares colombianos según ca-
racterísticas  sociodemográficas  de  las  perso-
nas que los componen; y la segunda: existen
diferencias  entre  las  condiciones  de  pobreza
según  regiones  del  país.  En  relación  con  los
datos en análisis, es pertinente detallar las ca-
racterísticas  o  factores  examinados  desde  la
base  de  datos  IPM  (DANE,  2019);  la  cual  está
disponible de manera gratuita en el Banco Na-
cional de Datos de la web de microdatos de la

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Edith Johana Medina-Hernández, Luis Francisco Sierra-Ibáñez y Andy Rafael Domínguez-Monterrosa7

institución,  teniendo  disponibilidad  de  infor-
mación a nivel nacional y departamental. En la
Tabla 1, se describe el diccionario de variables
de interés.

La base de datos del IPM (DANE, 2019) cuenta
con  una  muestra  de  88.713  hogares,  que  re-
presentan 283.012 personas a nivel nacional y
que proyectan el total de la población del país.

El detalle de la distribución de esta muestra se
ilustra en la Tabla 2, donde se incluyen los va-
lores absolutos del total de hogares y las per-
sonas que viven en ellos, según su condición
de ser pobres o no, haciendo distinciones por
regiones.  Se  puede  observar  que  es  mayor  la
cantidad  de  hogares  no  pobres,  frente  a  los
pobres, y que la región con mayor cantidad de
hogares pobres es la Caribe.

Notación

Tipo

Significado y Categorías

Tabla 1. Variables analizadas

REG

POB

PAR

PIS

ALC

ACU

EMF

DLD

BAS

ASS

TRI

ATI

INE

RES

ANA

LOE

HAC

CUA

PER

IPM

PRI

SEC

SUP

NDE

MEN

ADJ

ADT

MAY

HOM

MUJ

Localización

Región: 1 Caribe, 2 Oriental, 3 Central, 4 Pacífica (sin Valle), 5 Bogotá, 6 Antioquia, 7 Valle
del Cauca, 8 San Andrés y Providencia, 9 Orinoquía - Amazonía

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Hogar

Personas

Personas

Personas

Personas

Personas

Personas

Personas

Personas

Personas

Personas

Hogar pobre y no pobre

Privación o no por inadecuado material de paredes exteriores

Privación o no por inadecuado material de pisos

Privación o no por inadecuada eliminación de excretas

Privación o no por no acceso a fuente de agua mejorada

Privación o no por Tasa de Empleo Formal

Privación o no por Desempleo de Larga Duración

Privación o no por barreras de acceso a salud

Privación o no por no aseguramiento en salud

Privación o no por Trabajo Infantil

Privación o no por Atención Integral a la Primera Infancia

Privación o no por Inasistencia Escolar

Privación o no por rezago escolar

Privación o no por Analfabetismo

Privación o no por Bajo Logro Educativo

Privación o no por hacinamiento crítico

Número de cuartos en los que duermen las personas del hogar

Número de personas que componen el hogar

Índice de Pobreza Multidimensional

Número de personas en el hogar que tienen como máximo un nivel educativo de primaria

Número de personas que tienen como máximo un nivel educativo de secundaria

Número de personas que tienen como máximo un nivel educativo de Educación Superior

Número de personas del hogar que no declaran su formación académica

Número de personas en el hogar menores a 18 años de edad

Número de personas en el hogar con edad de 18 a 29 años

Número de personas en el hogar con edad de 30 a 54 años

Número de personas en el hogar mayores o iguales a 55 años

Número de personas en el hogar de género masculino

Número de personas en el hogar de género femenino

Fuente: elaboración propia desde la Base de Datos IPM (DANE, 2019).

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Perspectiva multidimensional de la pobreza en los hogares colombianos8

Tabla 2. Hogares y personas analizadas según condición de ser pobres y no

Total de hogares analizados

Personas en los hogares analizados

Región

Caribe

Oriental

Central

Pacífica
(sin Valle)

Bogotá

Antioquia

Valle del Cauca

San Andrés y Providencia

Orinoquía y Amazonía

Total nacional

No pobre

13.215

13.277

15.259

5.965

1.688

2.767

2.683

1.161

11.160

67.175

Pobre

6.827

2.920

3.418

2.526

51

650

429

87

4.630

21.538

Total

20.042

16.197

18.677

8.491

1.739

3.417

3.112

1.248

15.790

88.713

No pobre

Pobre

45.070

39.314

43.453

18.101

4.707

8.038

7.854

2.735

32.597

201.869

28.739

10.117

11.978

9.161

177

2.330

1.568

230

16.843

81.143

Total

73.809

49.431

55.431

27.262

4.884

10.368

9.422

2.965

49.440

283.012

Fuente: elaboración propia desde la Base de Datos IPM (DANE, 2019).

3.1 Técnicas para el análisis de la
información

A  continuación  se  presentan  los  conceptos
técnicos  relacionados  con  la  obtención  de  los
resultados.  En  primera  instancia,  se  definen
aspectos  relacionados  con  la  construcción  del
indicador IPM por parte del DANE y, posterior-
mente, se incluyen conceptos relativos al méto-
do multivariante PCA, que son necesarios para
la comprensión de los hallazgos del trabajo.

El cálculo del IPM, en Colombia, se basa en la
definición de variables de privación y sus pon-
deraciones. Desde estas se determina si un ho-
gar  se  encuentra  en  condiciones  de  pobreza
o no. Para esto, según como se especifica en
DANE  (2018),  se  utiliza  un  algoritmo  que  es-
tablece como unidad de análisis los hogares y
una  equiponderación  de  cinco  dimensiones  y
los factores que las definen. En este algoritmo
se  procede  a  construir  una  matriz  de  1  o  0,
donde el 1 representa privación y 0, no priva-
ción. En la matriz, las filas representan los ho-
gares y las columnas las características evalua-
das, las cuales fueron incluidas en la Tabla 1.

Dorian (2017) explica como las ponderaciones
asignadas  a  cada  uno  de  los  factores  de
privación de los hogares se basan en el método
desarrollado por Sabina Alkire y James Foster,

en el marco del proyecto OPHI (Oxford Poverty
&  Human  Development  Initiative),  basado
en  las  medidas  de  pobreza  de  Foster-  Greer-
Thorbecke.  El  método  consiste  en  contar  los
diferentes tipos de privación que las personas
experimentan  al  mismo  tiempo  y  una  vez
establecidas las ponderaciones deseadas para
cada  factor,  se  realiza  una  suma  ponderada
para  cada  hogar,  denominada  indicador  IPM.
En  Colombia,  los  hogares  son  considerados
pobres multidimensionalmente cuando tienen
privación  en  por  lo  menos  el  33%  de  los
indicadores (DANE, 2018).

Ahora  bien,  en  cuanto  a  la  técnica  específica
mediante  la  cual  se  obtienen  los  resultados
en  este  estudio,  el  Análisis  de  Componentes
Principales  (PCA),  es  necesario  indicar  que  es
una técnica estadística planteada por Hotelling
(1933), quien se basó en los trabajos de Pearson
(1901)  acerca  de  los  ajustes  ortogonales  por
mínimos  cuadrados.  El  PCA  es  una  técnica
multivariante  que  realiza  una  reducción  de
dimensionalidad, creando un conjunto de datos
menor  al  conjunto  de  variables  originales,  al
cual se le denomina componentes principales
y se expresa como combinaciones lineales de
las variables originales.

Para  Peña  (2002),  las  componentes  principa-
les  tienen  doble  utilidad.  La  primera  es  que
permiten  representar  óptimamente  los  datos

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Edith Johana Medina-Hernández, Luis Francisco Sierra-Ibáñez y Andy Rafael Domínguez-Monterrosa9

analizados en un espacio de dimensión peque-
ña, y la segunda, que permiten transformar las
variables originales, que están correlacionadas
entre  sí,  en  nuevas  variables  incorrelaciona-
das, facilitando la interpretación de los datos.
Así pues, con esta técnica lo que se busca es
tener la mejor representación de los atributos
de la información en análisis, en la menor can-
tidad de dimensiones posible.

En  el  PCA  se  dispone  de  una  matriz  V,  que
contiene una muestra de tamaño n acerca de
p  variables  X1,X2,…,Xp  inicialmente  correlacio-
nadas;  para,  posteriormente,  obtener  a  partir
de  ellas  un  número  k≤p  de  variables  incorre-
lacionadas  C1,C2,…,Cp  que  sean  combinación
lineal de las variables iniciales y que expliquen
la mayor parte de su variabilidad.

La primera componente principal, al igual que las
restantes,  se  expresa  como  combinación  lineal
de las variables originales. C1 se obtiene de forma
que su varianza sea máxima, sujeta a la restric-
ción de que la suma de los pesos u1j al cuadrado
sea igual a la unidad, es decir, la variable de los
pesos  o  ponderaciones  (u11,u12,…,u1p )  se  toma
normalizada. Se trata entonces de hallar C1 maxi-
mizando V(C1) = u1Vu1, sujeta a la restricción:

p

∑

j=1

u2 = u1u1 = 1

1i

[1]

Se demuestra que, para maximizar V(C1) se toma
 el
el mayor valor propio λ de la matriz V. Sea λ
mayor valor propio de V y tomando u1  como su
vector  propio  normalizado  (u1u1 =  1).  Teniendo
definido  el  vector  de  ponderaciones  que  se
aplica a las variables iniciales para obtener la
primera  componente  principal,  que  está  defi-
nida como:

1

C1 = u1X = u11 X1 + u12X2 + ... + u1p Xp

[2]

Para maximizar V(C2)  se toma el segundo ma-
yor valor propio λ de la matriz V (el mayor ya
se había tomado al obtener la primera compo-
nente principal). Tomando λ
 como el segundo
valor propio de V y tomando u2 como su vec-
tor propio asociado normalizado (u2u2 = 1), ya
se tendría definido el vector de ponderaciones

2

que se aplica a las variables iniciales para obtener
la segunda componente principal, definida como:

C2 = u2 X = u21X1 + u22 X2 + ... + u2p Xp

[3]

De  forma  similar,  la  componente  principal
h-ésima se define como Ch = Xuh donde uh es el
vector propio de V asociado a su h-ésimo ma-
yor valor propio. Cuanto mayor sea la varianza,
mayor es la información que lleva incorporada
la  respectiva  componente.  Por  esta  razón,  se
selecciona como primera componente aquella
que  tiene  mayor  varianza,  mientras  que,  por
el contrario, la última es la de menor varianza.

Entre  los  distintos  métodos  multivariantes,  los
cuales,  según  Cuadras  (2014),  son  un  conjun-
to  de  técnicas  estadísticas  destinadas  a  descri-
bir e interpretar varias variables en conjunto, el
PCA  es  considerado  un  método  de  interdepen-
dencia,  porque  permite  encontrar  asociaciones
múltiples  entre  las  variables,  sin  necesidad  de
examinar  una  variable  respuesta  en  particular.
Habitualmente  los  resultados  del  PCA  y  otras
técnicas  de  reducción  de  la  dimensionalidad
suelen  representarse  mediante  gráficos  Biplot,
propuestos por Galindo (1986), los cuales mues-
tran conjuntamente las observaciones (filas de la
matriz de datos) en forma de puntos, y las varia-
bles (columnas) en forma de vectores.

4. Resultados

Antes de presentar los resultados de la investiga-
ción obtenidos mediante la aplicación del PCA,
es pertinente presentar una exploración descrip-
tiva de las principales variables en estudio, ha-
ciendo  comparaciones  por  regiones.  Todo  ello
con la intención de discutir posibles acciones re-
queridas para la mitigación del fenómeno de la
pobreza en el país, tanto en el ámbito nacional,
como regional. Todas las figuras presentadas en
este aparte del documento fueron obtenidas en
el programa estadístico R.

4.1 Exploración descriptiva de los
datos

La  primera  gráfica  por  describir  es  la  que  re-
presenta  las  proporciones  de  hogares  pobres
y  no  pobres  según  regiones,  de  acuerdo  con

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Perspectiva multidimensional de la pobreza en los hogares colombianos10

los  totales  que  se  presentaron  anteriormente
en la Tabla 2 y que se representan en la Figura
1. Puede observarse que la región más pobre
es la Caribe, con un 34% de hogares pobres, y
que la segunda región con mayor prevalencia
de hogares pobres es la Pacífica, con un 30%,
seguida  de  la  Orinoquía  y  la  Amazonía,  29%.
Estas diferencias observadas se probaron me-
diante  un  test  chi  cuadrado  para  igualdad  de
proporciones y se obtuvo que son estadística-
mente significativas con un nivel de confianza
del 99% (valor p < 0,01).

En la Figura 2, se muestra por regiones el por-
centaje  de  hogares  que  tienen  privación  y  no
privación de logro educativo (LOE). Se observa
que  la  región  con  mayor  privación  por  logro
educativo  es  la  región  Pacífica:  62%  frente  al
38% de no privación; es decir, esta región tiene
un  alto  porcentaje  de  hogares  que  no  tienen
logro educativo alguno. La segunda región con
mayor porcentaje de privación LOE, es la cen-
tral,  con  un  61%,  y  la  tercera  la  Oriental,  con
60%. Desde esta gráfica, también se interpreta
que siete de las nueve regiones estudiadas tie-
nen un porcentaje mayor del 50% en privación
por LOE.

Las  diferencias  percibidas  en  la  Figura  2,  se
probaron estadísticamente y se obtuvo valor p
< 0,05, entonces se concluye que, con una con-
fianza  del  95%,  sí  existe  una  diferencia  entre
la proporción de privación por logro educativo
en los hogares colombianos según regiones.

En  la  Figura  3,  se  presenta  la  gráfica  de  los
hogares según proporciones de acceso, o no,
a  un  empleo  formal.  Se  observan  a  Bogotá  y
San  Andrés  y  Providencia  como  las  regiones
donde  menor  privación  en  la  variable  EMF  se
registra  en  el  país.  En  contraste  las  regiones
donde  más  del  85%  de  los  hogares  declaran
tener dificultades de acceso a condiciones dig-
nas de empleabilidad, entre al menos uno de
los integrantes de la familia, son el Caribe co-
lombiano, el Pacífico y la Amazonía-Orinoquía.
Las  diferencias  porcentuales  percibidas  en  la
Figura  3  fueron  probadas  mediante  un  test
para diferencia de proporciones y son estadís-
ticamente significativas con una confianza del
99% (valor p < 0,01).

Además de los factores de privación que inclu-
ye el DANE en la definición del indicador IPM,
las  características  sociodemográficas  de  las
personas que componen los hogares, también
permiten concluir frente a otros atributos que
caracterizan  el  fenómeno  de  la  pobreza.  Por
ello, a continuación se ejemplifica el compor-
tamiento del número de personas con educa-
ción  superior,  para  advertir  diferencias  entre
regiones.

En  la  Figura  4,  se  observa  cómo  las  regiones
con  mayor  porcentaje  de  personas  sin  estu-
dios  superiores  son  la  Pacífica  y  la  Orinoquía
y  Amazonía  (76,9%).  Por  su  parte,  la  región
con el menor porcentaje de hogares donde no
existe  ni  una  persona  que  tenga  estudios  su-
periores es Bogotá (38,2% de los hogares). En
general, siete de las nueve regiones analizadas
muestran cómo  más de  un 70%  de las perso-
nas no tiene educación superior.

4.2 Resultados del análisis
mediante PCA

Antes de presentar los resultados de las compo-
nentes obtenidas, conviene explicar la estructu-
ra  de  correlaciones  observadas  entre  pares  de
variables, según las representaciones de las ma-
trices de correlaciones en la Figura 5 y Figura 6.
Desde estas, es posible notar cómo los distintos
factores en el análisis tienen correlaciones posi-
tivas o negativas con el indicador IPM; por ejem-
plo, desde la Figura 5 se interpreta que las mayo-
res correlaciones las presenta el IPM con el logro
educativo,  el  empleo  formal  y  el  analfabetismo
(LOE: 0,68, EMF: 0,58 y ANA: 0,53); en contraste,
las  correlaciones  más  bajas  se  registran  con  la
atención integral a la primera infancia y el traba-
jo infantil (ATI: 0,13 y TRI: 0,18).

Las correlaciones que se observan entre las va-
riables  de  personas,  en  la  Figura  6,  son  más
altas  que  las  vistas  para  las  variables  de  pri-
vación de los hogares, en la Figura 5. Este re-
sultado en términos interpretativos, justifica el
porqué este estudio aporta al análisis de la po-
breza  como  fenómeno  multivariante;  porque
si  bien  el  IPM  es  un  índice  multidimensional
desde  el  cual  se  hacen  oficialmente  las  clasi-
ficaciones  de  hogares  pobres  y  no  pobres  en

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Edith Johana Medina-Hernández, Luis Francisco Sierra-Ibáñez y Andy Rafael Domínguez-MonterrosaFigura 1. Porcentaje de Hogares pobres y no pobres por regiones de Colombia

11

%

s
e
r
a
g
o
h

e
d

t

e
j
a
n
e
c
r
o
P

%

s
e
r
a
g
o
h

e
d

t

e
j
a
n
e
c
r
o
P

%

s
e
r
a
g
o
h

e
d

t

e
j
a
n
e
c
r
o
P

66%

82%

82%

70%

81%

86%

93%

97%

71%

POB

No pobre
Pobre

34%

18%

18%

30%

3%

19%

14%

Caribe

Oriental

Central

Pacífico

Bogotá

Antioquia

Valle

Regiones

29%

Amazonas

7%
San
Andrés

Fuente: elaboración propia en el programa estadístico R, con datos IPM (DANE, 2019).

Figura 2. Privación por logro educativo según regiones de Colombia

42%

40%

39%

38%

42%

47%

58%

18%

61%

62%

80%

20%

58%

53%

Caribe

Oriental

Central

Pacífico

Bogotá

Antioquia

Valle

Regiones

LOE

No privación
Privación

40%

60%

Amazonas

71%

29%

San
Andrés

Fuente: elaboración propia en programa estadístico R, con datos IPM (DANE, 2019).

Figura 3. Privación por condiciones de empleo formal según regiones

12%

20%

20%

12%

27%

27%

47%

49%

88%

80%

80%

88%

53%

73%

53%

51%

14%

86%

EMF

No privación
Privación

Caribe Oriental

Central

Pacífico

Bogotá

Antioquia

Valle

Regiones

San
Andrés

Amazonas

Fuente: elaboración propia en programa estadístico R, con datos IPM (DANE, 2019).

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Perspectiva multidimensional de la pobreza en los hogares colombianos

12

%

s
e
r
a
g
o
h

e
d

t

s
e
j
a
n
e
c
r
o
P

0
1
2

3

4

5

Figura 4. Porcentaje de personas en el hogar con educación superior por regiones

71,8%

75,0%

75,1%

76,9%

71,9%

70,4%

55,2%

SUP

76,9%

38,2%

18,3%

8,14%

17,34% 17,0%

6,7%

Caribe

Oriental

6,9%
Central

32,1%

16,3%

5,7%
Pacífico

24,2%

18,6%

4,6%
Bogotá

Regiones

8,0%
1,3%
Antioquia

19,1%

8,8%
1,5%
Valle

29,5%

13,9%
1,0%
San
Andrés

16,6%

5,9%
Amazonas

Fuente: elaboración propia en programa estadístico R, con datos IPM (DANE, 2019).

Figura 5. Matriz de correlaciones bivariadas entre las variables de Hogares y el IPM

PAR

0,23

PIS

0,24

0,31

ALC

0,09

0,22

0,35

ACU

0,06

0,14

0,11

0,14

EMF

0,03

0,03

0,02

0,01

0,06

DLD

0,00

0,00

0,01

-0,01

0,04

-0,04

BAS

0,02

0,03

0,03

0,02

0,13

-0,06

0,05

ASS

0,01

0,03

0,03

0,03

0,05

-0,06

0,04

0,03

TRI

0,03

0,02

0,04

0,02

0,00

-0,05

0,02

0,12

0,01

ATI

0,05

0,07

0,07

0,06

0,07

-0,04

0,03

0,10

0,28

0,07

INE

0,06

0,07

0,07

0,06

0,08

-0,10

0,06

0,03

0,21

0,05

0,25

RES

0,05

0,19

0,15

0,13

0,15

0,06

0,02

0,04

0,04

-0,03

0,06

0,03

ANA

0,06

0,20

0,15

0,23

0,33

0,07

0,01

0,02

0,07

-0,06

0,10

0,11

0,34

LOE

0,14

0,15

0,14

0,04

0,07

-0,05

0,05

0,08

0,04

0,18

0,13

0,18

0,04

0,04

HAC

-0,03

-0,07

-0,02

-0,02

0,00

-0,08

0,02

0,01

0,03

0,05

0,03

0,14

0,02

-0,02

-0,10

CUA

0,05

0,05

0,05

0,01

0,11

-0,22

0,10

0,10

0,14

0,25

0,21

0,50

0,08

0,05

0,34

0,30

PER

0,22

0,39

0,38

0,38

0,58

0,26

0,23

0,32

0,18

0,13

0,27

0,31

0,53

0,68

0,25

-0,01

0,23

IPM

Fuente: elaboración propia en programa estadístico R, con datos IPM (DANE, 2019)

1

0,8

0,6

0,4

0,2

0

-0,2

-0,4

-0,6

-0,8

-1

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Edith Johana Medina-Hernández, Luis Francisco Sierra-Ibáñez y Andy Rafael Domínguez-Monterrosa

Figura 6. Matriz de correlaciones bivariadas entre las variables de personas y el IPM

13

PRI

-0,23

SEC

-0,34

-0,17

SUP

0,01

0,18

-0,01

NDE

0,13

0,22

-0,05

0,89

MEN

0,02

0,43

0,08

0,31

0,17

ADJ

0,13

0,26

0,15

0,34

0,33

-0,06

ADT

0,36

-0,07

0,04

-0,27

-0,28

-0,18

-0,36

MAY

0,31

0,37

0,03

0,56

0,57

0,38

0,42

0,00

HOM

0,19

0,33

0,11

0,66

0,65

0,38

0,37

0,00

0,21

MUJ

0,57

0,05

-0,44

0,15

0,26

0,03

-0,01

0,11

0,21

0,15

IPM

1

0,8

0,6

0,4

0,2

0

-0,2

-0,4

-0,6

-0,8

-1

Fuente: elaboración propia en programa estadístico R, con datos IPM (DANE, 2019).

Colombia,  con  el  método  Alkire  y  Foster  que
se  usa  en  DANE  (2018)  para  asignar  las  pon-
deraciones de los factores de privación, no se
considera  ninguna  dependencia  frente  al  nú-
mero de personas de los hogares ni respecto
a las características que definen a tales perso-
nas, aunque estas también aportan al análisis
multidimensional de la pobreza.

Continuando con el análisis y pasando a los re-
sultados específicos de la aplicación del PCA,
es pertinente indicar el porcentaje de varianza
explicada  por  cada  una  de  las  componentes
principales  obtenidas.  Los  dos  primeros  ejes
resumen el 32,7% de la variabilidad en los da-
tos y se observa que hasta la dimensión 4 se
logra explicar 44,2%, por lo cual, con analizar
los  planos  1-2  y  3-4  se  podría  lograr  enten-
der qué es lo que caracteriza a los hogares del
país, según sus condiciones de pobreza.

Para  entender  los  resultados  de  la  aplicación
de  la  técnica  y  antes  de  presentar  de  forma
gráfica  los  principales  planos  del  PCA,  es  ne-
cesario  analizar  las  ponderaciones  obtenidas
para las variables en análisis. En la Tabla 3, se
muestran  los  coeficientes  obtenidos  para  las
cinco primeras componentes principales.

Desde  la  Tabla  3  se  puede  concluir  que,  al
remplazar los valores obtenidos en la ecuación
(2), presentada anteriormente en la sección de
metodología,  la  ecuación  de  la  primera  com-
ponente es:

C1 = u1 X = u11 X1 + u12 X2 +...+ u1p Xp=
C1= 0,37PAR + 0,66PIS +...+ 15,55 PER +...+
13,12MEN +...+ 9,28MUJ

[4]

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Perspectiva multidimensional de la pobreza en los hogares colombianos14

Frente a las mayores contribuciones de la com-
ponente 1, se exaltan las ponderaciones obte-
nidas  para  las  variables:  #  de  personas  en  el
hogar  (PER),  #  de  menores  en  el  hogar  (MEN)
y  #  de  personas  en  el  hogar  que  no  declaran
su  nivel  educativo  (NDE).  En  relación  con  la
componente  principal  2,  se  obtiene  que  las
mayores  ponderaciones  se  concentran  sobre
las variables (IPM), logro educativo (LOE), # de
personas  en  el  hogar  con  primaria,  alfabetis-
mo (ANF) y # de personas en el hogar con se-
cundaria (SEC).

C2 = u2 X = u21 X1 + u22 X2 +...+ u2p Xp=

[5]
C2 = 0,91PAR + 4,28PIS +...+ 15,79 LOE +...+ 1,47MUJ

Pasando a las representaciones de las compo-
nentes, en la Figura 7, se grafican los hogares
y  las  variables  de  privación  en  el  mismo  pla-
no, asignando por colores la condición de ser
pobre  o  no.  Se  observa  que  los  vectores  más
representativos, por ser los de mayor variabi-
lidad (los más largos), corresponden a las va-
riables: número de personas en el hogar (PER),
número de menores en el hogar (MEN), núme-

Tabla 3. Coeficientes de las cinco primeras componentes principales

Variable

Dim,1

Dim,2

PAR

PIS

ALC

ACU

EMF

DLD

BAS

ASS

TRI

ATI

INE

RES

ANA

LOE

HAC

CUA

PER

IPM

PRI

SEC

SUP

NDE

MEN

ADJ

ADT

MAY

HOM

MUJ

0,37

0,66

0,69

0,38

1,13

0,8

0,37

0,54

0,96

1,74

1,96

7,32

0,44

0,77

3,67

1,33

15,55

4,23

2,48

2,75

0,25

11,68

13,12

3,28

4,11

0,52

9,61

9,28

0,91

4,28

3,45

4,48

5,83

2,2

0,06

0,26

0,19

0,33

0,62

0,02

8,17

15,79

0,01

0,73

1,27

17,63

11,19

2,75

8,49

2,19

0,75

1,56

2,16

2,94

0,28

1,47

Dim,3

9,31

8,32

12,88

6,1

0,01

0,09

0,04

0,14

0,06

1,26

0

0,13

3,64

2,43

5,28

7,79

2,77

0,38

11,34

0,01

0,72

0,85

1,17

0

0,39

21,51

1,94

1,45

Dim,4

Dim,5

0,15

0,04

0,04

0,53

6,18

0,1

1,24

13,37

0,25

1,42

0,07

8,26

0,13

0,78

0,86

0,03

0,12

0,91

1,29

22,56

0,88

2,79

4

24,97

7,28

1,5

0,25

0

2,91

2,22

2,13

0

1,62

6,87

0,16

2,38

17,07

3,83

12,78

2,24

3,24

0,86

2,62

0,41

1,39

0

0,02

4,66

7,77

2,83

0,53

0,56

5,53

10,69

0,12

4,56

Fuente: elaboración propia a partir de resultados en software R y desde datos IPM (DANE, 2019).

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Edith Johana Medina-Hernández, Luis Francisco Sierra-Ibáñez y Andy Rafael Domínguez-MonterrosaFigura 7. Plano 1-2 de componentes principales según hogares pobres o no

15

8

4

0

-4

)

%
3
3
1

.

(

2
m
D

i

IPM

LOE

PRI

ANA

EMF

ACU

PIS

ALC

MAY

DLD

PAR

ASS

BAS

INE

TRI

HAC

AT I

CUA

ADJ

ADT

SEC

RES

HOM

MEN

MUJ

NDE

PER

POB
0
1

SUP

0

5

10

Dim1 (19.6%)

15

20

Fuente: elaboración propia en programa estadístico R, a partir de datos IPM (DANE, 2019).

ro de personas con primaria (PRI) y número de
personas con educación superior (SUP).

Las variables de privación que van en la direc-
ción del vector del IPM, que se observan en alta
correlación con este, por tener ángulos peque-
ños frente a él y a su vez mostrarse como vec-
tores  largos  en  el  plano,  son  las  condiciones
de  privación  por  logro  educativo  (LOE),  em-
pleo  formal  (EMF)  y  el  vector  de  analfabetis-
mo (ANA). En dirección contraria, se observa la
educación superior (SUP) caracterizando a los
hogares que no son pobres.

En la Figura 8, donde se muestra plano 1-2 del
Biplot,  asignando  por  colores  el  número  de
personas que viven en cada hogar, se observa
claramente un patrón de ordenación en el sen-

tido  de  la  primera  componente  principal,  de
forma que los hogares con mayor cantidad de
personas se ubican hacia la derecha. Entre ta-
les hogares, también se notan muchos meno-
res de edad que están realizando o cursando
la  secundaria.  En  contraste,  los  hogares  don-
de  residen  pocas  personas,  ubicados  hacia  la
izquierda del plano, se caracterizan por tener
integrantes mayores de edad, y personas con
periodos de desempleo de larga duración.

Ahora bien, en el análisis de las componentes
principales no solo es importante interpretar el
plano 1-2, dado que otros planos y dimensio-
nes  también  reflejan  patrones  del  comporta-
miento de los datos. En la Figura 9, se presen-
ta  el  plano  de  las  componentes  principales  3
y 4, pintando el número de personas mayores

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Perspectiva multidimensional de la pobreza en los hogares colombianos
16

Figura 8. Biplot en el plano 1-2 según número de personas en el hogar

8

4

MAY

DLD

)

%
3
3
1

.

(

0

2
m
D

i

-4

SUP

0

IPM

LOE

PRI

ANA

EMF

ACU

ALC

PIS

PAR

ASS

INE

BAS

TRI

CUA

HAC
ATI

ADJ

SEC

RES

HOM

MEN

ADT

MUJ

NDE

PER

PER

1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20

5
Dim1 (19.6%)

10

15

20

Fuente: elaboración propia en programa estadístico R, a partir de datos IPM (DANE, 2019).

que viven en los hogares; se observa claramen-
te  la  diferenciación  en  la  dirección  del  eje  3.
Frente al eje 4 puede indicarse que los adultos
jóvenes  (ADJ)  se  notan  caracterizados  por  te-
ner  empleo  formal  (EMF)  y  aseguramiento  en
salud (ASS).

lución  del  acceso  a  la  educación  en  Colombia,
afirma  que  “muchos  obstáculos  limitan  el  acce-
so de los jóvenes a la educación, entre otros, la
falta de oportunidades educativas, la pobreza, la
presión por empezar a trabajar, el conflicto y la
violencia” (p. 30).

5. Discusión de resultados

De  acuerdo  con  los  resultados  presentados
anteriormente, resulta útil discutir sus implica-
ciones y utilidad desde el punto de vista inter-
pretativo. El primero de los hallazgos que vale
la pena evaluar es que el factor obtenido como
el más importante para caracterizar la pobreza
de  los  hogares  colombianos,  es  el  logro  edu-
cativo. Esta idea la sustenta la Organización para
la Cooperación y el Desarrollo Económico (OCDE,
2016), cuando, analizando históricamente la evo-

Este  primer  hallazgo  puede  deberse  a  que  los
niños,  jóvenes  o  adultos  jóvenes  en  lugar  de
estudiar,  muchas  veces  deben  asumir  de  for-
ma  temprana  actividades  laborales,  por  causa
de  limitantes  económicos  en  sus  hogares.  Por
ello,  sería  necesario  reevaluar  estrategias  con
el fin de disminuir la incidencia de este factor
en el cálculo del IPM, para que no sea visto sim-
plemente como un ponderador de un indicador
multidimensional de la pobreza, sino como un
condicionante del derecho a la educación de los
menores de edad.

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Edith Johana Medina-Hernández, Luis Francisco Sierra-Ibáñez y Andy Rafael Domínguez-Monterrosa
17

Figura 9. Biplot en el plano 3-4 según personas mayores en el hogar

5

)

%
2
5

.

(

4
m
D

i

ADJ

SEC

ASS

EMF

HAC

ATI

BAS

IPM

PAR

ALC

PIS

ACU

DLD

INE
TRI

MAY

MAY
0
1
2
3
4
5
6
7
8

HOM
PER

MUJ

CUA

ANA

SUP

LOE

PRI

NDE
MEN

ADT

RES

Fuente: elaboración propia en programa estadístico R, a partir de datos IPM (DANE, 2019).

0

-5

5
El segundo resultado relevante es que, en los
Dim3 (6.3%)
hogares donde hay mayor cantidad de perso-
nas,  hay  tendencia  a  que  sean  más  pobres.
Esto lo corrobora el informe del Programa de
las Naciones Unidas para el Desarrollo (PNUD,
2016), quien analiza cómo los hogares pobres
tienen en promedio un mayor número de inte-
grantes. García y Jaramillo (2019), al respecto,
también  infieren  en  sentido  positivo,  cuando
indican  que,  los  colombianos  pasaron  de  3,9
personas por hogar, en 2005, a 3,1 en 2018,
con el fin de tener un control de la natalidad en
los hogares vulnerables y bajar los índices de
pobreza en el país. Se puede reflexionar sobre
este comportamiento, cómo en hogares donde
viven cinco personas y solo una trabaja es muy
difícil mantener y sostener las necesidades bá-
sicas;  este  ejemplo  es  una  situación  muy  co-
mún entre hogares pobres del país.

10

15

El tercer hallazgo por discutir se refiere a la condi-
ción de empleo formal, dado que en Colombia no
tener un empleo formal aumenta la pobreza en
los hogares. Al respecto, afirmaba Moreno (2009)
hace más de una década:

La  pobreza  que  es  fundamentalmente  de  in-
gresos,  se  encuentra  altamente  relacionada
con  las  condiciones  en  las  cuales  las  perso-
nas se vinculan al mercado del trabajo (…) si
bien la situación de pobreza no está limitada
al sector informal, el hecho de que el jefe del
hogar se encuentre en el sector informal del
mercado laboral tiene poco más del doble de
riesgo, de que su hogar se encuentre en la po-
breza  con  respecto  a  quienes  se  encuentran
en el sector formal (p. 19).

Otro resultado importante por mencionar, el cual
no  se  asocia  a  factores  específicos  de  privación

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Perspectiva multidimensional de la pobreza en los hogares colombianos
18

que  condicionan  la  pobreza  en  el  país,  es  que
la  región  más  pobre  de  Colombia  es  la  Caribe,
cuyo planteamiento es ratificado en el estudio de
Marrugo et al. (2015), quienes realizan un estudio
de los determinantes de la pobreza en la región
Caribe, y afirman que el país ha mostrado estar
caracterizado  por  un  modelo  centro-periferia
en  perjuicio  de  las  regiones  Caribe,  Pacífica,
como  las  más  pobres  del  país.  Estos  autores
sustentan que las variables del mercado laboral y
la tasa de desempleo están entre los principales
determinantes  de  la  pobreza  en  las  regiones
costeras de Colombia.

Por todo lo anterior, los resultados de este estudio
ratifican  que  analizar  la  pobreza  implica  evaluar
diversas dimensiones, porque desde cada una de
ellas se pueden diseñar estrategias de política pú-
blica dirigidas que aporten a la reducción de la pre-
cariedad en las condiciones de vida de las perso-
nas y sus hogares. En este sentido, los resultados
de este estudio son acordes con la inferencia de
Dong et al. (2021), quienes afirman, ”la reducción
de  la  pobreza  es  un  proceso  sistemático  y  com-
plejo, que involucra disciplinas como la economía,
política, cultura, geografía, sociedad y psicología, y
cambia con diferencias en el espacio, el tiempo y el
entorno de desarrollo” (p. 146).

6. Conclusiones

Desde un punto de vista interpretativo, las con-
clusiones de este estudio se resumen en tres as-
pectos:

a) Para caracterizar la pobreza en Colombia, cuan-
do se analizan las dimensiones del IPM de los
hogares junto a variables sociodemográficas de
las personas que los componen, se observa que
estas últimas resultan más determinantes de la
condición de ser pobre o no. Los factores de las
viviendas,  como  tener  un  inadecuado  material
de paredes o los pisos, resultan poco relevantes.

b) Los datos del IPM (DANE, 2019) muestran que,
las  características  que  generan  mayores  dife-
rencias entre los hogares pobres y no pobres,
son el número de integrantes del hogar, su lo-
gro educativo y el acceso al mercado del trabajo
mediante un empleo formal.

c)  Por regiones, se observan diferencias estadís-
ticamente  significativas  entre  las  condiciones
de  pobreza  multidimensional  de  los  hogares,
registrándose las mayores precariedades en las
zonas costeras del país (regiones Caribe y Pací-
fica) y la Amazónica (incluyendo la Orinoquía).

Desde un punto de vista metodológico, es preciso
concluir:

a)  A pesar de que en este estudio no se utiliza-
ron  herramientas  de  georreferenciación  para
examinar la distribución espacial del IPM en Co-
lombia, los datos DANE de este indicador per-
mitirían plantear investigaciones académicas de
este tipo, desde las cuales se pueda predecir la
incidencia de la pobreza a nivel local.

b) Las técnicas de análisis multivariante (como el
PCA utilizado en esta investigación), son útiles
para  exploraciones  descriptivas  en  las  que  no
se busque probar hipótesis de dependencia en-
tre variables, sino que se estudie la interdepen-
dencia existente entre múltiples factores o con-
dicionantes  de  un  fenómeno  socioeconómico,
como es el de la pobreza.

c) Para investigaciones futuras acerca del es-
tudio de la pobreza desde análisis cuantita-
tivos,  se  recomienda  evaluar  variables  que
describan a las personas y sus posibilidades
de tener acceso a la educación y el empleo
formal;  ya  que  estas  condiciones  son  las
que más pueden contribuir a la generación
de estrategias de política pública que hagan
frente a esta problemática social.

Dado que entender las características que de-
limitan  la  pobreza  de  una  población  permite
diseñar acciones de política pública que con-
tribuyan al mejoramiento de la calidad de vida
de las personas, para terminar, es preciso in-
dicar  que,  las  dos  principales  recomendacio-
nes de este estudio en términos de acciones
gubernamentales requeridas, son:

a) Es necesario que el gobierno nacional apoye
las estrategias que motivan a los colombia-
nos a estudiar y prepararse académicamen-
te, porque con ello indirectamente se evita
la perpetuación de patrones de pobreza.

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Edith Johana Medina-Hernández, Luis Francisco Sierra-Ibáñez y Andy Rafael Domínguez-Monterrosa19

b) En este estudio, se pudo corroborar que el
acceso al mercado del trabajo es uno de los
factores más determinantes de la condición
de  ser  pobre  o  no;  por  tanto,  se  requieren
mayores  acciones  e  inversiones  de  los  go-

biernos locales (Gobernaciones y Alcaldías),
para  favorecer  la  empleabilidad  formal  en
los  territorios.  Al  igual  que  estrategias  de
apoyo  a  las  microempresas,  ya  que  estas
ayudan a generar puestos de trabajo formal.

Referencias
Alkire, S. y Foster, J. (2007). Counting and multidimensional poverty measurement (OPHI Working Paper 7).

University of Oxford. https://ophi.org.uk/working-paper-number-07/

Arias-Ramírez, R., Sánchez-Hernández, L. y Rodríguez-Morales, M. (2020). Pobreza y desigualdad en Costa
Rica: Una mirada más allá de la Distribución de los Ingresos. Revista Estudios del Desarrollo Social: Cuba
y América Latina, 8(1), 1-26. http://www.revflacso.uh.cu/index.php/EDS/article/view/422

Barahona, I. (2018). Poverty in Mexico: Its relationship to social and cultural indicators. Social Indicators

Research, (135), 599-627. https://doi.org/10.1007/s11205-016-1510-3

Cardona, D., González, J., Rivera, M. y Cárdenas, E. (2014). Aplicación de la regresión lineal en un problema

de pobreza. Interacción, 12, 73-84. https://doi.org/10.18041/1657-7531/interaccion.0.2315

Chacón-Mejía,  C.,  Mattei,  L.  y  Ramírez-Chaparro,  M.  (2021).  Ruralidades  en  américa  latina  una  mirada
multidimensional de la pobreza a partir del análisis de componentes principales. Revista Visión Contable,
(23), 133-155. https://doi.org/10.24142/rvc.n23a6

Congreso de la República de Colombia. (2011, 3 de noviembre). Decreto 4160. Por el cual se crea la Agencia
Nacional para la Superación de la Pobreza Extrema, se determinan sus objetivos y estructura orgánica.
http://www.suin-juriscol.gov.co/viewDocument.asp?id=1542859

Congreso de la República de Colombia. (2016, 21 de junio). Ley 1785. Por medio de la cual se establece la
red para la superación de la pobreza extrema - red unidos y se dictan otras disposiciones. http://www.
suin-juriscol.gov.co/viewDocument.asp?ruta=Leyes/30021681

Congreso  de  la  República  de  Colombia.  (2019,  8  de  enero).  Ley  1948.  Por  medio  de  la  cual  se  adoptan
criterios de política pública para la promoción de la movilidad social y se regula el funcionamiento del
programa  Familias  en  Acción.  https://dapre.presidencia.gov.co/normativa/normativa/LEY%201948%20
DEL%208%20DE%20ENERO%20DE%202019.pdf

Corbelle-Cacabelos, F. y Troitiño-Cobas, A. (2021). Pobreza multidimensional en España. Una aplicación de
la metodología de Alkire y Foster. 2008 - 2015. Revista de Métodos Cuantitativos para la Economía y la
Empresa, 31, 55-103. https://doi.org/10.46661/revmetodoscuanteconempresa.3489

Cuadras,  M.  (2014).  Nuevos  Métodos  de  Análisis  Multivariante.  CMC  Edition.  https://www.academia.

edu/8119269/NUEVOS_M%C3%89TODOS_DE_AN%C3%81LISIS_MULTIVARIANTE

DANE  –Departamento  Administrativo  Nacional  de  Estadística–.  (2018).  Algoritmo  para  la  construcción  del
indice  de  pobreza  multidimensional  -  IPM.  DANE.  http://catalog.ihsn.org/index.php/catalog/7103/
download/83844

DANE  –Departamento  Administrativo  Nacional  de  Estadística–.

(2019).  Boletín  Técnico  Pobreza
multidimensional en Colombia. DANE. https://www.dane.gov.co/files/investigaciones/condiciones_vida/
pobreza/2018/bt_pobreza_multidimensional_18.pdf

DNP –Departamento Nacional de Planeación de Colombia–. (2012, 28 de mayo). Conpes Social 150. https://

colaboracion.dnp.gov.co/CDT/Conpes/Social/150.pdf

Dong, Y., Jin, G., Deng, X. y Wu, F. (2021). Multidimensional measurement of poverty and its spatio-temporal
dynamics in China from the perspective of development geography. Journal of Geographical Sciences, 31,
130-148. https://doi.org/10.1007/s11442-021-1836-x

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Perspectiva multidimensional de la pobreza en los hogares colombianos20

Dorian,  L.  (2017).  Metodología  Alkire  y  Foster  en  la  medición  de  Pobreza  Multidimensional:  el  caso  colombiano

(MPRA Paper Nº 80102). MPRA. https://mpra.ub.uni-muenchen.de/id/eprint/80102

Fagnola, B. y Moneta-Pizarro, A. (2021). Identificación de la pobreza multidimensional en Argentina con métodos
robustos  de  análisis  factorial.  Cuadernos  del  CIMBAGE,  1(23),  1-20.  http://157.92.136.232/index.php/
CIMBAGE/article/view/2053

Fuentes,  C.,  Peña,  S.  y  Hernández,  V.  (2018).  La  medición  multidimensional  de  la  pobreza  a  nivel
intraurbano  en  Ciudad  Juárez,  Chihuahua  (2012).  Estudios  fronterizos,  19,  1-25.  https://doi.
org/10.21670/ref.1801001

Galindo, M. P. (1986). Una alternativa de representación simultánea: HJ-Biplot. Qüestiió, 10(1), 13-23. http://hdl.

handle.net/2099/4523

Gamboa, G., Mingorría, S. y Scheidel, A. (2020). The meaning of poverty matters: Trade-offs in poverty reduction

programmes. Ecological Economics, 169, 106450. https://doi.org/10.1016/j.ecolecon.2019.106450

García, D. M. y Jaramillo, Á. (2019). El cambio social que se gesta en los hogares colombianos. https://razonpublica.

com/el-cambio-social-que-se-gesta-en-los-hogares-colombianos/

González, J. (2019). Aumento de la pobreza en Colombia no debe subestimarse. https://razonpublica.com/aumento-

de-la-pobreza-en-colombia-no-debe-subestimarse/

Hotelling, H. (1933). Analysis of a complex of statistical variables into principal components. Journal of Educational

Psychology, 24(6), 417-441. https://doi.org/10.1037/h0071325

Marrugo,  C.,  Del-Risco,  K.,  Herrera,  J.  y  Pérez,  G.  J.  (2015).  Determinantes  de  la  pobreza  en  la  región  Caribe

colombiana. Revista de Economía del Caribe, (15), 47-69. http://dx.doi.org/10.14482/ecoca.15.7192

Mayorga-Henao, J. M., Hernández, L. M. y Lozano, M. C. (2021). Segregación y pobreza multidimensional en el
sistema urbano colombiano. Bitácora Urbano Territorial, 31(2), 113-129. https://doi.org/10.15446/bitacora.
v31n2.89600

Moreno,  J.  A.  (2009).  Informalidad  Laboral  y  Pobreza  Urbana  en  Colombia  (Documento  de  trabajo  134).
CIDSE,  Universidad  del  Valle.  http://biblioteca.clacso.edu.ar/Colombia/cidse-univalle/20121113055828/
DocTrab_134.pdf

Munévar,  W.  (2019).  Pobreza,  exclusión  social  y  comportamiento  económico  de  los  países  latinoamericanos.
Revista Observatorio de la Economía Latinoamericana, (2019), 1-16. https://www.eumed.net/rev/oel/2019/02/
pobreza-exclusion-social.html

OCDE  –Organización  para  la  Cooperación  y  el  Desarrollo  Económico–.  (2016).  Educación  en  Colombia.  OECD.

https://www.mineducacion.gov.co/1759/articles-356787_recurso_1.pdf

Pearson, K. (1901). LIII. On lines and planes of closest fit to systems of points in space. The London, Edinburgh, and Dublin
Philosophical Magazine and Journal of Science, 2(11), 559-572. https://doi.org/10.1080/14786440109462720

Peña, D. (2002). Análisis de datos multivariantes. https://www.researchgate.net/publication/40944325_Analisis_

de_Datos_Multivariantes

PNUD  –Programa  de  las  Naciones  Unidas  para  el  Desarrollo–.  (2016).  Contexto  y  caracterización  de  los
hogares  en  situación  de  pobreza  en  Colombia.  PNUD.  https://info.undp.org/docs/pdc/Documents/COL/
Investigaci%C3%B3n_Caracterizacio%CC%81n%20de%20los%20pobres_LAR_Sin%20publicar.pdf

Rajeev, M. (2012). Human rights indicators: a guide to measurement and implementation. United Nations Human

Rights. https://www.ohchr.org/documents/publications/human_rights_indicators_en.pdf

Sacchidanand,  M.  y  Biswas,  S.  (2017).  The  role  of  education  in  poverty  alleviation:  Evidence  from  Bangladesh.
Journal of Economics and Sustainable Development, 8(20), 151-160. https://www.iiste.org/Journals/index.php/
JEDS/article/view/39320/40429

Tejero-Pérez, A. (2018). Pobreza laboral en España. Un análisis dinámico. Revista Internacional de Sociología, 76(2),

e096. https://doi.org/10.3989/ris.2018.76.2.16.54

Sociedad y Economía N° 44 (Sep - dic 2021) / e-ISSN: 2389-9050 / e10310734Edith Johana Medina-Hernández, Luis Francisco Sierra-Ibáñez y Andy Rafael Domínguez-Monterrosa