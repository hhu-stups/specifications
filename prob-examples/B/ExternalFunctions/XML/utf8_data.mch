MACHINE utf8_data
DEFINITIONS
  XML_ELement_Type == struct(
                        recId: NATURAL1,
                        pId:NATURAL,
                        element:STRING,
                        attributes: STRING +-> STRING,
                        meta: STRING +-> STRING);
  EXTERNAL_FUNCTION_READ_XML == (STRING * STRING) --> seq(XML_ELement_Type);
  READ_XML(file,e) == {};
CONSTANTS
  data
PROPERTIES
    data = READ_XML("utf8_data.xml","UTF-8") & data : seq(XML_ELement_Type)
ASSERTIONS
  data(2)'attributes("a") = "Foo";
  data(2)'attributes("b") = "Föö"
END
