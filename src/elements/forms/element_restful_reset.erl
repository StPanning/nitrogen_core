% Nitrogen Web Framework for Erlang
% Copyright (c) 2012 Steffen Panning
% See MIT-LICENSE for licensing information.

-module (element_restful_reset).
-include_lib ("wf.hrl").
-compile(export_all).

reflect() -> record_info(fields, restful_reset).

render_element(Record) ->
    ID = Record#restful_reset.id,
    Anchor = Record#restful_reset.anchor,
    case Record#restful_reset.postback of
        undefined -> ignore;
        Postback -> wf:wire(Anchor, #event { type=click, validation_group=ID, postback=Postback, delegate=Record#restful_reset.delegate })
    end,

    Value = ["  ", wf:html_encode(Record#restful_reset.text, Record#restful_reset.html_encode), "  "], 
    wf_tags:emit_tag(input, [
        {type,  reset},
	{name,  Record#restful_reset.html_name},
        {class, [restful_reset, Record#restful_reset.class]},
        {style, Record#restful_reset.style},
        {value, Value}
    ]).
