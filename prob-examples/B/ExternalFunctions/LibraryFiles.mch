MACHINE LibraryFiles
/* This Library Machine provides a convenient access to the ProB
   external functions for directory and file manipulation */
ABSTRACT_CONSTANTS files, full_files,
   directories, full_directories,
   current_directory,
   file_exists, file_readable, file_writable, file_executable, file_size, 
   file_created, file_modified, file_accessed,
   directory_exists, directory_readable, directory_writable, directory_searchable,
   directory_created, directory_modified, directory_accessed
PROPERTIES
  /* relative file names of files in a directory */
  files : STRING --> POW(STRING) &
  files = %(x).(x:STRING|FILES(x)) &
  
  /* full file names of files in a directory */
  full_files : STRING --> POW(STRING) &
  full_files = %(x).(x:STRING|FULL_FILES(x)) &
  
  directories : STRING --> POW(STRING) &
  directories = %(x).(x:STRING|DIRECTORIES(x)) &
  
  full_directories : STRING --> POW(STRING) &
  full_directories = %(x).(x:STRING|FULL_DIRECTORIES(x)) &
  
  /* a constant giving the current directory (.) */
  current_directory = "." &
  
  /* checking whether a path points to a directory */
  directory_exists = %x.(x:STRING|bool(DIRECTORY_EXISTS(x))) &
  directory_readable = %x.(x:STRING|bool(DIRECTORY_PROPERTY(x,"readable"))) &
  directory_writable = %x.(x:STRING|bool(DIRECTORY_PROPERTY(x,"writable"))) &
  directory_searchable = %x.(x:STRING|bool(DIRECTORY_PROPERTY(x,"searchable"))) &
  directory_created = %x.(x:STRING|DIRECTORY_PROPERTY_VALUE(x,"create_timestamp")) &
  directory_modified = %x.(x:STRING|DIRECTORY_PROPERTY_VALUE(x,"modify_timestamp")) &
  directory_accessed = %x.(x:STRING|DIRECTORY_PROPERTY_VALUE(x,"access_timestamp")) &
  
  /* checking whether a path points to a file */
  file_exists = %x.(x:STRING|bool(FILE_EXISTS(x))) &
  file_readable = %x.(x:STRING|bool(FILE_PROPERTY(x,"readable"))) &
  file_writable = %x.(x:STRING|bool(FILE_PROPERTY(x,"writable"))) &
  file_executable = %x.(x:STRING|bool(FILE_PROPERTY(x,"executable"))) &
  file_size = %x.(x:STRING|FILE_PROPERTY_VALUE(x,"size_in_bytes")) &
  file_created = %x.(x:STRING|FILE_PROPERTY_VALUE(x,"create_timestamp")) &
  file_modified = %x.(x:STRING|FILE_PROPERTY_VALUE(x,"modify_timestamp")) &
  file_accessed = %x.(x:STRING|FILE_PROPERTY_VALUE(x,"access_timestamp"))
DEFINITIONS
 FILES(x) == files(x);
 EXTERNAL_FUNCTION_FILES == (STRING --> POW(STRING));
 FULL_FILES(x) == full_files(x);
 EXTERNAL_FUNCTION_FULL_FILES == (STRING --> POW(STRING));
 DIRECTORIES(x) == directories(x);
 EXTERNAL_FUNCTION_DIRECTORIES == (STRING --> POW(STRING));
 FULL_DIRECTORIES(x) == full_directories(x);
 EXTERNAL_FUNCTION_FULL_DIRECTORIES == (STRING --> POW(STRING));

 EXTERNAL_PREDICATE_DIRECTORY_EXISTS == (STRING);
 DIRECTORY_EXISTS(A) == (directory_exists(A)=TRUE);
 EXTERNAL_PREDICATE_FILE_EXISTS == (STRING);
 FILE_EXISTS(A) == (file_exists(A)=TRUE);
 EXTERNAL_PREDICATE_FILE_PROPERTY == (STRING*STRING);
 FILE_PROPERTY(A,B) == (file_property(A,B)=TRUE);
 EXTERNAL_FUNCTION_FILE_PROPERTY_VALUE == ((STRING*STRING)-->INTEGER);
 FILE_PROPERTY_VALUE(A,B) == (file_property_value(A,B));
 EXTERNAL_FUNCTION_DIRECTORY_PROPERTY_VALUE == ((STRING*STRING)-->INTEGER);
 DIRECTORY_PROPERTY_VALUE(A,B) == (directory_property_value(A,B));
 EXTERNAL_PREDICATE_DIRECTORY_PROPERTY == (STRING*STRING);
 DIRECTORY_PROPERTY(A,B) == (directory_property(A,B)=TRUE)
ASSERTIONS
 directory_exists(current_directory)=TRUE;
 file_exists(current_directory)=FALSE;
 !f.(f:files(current_directory) => file_exists(f)=TRUE);
 !f.(f:full_files(current_directory) => file_exists(f)=TRUE);
 !f.(f:files(current_directory) => directory_exists(f)=FALSE);
 !f.(f:full_files(current_directory) => directory_exists(f)=FALSE);
 card(full_files(current_directory)) = card(files(current_directory));
 !d.(d:directories(current_directory) => directory_exists(d)=TRUE);
 !d.(d:full_directories(current_directory) => directory_exists(d)=TRUE);
 !d.(d:directories(current_directory) => file_exists(d)=FALSE);
 !d.(d:full_directories(current_directory) => file_exists(d)=FALSE);
 card(full_directories(current_directory)) = card(directories(current_directory));
 !f.(f:files(current_directory) => file_size(f)>=0);
 !f.(f:files(current_directory) => ((file_readable(f)=TRUE) => file_exists(f)=TRUE)); /* just call file_readable */
 !f.(f:files(current_directory) => ((file_writable(f)=TRUE) => file_exists(f)=TRUE)); /* just call file_readable */
 !f.(f:files(current_directory) => ((file_executable(f)=TRUE) => file_exists(f)=TRUE)); /* just call file_executable */
 /* !f.(f:files(current_directory) => (file_created(f)<=file_modified(f))); this does not seem to hold !! */
 /* !f.(f:files(current_directory) => (file_modified(f)<=file_accessed(f))); this does not seem to hold !! */
 !f.(f:files(current_directory) => (file_modified(f)>=0 & file_created(f)>=0 & file_accessed(f)>=0));
 !d.(d:directories(current_directory) => (directory_readable(d)=TRUE => directory_exists(d)=TRUE));
 !d.(d:directories(current_directory) => (directory_writable(d)=TRUE => directory_exists(d)=TRUE));
 !d.(d:directories(current_directory) => (directory_searchable(d)=TRUE => directory_exists(d)=TRUE));
 /* !d.(d:directories(current_directory) => (directory_created(d)<=directory_modified(d))); this does not seem to hold !! */
 /* !d.(d:directories(current_directory) => (directory_modified(d)<=directory_accessed(d)))this does not seem to hold !! */
 !d.(d:directories(current_directory) => (directory_modified(d)>=0 & directory_created(d)>=0 & directory_accessed(d)>=0))
/*
 Examples:
  {x,y|x:full_files(".") & y=file_size(x) & y>1024*1024}
 
  let subdir = {x,y|x:STRING & y:full_directories(x)}
  card(closure1(subdir)[{"~/git_root/prob_examples/public_examples/B"}])
*/
END

