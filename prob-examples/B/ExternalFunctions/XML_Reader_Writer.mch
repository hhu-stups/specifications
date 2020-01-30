MACHINE XML_Reader_Writer
DEFINITIONS
 "LibraryXML.def"
ABSTRACT_CONSTANTS get_element, get_attributes, get_pId
CONSTANTS Data
PROPERTIES
 get_element = %r.(r:XML_ELement_Type|r'element) &
 get_attributes = %r.(r:XML_ELement_Type|r'attributes) &
 get_pId = %r.(r:XML_ELement_Type|r'pId) &
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
 // idempotence checks:
 !d.(d=READ_XML_FROM_STRING(WRITE_XML_TO_STRING(Data))
   => (Data ; get_element)=(d ; get_element) &
      (Data ; get_attributes)=(d ; get_attributes) &
      (Data ; get_pId)=(d ; get_pId)
  );
 (WRITE_XML(Data,"XML/Data2.xml") & (Data ; get_element)=(READ_XML("XML/Data2.xml","auto") ; get_element));
 (WRITE_XML(Data,"XML/Data2.xml") & (Data ; get_attributes)=(READ_XML("XML/Data2.xml","auto") ; get_attributes))
VARIABLES xx
INVARIANT
 xx:dom(Data)
INITIALISATION xx:=1
OPERATIONS
  res <-- XML_Element = BEGIN res := Data(xx) END;
  res <-- Line = BEGIN res := Data(xx)'meta("xmlLineNumber") END;
  Inc = SELECT xx+1 : dom(Data) THEN xx:=xx+1 END;
  res <-- XML_AS_STRING = BEGIN res := WRITE_XML_TO_STRING(Data) END
END
