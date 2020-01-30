MACHINE XML_Reader
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
CONSTANTS Data
PROPERTIES
// Data : seq(XML_ELement_Type) &
 Data = READ_XML("XML/Data.xml","auto")
ASSERTIONS
 Data : seq(XML_ELement_Type);
 size(Data) = 9;
 Data(1)'element = "Data";
 Data(1)'attributes("version") = "03.04";
 Data(1)'meta("xmlLineNumber") = "2";
 Data(4)'element = "Tag1";
 Data(4)'attributes("attribute1") = "value1";
 Data(4)'meta("xmlLineNumber") = "5";
 Data(6)'attributes("attribute1") = "value2";
 Data(8)'element = "Group1";
 Data(8)'meta("xmlLineNumber") = "10";
 !x.(x:ran(Data) & x'pId /=0 => x'pId : dom(Data));
 Data(9)'attributes("text") = "hallo du";
 Data(9)'meta("xmlLineNumber")="11";

 // check newline handling:
 READ_XML("XML/Data1.xml","auto")(9)'meta("xmlLineNumber")="15"
VARIABLES xx
INVARIANT
 xx:dom(Data)
INITIALISATION xx:=1
OPERATIONS
  res <-- XML_Element = BEGIN res := Data(xx) END;
  res <-- Line = BEGIN res := Data(xx)'meta("xmlLineNumber") END;
  Inc = SELECT xx+1 : dom(Data) THEN xx:=xx+1 END
END
