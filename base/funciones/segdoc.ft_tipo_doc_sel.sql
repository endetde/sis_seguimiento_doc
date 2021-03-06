--------------- SQL ---------------

CREATE OR REPLACE FUNCTION segdoc.ft_tipo_doc_sel (
  p_administrador integer,
  p_id_usuario integer,
  p_tabla varchar,
  p_transaccion varchar
)
RETURNS varchar AS
$body$
/**************************************************************************
 SISTEMA:		Seguimiento de Documentos
 FUNCION: 		segdoc.ft_tipo_doc_sel
 DESCRIPCION:   Funcion que devuelve conjuntos de registros de las consultas relacionadas con la tabla 'segdoc.ttipo_doc'
 AUTOR: 		 (admin)
 FECHA:	        31-01-2017 09:39:28
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

	v_nombre_funcion = 'segdoc.ft_tipo_doc_sel';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'seg_TDO_SEL'
 	#DESCRIPCION:	Consulta de datos
 	#AUTOR:		admin	
 	#FECHA:		31-01-2017 09:39:28
	***********************************/

	if(p_transaccion='seg_TDO_SEL')then
     				
    	begin
    		--Sentencia de la consulta
			v_consulta:='select
						tdo.id_tipo_doc,
						tdo.codigo,
						tdo.estado_reg,
						tdo.descripcion,
						tdo.fecha_reg,
						tdo.usuario_ai,
						tdo.id_usuario_reg,
						tdo.id_usuario_ai,
						tdo.id_usuario_mod,
						tdo.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod	
						from segdoc.ttipo_doc tdo
						inner join segu.tusuario usu1 on usu1.id_usuario = tdo.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = tdo.id_usuario_mod
				        where  ';
			
			--Definicion de la respuesta
			v_consulta:=v_consulta||v_parametros.filtro;
			v_consulta:=v_consulta||' order by ' ||v_parametros.ordenacion|| ' ' || v_parametros.dir_ordenacion || ' limit ' || v_parametros.cantidad || ' offset ' || v_parametros.puntero;

			--Devuelve la respuesta
			return v_consulta;
						
		end;

	/*********************************    
 	#TRANSACCION:  'seg_TDO_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		31-01-2017 09:39:28
	***********************************/

	elsif(p_transaccion='seg_TDO_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_tipo_doc)
					    from segdoc.ttipo_doc tdo
					    inner join segu.tusuario usu1 on usu1.id_usuario = tdo.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = tdo.id_usuario_mod
					    where ';
			
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