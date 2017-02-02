--------------- SQL ---------------

CREATE OR REPLACE FUNCTION segdoc.ft_informe_ime (
  p_administrador integer,
  p_id_usuario integer,
  p_tabla varchar,
  p_transaccion varchar
)
RETURNS varchar AS
$body$
/**************************************************************************
 SISTEMA:		Seguimiento de Documentos
 FUNCION: 		segdoc.ft_informe_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'segdoc.tinforme'
 AUTOR: 		 (admin)
 FECHA:	        31-01-2017 10:17:46
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:

 DESCRIPCION:	
 AUTOR:			
 FECHA:		
***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_informe	integer;
    
    
    v_num_tramite 			varchar;
    v_id_proceso_wf			integer;
    v_id_estado_wf			integer;
    v_codigo_estado 		varchar;
    v_codigo_tipo_proceso	varchar;
    v_id_gestion			integer;
    v_registros_tdo			record;
    v_resp_doc 				boolean;
    
    v_id_tipo_estado	    integer;
    v_id_funcionario		integer;
    v_id_usuario_reg		integer;
    v_id_depto				integer;
    v_id_estado_wf_ant 		integer;
    v_id_estado_actual		integer;
    
    v_acceso_directo		varchar;
    v_clase					varchar;
    v_parametros_ad			varchar;
    v_tipo_noti				varchar;
    v_titulo				varchar;
    v_reg_informe			record;
    
    v_codigo_estado_siguiente  varchar;	
    v_es_fin					varchar;
    v_obs						varchar;
			    
BEGIN

    v_nombre_funcion = 'segdoc.ft_informe_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SEG_INF_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		31-01-2017 10:17:46
	***********************************/

	if(p_transaccion='SEG_INF_INS')then
					
        begin
        	
            
            v_codigo_tipo_proceso = 'INFORME';
            
            --obtener la gestion apartir de la fecha
            
            select id_gestion into v_id_gestion from
            param.tperiodo per 
            where per.fecha_ini <= v_parametros.fecha_doc 
             and per.fecha_fin >=  v_parametros.fecha_doc
             limit 1 offset 0;
             
             IF v_id_gestion is null THEN
                raise exception 'no se encontro una gestion para la fecha %',v_parametros.fecha_doc;
             END IF;
                         
             
             select 
                *
               into
                 v_registros_tdo
             from segdoc.ttipo_doc tdo 
             where tdo.id_tipo_doc = v_parametros.id_tipo_doc;
            
            
            --Sentencia de la insercion
        	insert into segdoc.tinforme(
			obs,
			
			estado_reg,
			
			
			id_funcionario,
			num_doc,
			id_tipo_doc,
			id_usuario_reg,
			fecha_reg,
			usuario_ai,
			id_usuario_ai,
			id_usuario_mod,
			fecha_mod,
            fecha_doc
          	) values(
			v_parametros.obs,			
			'activo',			
			v_parametros.id_funcionario,
			v_parametros.num_doc,
			v_parametros.id_tipo_doc,
			p_id_usuario,
			now(),
			v_parametros._nombre_usuario_ai,
			v_parametros._id_usuario_ai,
			null,
			null,
            v_parametros.fecha_doc
            )RETURNING id_informe into v_id_informe;
            
           -- raise exception '% --- %', v_id_gestion, v_codigo_tipo_proceso;
            
             -- inciiar el tramite en el sistema de WF
           SELECT 
                 ps_num_tramite ,
                 ps_id_proceso_wf ,
                 ps_id_estado_wf ,
                 ps_codigo_estado 
              into
                 v_num_tramite,
                 v_id_proceso_wf,
                 v_id_estado_wf,
                 v_codigo_estado   
                  
            FROM wf.f_inicia_tramite(
                 p_id_usuario, 
                 v_parametros._id_usuario_ai,
                 v_parametros._nombre_usuario_ai,
                 v_id_gestion, 
                 v_codigo_tipo_proceso, 
                 v_parametros.id_funcionario,
                 NULL,
                 'Registro de Documento '|| COALESCE(v_registros_tdo.codigo,'N/S') ||' nro: '||COALESCE(v_parametros.num_doc,'s/n'),
                 v_parametros.num_doc);
                 
              
        
            -- UPDATE DATOS wf
            
              UPDATE segdoc.tinforme  SET
                 nro_tramite = v_num_tramite,
                 id_proceso_wf = v_id_proceso_wf,
                 id_estado_wf = v_id_estado_wf,
                 estado = v_codigo_estado
              WHERE id_informe = v_id_informe;
          
          
            -- inserta documentos en estado borrador si estan configurados
           v_resp_doc =  wf.f_inserta_documento_wf(p_id_usuario, v_id_proceso_wf, v_id_estado_wf);
           v_resp_doc = wf.f_verifica_documento(p_id_usuario, v_id_estado_wf);
            
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Informe almacenado(a) con exito (id_informe'||v_id_informe||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_informe',v_id_informe::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'SEG_INF_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		31-01-2017 10:17:46
	***********************************/

	elsif(p_transaccion='SEG_INF_MOD')then

		begin
			--Sentencia de la modificacion
			update segdoc.tinforme set
			obs = v_parametros.obs,
			estado = v_parametros.estado,
			id_estado_wf = v_parametros.id_estado_wf,
			id_proceso_wf = v_parametros.id_proceso_wf,
			id_funcionario = v_parametros.id_funcionario,
			num_doc = v_parametros.num_doc,
			id_tipo_doc = v_parametros.id_tipo_doc,
			id_usuario_mod = p_id_usuario,
			fecha_mod = now(),
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_informe=v_parametros.id_informe;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Informe modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_informe',v_parametros.id_informe::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'SEG_INF_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		31-01-2017 10:17:46
	***********************************/

	elsif(p_transaccion='SEG_INF_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from segdoc.tinforme
            where id_informe=v_parametros.id_informe;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Informe eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_informe',v_parametros.id_informe::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
        
    /*********************************    
 	#TRANSACCION:  'SEG_ANTEST_IME'
 	#DESCRIPCION:	Transaccion utilizada  pasar a  estados anteriores del informe
 	#AUTOR:		RAC	
 	#FECHA:		01/02/2017
	***********************************/

	elseif(p_transaccion='SEG_ANTEST_IME')then   
        begin
        
        --------------------------------------------------
        --Retrocede al estado inmediatamente anterior
        -------------------------------------------------
       --recuperaq estado anterior segun Log del WF
          SELECT  
             ps_id_tipo_estado,
             ps_id_funcionario,
             ps_id_usuario_reg,
             ps_id_depto,
             ps_codigo_estado,
             ps_id_estado_wf_ant
          into
             v_id_tipo_estado,
             v_id_funcionario,
             v_id_usuario_reg,
             v_id_depto,
             v_codigo_estado,
             v_id_estado_wf_ant 
          FROM wf.f_obtener_estado_ant_log_wf(v_parametros.id_estado_wf);
          --
          select 
               ew.id_proceso_wf 
            into 
               v_id_proceso_wf
          from wf.testado_wf ew
          where ew.id_estado_wf= v_id_estado_wf_ant;          
          
         --configurar acceso directo para la alarma   
             v_acceso_directo = '';
             v_clase = '';
             v_parametros_ad = '';
             v_tipo_noti = 'notificacion';
             v_titulo  = 'Notificacion';
             
          -- registra nuevo estado                      
          v_id_estado_actual = wf.f_registra_estado_wf(
              v_id_tipo_estado, 
              v_id_funcionario, 
              v_parametros.id_estado_wf, 
              v_id_proceso_wf, 
              p_id_usuario,
              v_parametros._id_usuario_ai,
              v_parametros._nombre_usuario_ai,
              v_id_depto,
              '[RETROCESO] '|| v_parametros.obs,
              v_acceso_directo,
              v_clase,
              v_parametros_ad,
              v_tipo_noti,
              v_titulo);
               
           IF  segdoc.f_fun_regreso_informe_wf(p_id_usuario, 
           									v_parametros._id_usuario_ai, 
                                            v_parametros._nombre_usuario_ai, 
                                            v_id_estado_actual, 
                                            v_id_proceso_wf, 
                                            v_codigo_estado) THEN
                                            
          END IF; 
                         
         -- si hay mas de un estado disponible  preguntamos al usuario
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Se realizo el cambio de estado)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'operacion','cambio_exitoso');
                             
          --Devuelve la respuesta
            return v_resp;
        end;
    
    /*********************************    
 	#TRANSACCION:  'SEG_SIGEST_IME'
 	#DESCRIPCION:	funcion que controla el cambio al Siguiente estado del informe, integrado  con el WF
 	#AUTOR:		RAC	
 	#FECHA:		01-02-2017 12:12:51
	***********************************/

	elseif(p_transaccion='SEG_SIGEST_IME')then   
        
        begin
        	
           /*   PARAMETROS
           
          $this->setParametro('id_proceso_wf_act','id_proceso_wf_act','int4');
          $this->setParametro('id_tipo_estado','id_tipo_estado','int4');
          $this->setParametro('id_funcionario_wf','id_funcionario_wf','int4');
          $this->setParametro('id_depto_wf','id_depto_wf','int4');
          $this->setParametro('obs','obs','text');
          $this->setParametro('json_procesos','json_procesos','text');
          */        
           
          select 
            ew.id_tipo_estado ,            
            ew.id_estado_wf
           into 
            v_id_tipo_estado,            
            v_id_estado_wf
            
          from wf.testado_wf ew
          inner join wf.ttipo_estado te on te.id_tipo_estado = ew.id_tipo_estado
          where ew.id_estado_wf =  v_parametros.id_estado_wf_act;
          
          select 
               i.*
             into 
               v_reg_informe
          from segdoc.tinforme i
          where i.id_proceso_wf = v_parametros.id_proceso_wf_act;
          
           -- obtener datos tipo estado
                
           select
                 te.codigo,
                 te.fin
             into
                 v_codigo_estado_siguiente,
                 v_es_fin
            from wf.ttipo_estado te
            where te.id_tipo_estado = v_parametros.id_tipo_estado;
                
           IF  pxp.f_existe_parametro(p_tabla,'id_depto_wf') THEN
               v_id_depto = v_parametros.id_depto_wf;
            END IF;
                
            IF  pxp.f_existe_parametro(p_tabla,'obs') THEN
                  v_obs=v_parametros.obs;
            ELSE
                 v_obs='---';
            END IF;
               
             --configurar acceso directo para la alarma   
             v_acceso_directo = '';
             v_clase = '';
             v_parametros_ad = '';
             v_tipo_noti = 'notificacion';
             v_titulo  = 'Visto Bueno';
             
             -- hay que recuperar el supervidor que seria el estado inmediato,...
             v_id_estado_actual =  wf.f_registra_estado_wf(v_parametros.id_tipo_estado, 
                                                             v_parametros.id_funcionario_wf, 
                                                             v_parametros.id_estado_wf_act, 
                                                             v_parametros.id_proceso_wf_act,
                                                             p_id_usuario,
                                                             v_parametros._id_usuario_ai,
                                                             v_parametros._nombre_usuario_ai,
                                                             v_id_depto,
                                                             v_obs,
                                                             v_acceso_directo ,
                                                             v_clase,
                                                             v_parametros_ad,
                                                             v_tipo_noti,
                                                             v_titulo);
                
                   
          IF  segdoc.f_fun_inicio_informe_wf(p_id_usuario, 
           									v_parametros._id_usuario_ai, 
                                            v_parametros._nombre_usuario_ai, 
                                            v_id_estado_actual, 
                                            v_parametros.id_proceso_wf_act, 
                                            v_codigo_estado_siguiente) THEN
                                            
          END IF;  
          
        
          -- si hay mas de un estado disponible  preguntamos al usuario
          v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Se realizo el cambio de estado del informe)'); 
          v_resp = pxp.f_agrega_clave(v_resp,'operacion','cambio_exitoso');
          
          
          -- Devuelve la respuesta
          return v_resp;
        
     end;
         
	else
     
    	raise exception 'Transaccion inexistente: %',p_transaccion;

	end if;

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