% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2010 Rusty Klophaus
% See MIT-LICENSE for licensing information.

-module (element_restful_upload).
-include_lib ("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, restful_upload).

render_element(Record) -> 
  Value = wf:html_encode(Record#restful_upload.text, Record#restful_upload.html_encode),
  wf_tags:emit_tag(input, [
			   {type, file}, 
			   {class, [restful_upload, Record#restful_upload.class]},
			   {maxlength, Record#restful_upload.maxlength},
			   {style, Record#restful_upload.style},
			   {name, Record#restful_upload.html_name},
			   {value, Value}
			  ]).
