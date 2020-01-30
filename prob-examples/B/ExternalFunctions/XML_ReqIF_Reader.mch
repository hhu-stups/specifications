MACHINE XML_ReadeReqIF_reader
DEFINITIONS
 XML_ELement_Type ==
      struct(
        recId: NATURAL1,
        pId:NATURAL,
        element:STRING,
        attributes: STRING +-> STRING,
        meta: STRING +-> STRING
        );
 EXTERNAL_FUNCTION_READ_XML == (STRING * STRING) --> seq(XML_ELement_Type);
 READ_XML(file,encoding) == {};
 EXTERNAL_FUNCTION_READ_XML_FROM_STRING == STRING --> seq(XML_ELement_Type);
 READ_XML_FROM_STRING(contents) == {};
 EXTERNAL_FUNCTION_WRITE_XML_TO_STRING == seq(XML_ELement_Type) --> STRING;
 WRITE_XML_TO_STRING(contents) == "<?xml ...?>";

 ChildrenForELEMENT(ElStr) == dom({i,root| root:dom(Data) & Data(root)'element = ElStr & i:dom(Data) & Data(i)'pId = root});
 GetDESC(ii) == IF "DESC" : dom(Data(ii)'attributes) THEN Data(ii)'attributes("DESC") ELSE "??" END
CONSTANTS Data, SPEC_TYPES,SPEC_OBJECTS, SPECIFICATIONS, child, descs, dot_child
PROPERTIES
// Data : seq(XML_ELement_Type) &
 Data = READ_XML("XML/example_reqif.xml","auto") &
 SPEC_TYPES = ChildrenForELEMENT("SPEC-TYPES") &
 SPEC_OBJECTS = ChildrenForELEMENT("SPEC-OBJECTS") &
 SPECIFICATIONS = ChildrenForELEMENT("SPECIFICATIONS") &
 child = {j,i| i:dom(Data) & Data(i)'pId = j} &
 descs = closure1(child) &

 // following relation is for dot viewing:
// dot_child = {j2,i2| LET i,j BE i=prj1(INTEGER,STRING)(i2) & j=prj1(INTEGER,STRING)(j2) IN j|->i:child & j:dom(Data) & prj2(INTEGER,STRING)(j2)=Data(j)'element & prj2(INTEGER,STRING)(i2)=Data(i)'element  END }
 dot_child = {j2,i2| #(i,j).( j|->i:child & j:dom(Data) & j2 = rec(Id:j,el:Data(j)'element) & i2 = rec(Id:i,el:Data(i)'element)  ) }
VARIABLES xx
INVARIANT
 xx:dom(Data)
INITIALISATION xx:=1
OPERATIONS
  res <-- XML_Element = BEGIN res := Data(xx) END;
  res <-- Line = BEGIN res := Data(xx)'meta("xmlLineNumber") END;
  Inc = SELECT xx+1 : dom(Data) THEN xx:=xx+1 END;

  SPEC_TYPE_INFO(i,ln,desc) = PRE i:SPEC_TYPES & desc=GetDESC(i) & Data(i)'attributes("LONG-NAME")=ln THEN skip END;
  SPEC_OBJ_INFO(i,ln,desc) = PRE i:SPEC_OBJECTS & desc=GetDESC(i) & Data(i)'attributes("LONG-NAME")=ln THEN skip END;
  SPEC_OBJ_REF(i,j,text) = PRE i:SPEC_OBJECTS & j:descs[{i}] & "text":dom(Data(j)'attributes) & text = Data(j)'attributes("text") THEN skip END;
  SPECIFICATION_INFO(i,ln,desc) = PRE i:SPECIFICATIONS & desc=GetDESC(i) & Data(i)'attributes("LONG-NAME")=ln THEN skip END;
  SPEC_REF(i,j,text) = PRE i:SPECIFICATIONS & j:descs[{i}] & "text":dom(Data(j)'attributes) & text = Data(j)'attributes("text") THEN skip END
END
