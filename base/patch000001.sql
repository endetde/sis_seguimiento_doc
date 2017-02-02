

/***********************************I-SCP-RAC-SEGDOC-0-31/01/2017****************************************/

CREATE TABLE segdoc.ttipo_doc (
  id_tipo_doc SERIAL,
  codigo VARCHAR(100) NOT NULL,
  descripcion VARCHAR(800),
  CONSTRAINT ttipo_doc_codigo_key UNIQUE(codigo),
  CONSTRAINT ttipo_doc_pkey PRIMARY KEY(id_tipo_doc)
) INHERITS (pxp.tbase)

WITH (oids = false);


--------------- SQL ---------------

CREATE TABLE segdoc.tinforme (
  id_informe SERIAL NOT NULL,
  id_tipo_doc INTEGER NOT NULL,
  id_funcionario INTEGER NOT NULL,
  id_estado_wf INTEGER,
  id_proceso_wf INTEGER,
  estado VARCHAR(200) NOT NULL,
  num_doc VARCHAR(300),
  obs VARCHAR,
  PRIMARY KEY(id_informe)
) INHERITS (pxp.tbase)

WITH (oids = false);


--------------- SQL ---------------

ALTER TABLE segdoc.tinforme
  ADD COLUMN nro_tramite VARCHAR(400);
  
  --------------- SQL ---------------

ALTER TABLE segdoc.tinforme
  ADD COLUMN fecha_doc DATE NOT NULL;
  
  --------------- SQL ---------------

ALTER TABLE segdoc.tinforme
  ALTER COLUMN estado DROP NOT NULL;

/***********************************F-SCP-RAC-SEGDOC-0-31/01/2017****************************************/


