/********************************************I-DAT-RAC-SEG-0-15/01/2013********************************************/


/* Data for the 'segu.tsubsistema' table  (Records 1 - 1) */

INSERT INTO segu.tsubsistema ("codigo", "nombre", "fecha_reg", "prefijo", "estado_reg", "nombre_carpeta", "id_subsis_orig")
VALUES 
  (E'SEGDOC', E'Seguimiento de Documentos', E'2017-01-31', E'SEG', E'activo', E'seguimiento_doc', NULL);  
  
  
----------------------------------
--COPY LINES TO data.sql FILE  
---------------------------------

select pxp.f_insert_tgui ('SEGUIMIENTO DE DOCUMENTOS', '', 'SEGDOC', 'si', 1, '', 1, '', '', 'SEGDOC');
select pxp.f_insert_tgui ('Tipo Documento', 'Tipo Documento', 'TDO', 'si', 1, 'sis_seguimiento_doc/vista/tipo_doc/TipoDoc.php', 2, '', 'TipoDoc', 'SEGDOC');
select pxp.f_insert_tgui ('Registro de Documentos', 'Registro', 'RDOC', 'si', 2, 'sis_seguimiento_doc/vista/informe/InformeReg.php', 2, '', 'InformeReg', 'SEGDOC');
select pxp.f_insert_tgui ('VoBo Documentos', 'VoBo Documentos', 'VBDOC', 'si', 3, 'sis_seguimiento_doc/vista/informe/InformeVb.php', 2, '', 'InformeVb', 'SEGDOC');
select pxp.f_insert_tgui ('Estado de Wf', 'Estado de Wf', 'RDOC.1', 'no', 0, 'sis_workflow/vista/estado_wf/FormEstadoWf.php', 3, '', 'FormEstadoWf', 'SEGDOC');
select pxp.f_insert_tgui ('Estado de Wf', 'Estado de Wf', 'RDOC.2', 'no', 0, 'sis_workflow/vista/estado_wf/AntFormEstadoWf.php', 3, '', 'AntFormEstadoWf', 'SEGDOC');
select pxp.f_insert_tgui ('Documentos del Proceso', 'Documentos del Proceso', 'RDOC.3', 'no', 0, 'sis_workflow/vista/documento_wf/DocumentoWf.php', 3, '', '90%', 'SEGDOC');
select pxp.f_insert_tgui ('Observaciones del WF', 'Observaciones del WF', 'RDOC.4', 'no', 0, 'sis_workflow/vista/obs/Obs.php', 3, '', '80%', 'SEGDOC');
select pxp.f_insert_tgui ('Funcionarios', 'Funcionarios', 'RDOC.5', 'no', 0, 'sis_organigrama/vista/funcionario/Funcionario.php', 3, '', 'funcionario', 'SEGDOC');
select pxp.f_insert_tgui ('Documentos del Proceso', 'Documentos del Proceso', 'RDOC.1.1', 'no', 0, 'sis_workflow/vista/documento_wf/DocumentoWf.php', 4, '', '90%', 'SEGDOC');
select pxp.f_insert_tgui ('Subir ', 'Subir ', 'RDOC.1.1.1', 'no', 0, 'sis_workflow/vista/documento_wf/SubirArchivoWf.php', 5, '', 'SubirArchivoWf', 'SEGDOC');
select pxp.f_insert_tgui ('Documentos de Origen', 'Documentos de Origen', 'RDOC.1.1.2', 'no', 0, 'sis_workflow/vista/documento_wf/DocumentoWf.php', 5, '', '90%', 'SEGDOC');
select pxp.f_insert_tgui ('Hist�rico', 'Hist�rico', 'RDOC.1.1.3', 'no', 0, 'sis_workflow/vista/documento_historico_wf/DocumentoHistoricoWf.php', 5, '', '30%', 'SEGDOC');
select pxp.f_insert_tgui ('Estados por momento', 'Estados por momento', 'RDOC.1.1.4', 'no', 0, 'sis_workflow/vista/tipo_documento_estado/TipoDocumentoEstadoWF.php', 5, '', '40%', 'SEGDOC');
select pxp.f_insert_tgui ('Pagos similares', 'Pagos similares', 'RDOC.1.1.5', 'no', 0, 'sis_tesoreria/vista/plan_pago/RepFilPlanPago.php', 5, '', '90%', 'SEGDOC');
select pxp.f_insert_tgui ('Funcionarios', 'Funcionarios', 'RDOC.4.1', 'no', 0, 'sis_organigrama/vista/funcionario/Funcionario.php', 4, '', 'funcionario', 'SEGDOC');
select pxp.f_insert_tgui ('Cuenta Bancaria del Empleado', 'Cuenta Bancaria del Empleado', 'RDOC.4.1.1', 'no', 0, 'sis_organigrama/vista/funcionario_cuenta_bancaria/FuncionarioCuentaBancaria.php', 5, '', 'FuncionarioCuentaBancaria', 'SEGDOC');
select pxp.f_insert_tgui ('Especialidad del Empleado', 'Especialidad del Empleado', 'RDOC.4.1.2', 'no', 0, 'sis_organigrama/vista/funcionario_especialidad/FuncionarioEspecialidad.php', 5, '', 'FuncionarioEspecialidad', 'SEGDOC');
select pxp.f_insert_tgui ('Personas', 'Personas', 'RDOC.4.1.3', 'no', 0, 'sis_seguridad/vista/persona/Persona.php', 5, '', 'persona', 'SEGDOC');
select pxp.f_insert_tgui ('Instituciones', 'Instituciones', 'RDOC.4.1.1.1', 'no', 0, 'sis_parametros/vista/institucion/Institucion.php', 6, '', 'Institucion', 'SEGDOC');
select pxp.f_insert_tgui ('Personas', 'Personas', 'RDOC.4.1.1.1.1', 'no', 0, 'sis_seguridad/vista/persona/Persona.php', 7, '', 'persona', 'SEGDOC');
select pxp.f_insert_tgui ('Subir foto', 'Subir foto', 'RDOC.4.1.1.1.1.1', 'no', 0, 'sis_seguridad/vista/persona/subirFotoPersona.php', 8, '', 'subirFotoPersona', 'SEGDOC');
select pxp.f_insert_tgui ('Estado de Wf', 'Estado de Wf', 'VBDOC.1', 'no', 0, 'sis_workflow/vista/estado_wf/FormEstadoWf.php', 3, '', 'FormEstadoWf', 'SEGDOC');
select pxp.f_insert_tgui ('Estado de Wf', 'Estado de Wf', 'VBDOC.2', 'no', 0, 'sis_workflow/vista/estado_wf/AntFormEstadoWf.php', 3, '', 'AntFormEstadoWf', 'SEGDOC');
select pxp.f_insert_tgui ('Documentos del Proceso', 'Documentos del Proceso', 'VBDOC.3', 'no', 0, 'sis_workflow/vista/documento_wf/DocumentoWf.php', 3, '', '90%', 'SEGDOC');
select pxp.f_insert_tgui ('Observaciones del WF', 'Observaciones del WF', 'VBDOC.4', 'no', 0, 'sis_workflow/vista/obs/Obs.php', 3, '', '80%', 'SEGDOC');
select pxp.f_insert_tgui ('Funcionarios', 'Funcionarios', 'VBDOC.5', 'no', 0, 'sis_organigrama/vista/funcionario/Funcionario.php', 3, '', 'funcionario', 'SEGDOC');
select pxp.f_insert_tgui ('Documentos del Proceso', 'Documentos del Proceso', 'VBDOC.1.1', 'no', 0, 'sis_workflow/vista/documento_wf/DocumentoWf.php', 4, '', '90%', 'SEGDOC');
select pxp.f_insert_tgui ('Subir ', 'Subir ', 'VBDOC.1.1.1', 'no', 0, 'sis_workflow/vista/documento_wf/SubirArchivoWf.php', 5, '', 'SubirArchivoWf', 'SEGDOC');
select pxp.f_insert_tgui ('Documentos de Origen', 'Documentos de Origen', 'VBDOC.1.1.2', 'no', 0, 'sis_workflow/vista/documento_wf/DocumentoWf.php', 5, '', '90%', 'SEGDOC');
select pxp.f_insert_tgui ('Histórico', 'Histórico', 'VBDOC.1.1.3', 'no', 0, 'sis_workflow/vista/documento_historico_wf/DocumentoHistoricoWf.php', 5, '', '30%', 'SEGDOC');
select pxp.f_insert_tgui ('Estados por momento', 'Estados por momento', 'VBDOC.1.1.4', 'no', 0, 'sis_workflow/vista/tipo_documento_estado/TipoDocumentoEstadoWF.php', 5, '', '40%', 'SEGDOC');
select pxp.f_insert_tgui ('Pagos similares', 'Pagos similares', 'VBDOC.1.1.5', 'no', 0, 'sis_tesoreria/vista/plan_pago/RepFilPlanPago.php', 5, '', '90%', 'SEGDOC');
select pxp.f_insert_tgui ('Funcionarios', 'Funcionarios', 'VBDOC.4.1', 'no', 0, 'sis_organigrama/vista/funcionario/Funcionario.php', 4, '', 'funcionario', 'SEGDOC');
select pxp.f_insert_tgui ('Cuenta Bancaria del Empleado', 'Cuenta Bancaria del Empleado', 'VBDOC.4.1.1', 'no', 0, 'sis_organigrama/vista/funcionario_cuenta_bancaria/FuncionarioCuentaBancaria.php', 5, '', 'FuncionarioCuentaBancaria', 'SEGDOC');
select pxp.f_insert_tgui ('Especialidad del Empleado', 'Especialidad del Empleado', 'VBDOC.4.1.2', 'no', 0, 'sis_organigrama/vista/funcionario_especialidad/FuncionarioEspecialidad.php', 5, '', 'FuncionarioEspecialidad', 'SEGDOC');
select pxp.f_insert_tgui ('Personas', 'Personas', 'VBDOC.4.1.3', 'no', 0, 'sis_seguridad/vista/persona/Persona.php', 5, '', 'persona', 'SEGDOC');
select pxp.f_insert_tgui ('Instituciones', 'Instituciones', 'VBDOC.4.1.1.1', 'no', 0, 'sis_parametros/vista/institucion/Institucion.php', 6, '', 'Institucion', 'SEGDOC');
select pxp.f_insert_tgui ('Personas', 'Personas', 'VBDOC.4.1.1.1.1', 'no', 0, 'sis_seguridad/vista/persona/Persona.php', 7, '', 'persona', 'SEGDOC');
select pxp.f_insert_tgui ('Subir foto', 'Subir foto', 'VBDOC.4.1.1.1.1.1', 'no', 0, 'sis_seguridad/vista/persona/subirFotoPersona.php', 8, '', 'subirFotoPersona', 'SEGDOC');
select pxp.f_insert_tfuncion ('segdoc.ft_tipo_doc_sel', 'Funcion para tabla     ', 'SEGDOC');
select pxp.f_insert_tfuncion ('segdoc.ft_tipo_doc_ime', 'Funcion para tabla     ', 'SEGDOC');
select pxp.f_insert_tfuncion ('segdoc.ft_informe_ime', 'Funcion para tabla     ', 'SEGDOC');
select pxp.f_insert_tfuncion ('segdoc.f_fun_inicio_informe_wf', 'Funcion para tabla     ', 'SEGDOC');
select pxp.f_insert_tfuncion ('segdoc.f_fun_regreso_informe_wf', 'Funcion para tabla     ', 'SEGDOC');
select pxp.f_insert_tfuncion ('segdoc.ft_informe_sel', 'Funcion para tabla     ', 'SEGDOC');
select pxp.f_insert_tprocedimiento ('seg_TDO_SEL', 'Consulta de datos', 'si', '', '', 'segdoc.ft_tipo_doc_sel');
select pxp.f_insert_tprocedimiento ('seg_TDO_CONT', 'Conteo de registros', 'si', '', '', 'segdoc.ft_tipo_doc_sel');
select pxp.f_insert_tprocedimiento ('seg_TDO_INS', 'Insercion de registros', 'si', '', '', 'segdoc.ft_tipo_doc_ime');
select pxp.f_insert_tprocedimiento ('seg_TDO_MOD', 'Modificacion de registros', 'si', '', '', 'segdoc.ft_tipo_doc_ime');
select pxp.f_insert_tprocedimiento ('seg_TDO_ELI', 'Eliminacion de registros', 'si', '', '', 'segdoc.ft_tipo_doc_ime');
select pxp.f_insert_tprocedimiento ('SEG_INF_INS', 'Insercion de registros', 'si', '', '', 'segdoc.ft_informe_ime');
select pxp.f_insert_tprocedimiento ('SEG_INF_MOD', 'Modificacion de registros', 'si', '', '', 'segdoc.ft_informe_ime');
select pxp.f_insert_tprocedimiento ('SEG_INF_ELI', 'Eliminacion de registros', 'si', '', '', 'segdoc.ft_informe_ime');
select pxp.f_insert_tprocedimiento ('SEG_ANTEST_IME', 'Transaccion utilizada  pasar a  estados anteriores del informe', 'si', '', '', 'segdoc.ft_informe_ime');
select pxp.f_insert_tprocedimiento ('SEG_SIGEST_IME', 'funcion que controla el cambio al Siguiente estado del informe, integrado  con el WF', 'si', '', '', 'segdoc.ft_informe_ime');
select pxp.f_insert_tprocedimiento ('SEG_INF_SEL', 'Consulta de datos', 'si', '', '', 'segdoc.ft_informe_sel');
select pxp.f_insert_tprocedimiento ('SEG_INF_CONT', 'Conteo de registros', 'si', '', '', 'segdoc.ft_informe_sel');
select pxp.f_insert_tprocedimiento ('SEG_INFREG_SEL', 'consulta de informe filtrado por el usuario de registro', 'si', '', '', 'segdoc.ft_informe_sel');
select pxp.f_insert_tprocedimiento ('SEG_INFREG_CONT', 'Conteo de registros', 'si', '', '', 'segdoc.ft_informe_sel');
select pxp.f_insert_trol ('Pruebas', 'SDOC', 'SEGDOC');
select pxp.f_insert_trol ('REgistro de documentos', 'SEG-Registro', 'SEGDOC');
select pxp.f_insert_trol ('VoBo Documentos', 'SEG - VoBo', 'SEGDOC');  

