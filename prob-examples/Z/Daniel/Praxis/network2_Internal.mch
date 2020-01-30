
MACHINE network2
SETS /* enumerated */
  FSTState={fstFailed,fstOK};
  MsgType={requestMsg,responseMsg,fstFailMsg};
  Response={granted,refused}
ABSTRACT_CONSTANTS
  others
ABSTRACT_VARIABLES
  fstState,
  received,
  sent,
  wsState
/* PROMOTED OPERATIONS
  RequestOK,
  Transfer,
  ReadRequestOK,
  ReadResponse */
PROPERTIES
    others : {1,2} --> POW({1,2})
  & others = {cmpset__264|cmpset__264 : INTEGER * POW(INTEGER) & #(w).(cmpset__264 = w |-> {1,2} - {w} & w : {1,2})}
INITIALISATION
    LET wsState',fstState',sent',received' BE ((wsState' = {1,2} * {wsIdle} & fstState' = fstOK) & sent' = {1,2} * {[]}) & received' = {1,2} * {[]}
    IN
      SELECT 
          wsState' : {1,2} --> WSState
        & sent' : {1,2} --> seq({rec__35|rec__35 : struct(msg:struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response),waitingFor:POW(INTEGER)) & ((# /* LET */ (lettmp271).( (lettmp271)=(rec__35'msg) & lettmp271'requestor : {1,2} & lettmp271'responder : {1,2})) & rec__35'waitingFor : POW({1,2}))})
        & !(ws).(ws : {1,2} => !(qmsg).(qmsg : ran(sent'(ws)) => qmsg'waitingFor <: others(ws)))
        & received' : {1,2} --> seq({rec__38|rec__38 : struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response) & (rec__38'requestor : {1,2} & rec__38'responder : {1,2})})
      THEN 
        fstState,received,sent,wsState := fstState',received',sent',wsState'
      END
    END
OPERATIONS
  RequestOK(ws?) = 
    ANY fstState',received',sent',wsState',match__1
    WHERE 
        wsState' : {1,2} --> WSState
      & ws? : {1,2}
      & match__1'requestor : {1,2}
      & match__1'responder : {1,2}
      & wsState(ws?) = wsIdle
      & match__1'msgType = requestMsg
      & match__1'requestor = ws?
      & wsState' = wsState <+ {ws? |-> wsWaiting(others(ws?))}
      & match__1'responder = ws?
      & match__1'response = granted
      & sent' : {1,2} --> seq({rec__186|rec__186 : struct(msg:struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response),waitingFor:POW(INTEGER)) & ((# /* LET */ (lettmp297).( (lettmp297)=(rec__186'msg) & lettmp297'requestor : {1,2} & lettmp297'responder : {1,2})) & rec__186'waitingFor : POW({1,2}))})
      & received' : {1,2} --> seq({rec__190|rec__190 : struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response) & (rec__190'requestor : {1,2} & rec__190'responder : {1,2})})
      & !(ws).(ws : {1,2} => !(qmsg).(qmsg : ran(sent'(ws)) => qmsg'waitingFor <: others(ws)))
      & fstState = fstOK
      & fstState' = fstState
      & (# /* LET */ (waitingFor).( (waitingFor)=(others(ws?)) & ((match__1'requestor : {1,2} & match__1'responder : {1,2}) & waitingFor : POW({1,2})) & sent' = sent <+ {ws? |-> (sent(ws?) ^ [rec(msg:match__1,waitingFor:waitingFor)])}))
      & received = received'
    THEN
      fstState,received,sent,wsState := fstState',received',sent',wsState'
    END;
  
  Transfer(from?,to?) = 
    ANY received',sent'
    WHERE 
        sent' : {1,2} --> seq({rec__205|rec__205 : struct(msg:struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response),waitingFor:POW(INTEGER)) & ((# /* LET */ (lettmp301).( (lettmp301)=(rec__205'msg) & lettmp301'requestor : {1,2} & lettmp301'responder : {1,2})) & rec__205'waitingFor : POW({1,2}))})
      & !(ws).(ws : {1,2} => !(qmsg).(qmsg : ran(sent'(ws)) => qmsg'waitingFor <: others(ws)))
      & received' : {1,2} --> seq({rec__208|rec__208 : struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response) & (rec__208'requestor : {1,2} & rec__208'responder : {1,2})})
      & fstState = fstOK
      & from? : {1,2}
      & to? : {1,2}
      & sent(from?) /= []
      & (# /* LET */ (queuedMsg).( (queuedMsg)=first(sent(from?)) & (to? : queuedMsg'waitingFor & sent' = sent <+ {from? |-> ((LET (waitingFor')==(queuedMsg'waitingFor - {to?}) IN {z_,z__|(z_ : BOOL & z__ : POW(INTEGER * struct(msg:struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response),waitingFor:POW(INTEGER)))) & ((waitingFor' = {} => z__ = []) & (not(waitingFor' = {}) => z__ = [rec(msg:queuedMsg'msg,waitingFor:waitingFor')]))}(TRUE)) ^ tail(sent(from?)))}) & received' = received <+ {to? |-> (received(to?) ^ [queuedMsg'msg])}))
    THEN
      received,sent := received',sent'
    END;
  
  ReadRequestOK(ws?) = 
    ANY fstState',received',sent',wsState',match__3
    WHERE 
        sent' : {1,2} --> seq({rec__226|rec__226 : struct(msg:struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response),waitingFor:POW(INTEGER)) & ((# /* LET */ (lettmp307).( (lettmp307)=(rec__226'msg) & lettmp307'requestor : {1,2} & lettmp307'responder : {1,2})) & rec__226'waitingFor : POW({1,2}))})
      & received' : {1,2} --> seq({rec__229|rec__229 : struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response) & (rec__229'requestor : {1,2} & rec__229'responder : {1,2})})
      & ws? : {1,2}
      & wsState' : {1,2} --> WSState
      & match__3'requestor : {1,2}
      & match__3'responder : {1,2}
      & sent : {1,2} --> seq({rec__233|rec__233 : struct(msg:struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response),waitingFor:POW(INTEGER)) & ((# /* LET */ (lettmp310).( (lettmp310)=(rec__233'msg) & lettmp310'requestor : {1,2} & lettmp310'responder : {1,2})) & rec__233'waitingFor : POW({1,2}))})
      & received : {1,2} --> seq({rec__236|rec__236 : struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response) & (rec__236'requestor : {1,2} & rec__236'responder : {1,2})})
      & sent' : {1,2} --> seq({rec__237|rec__237 : struct(msg:struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response),waitingFor:POW(INTEGER)) & ((# /* LET */ (lettmp311).( (lettmp311)=(rec__237'msg) & lettmp311'requestor : {1,2} & lettmp311'responder : {1,2})) & rec__237'waitingFor : POW({1,2}))})
      & received' : {1,2} --> seq({rec__240|rec__240 : struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response) & (rec__240'requestor : {1,2} & rec__240'responder : {1,2})})
      & ws? : {1,2}
      & !(ws).(ws : {1,2} => !(qmsg).(qmsg : ran(sent(ws)) => qmsg'waitingFor <: others(ws)))
      & !(ws).(ws : {1,2} => !(qmsg).(qmsg : ran(sent'(ws)) => qmsg'waitingFor <: others(ws)))
      & fstState = fstOK
      & fstState' = fstState
      & received(ws?) /= []
      & received' = received <+ {ws? |-> tail(received(ws?))}
      & wsState : {1,2} --> WSState
      & wsState' : {1,2} --> WSState
      & match__3'requestor : {1,2}
      & match__3'responder : {1,2}
      & wsState' = {z_,z__|(z_ : BOOL & z__ : POW(INTEGER * WSState)) & ((match__3'response = granted => z__ = wsState <+ {ws? |-> wsIdle}) & (not(match__3'response = granted) => z__ = wsState))}(TRUE)
      & match__3'msgType = responseMsg
      & match__3'responder = ws?
      & (# /* LET */ (match__2).( (match__2)=first(received(ws?)) & (((match__2'requestor : {1,2} & match__2'responder : {1,2}) & match__2'msgType = requestMsg) & match__3'response = {z_,z__|(z_ : BOOL & z__ : Response) & ((wsState(ws?) = wsIdle or (__is_ft_case(WSState,wsWaiting,(wsState(ws?))) & match__2'requestor > ws?) => z__ = granted) & (not(wsState(ws?) = wsIdle or (__is_ft_case(WSState,wsWaiting,(wsState(ws?))) & match__2'requestor > ws?)) => z__ = refused))}(TRUE)) & match__3'requestor = match__2'requestor))
      & !(ws).(ws : {1,2} => !(qmsg).(qmsg : ran(sent'(ws)) => qmsg'waitingFor <: others(ws)))
      & fstState = fstOK
      & fstState' = fstState
      & (# /* LET */ (waitingFor).( (waitingFor)=(others(ws?)) & ((match__3'requestor : {1,2} & match__3'responder : {1,2}) & waitingFor : POW({1,2})) & sent' = sent <+ {ws? |-> (sent(ws?) ^ [rec(msg:match__3,waitingFor:waitingFor)])}))
    THEN
      fstState,received,sent,wsState := fstState',received',sent',wsState'
    END;
  
  ReadResponse(ws?) = 
    ANY fstState',received',sent',wsState',match__4
    WHERE 
        sent' : {1,2} --> seq({rec__259|rec__259 : struct(msg:struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response),waitingFor:POW(INTEGER)) & ((# /* LET */ (lettmp318).( (lettmp318)=(rec__259'msg) & lettmp318'requestor : {1,2} & lettmp318'responder : {1,2})) & rec__259'waitingFor : POW({1,2}))})
      & received' : {1,2} --> seq({rec__262|rec__262 : struct(msgType:MsgType,requestor:INTEGER,responder:INTEGER,response:Response) & (rec__262'requestor : {1,2} & rec__262'responder : {1,2})})
      & ws? : {1,2}
      & match__4'requestor : {1,2}
      & match__4'responder : {1,2}
      & !(ws).(ws : {1,2} => !(qmsg).(qmsg : ran(sent'(ws)) => qmsg'waitingFor <: others(ws)))
      & fstState = fstOK
      & fstState' = fstState
      & received(ws?) /= []
      & match__4 = first(received(ws?))
      & received' = received <+ {ws? |-> tail(received(ws?))}
      & sent = sent'
      & wsState' : {1,2} --> WSState
      & match__4'msgType = responseMsg
      & wsState' = wsState <+ {ws? |-> {z_,z__|(z_ : BOOL & z__ : WSState) & ((match__4'requestor /= ws? or not(__is_ft_case(WSState,wsWaiting,(wsState(ws?)))) => z__ = wsState(ws?)) & (not(match__4'requestor /= ws? or not(__is_ft_case(WSState,wsWaiting,(wsState(ws?))))) => z__ = (LET (nowWaiting)==(__ft~(WSState,wsWaiting,(wsState(ws?))) - {match__4'responder}) IN {z_,z__|(z_ : BOOL & z__ : WSState) & ((nowWaiting = {} => z__ = wsEditing) & (not(nowWaiting = {}) => z__ = wsWaiting(nowWaiting)))}(TRUE))))}(TRUE)}
    THEN
      fstState,received,sent,wsState := fstState',received',sent',wsState'
    END
FREETYPES
  WSState: 
    wsIdle
    wsWaiting(POW(INTEGER))
    wsEditing
END
