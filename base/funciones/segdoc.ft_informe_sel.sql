--------------- SQL ---------------

CREATE OR REPLACE FUNCTION segdoc.ft_informe_sel (
  p_administrador integer,
  p_id_usuario integer,
  p_tabla varchar,
  p_transaccion varchar
)
RETURNS varchar AS
$body$
/**************************************************************************
 SISTEMA:		Seguimiento de Documentos
 FUNCION: 		segdoc.ft_informe_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'segdoc.tinforme'
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

	v_consulta    		varchar;
	v_parametros  		record;
	v_nombre_funcion   	text;
	v_resp				varchar;
			    
BEGIN

	v_nombre_funcion = 'segdoc.ft_informe_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'SEG_INF_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		31-01-2017 10:17:46
	***********************************/

	if(p_transaccion='SEG_INF_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
                          inf.id_informe,
                          inf.obs,
                          inf.estado,
                          inf.estado_reg,
                          inf.id_estado_wf,
                          inf.id_proceso_wf,
                          inf.id_funcionario,
                          inf.num_doc,
                          inf.id_tipo_doc,
                          inf.id_usuario_reg,
                          inf.fecha_reg,
                          inf.usuario_ai,
                          inf.id_usuario_ai,
                          inf.id_usuario_mod,
                          inf.fecha_mod,
                          usu1.cuenta as usr_reg,
                          usu2.cuenta as usr_mod,
                          tdo.descripcion as desc_tipo_doc,
                          fun.desc_funcionario1	,
                          nro_tramite
						from segdoc.tinforme inf
                        inner join segdoc.ttipo_doc tdo on tdo.id_tipo_doc = inf.id_tipo_doc
						inner join orga.vfuncionario fun on fun.id_funcionario = inf.id_funcionario
                        inner join segu.tusuario usu1 on usu1.id_usuario = inf.id_usuario_reg
						inner join wf.testado_wf ewf on ewf.id_estado_wf = inf.id_estado_wf
                        
                        left join segu.tusuario usu2 on usu2.id_usuario = inf.id_usuario_mod
                        where  inf.estado != ''borrador'' and ';
                        
                        IF  p_administrador != 1 THEN
                           v_consulta = v_consulta||'  ewf.id_funcionario = '||v_parametros.id_funcionario_usu||' and ' ;
                        END IF;
                        
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SEG_INF_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		31-01-2017 10:17:46
	***********************************/

	elsif(p_transaccion='SEG_INF_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_informe)
					    from segdoc.tinforme inf
                        inner join segdoc.ttipo_doc tdo on tdo.id_tipo_doc = inf.id_tipo_doc
						inner join orga.vfuncionario fun on fun.id_funcionario = inf.id_funcionario
                        inner join segu.tusuario usu1 on usu1.id_usuario = inf.id_usuario_reg
						inner join wf.testado_wf ewf on ewf.id_estado_wf = inf.id_estado_wf
                        
                        left join segu.tusuario usu2 on usu2.id_usuario = inf.id_usuario_mod
                        where  inf.estado != ''borrador''  and ';
                        
                        
                        IF  p_administrador != 1 THEN
                           v_consulta = v_consulta||'  ewf.id_funcionario = '||v_parametros.id_funcionario_usu||' and ' ;
                        END IF;
			
			--Definicion de la respuesta		    
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;
	
    /*********************************    
 	#TRANSACCION:  'SEG_INFREG_SEL'
 	#DESCRIPCION:	consulta de informe filtrado por el usuario de registro
 	#AUTOR:		admin	
 	#FECHA:		31-01-2017 10:17:46
	***********************************/

	elseif(p_transaccion='SEG_INFREG_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
                          inf.id_informe,
                          inf.obs,
                          inf.estado,
                          inf.estado_reg,
                          inf.id_estado_wf,
                          inf.id_proceso_wf,
                          inf.id_funcionario,
                          inf.num_doc,
                          inf.id_tipo_doc,
                          inf.id_usuario_reg,
                          inf.fecha_reg,
                          inf.usuario_ai,
                          inf.id_usuario_ai,
                          inf.id_usuario_mod,
                          inf.fecha_mod,
                          usu1.cuenta as usr_reg,
                          usu2.cuenta as usr_mod,
                          tdo.descripcion as desc_tipo_doc,
                          fun.desc_funcionario1	,
                          nro_tramite
						from segdoc.tinforme inf
                        inner join segdoc.ttipo_doc tdo on tdo.id_tipo_doc = inf.id_tipo_doc
						inner join orga.vfuncionario fun on fun.id_funcionario = inf.id_funcionario
                        inner join segu.tusuario usu1 on usu1.id_usuario = inf.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = inf.id_usuario_mod
                        where  ';
                       
            
            IF p_administrador != 1 THEN
               v_consulta = v_consulta || ' inf.id_usuario_reg = '||p_id_usuario||' and ';
            END IF; 
                        
                        
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'SEG_INFREG_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		31-01-2017 10:17:46
	***********************************/

	elsif(p_transaccion='SEG_INFREG_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_informe)
					    from segdoc.tinforme inf
                        inner join segdoc.ttipo_doc tdo on tdo.id_tipo_doc = inf.id_tipo_doc
						inner join orga.vfuncionario fun on fun.id_funcionario = inf.id_funcionario
                        inner join segu.tusuario usu1 on usu1.id_usuario = inf.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = inf.id_usuario_mod
                        where ';
                        
            
              IF p_administrador != 1 THEN
               v_consulta = v_consulta || ' inf.id_usuario_reg = '||p_id_usuario||' and ';
              END IF;             
			
			--Definicion de la respuesta		    
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;
    
    				
	else
					     
		raise exception 'Transaccion inexistente';
					         
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