/********************************************F-DAT-RAC-SEG-0-15/01/2013********************************************/


/********************************************I-DAT-RAC-SEG-0-13/02/2017********************************************/


select wf.f_import_tproceso_macro ('insert','SD', 'SEGDOC', 'Seguimiento de Documentos','si');
select wf.f_import_ttipo_proceso ('insert','DOC',NULL,NULL,'SD','Documentos','','','si','','opcional','','DOC',NULL);
select wf.f_import_ttipo_estado ('insert','borrador','DOC','Borrador','si','no','no','funcion_listado','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','vobo','DOC','VoBo','no','no','no','funcion_listado','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','vbconta','DOC','VoBo Conta','no','no','no','funcion_listado','','ninguno','','','si','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);
select wf.f_import_ttipo_estado ('insert','finalizado','DOC','Finalizado','no','no','si','anterior','','ninguno','','','no','no',NULL,'<font color="99CC00" size="5"><font size="4">{TIPO_PROCESO}</font></font><br><br><b>&nbsp;</b>Tramite:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; <b>{NUM_TRAMITE}</b><br><b>&nbsp;</b>Usuario :<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {USUARIO_PREVIO} </b>en estado<b>&nbsp; {ESTADO_ANTERIOR}<br></b>&nbsp;<b>Responsable:&nbsp;&nbsp; &nbsp;&nbsp; </b><b>{FUNCIONARIO_PREVIO}&nbsp; {DEPTO_PREVIO}<br>&nbsp;</b>Estado Actual<b>: &nbsp; &nbsp;&nbsp; {ESTADO_ACTUAL}</b><br><br><br>&nbsp;{OBS} <br>','Aviso WF ,  {PROCESO_MACRO}  ({NUM_TRAMITE})','','no','','','','','','','',NULL);
select wf.f_import_testructura_estado ('insert','borrador','vobo','DOC',1,'');
select wf.f_import_testructura_estado ('insert','vobo','vobo','DOC',1,'');
select wf.f_import_testructura_estado ('insert','vobo','vbconta','DOC',1,'');
select wf.f_import_testructura_estado ('insert','vbconta','finalizado','DOC',1,'');


/********************************************F-DAT-RAC-SEG-0-13/02/2017********************************************/


