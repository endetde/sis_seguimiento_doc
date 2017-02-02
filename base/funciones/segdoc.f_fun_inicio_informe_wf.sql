--------------- SQL ---------------

CREATE OR REPLACE FUNCTION segdoc.f_fun_inicio_informe_wf (
  p_id_usuario integer,
  p_id_usuario_ai integer,
  p_usuario_ai varchar,
  p_id_estado_wf integer,
  p_id_proceso_wf integer,
  p_codigo_estado varchar
)
RETURNS boolean AS
$body$
/*
*
*  Autor:   RAC
*  DESC:    funcion que actualiza el estado siguiente del informe
*  Fecha:   01/02/2017
*
*/

DECLARE

	v_nombre_funcion   	 text;
    v_resp    			 varchar;
    v_mensaje 			 varchar;
    
    v_rec_informe 			 record;
    
    v_config			record;
    v_registros			record;
    v_id_movimiento		integer;
    v_id_movimiento_tipo integer;
    v_id_almacen_dest 	integer;
    v_id_funcionario 	integer;
	v_id_gestion 		integer;
    v_id_movimiento_det	integer;
    v_record			record;
    v_valores						text[];
    v_respuesta			varchar;
    v_mostrar_alerts	varchar;
    v_alertas			text;
    v_integrar_almacenes	varchar;
   
	
    
BEGIN

	 v_nombre_funcion = 'vef.f_fun_inicio_informe_wf';
    
      select i.*
      into v_rec_informe
      from segdoc.tinforme i
      where id_proceso_wf = p_id_proceso_wf;
      
      
    -- actualiza estado en la solicitud
    update segdoc.tinforme  t set 
       id_estado_wf =  p_id_estado_wf,
       estado = p_codigo_estado,
       id_usuario_mod=p_id_usuario,
       id_usuario_ai = p_id_usuario_ai,
       usuario_ai = p_usuario_ai,
       fecha_mod=now()                   
    where id_proceso_wf = p_id_proceso_wf;   

	RETURN   TRUE;

EXCEPTION
					
	WHEN OTHERS THEN
			v_resp='';
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
			v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
			v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
			raise exception '%',v_resp;
END;
$body$
LANGUAGE 'plpgsql'
VOLATILE
CALLED ON NULL INPUT
SECURITY INVOKER
COST 100;