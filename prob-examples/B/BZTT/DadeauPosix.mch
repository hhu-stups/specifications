/****************************************************************/
/* POSIX spec modelization					*/
/*								*/
/* Based on :							*/
/*	The Open Group Base Specifications Issue 6		*/
/*	IEEE Std 1003.1, 2004 Edition				*/
/*	Copyright © 2001-2004 The IEEE and The Open Group	*/
/*								*/
/* Authors (1) :						*/
/*	DADEAU Frederic						*/
/*	DE KERMADEC Adrien					*/
/*	TISSOT Regis						*/
/*								*/
/* (1) : LIFC...						*/
/****************************************************************/

/* TODO -> correction sur les permissions de recherche c.f. notes de modélisation */

/* unlink : le lien entre fichier et repertoire et supprimé, mais le fichier reste ouvert */
/* rename : deplacer un fichier ou un repertoire TODO a completer */
/* taille des repertoires pour stat */
/* attention au fait que ROOT_ID |-> ROOT_ID pour les NOT_empty, exist*/

/* ENOTENT et ENOTDIR peut être après EACCES -> question de securité */
MACHINE posix

/* NOTES : */
/* the x bit of permission for dirs denotes search permissions */
/* non determinism beetween ENOENT and ENODIR (c.f. truncate,...)*/

SETS
	NAMES = {n_root, n_null, n_01, n_02, n_03, n_04};
	MODE_FLAG = {r,w,rw};
/*AccCtrl 	UID = {uid0,uid1,uid2};*/
/*AccCtrl 	GID = {gid0,gid1,gid2};*/
	BOOLEAN = {true,false};
	IDS = {id0,id1,id2,id3,id4,id5,id6};

	SW = {ok,ko};
	ERRNO = {
		OK,
		EACCES,
		EEXIST,
		EISDIR,
		EMFILE,
		ENOENT,
		EBADF,
		EFBIG,
		EINVAL,
		ENOTDIR,
		ENOTEMPTY,
		EBUSY,
		EPERM
		}


DEFINITIONS
	/*MAX_IDS == 512;*/
	/*IDS == 0..512;*/
	MAX_FILE_SIZE == 12; /*assurer la cohérence avec ci dessous */
	FILE_SIZE == 0..12;
/*	BYTE == 0..255;*/
	MAX_OPEN == 10; /*assurer la cohérence avec ci dessous */
	OPENED_FD == 0..10
/*AccCtrl 	PERMISSIONS_W == {7,6,3,2};*/
/*AccCtrl 	PERMISSIONS_R == {7,6,5,4};*/
/*AccCtrl 	PERMISSIONS_RW == {7,6};*/
/*AccCtrl 	PERMISSIONS_X == {7,5,3,1};*/
/*AccCtrl 	RIGHTS == 0..7*/
CONSTANTS
	ROOT_ID,
	ROOT_NAME,
/*AccCtrl 	ROOT_UID,*/
/*AccCtrl 	ROOT_GID,*/

	EMPTY_NAME

PROPERTIES
	ROOT_ID : IDS
&	ROOT_ID = id0 /*0*/

&	ROOT_NAME : NAMES
&	ROOT_NAME = n_root

/*AccCtrl &	ROOT_UID : UID*/
/*AccCtrl &	ROOT_GID : GID*/
/*AccCtrl &	ROOT_UID = uid0*/
/*AccCtrl &	ROOT_GID = gid0*/

&	EMPTY_NAME : NAMES
&	EMPTY_NAME = n_null
VARIABLES
	/*****************************/
	/* arborescence des fichiers */
	/*****************************/
	existing_files,
	existing_dirs,
	existing_ids,

	ids2name,
	ids2parent,
	ids2parentClosure,

	current_dir,

	/***********************/
	/* contenu des fichier */
	/***********************/
	file2size,
	file2content,

	/***************************************/
	/* gestion de l'ouverture des fichiers */
	/***************************************/
	fd,
	fd2ids,
	fd2mode,

	/***************************/
	/* gestion des permissions */
	/***************************/
/*AccCtrl 	uid,*/
/*AccCtrl 	gid,*/
/*AccCtrl 	user2group,*/
/*AccCtrl 	user2group1,*/
/*AccCtrl 	file2user,*/
/*AccCtrl 	file2group,*/
/*AccCtrl 	file2urights,*/
/*AccCtrl 	file2grights,*/
/*AccCtrl 	file2arights,*/
/*AccCtrl 	current_user,*/

	/***********************/
	/* gestion des erreurs */
	/***********************/
	errno,

	/*********************************/
	/* variables utiles pour le test */
	/*********************************/
	last_IN_fd,
	last_IN_path,
	last_IN_pathRoot,
	last_IN_name

INVARIANT
	/*****************************/
	/* arborescence des fichiers */
	/*****************************/
	existing_files <: IDS
&	existing_dirs <: IDS

&	existing_ids <: IDS
&	existing_ids = existing_files \/ existing_dirs
&	existing_files /\ existing_dirs = {}

&	ids2name : existing_ids --> NAMES

&	ids2parent : existing_ids --> existing_dirs
&	ids2parentClosure : existing_ids <-> existing_dirs

&	current_dir : existing_dirs

	/***********************/
	/* contenu des fichier */
	/***********************/

&	file2content : existing_files <-> NAT /* abstraction avec un numéro de version du fichier */
&	(!(f).((f:existing_files) => (f|->0 : file2content)))
&	file2size : file2content -->  FILE_SIZE /* relation entre la version d'un ficher et son num de version*/

	/***************************************/
	/* gestion de l'ouverture des fichiers */
	/***************************************/
&	fd <: OPENED_FD
&	fd2ids : fd --> existing_ids
&	fd2mode : fd --> MODE_FLAG
&	card(fd) <= MAX_OPEN

	/***************************/
	/* gestion des permissions */
	/***************************/
/*AccCtrl  &	uid <: UID*/
/*AccCtrl  &	gid <: GID*/
/*AccCtrl  &	user2group : uid <-> gid*/
/*AccCtrl  &	user2group1 : uid --> gid*/
/*AccCtrl  &	file2user : existing_ids --> uid*/
/*AccCtrl  &	file2group : existing_ids --> gid*/
/*AccCtrl  &	file2urights : existing_ids --> RIGHTS*/
/*AccCtrl  &	file2grights : existing_ids --> RIGHTS*/
/*AccCtrl  &	file2arights : existing_ids --> RIGHTS*/
/*AccCtrl  &	current_user : uid*/

	/***********************/
	/* gestion des erreurs */
	/***********************/
&	errno : ERRNO

	/*********************************/
	/* variables utiles pour le test */
	/*********************************/
&	last_IN_fd : OPENED_FD
&	last_IN_path : IDS
&	last_IN_pathRoot : IDS
&	last_IN_name : NAMES

INITIALISATION
	/*****************************/
	/* arborescence des fichiers */
	/*****************************/
	existing_files := {}
||	existing_dirs := {ROOT_ID}
||	existing_ids := {ROOT_ID}
||	ids2name := {ROOT_ID |-> ROOT_NAME}
||	ids2parent := {ROOT_ID |-> ROOT_ID}
||	ids2parentClosure := {ROOT_ID |-> ROOT_ID}
||	current_dir := ROOT_ID

	/***********************/
	/* contenu des fichier */
	/***********************/
||	file2size := {}
||	file2content := {}

	/***************************************/
	/* gestion de l'ouverture des fichiers */
	/***************************************/
||	fd := {}
||	fd2ids := {}
||	fd2mode := {}

	/***************************/
	/* gestion des permissions */
	/***************************/
/*AccCtrl  ||	uid :={ROOT_UID}*/
/*AccCtrl  ||	gid := {ROOT_GID}*/
/*AccCtrl  ||	user2group := {ROOT_UID |-> ROOT_GID}*/
/*AccCtrl  ||	user2group1 := {ROOT_UID |-> ROOT_GID}*/
/*AccCtrl  ||	file2user := {ROOT_ID |-> ROOT_UID}*/
/*AccCtrl  ||	file2group := {ROOT_ID |-> ROOT_GID}*/
/*AccCtrl  ||	file2urights := {ROOT_ID |-> 6}*/
/*AccCtrl  ||	file2grights := {ROOT_ID |-> 4}*/
/*AccCtrl  ||	file2arights := {ROOT_ID |-> 4}*/
/*AccCtrl  ||	current_user := ROOT_UID*/

||	errno := OK

	/*********************************/
	/* variables utiles pour le test */
	/*********************************/
||	last_IN_fd := 1
||	last_IN_path := ROOT_ID
||	last_IN_pathRoot := ROOT_ID
||	last_IN_name := n_root
OPERATIONS
	null =
	BEGIN
		skip
	END;

	/****************************************************************/
	/* open 							*/
	/* open a file or a directory 					*/
	/*  int open(const char *path, int oflag, ... ); 		*/
	/* IN : 							*/
	/*	IN_path : IDS						*/
	/*	IN_name : NAMES						*/
	/*								*/
	/*	IN_mode : MODE_FLAG					*/
	/*								*/
	/*	IN_o_creat : BOOLEAN					*/
	/*	IN_o_excl : BOOLEAN					*/
	/*	IN_o_trunc : BOOLEAN					*/
	/*								*/
	/*	IN_urights : RIGHTS 					*/
	/*	  used when o_creat is set and file does not exists	*/
	/*	IN_grights : RIGHTS 					*/
	/*	  used when o_creat is set and file does not exists	*/
	/*	IN_arights : RIGHTS 					*/
	/*	  used when o_creat is set and file does not exists	*/
	/* OUT :							*/
	/*	fd : fd							*/
	/*								*/
	/* BEHAVIOURS : 						*/
	/*	OK 							*/
	/*	EACCES : permission denied (wrt O_FLAG)			*/
	/*	EEXIST : O_CREATE /\ O_EXCL -> file already exists	*/
	/*	EISDIR : filname is dir /\ w/rw				*/
	/*	EMFILE : too filedescriptor in the process		*/
	/*	ENOENT : file not exist or path is wrong		*/
	/*								*/
	/* NOTES :							*/
	/*	- On create a new file, group permission assignation is	*/
	/*	implementation dependant (c.f. Set-GID bit)		*/
	/*	- the result of O-trunc and RdONLY is undefined		*/
	/*	- TODO take account of search permission		*/
	/*	- TODO how the rights are set ?	(ok)			*/
	/*	- TODO rights mofication if the file exist ? (no)	*/
	/****************************************************************/
	OUT_sw,
	OUT_fd
	/*AccCtrl  <-- open(IN_pathRoot, IN_path, IN_name, IN_mode, IN_o_creat, IN_o_excl, IN_o_trunc, IN_urights, IN_grights, IN_arights) =*/
	<-- open(IN_pathRoot, IN_path, IN_name, IN_mode, IN_o_creat, IN_o_excl, IN_o_trunc) =
	PRE
		IN_pathRoot : IDS
	&	IN_pathRoot : {current_dir, ROOT_ID}

	&	IN_path : IDS
	&	IN_name : NAMES

	&	IN_mode : MODE_FLAG

	&	IN_o_creat : BOOLEAN
	&	IN_o_excl : BOOLEAN
	&	IN_o_trunc : BOOLEAN

	/*AccCtrl  &	IN_urights : RIGHTS*/
	/*AccCtrl  &	IN_grights : RIGHTS*/
	/*AccCtrl  &	IN_arights : RIGHTS*/

	/* restrictions */
	/* we do not deal with multiple access over the same file */
	/*&	(ids2name~[{IN_name}] /\ ids2parent~[{IN_path}]) /\ fd = {}*/

	THEN
		last_IN_path := IN_path
		|| last_IN_pathRoot := IN_pathRoot
		|| last_IN_name := IN_name
		|| IF (ids2name~[{IN_name}] /\ ids2parent~[{IN_path}] ={} & IN_o_creat = false) or (IN_path /: existing_dirs) THEN
			/* file doesn't exist and O_CREAT is not set or path doesn't exist*/
			errno := ENOENT
			|| OUT_sw := ko
		ELSE
			/* file exist or O_CREAT is set and path exist*/
			/*AccCtrl  LET LOC_dirs BE*/
				/*AccCtrl  LOC_dirs = (ids2parentClosure[{IN_pathRoot}] \/ ids2parentClosure[{IN_path}] \/ {IN_pathRoot} \/ {IN_path})*/
					/*AccCtrl  - ids2parent[(ids2parentClosure[{IN_pathRoot}] \/ {IN_pathRoot}) /\ (ids2parentClosure[{IN_path}] \/ {IN_path})]*/
			/*AccCtrl  IN*/
				/*AccCtrl  IF IN_pathRoot /= IN_path */
					/*AccCtrl  & (file2arights[LOC_dirs]  /<: PERMISSIONS_X)*/
					/*AccCtrl  & (file2grights[LOC_dirs]  /<: PERMISSIONS_X or file2group[LOC_dirs] - user2group[{current_user}] /= {})*/
					/*AccCtrl  & (file2urights[LOC_dirs]  /<: PERMISSIONS_X or {current_user} /= file2user[LOC_dirs])*/
					/*AccCtrl  & (current_user /= ROOT_UID)*/
				/*AccCtrl  THEN*/
					/*AccCtrl  /* search permission denied for one or more component of the file name*/
					/*AccCtrl  errno := EACCES*/
					/*AccCtrl  || OUT_sw := ko*/
				/*AccCtrl  ELSE*/
					/*AccCtrl  /* search permission ok*/
					IF ids2name~[{IN_name}] /\ ids2parent~[{IN_path}] ={} THEN
						/* file doesn't exist */
						/*AccCtrl  IF file2arights(IN_path) /: PERMISSIONS_W */
							/*AccCtrl  & (file2grights(IN_path) /: PERMISSIONS_W or user2group[{current_user}] /\ {file2group(IN_path)} = {})*/
							/*AccCtrl  & (file2urights(IN_path) /: PERMISSIONS_W or current_user /= file2user(IN_path))*/
							/*AccCtrl  & current_user /= ROOT_UID */
						/*AccCtrl  THEN*/
							/*AccCtrl  /* permission denied to create a file in the directory */
							/*AccCtrl  errno := EACCES*/
							/*AccCtrl  || OUT_sw := ko*/
						/*AccCtrl  ELSE*/
							IF card(fd) >= MAX_OPEN THEN
								/* too many file opened */
								errno := EMFILE
								|| OUT_sw := ko
							ELSE
								/* file creation allowed */
								ANY LOC_id WHERE LOC_id  : IDS & LOC_id /: existing_ids THEN
									existing_ids := existing_ids \/ {LOC_id}
									|| existing_files := existing_files \/ {LOC_id}
									|| ids2name := ids2name \/ {LOC_id |-> IN_name}
									|| ids2parent := ids2parent \/ {LOC_id |-> IN_path}
									|| ids2parentClosure := ids2parentClosure \/ ({LOC_id} * (ids2parentClosure[{IN_path}] \/ {IN_path}))
									|| file2content := file2content \/ {LOC_id |-> 0}
									|| file2size := file2size \/ {(LOC_id |-> 0)|-> 0}
									|| LET LOC_fd BE
										LOC_fd = min(OPENED_FD - fd)
									IN
										fd := fd \/ {LOC_fd}
										|| fd2ids := fd2ids \/ {LOC_fd|->LOC_id}
										|| fd2mode := fd2mode \/ {LOC_fd |-> IN_mode}
										|| OUT_fd := LOC_fd
									END
									/*AccCtrl  || file2user := file2user \/ {LOC_id |-> current_user}*/
									/* group du process ou du df conteneur */
									/*AccCtrl  || file2group := file2group \/ {LOC_id |-> file2group(IN_path)} */
									/*AccCtrl  || file2urights := file2urights \/ {LOC_id |-> IN_urights}*/
									/*AccCtrl  || file2grights := file2grights \/ {LOC_id |-> IN_grights}*/
									/*AccCtrl  || file2arights := file2arights \/ {LOC_id |-> IN_arights}*/
									|| errno := OK
									|| OUT_sw := ok
								END
							END
						 /*AccCtrl  END*/
					ELSE
						/* file exist */
						ANY LOC_id WHERE /* attention, on doit garantir qu'il n'y a qu'un fichier de meme nom dans le rep*/
							LOC_id  : ids2name~[{IN_name}] /\ ids2parent~[{IN_path}]
						THEN
							/*AccCtrl  IF current_user /= ROOT_UID*/
								/*AccCtrl  or (IN_mode = r*/
									/*AccCtrl  & file2arights(LOC_id) /: PERMISSIONS_R */
									/*AccCtrl  & (file2grights(LOC_id) /: PERMISSIONS_R or user2group[{current_user}] /\ {file2group(LOC_id)} = {})*/
									/*AccCtrl  & (file2urights(LOC_id) /: PERMISSIONS_R or current_user /= file2user(LOC_id)))*/
								/*AccCtrl  or (IN_mode = w*/
									/*AccCtrl  & file2arights(LOC_id) /: PERMISSIONS_W */
									/*AccCtrl  & (file2grights(LOC_id) /: PERMISSIONS_W or user2group[{current_user}] /\ {file2group(LOC_id)} = {})*/
									/*AccCtrl  & (file2urights(LOC_id) /: PERMISSIONS_W or current_user /= file2user(LOC_id)))*/
								/*AccCtrl  or (IN_mode = rw*/
									/*AccCtrl  & file2arights(LOC_id) /: PERMISSIONS_RW */
									/*AccCtrl  & (file2grights(LOC_id) /: PERMISSIONS_RW or user2group[{current_user}] /\ {file2group(LOC_id)} = {})*/
									/*AccCtrl  & (file2urights(LOC_id) /: PERMISSIONS_RW or current_user /= file2user(LOC_id)))*/
							/*AccCtrl  THEN*/
								/*AccCtrl  /* access denied */
								/*AccCtrl  errno := EACCES*/
								/*AccCtrl  || OUT_sw := ko*/
							/*AccCtrl  ELSE*/
								/* access allowed */
								IF LOC_id : existing_dirs & IN_mode /= r THEN
									/* file is a dir and mode is w or rw */
									errno := EISDIR
									|| OUT_sw := ko
								ELSE
									IF IN_o_excl = true & IN_o_creat = true THEN
										/* file exist and O_CREAT and O_EXCL is set*/
										errno := EEXIST
										|| OUT_sw := ko
									ELSE
										IF card(fd) >= MAX_OPEN THEN
											/* too many files are open */
											errno := EMFILE
											|| OUT_sw := ko
										ELSE
											IF IN_o_trunc = true & IN_mode : {w,rw} THEN
												/* file size is updated to 0*/
												file2content := file2content \/ {LOC_id |-> max(file2content[{LOC_id}]) + 1}
												|| file2size := file2size \/ {(LOC_id |-> max(file2content[{LOC_id}]) + 1) |-> 0}
											END
											/* file is opened*/
											|| LET LOC_fd BE
												LOC_fd = min(OPENED_FD - fd)
											IN
												fd := fd \/ {LOC_fd}
												|| fd2ids := fd2ids \/ {LOC_fd|->LOC_id}
												|| fd2mode := fd2mode \/ {LOC_fd |-> IN_mode}
												|| OUT_fd := LOC_fd
											END
											|| errno := OK
											|| OUT_sw := ok
										END
									END
								END
							/*AccCtrl  END*/
						END
					END
				/*AccCtrl  END*/
			/*AccCtrl  END*/
		END
	END;

	/****************************************************************/
	/* creat							*/
	/* equivalent to open(path, O_WRONLY | O_CREAT | O_TRUNC, mode)	*/
	/* model :							*/
	/*	open(IN_path,IN_name,					*/
	/*	IN_mode, 						*/
	/*	IN_o_creat = true, 					*/
	/*	IN_o_excl = false,					*/
	/*	IN_o_trunc = true,					*/
	/*	IN_urights,						*/
	/*	IN_grights,						*/
	/*	IN_arights						*/
	/****************************************************************/

	/****************************************************************/
	/* read								*/
	/* read a file							*/
	/* ssize_t read(int fildes, void *buf, size_t nbyte); 		*/
	/*								*/
	/* IN :								*/
	/*	IN_fd							*/
	/* OUT :							*/
	/*	OUT_sw							*/
	/*	OUT_content_version					*/
	/*	OUT_size						*/
	/*								*/
	/* BEHAVIOURS :							*/
	/* 	OK							*/
	/*	EBADF not a valid fd for reading			*/
	/*	EISDIR fd refer to a directory				*/
	/*								*/
	/* NOTES :							*/
	/*	EISDIR error is implementation dependant 		*/
	/****************************************************************/
	OUT_sw,
	OUT_content_version,
	OUT_size
	<-- read(IN_fd) =
	PRE
		IN_fd : OPENED_FD
	THEN
		last_IN_fd := IN_fd
		|| IF IN_fd /: fd THEN
			/* the fd is not a valid file descriptor */
			errno := EBADF
			|| OUT_sw := ko
		ELSE
			/* fd is a valid file descriptor */
			IF fd2ids(IN_fd) : existing_dirs THEN
				/* fd refers to a directory */
				errno := EISDIR
				|| OUT_sw := ko
			ELSE
				/* fd refers to a valid file */
				OUT_content_version := max(file2content[{fd2ids(IN_fd)}])
				|| OUT_size := file2size(fd2ids(IN_fd) |-> max(file2content[{fd2ids(IN_fd)}]))
				|| errno := OK
				|| OUT_sw := ok
			END
		END
	END;

	/****************************************************************/
	/* write 							*/
	/* write in an opened file 					*/
	/* ssize_t write(int fildes, const void *buf, size_t nbyte); 	*/
	/*								*/
	/* IN :								*/
	/*	IN_fd : IDS						*/
	/*	IN_modify : BOOLEAN					*/
	/*	IN_append : BOOLEAN					*/
	/*		only modifications after the end of the file 	*/
	/*	IN_newSize : NAT					*/
	/*		only considered if modified is set to true	*/
	/*								*/
	/* OUT :							*/
	/*	OUT_sw							*/
	/*								*/
	/* BEHAVIOURS : 						*/
	/*	EBADF : fd does not refer to a valid 			*/
	/*		fd open for writing				*/
	/*	EFBIG : write exceeds implementation max file size	*/
	/*								*/
	/* NOTES :							*/
	/*	- it is possible to decrease the file size ? (no)	*/
	/*	- when the new data size exceed 			*/
	/*	max file size, datas are written ? (yes)		*/
	/****************************************************************/
	OUT_sw
	<-- write(IN_fd, IN_modify, IN_append, IN_newSize) =
	PRE
		IN_fd : OPENED_FD
	&	IN_modify : BOOLEAN
	&	IN_append : BOOLEAN
	&	IN_newSize : NAT
	&	((IN_fd : fd & fd2ids(IN_fd) : existing_files) => IN_newSize >= file2size(fd2ids(IN_fd) |-> max(file2content[{fd2ids(IN_fd)}])))
	THEN
		last_IN_fd := IN_fd
		|| IF IN_fd /: fd or fd2mode(IN_fd) /: {r,rw} or fd2ids(IN_fd) /: existing_files THEN
			/* bad fd */
			errno := EBADF
			|| OUT_sw := ko
		ELSE
			/* good fd */
			IF IN_modify = true THEN
				/* the file is modified */
				IF IN_newSize > MAX_FILE_SIZE THEN
					/* data size exceeds MAX_FILE_SIZE*/
					IF IN_append = true & file2size(fd2ids(IN_fd) |-> max(file2content[{fd2ids(IN_fd)}]))>= MAX_FILE_SIZE THEN
						/* file does'nt change*/
						errno := EFBIG
						|| OUT_sw := ko
					ELSE
						/* file is modified */
						file2content := file2content \/ {fd2ids(IN_fd) |-> max(file2content[{fd2ids(IN_fd)}])+1}
						|| file2size := file2size \/  {(fd2ids(IN_fd) |-> max(file2content[{fd2ids(IN_fd)}])+1) |-> MAX_FILE_SIZE}
						|| errno := EFBIG
						|| OUT_sw := ko
					END
				ELSE
					/* file is modified without errors */
					file2content := file2content \/ {fd2ids(IN_fd) |-> max(file2content[{fd2ids(IN_fd)}])+1}
					|| file2size := file2size \/  {(fd2ids(IN_fd) |-> max(file2content[{fd2ids(IN_fd)}])+1) |-> IN_newSize}
					|| errno := OK
					|| OUT_sw := ok
				END
			ELSE
				errno := OK
				|| OUT_sw := ok
			END
		END
	END;

	/********************************************************/
	/* close						*/
	/* close an open file or directory			*/
	/* int close(int fildes);				*/
	/*							*/
	/* IN :							*/
	/*	IN_fd : IDS					*/
	/*							*/
	/* OUT :						*/
	/*	OUT_sw						*/
	/*							*/
	/* BEHAVIOURS :						*/
	/*	OK						*/
	/*	EBADF : bad fd					*/
	/********************************************************/
	OUT_sw
	<-- close(IN_fd) =
	PRE
		IN_fd : OPENED_FD
	THEN
		last_IN_fd := IN_fd
		|| IF IN_fd /: fd THEN
			/* bad fd */
			errno := EBADF
			|| OUT_sw := ko
		ELSE
			/* good fd */
			/* TODO : if the file descriptor correspond to a removed file */
			fd := fd - {IN_fd}
			|| fd2ids := {IN_fd}<<|fd2ids
			|| fd2mode := {IN_fd}<<|fd2mode
			|| errno := OK
			|| OUT_sw := ok
		END
	END;

	/********************************************************/
	/* ftruncate						*/
	/* increase, decrease an opened file			*/
	/* int ftruncate(int fildes, off_t length);		*/
	/*							*/
	/* IN :							*/
	/*	IN_fd : IDS					*/
	/*	IN_newSize					*/
	/*							*/
	/* OUT :						*/
	/*	OUT_sw						*/
	/*							*/
	/* BEHAVIOURS :						*/
	/*	OK						*/
	/*	EBADF/EINVAL : bad fd				*/
	/*	EINVAL : newSize < 0				*/
	/*	EFBIG : newSize > MAX_FILE_SIZE			*/
	/*							*/
	/* NOTES :						*/
	/*	- TODO IN_newSize < 0				*/
	/********************************************************/
	OUT_sw
	<-- ftruncate(IN_fd,IN_newSize) =
	PRE
		IN_fd : OPENED_FD
	&	IN_newSize : NAT
	THEN
		last_IN_fd := IN_fd
		|| IF IN_fd /: fd THEN
			/* not a valid fd */
			errno := EBADF
			|| OUT_sw := ko
		ELSE
			IF IN_newSize < 0 THEN
				errno := EINVAL
				|| OUT_sw := ko
			ELSE
				IF IN_newSize > MAX_FILE_SIZE THEN
					errno := EFBIG
					|| OUT_sw := ko
				ELSE
					file2content := file2content \/ {fd2ids(IN_fd) |-> max(file2content[{fd2ids(IN_fd)}])+1}
					|| file2size := file2size \/ {(fd2ids(IN_fd) |-> max(file2content[{fd2ids(IN_fd)}])+1) |-> IN_newSize}
					|| errno := OK
					|| OUT_sw := ok
				END
			END
		END
	END;

	/********************************************************/
	/* truncate						*/
	/* increase, decrease a file				*/
	/* int truncate(const char *path, off_t length);	*/
	/*							*/
	/* IN :							*/
	/*	IN_path						*/
	/*	IN_name						*/
	/*	IN_newSize					*/
	/*							*/
	/* OUT :						*/
	/*	OUT_sw						*/
	/*							*/
	/* BEHAVIOURS :						*/
	/*	OK						*/
	/*	EACCES : permission denied			*/
	/*	ENOENT : bad path				*/
	/*	EINVAL : newSize < 0				*/
	/*	EFBIG : newSize > MAX_FILE_SIZE			*/
	/*							*/
	/* NOTES :						*/
	/*	- TODO IN_newSize < 0				*/
	/********************************************************/
	OUT_sw
	<-- truncate(IN_pathRoot, IN_path, IN_name, IN_newSize) =
	PRE
		IN_pathRoot : IDS
	&	IN_pathRoot : {current_dir, ROOT_ID}
	&	IN_path : IDS
	&	IN_name : NAMES
	&	IN_newSize : NAT

	/* restrictions */
	/* we don't deal with opened file */
	&	(ids2name~[{IN_name}] /\ ids2parent~[{IN_path}]) /\ fd2ids[fd] = {}
	THEN
		last_IN_path := IN_path
		|| last_IN_pathRoot := IN_pathRoot
		|| last_IN_name := IN_name
		|| IF IN_path /: existing_dirs THEN
			errno := ENOTDIR
			||OUT_sw := ko
		ELSE
			IF ids2name~[{IN_name}] /\ ids2parent~[{IN_path}] = {}
				or IN_name = EMPTY_NAME THEN
				/* file does'nt exist*/
				errno := ENOENT
				|| OUT_sw := ko
			ELSE
				/* file exist*/
				IF ids2name~[{IN_name}] /\ ids2parent~[{IN_path}] <: existing_dirs THEN
					errno := EISDIR
					|| OUT_sw := ko
				ELSE
					/*AccCtrl  LET LOC_dirs BE*/
						/*AccCtrl  LOC_dirs = (ids2parentClosure[{IN_pathRoot}] \/ ids2parentClosure[{IN_path}] \/ {IN_pathRoot} \/ {IN_path})*/
							/*AccCtrl  - ids2parent[(ids2parentClosure[{IN_pathRoot}] \/ {IN_pathRoot}) /\ (ids2parentClosure[{IN_path}] \/ {IN_pathRoot})]*/
					/*AccCtrl  IN*/
						/*AccCtrl  IF IN_pathRoot /= IN_path */
							/*AccCtrl  & (file2arights[LOC_dirs]  /<: PERMISSIONS_X)*/
							/*AccCtrl  & (file2grights[LOC_dirs]  /<: PERMISSIONS_X or file2group[LOC_dirs] - user2group[{current_user}] /= {})*/
							/*AccCtrl  & (file2urights[LOC_dirs]  /<: PERMISSIONS_X or {current_user} /= file2user[LOC_dirs])*/
							/*AccCtrl  & (current_user /= ROOT_UID)*/
						/*AccCtrl  THEN*/
							/*AccCtrl  /* search permission denied for one or more component of the file name*/
							/*AccCtrl  errno := EACCES*/
							/*AccCtrl  || OUT_sw := ko*/
						/*AccCtrl  ELSE*/
							/*AccCtrl  /* search permission ok*/
							ANY LOC_id WHERE /* attention, on doit garantir qu'il n'y a qu'un fichier de meme nom dans le rep*/
								LOC_id  : ids2name~[{IN_name}] /\ ids2parent~[{IN_path}]
							THEN
								/*AccCtrl  IF file2arights(IN_path) /: PERMISSIONS_W */
									/*AccCtrl  & (file2grights(LOC_id) /: PERMISSIONS_W or user2group[{current_user}] /\ {file2group(LOC_id)} = {})*/
									/*AccCtrl  & (file2urights(LOC_id) /: PERMISSIONS_W or current_user /= file2user(LOC_id))*/
									/*AccCtrl  & current_user /= ROOT_UID */
								/*AccCtrl  THEN*/
									/*AccCtrl  /* permission denied */
									/*AccCtrl  errno := EACCES*/
									/*AccCtrl  || OUT_sw := ko*/
								/*AccCtrl  ELSE*/
									/* access allowed */
									IF IN_newSize < 0 THEN
										errno := EINVAL
										|| OUT_sw := ko
									ELSE
										IF IN_newSize > MAX_FILE_SIZE THEN
											errno := EFBIG
											|| OUT_sw := ko
										ELSE
											IF IN_newSize /= file2size(LOC_id |-> max(file2content[{LOC_id}])) THEN
												/* the file change */
												file2content := file2content \/ {LOC_id |-> max(file2content[{LOC_id}])+1}
												|| file2size := file2size \/ {(LOC_id |-> max(file2content[{LOC_id}])+1) |-> IN_newSize}
											END
											|| errno := OK
											|| OUT_sw := ok
										END
									END
								/*AccCtrl  END*/
							END
						/*AccCtrl  END*/
					/*AccCtrl  END*/
				END
			END
		END
	END;

	/****************************************************************/
	/* closedir							*/
	/*								*/
	/* int closedir(DIR *dirp)					*/
	/* ferme un répertoire ouvert - retourne un entier		*/
	/* INPUT :							*/
	/*	Dir : existing_dirs					*/
	/* OUTPUT :							*/
	/*	successful:						*/
	/* 		err = 0 					*/
	/*	failure:						*/
	/* 		err = -1,					*/
	/* 		errno = {EADF,EINTR}				*/
	/****************************************************************/
	/* COMPORTEMENTS :						*/
	/* The opendir() function shall fail if:			*/
	/*	[EADF]							*/
	/*		The dirp argument does not refer to		*/
	/*		an open directory stream			*/
	/*								*/
	/* COMPORTEMENTS NON TRAITES :					*/
	/*	[EINTR]							*/
	/*		The closedir() function was interrupted by	*/
	/*		a signal					*/
	/****************************************************************/
       OUT_sw
               <-- closedir(IN_dir) =
       PRE
               IN_dir:OPENED_FD
       THEN
       		last_IN_fd := IN_dir
		|| IF( IN_dir  /: fd) THEN
			/*Dir is not a open directory*/
			errno := EBADF
			|| OUT_sw := ko
		ELSE
			/* comportement normal */
			fd := fd - {IN_dir}
			|| fd2ids := {IN_dir}<<|fd2ids
			|| fd2mode := {IN_dir}<<|fd2mode
			|| OUT_sw := ok
		END
       END;

	/****************************************************************/
	/* rename							*/
	/* 								*/
	/* int rename(const char *old, const char *new)			*/
	/* renomme un fichier - retourne un entier			*/
	/* INPUT :							*/
	/* 	IN_oldDir						*/
	/*	IN_newParent						*/
	/*	IN_newName                                        	*/
	/*								*/
	/* OUTPUT :							*/
	/*	successful:						*/
	/*		err = 0						*/
	/*	failure:						*/
 	/* 		err = -1,					*/
	/* 		errno = {EADF,EINTR}				*/
	/****************************************************************/
	/* COMPORTEMENTS :						*/
	/* The rename function shall fail if:				*/
	/*	[AEACCES]						*/
	/*	[EBUSY]							*/
	/*	[EINVAL]						*/
	/*	[EISDIR]						*/
	/*	[ENOTDIR] (1/2)						*/
	/*	[ENOTEMPTY]						*/
	/*	[EBUSY]							*/
	/*	[ENOENT]						*/
	/*								*/
	/* NOTES :							*/
	/*	- ACCES : write permission is required and is denied 	*/
	/*	for a directory pointed to by the old or the new 	*/
	/*	arguments ?						*/
	/*	- mistake beetwen ENOTEMPTY and EEXIST			*/
	/*								*/
	/* TODO :							*/
	/*	- si old et new sont des repertoire, alors les droits	*/
	/*	en ecriture doivent être acquis [FAIT]			*/
	/*	- si old est un dir : new ne doit pas être un de 	*/
	/*	ses fils 						*/
	/****************************************************************/
      /*
      vérifier avec le standard car peut différé
       [ENOSPC] ?? pas compris
       [EPERM] or [EACCES] pas compris idem que EACCES dans notre cas?
       */
       OUT_sw
       <-- rename(IN_oldPathRoot, IN_oldPath, IN_oldName, IN_newPathRoot, IN_newPath,IN_newName) /*IN_oldPath, [IN_oldName] ,IN_newPath,IN_newName*/ =
       PRE
       		IN_oldPathRoot : IDS
       &	IN_oldPathRoot : {current_dir, ROOT_ID}
       &	IN_newPathRoot : IDS
       &	IN_newPathRoot : {current_dir, ROOT_ID}
       &	IN_oldPath : IDS
       &	IN_oldName : NAMES
       &	IN_newPath : IDS
       &	IN_newName : NAMES

       /*restrictions */
       /* we don't deal with opened files */
       &	(ids2parent~[{IN_oldPath}] /\ ids2name~[{IN_oldName}]) /\ fd2ids[fd] = {}
       &	(ids2parent~[{IN_newPath}] /\ ids2name~[{IN_newName}]) /\ fd2ids[fd] = {}
       /* we don't deal with not empty directory */
       & (ids2parent~[ids2parent~[{IN_oldPath}] /\ ids2name~[{IN_oldName}]] = {}
       		or ids2parent~[ids2parent~[{IN_oldPath}] /\ ids2name~[{IN_oldName}]] = {ROOT_ID})
       THEN
		last_IN_path := IN_oldPath
		|| last_IN_pathRoot := IN_oldPathRoot
		|| last_IN_name := IN_oldName
		|| IF ids2parent~[{IN_oldPath}] /\ ids2name~[{IN_oldName}] = {}
			or IN_newPath /: existing_dirs /*TODO a verifier*/
			or IN_oldName = EMPTY_NAME
			or IN_newName = EMPTY_NAME
		THEN
			/* the old file does'nt exist */
			/* or the old name points to an empty string */
			/* or the new name points to an empty string */
			errno := ENOENT
			|| OUT_sw := ko
		ELSE
			/* arguments are existing */
			IF ids2parent~[{IN_oldPath}] /\ ids2name~[{IN_oldName}] /= ids2parent~[{IN_newPath}] /\ ids2name~[{IN_newName}] THEN
				/* old and new are not the same file */
				/*AccCtrl  LET LOC_dirs BE*/
					/*AccCtrl  LOC_dirs = (ids2parentClosure[{IN_oldPathRoot}] \/ ids2parentClosure[{IN_oldPath}] \/ {IN_oldPathRoot} \/ {IN_oldPath})*/
						/*AccCtrl  - ids2parent[(ids2parentClosure[{IN_oldPathRoot}] \/ {IN_oldPathRoot}) /\ (ids2parentClosure[{IN_oldPath}] \/ {IN_oldPath})]*/
				/*AccCtrl  IN*/
					/*AccCtrl  IF IN_oldPathRoot /= IN_oldPath */
						/*AccCtrl  & (file2arights[LOC_dirs]  /<: PERMISSIONS_X)*/
						/*AccCtrl  & (file2grights[LOC_dirs]  /<: PERMISSIONS_X or file2group[LOC_dirs] - user2group[{current_user}] /= {})*/
						/*AccCtrl  & (file2urights[LOC_dirs]  /<: PERMISSIONS_X or {current_user} /= file2user[LOC_dirs])*/
						/*AccCtrl  & (current_user /= ROOT_UID)*/
					/*AccCtrl  THEN*/
						/*AccCtrl  /* search permission denied for one or more component of old path*/
						/*AccCtrl  errno := EACCES*/
						/*AccCtrl  || OUT_sw := ko*/
					/*AccCtrl  ELSE*/
						/*AccCtrl  /* search permission ok for the old path*/
						/*AccCtrl  LET LOC_dirs1 BE*/
							/*AccCtrl  LOC_dirs1 = (ids2parentClosure[{IN_newPathRoot}] \/ ids2parentClosure[{IN_newPath}] \/ {IN_newPathRoot} \/ {IN_newPath})*/
								/*AccCtrl  - ids2parent[(ids2parentClosure[{IN_newPathRoot}] \/ {IN_newPathRoot}) /\ (ids2parentClosure[{IN_newPath}] \/ {IN_newPath})]*/
						/*AccCtrl  IN*/
							/*AccCtrl  IF IN_newPathRoot /= IN_newPath */
								/*AccCtrl  & (file2arights[LOC_dirs1]  /<: PERMISSIONS_X)*/
								/*AccCtrl  & (file2grights[LOC_dirs1]  /<: PERMISSIONS_X or file2group[LOC_dirs1] - user2group[{current_user}] /= {})*/
								/*AccCtrl  & (file2urights[LOC_dirs1]  /<: PERMISSIONS_X or {current_user} /= file2user[LOC_dirs1])*/
								/*AccCtrl  & (current_user /= ROOT_UID)*/
							/*AccCtrl  THEN*/
								/*AccCtrl  /* search permission denied for one or more component of the new path*/
								/*AccCtrl  errno := EACCES*/
								/*AccCtrl  || OUT_sw := ko*/
							/*AccCtrl  ELSE*/
								/*AccCtrl  /* search permission ok for the old and new paths */
								/*AccCtrl  IF (file2arights(IN_oldPath) /: PERMISSIONS_W*/
									/*AccCtrl  & (file2grights(IN_oldPath) /: PERMISSIONS_W or user2group[{current_user}] /\ {file2group(IN_oldPath)} = {})*/
									/*AccCtrl  & (file2urights(IN_oldPath) /: PERMISSIONS_W or current_user /= file2user(IN_oldPath))*/
									/*AccCtrl  & current_user /= ROOT_UID) */
								/*AccCtrl  THEN*/
									/*AccCtrl  /* permissions are denied over the old parent directory*/
									/*AccCtrl  errno := EACCES*/
									/*AccCtrl  || OUT_sw := ko*/
								/*AccCtrl  ELSE*/
									/*AccCtrl  IF (file2arights(IN_newPath) /: PERMISSIONS_W*/
										/*AccCtrl  & (file2grights(IN_newPath) /: PERMISSIONS_W or user2group[{current_user}] /\ {file2group(IN_newPath)} = {})*/
										/*AccCtrl  & (file2urights(IN_newPath) /: PERMISSIONS_W or current_user /= file2user(IN_newPath))*/
										/*AccCtrl  & current_user /= ROOT_UID)*/
									/*AccCtrl  THEN*/
										/*AccCtrl  /* permissions are denied over the new parent directory*/
										/*AccCtrl  errno := EACCES*/
										/*AccCtrl  || OUT_sw := ko*/
									/*AccCtrl  ELSE*/
										ANY LOC_oldId WHERE
											LOC_oldId : ids2parent~[{IN_oldPath}] /\ ids2name~[{IN_oldName}]
										THEN
											IF LOC_oldId = current_dir THEN
												/* cannot rename the current dir */
												errno := EBUSY
												|| OUT_sw := ko
											ELSE
												IF IN_newPath : (ids2parentClosure~[{LOC_oldId}] \/ {LOC_oldId}) THEN
													/* cannot move the old dir into one of their child */
													errno := EINVAL
													|| OUT_sw := ko
												ELSE
													IF ids2parent~[{IN_newPath}] /\ ids2name~[{IN_newName}] /= {} THEN
														/* the new file already exists */
														ANY LOC_newId WHERE
															LOC_newId : ids2parent~[{IN_newPath}] /\ ids2name~[{IN_newName}]
														THEN
															IF LOC_newId = current_dir THEN
																/* cannot rename the current dir */
																errno := EBUSY
																|| OUT_sw := ko
															ELSE
																IF LOC_oldId /: existing_dirs & LOC_newId : existing_dirs THEN
																	/* the new argument pointed to a directory */
																	/* the old argument does'nt */
																	errno := EISDIR
																	|| OUT_sw := ko
																ELSE
																	IF LOC_oldId : existing_dirs  & LOC_newId /: existing_dirs THEN
																		/* the new argument does'nt point to a directory */
																		/* the old argument does */
																		errno := ENOTDIR
																		|| OUT_sw := ko
																	ELSE
																		/* arguments are coherents */
																		/*AccCtrl  IF LOC_oldId : existing_dirs & LOC_newId : existing_dirs &*/
																			/*AccCtrl  ((file2arights(LOC_oldId) /: PERMISSIONS_W*/
																			/*AccCtrl  & (file2grights(LOC_oldId) /: PERMISSIONS_W or user2group[{current_user}] /\ {file2group(LOC_oldId)} = {})*/
																			/*AccCtrl  & (file2urights(LOC_oldId) /: PERMISSIONS_W or current_user /= file2user(LOC_oldId))*/
																			/*AccCtrl  & current_user /= ROOT_UID)*/
																			/*AccCtrl  or */
																			/*AccCtrl  (file2arights(LOC_newId) /: PERMISSIONS_W*/
																			/*AccCtrl  & (file2grights(LOC_newId) /: PERMISSIONS_W or user2group[{current_user}] /\ {file2group(LOC_newId)} = {})*/
																			/*AccCtrl  & (file2urights(LOC_newId) /: PERMISSIONS_W or current_user /= file2user(LOC_newId))*/
																			/*AccCtrl  & current_user /= ROOT_UID))*/
																		/*AccCtrl  THEN*/
																			/*AccCtrl  /* permission are denied either for the file to move or the new file*/
																			/*AccCtrl  errno := EACCES*/
																			/*AccCtrl  || OUT_sw := ko*/
																		/*AccCtrl  ELSE*/
																			/* permission ok */
																			IF LOC_newId : existing_dirs & ids2parent|>{LOC_newId} /= {} THEN
																				/* the new directory is not empty */
																				errno := ENOTEMPTY
																				||OUT_sw := ko
																			ELSE
																				IF LOC_oldId = current_dir
																					or LOC_oldId : fd2ids[fd]
																					or LOC_newId = current_dir
																					or LOC_newId : fd2ids[fd]
																				THEN
																					/*the current dir cannot be renamed*/
																					/* and opened file cannot be rename*/
																					errno := EBUSY
																					|| OUT_sw := ko
																				ELSE
																					/* all is ok for rename with an existing new file*/
																					/* if both files does'nt opened */
																					existing_ids := existing_ids - {LOC_newId}
																					|| existing_dirs := existing_dirs - {LOC_newId}
																					|| existing_files := existing_files - {LOC_newId}
																					|| ids2name := ({LOC_oldId,LOC_newId}<<|ids2name) \/ {LOC_oldId |-> IN_newName}
																					|| ids2parent := ({LOC_newId, LOC_oldId}<<|ids2parent) \/ {LOC_oldId |-> IN_newPath}
																					|| ids2parentClosure := ({LOC_newId, LOC_oldId}<<|ids2parentClosure) \/ ({LOC_oldId} * ids2parentClosure[{LOC_newId}])
																					|| file2size := ({LOC_newId}<|file2content)<<| file2size
																					|| file2content := {LOC_newId} <<| file2content
																					/*AccCtrl  || file2user := {LOC_newId} <<| file2user*/
																					/*AccCtrl  || file2group := {LOC_newId} <<| file2group*/
																					/*AccCtrl  || file2urights := {LOC_newId} <<| file2urights*/
																					/*AccCtrl  || file2grights := {LOC_newId} <<| file2grights*/
																					/*AccCtrl  || file2arights := {LOC_newId} <<| file2arights*/
																					|| errno := OK
																					|| OUT_sw := ok
																				END
																			END
																		/*AccCtrl  END*/
																	END
																END
															END
														END
													ELSE
														/* the new file does'nt exists */
														ids2name := ({LOC_oldId}<<|ids2name) \/ {LOC_oldId |-> IN_newName}
														|| ids2parent := ({LOC_oldId}<<|ids2parent) \/ {LOC_oldId |-> IN_newPath}
														|| ids2parentClosure := ({LOC_oldId}<<|ids2parentClosure) \/ ({LOC_oldId} * (ids2parentClosure[{IN_newPath}] \/ {IN_newPath}))
														|| errno := OK
														|| OUT_sw := ok
													END
												END
											END
										END
									/*AccCtrl  END*/
								/*AccCtrl  END*/
							/*AccCtrl  END*/
						/*AccCtrl  END*/
					/*AccCtrl  END*/
				/*AccCtrl  END*/
			ELSE
				errno := OK
				|| OUT_sw := ok
			END
		END
	END;

	/****************************************************************/
	/* stat								*/
	/* 								*/
	/* int stat(const char *restrict path, struct stat *restrict buf)*/
	/* récupère les informations d'un fichier - retourne un entier	*/
	/* INPUT :							*/
	/*	Parent							*/
	/*	Name							*/
	/*								*/
	/* OUTPUT :							*/
	/****************************************************************/
	/* COMPORTEMENTS : 						*/
	/* The stat function shall fail if:				*/
	/*	[EACCES]						*/
	/*	[ENOENT]						*/
	/* 	[ENOTDIR]						*/
	/****************************************************************/
	OUT_sw,
	OUT_urights,
	OUT_grights,
	OUT_arights,
	OUT_owner,
	OUT_group,
	OUT_size
	<-- stat(IN_pathRoot, IN_path,IN_name) =
	PRE
		IN_pathRoot : IDS
	&	IN_pathRoot : {current_dir, ROOT_ID}
	&	IN_path : IDS
	&	IN_name : NAMES
	THEN
		last_IN_path := IN_path
		|| last_IN_pathRoot := IN_pathRoot
		|| last_IN_name := IN_name
		|| IF IN_path /: existing_dirs THEN
			/* the path is not valid */
			errno := ENOTDIR
			|| OUT_sw := ko
		ELSE
			IF IN_name = n_null
				or ((ids2parent~[{IN_path}]  /\ ids2name~[{IN_name}])  /\ existing_ids = {})
			THEN
				/* the file does'nt exist */
				errno := ENOENT
				|| OUT_sw := ko
			ELSE
				/*AccCtrl  LET LOC_dirs BE*/
					/*AccCtrl  LOC_dirs = (ids2parentClosure[{IN_pathRoot}] \/ ids2parentClosure[{IN_path}] \/ {IN_pathRoot} \/ {IN_path})*/
						/*AccCtrl  - ids2parent[(ids2parentClosure[{IN_pathRoot}] \/ {IN_pathRoot}) /\ (ids2parentClosure[{IN_path}] \/ {IN_path})]*/
				/*AccCtrl  IN*/
					/*AccCtrl  IF IN_pathRoot /= IN_path */
						/*AccCtrl  & (file2arights[LOC_dirs]  /<: PERMISSIONS_X)*/
						/*AccCtrl  & (file2grights[LOC_dirs]  /<: PERMISSIONS_X or file2group[LOC_dirs] - user2group[{current_user}] /= {})*/
						/*AccCtrl  & (file2urights[LOC_dirs]  /<: PERMISSIONS_X or {current_user} /= file2user[LOC_dirs])*/
						/*AccCtrl  & (current_user /= ROOT_UID)*/
					/*AccCtrl  THEN*/
						/*AccCtrl  /* search permission denied for one or more component of the file name*/
						/*AccCtrl  errno := EACCES*/
						/*AccCtrl  || OUT_sw := ko*/
					/*AccCtrl  ELSE*/
						/* search permission ok*/
						ANY LOC_fd WHERE
							LOC_fd : (ids2parent~[{IN_path}]  /\ ids2name~[{IN_name}])
						THEN
							OUT_sw := ok
							|| errno := OK
							/*AccCtrl  || OUT_owner := file2user(LOC_fd)*/
							/*AccCtrl  || OUT_group := file2group(LOC_fd)*/
							/*AccCtrl  || OUT_urights := file2urights(LOC_fd)*/
							/*AccCtrl  || OUT_grights := file2grights(LOC_fd)*/
							/*AccCtrl  || OUT_arights := file2arights(LOC_fd)*/
							|| IF LOC_fd : existing_files THEN
								OUT_size := file2size((LOC_fd |-> max(file2content[{LOC_fd}])))
							   END
						END
					/*AccCtrl  END*/
				/*AccCtrl  END*/
			END
		END
	END;

	/****************************************************************/
	/* fstat							*/
	/* 								*/
	/* int fstat(const char *restrict path, struct stat *restrict buf)*/
	/* récupère les informations d'un fichier - retourne un entier 	*/
	/* INPUT :							*/
	/*	File 							*/
	/*								*/
	/* OUTPUT :							*/
	/*	successful:						*/
	/*		err = ok					*/
	/*								*/
	/*	failure:						*/
	/*		err = ko,					*/
	/*		 errno = {}					*/
	/****************************************************************/
	/* COMPORTEMENTS :						*/
	/* The stat function shall fail if:				*/
	/*	[EBADF]							*/
	/*								*/
	/****************************************************************/
	OUT_sw,
	OUT_urights,
	OUT_grights,
	OUT_arights,
	OUT_owner,
	OUT_group,
	OUT_size
	<-- fstat(IN_fd) =
	PRE
		IN_fd : OPENED_FD
	THEN
		last_IN_fd := IN_fd
		|| IF IN_fd /: fd  THEN
			errno := EBADF
			|| OUT_sw := ko
		ELSE
		errno := OK
		|| OUT_sw := ok
		/*AccCtrl  || OUT_urights := file2urights(IN_fd)*/
		/*AccCtrl  || OUT_grights := file2grights(IN_fd)*/
		/*AccCtrl  || OUT_arights := file2arights(IN_fd)*/
		/*AccCtrl  || OUT_owner := file2user(IN_fd)*/
		/*AccCtrl  || OUT_group := file2group(IN_fd)*/
		|| IF fd2ids(IN_fd) : existing_files THEN
			OUT_size := file2size((fd2ids(IN_fd) |-> max(file2content[{fd2ids(IN_fd)}])))
		   END
		END
	END;

	/****************************************************************/
	/* mkdir							*/
	/*								*/
	/* int mkdir(const char *path, mode_t mode)			*/
	/* créé un répertoire - retourne un entier			*/
	/* INPUT :							*/
	/*	IN_parent						*/
	/*	IN_name							*/
	/*	In_Mode							*/
	/*								*/
	/* OUTPUT :							*/
	/*	successful:						*/
	/* 		err = 0						*/
	/*								*/
	/*	failure:						*/
	/*		err = -1, 					*/
	/*		errno = {}					*/
	/****************************************************************/
	/* COMPORTEMENTS:						*/
	/* The stat function shall fail if:				*/
	/*	[EACCES]						*/
	/*	[EEXIST]						*/
	/*	[ENOENT]						*/
	/*	[ENOTDIR]						*/
	/****************************************************************/
	OUT_sw,
	OUT_dir
	/*AccCtrl  <-- mkdir(IN_pathRoot, IN_path, IN_name, IN_urights, IN_grights, IN_arights) =*/
	<-- mkdir(IN_pathRoot, IN_path, IN_name) =
	PRE
		IN_pathRoot : IDS
	&	IN_pathRoot : {current_dir, ROOT_ID}
	&	IN_path : IDS
	&	IN_name : NAMES
	/*AccCtrl  &	IN_arights : RIGHTS*/
	/*AccCtrl  &	IN_grights : RIGHTS*/
	/*AccCtrl  &	IN_urights : RIGHTS*/

	THEN
		last_IN_path := IN_path
		|| last_IN_pathRoot := IN_pathRoot
		|| last_IN_name := IN_name
		|| IF IN_name = EMPTY_NAME
			or IN_path /: existing_ids
		THEN
			/* the path does'nt exist*/
			errno := ENOENT
			|| OUT_sw := ko
		ELSE
			IF IN_path : existing_files THEN
				/* pathname point to a regular file*/
				errno := ENOTDIR
				|| OUT_sw := ko
			ELSE
				IF (ids2parent~[{IN_path}] /\ ids2name~[{IN_name}]) /= {} THEN
					/* the directory is already existing */
					errno := EEXIST
					|| OUT_sw := ko
				ELSE
					/*AccCtrl  LET LOC_dirs BE*/
						/*AccCtrl  LOC_dirs = (ids2parentClosure[{IN_pathRoot}] \/ ids2parentClosure[{IN_path}] \/ {IN_pathRoot} \/ {IN_path})*/
							/*AccCtrl  - ids2parent[(ids2parentClosure[{IN_pathRoot}] \/ {IN_pathRoot}) /\ (ids2parentClosure[{IN_path}] \/ {IN_path})]*/
					/*AccCtrl  IN*/
						/*AccCtrl  IF IN_pathRoot /= IN_path */
							/*AccCtrl  & (file2arights[LOC_dirs]  /<: PERMISSIONS_X)*/
							/*AccCtrl  & (file2grights[LOC_dirs]  /<: PERMISSIONS_X or file2group[LOC_dirs] - user2group[{current_user}] /= {})*/
							/*AccCtrl  & (file2urights[LOC_dirs]  /<: PERMISSIONS_X or {current_user} /= file2user[LOC_dirs])*/
							/*AccCtrl  & (current_user /= ROOT_UID)*/
						/*AccCtrl  THEN*/
							/*AccCtrl  /* search permission denied for one or more component of the file name*/
							/*AccCtrl  errno := EACCES*/
							/*AccCtrl  || OUT_sw := ko*/
						/*AccCtrl  ELSE*/
							/*AccCtrl  /* search permission ok*/
							/*AccCtrl  IF file2arights(IN_path) /: PERMISSIONS_W*/
								/*AccCtrl  & (file2grights(IN_path) /: PERMISSIONS_W or user2group[{current_user}] /\ {file2group(IN_path)} = {})*/
								/*AccCtrl  & (file2urights(IN_path) /: PERMISSIONS_W or current_user /= file2user(IN_path))*/
								/*AccCtrl  & current_user /= ROOT_UID*/
							/*AccCtrl  THEN*/
								/*AccCtrl  /* permission denied to create the directory */
								/*AccCtrl  errno := EACCES*/
								/*AccCtrl  || OUT_sw := ko*/
							/*AccCtrl  ELSE*/
								/* un fichier qui n'existe pas */
								ANY LOC_id WHERE
									LOC_id : IDS & LOC_id /: existing_ids
								THEN
									OUT_sw := ok
									|| errno := OK
									|| OUT_dir := LOC_id
									|| existing_dirs := existing_dirs  \/ {LOC_id}
									|| existing_ids := existing_ids  \/ {LOC_id}
									|| ids2name := ids2name  \/ {LOC_id |-> IN_name}
									|| ids2parent := ids2parent  \/ {LOC_id |-> IN_path}
									|| ids2parentClosure := ids2parentClosure \/ ({LOC_id} * (ids2parentClosure[{IN_path}]\/ {IN_path}))
									/*AccCtrl  || file2user := file2user \/ {LOC_id |-> current_user}*/
									/*AccCtrl  || file2group := file2group \/ {LOC_id |-> file2group(IN_path)}*/
									/*AccCtrl  || file2urights := file2urights \/ {LOC_id |-> IN_urights}*/
									/*AccCtrl  || file2grights := file2grights \/ {LOC_id |-> IN_grights}*/
									/*AccCtrl  || file2arights := file2arights \/ {LOC_id |-> IN_arights}*/
								END
							/*AccCtrl  END*/
						/*AccCtrl  END*/
					/*AccCtrl  END*/
				END
			END
		END
	END;

	/****************************************************************/
	/* rmdir							*/
	/*								*/
	/* int rmdir(const char *path)					*/
	/* supprime un répertoire - retourne un entier			*/
	/* 								*/
	/* INPUT :							*/
	/*	IN_parent						*/
	/*	IN_name							*/
	/*								*/
	/* OUTPUT :							*/
	/*	successful:						*/
	/*		err = 0						*/
	/*								*/
	/*	failure:						*/
	/*		err = -1,					*/
	/*		errno = {}					*/
	/****************************************************************/
	/* COMPORTEMENTS :						*/
	/* The stat function shall fail if:				*/
	/*	[ENOENT]						*/
	/*	[ENOTEMPTY]						*/
	/*	[ENOTDIR]						*/
	/*	[EBUSY]							*/
	/*	[EINVAL]						*/
	/*	[EACCES]						*/
	/*								*/
	/****************************************************************/
	OUT_sw
	<-- rmdir(IN_pathRoot, IN_path,IN_name) =
	PRE
		IN_pathRoot : IDS
	&	IN_pathRoot : {current_dir, ROOT_ID}
	&	IN_path : IDS
	&	IN_name : NAMES
	THEN
		last_IN_path := IN_path
		|| last_IN_pathRoot := IN_pathRoot
		|| last_IN_name := IN_name
		|| IF ids2parent~[{IN_path}] /\ existing_ids = {}
			or ((ids2parent~[{IN_path}]  /\ ids2name~[{IN_name}]) /\ existing_ids) = {}
			or IN_name = EMPTY_NAME
		THEN
			/* a component of path does'nt name an existing dir or point to an empty string */
			errno := ENOENT
			|| OUT_sw := ko
		ELSE
			IF (ids2parent~[{IN_path}]  /\ ids2name~[{IN_name}]) /\ existing_files /= {} THEN
				/* a component of path is not a dir */
				errno := ENOTDIR
				|| OUT_sw := ko
			ELSE
				IF (ids2parent~[ids2parent~[{IN_path}] /\ ids2name~[{IN_name}]] /= {}  ) THEN
					/* the dir is not empty */
					errno := ENOTEMPTY
					|| OUT_sw := ko
				ELSE
					ANY LOC_id WHERE
						LOC_id : ids2parent~[{IN_path}]  /\ ids2name~[{IN_name}]
					THEN
						IF LOC_id : fd2ids[fd]
							or LOC_id = current_dir
						THEN
							/* can't remove a working dir */
							errno := EBUSY
							|| OUT_sw := ko
						ELSE
							/*AccCtrl  LET LOC_dirs BE*/
								/*AccCtrl  LOC_dirs = (ids2parentClosure[{IN_pathRoot}] \/ ids2parentClosure[{IN_path}] \/ {IN_pathRoot} \/ {IN_path})*/
									/*AccCtrl  - ids2parent[(ids2parentClosure[{IN_pathRoot}] \/ {IN_pathRoot}) /\ (ids2parentClosure[{IN_path}] \/ {IN_path})]*/
							/*AccCtrl  IN*/
								/*AccCtrl  IF IN_pathRoot /= IN_path */
									/*AccCtrl  & (file2arights[LOC_dirs]  /<: PERMISSIONS_X)*/
									/*AccCtrl  & (file2grights[LOC_dirs]  /<: PERMISSIONS_X or file2group[LOC_dirs] - user2group[{current_user}] /= {})*/
									/*AccCtrl  & (file2urights[LOC_dirs]  /<: PERMISSIONS_X or {current_user} /= file2user[LOC_dirs])*/
									/*AccCtrl  & (current_user /= ROOT_UID)*/
								/*AccCtrl  THEN*/
									/*AccCtrl  /* search permission denied for one or more component of the file name*/
									/*AccCtrl  errno := EACCES*/
									/*AccCtrl  || OUT_sw := ko*/
								/*AccCtrl  ELSE*/
									/*AccCtrl  /* search permission ok*/
									/*AccCtrl  IF file2arights(IN_path) /: PERMISSIONS_W*/
										/*AccCtrl  & (file2grights(IN_path) /: PERMISSIONS_W or user2group[{current_user}] /\ {file2group(IN_path)} = {})*/
										/*AccCtrl  & (file2urights(IN_path) /: PERMISSIONS_W or current_user /= file2user(IN_path))*/
										/*AccCtrl  & current_user /= ROOT_UID*/
									/*AccCtrl  THEN*/
										/*AccCtrl  /*access denied to remove the directory*/
										/*AccCtrl  errno := EACCES*/
										/*AccCtrl  || OUT_sw := ko*/
									/*AccCtrl  ELSE*/

										OUT_sw := ok
										|| errno := OK
										|| existing_dirs := existing_dirs  - {LOC_id}
										|| existing_ids := existing_ids  - {LOC_id}
										|| ids2name := {LOC_id}<<|ids2name
										|| ids2parent := {LOC_id}<<|ids2parent
										|| ids2parentClosure := {LOC_id}<<|ids2parentClosure
										/*AccCtrl  || file2user := {LOC_id}<<|file2user*/
										/*AccCtrl  || file2group := {LOC_id}<<|file2group*/
										/*AccCtrl  || file2urights := {LOC_id}<<|file2urights*/
										/*AccCtrl  || file2grights := {LOC_id}<<|file2grights*/
										/*AccCtrl  || file2arights := {LOC_id}<<|file2arights*/
									/*AccCtrl  END*/
								/*AccCtrl  END*/
							/*AccCtrl  END*/
						END
					END
				END
			END
		END
	END;


	/****************************************************************/
	/* chdir							*/
	/* 								*/
	/* int chdir(const char *path);					*/
	/* change the current directory					*/
	/* INPUT :							*/
	/*	IN_pathRoot						*/
	/*	IN_path							*/
	/*	IN_name							*/
	/*								*/
	/* OUTPUT :							*/
	/*	OUT_sw 							*/
	/****************************************************************/
	/* COMPORTEMENTS : 						*/
	/* The stat function shall fail if:				*/
	/*	[EACCES]						*/
	/*	[ENOENT]						*/
	/* 	[ENOTDIR]						*/
	/****************************************************************/
	OUT_sw
	<-- chdir(IN_pathRoot, IN_path, IN_name) =
	PRE
		IN_pathRoot : IDS
	&	IN_pathRoot : {current_dir, ROOT_ID}
	&	IN_path : IDS
	&	IN_name : NAMES
	THEN
		last_IN_path := IN_path
		|| last_IN_pathRoot := IN_pathRoot
		|| last_IN_name := IN_name
		|| IF IN_path /: existing_ids
			or IN_name = EMPTY_NAME
			or (ids2parent~[{IN_path}] /\ ids2name~[{IN_name}]) /\ existing_ids = {}
		THEN
			/* a component of path does not name an existing directory or path is an empty string */
			errno := ENOENT
			|| OUT_sw := ko
		ELSE
			ANY LOC_dirId WHERE
				LOC_dirId : ids2parent~[{IN_path}] /\ ids2name~[{IN_name}]
			THEN
				IF LOC_dirId /: existing_dirs THEN
					/*a component of the path name is not a directory*/
					errno := ENOTDIR
					|| OUT_sw := ko
				ELSE
					/*AccCtrl  LET LOC_dirs BE*/
						/*AccCtrl  LOC_dirs = (ids2parentClosure[{IN_pathRoot}] \/ ids2parentClosure[{IN_path}] \/ {IN_pathRoot} \/ {IN_path})*/
							/*AccCtrl  - ids2parent[(ids2parentClosure[{IN_pathRoot}] \/ {IN_pathRoot}) /\ (ids2parentClosure[{IN_path}] \/ {IN_path})]*/
					/*AccCtrl  IN*/
						/*AccCtrl  IF IN_pathRoot /= IN_path */
							/*AccCtrl  & (file2arights[LOC_dirs]  /<: PERMISSIONS_X)*/
							/*AccCtrl  & (file2grights[LOC_dirs]  /<: PERMISSIONS_X or file2group[LOC_dirs] - user2group[{current_user}] /= {})*/
							/*AccCtrl  & (file2urights[LOC_dirs]  /<: PERMISSIONS_X or {current_user} /= file2user[LOC_dirs])*/
							/*AccCtrl  & (current_user /= ROOT_UID)*/
						/*AccCtrl  THEN*/
							/*AccCtrl  /* search permission denied for one or more component of the file name*/
							/*AccCtrl  errno := EACCES*/
							/*AccCtrl  || OUT_sw := ko*/
						/*AccCtrl  ELSE*/
							/* search permission ok*/
							current_dir := LOC_dirId
							|| errno := OK
							|| OUT_sw := ok
						/*AccCtrl  END*/
					/*AccCtrl  END*/
				END
			END
		END
	END;

	/****************************************************************/
	/* unlink							*/
	/* 								*/
	/* int unlink(const char *path);				*/
	/* remove a file						*/
	/* INPUT :							*/
	/*	IN_pathRoot						*/
	/*	IN_path							*/
	/*	IN_name							*/
	/*								*/
	/* OUTPUT :							*/
	/*	OUT_sw 							*/
	/****************************************************************/
	/* COMPORTEMENTS : 						*/
	/* The stat function shall fail if:				*/
	/*	[EACCES]						*/
	/*	[EBUSY]							*/
	/*	[ENOENT]						*/
	/* 	[ENOTDIR]						*/
	/*	[EPERM]							*/
	/****************************************************************/
	OUT_sw
	<-- unlink(IN_pathRoot, IN_path, IN_name) =
	PRE
		IN_pathRoot : IDS
	&	IN_pathRoot : {current_dir, ROOT_ID}
	&	IN_path : IDS
	&	IN_name : NAMES
	THEN
		last_IN_path := IN_path
		|| last_IN_pathRoot := IN_pathRoot
		|| last_IN_name := IN_name
		|| IF IN_path : existing_ids & IN_path /: existing_dirs THEN
			/* a component of the path is not a dir */
			errno := ENOTDIR
			|| OUT_sw := ko
		ELSE
			IF ids2parent~[{IN_path}] /\ ids2name~[{IN_name}] = {}
				or IN_name = EMPTY_NAME
			THEN
				/* a component of the path does not name an existing file or path is an empty string */
				errno := ENOENT
				|| OUT_sw := ko
			ELSE
				ANY LOC_id WHERE
					LOC_id : ids2parent~[{IN_path}] /\ ids2name~[{IN_name}]
				THEN
					IF LOC_id : existing_dirs THEN
						/* the implementation does not support the use of unlink on directory */
						errno := EPERM
						||OUT_sw := ko
					ELSE
						IF LOC_id : fd2ids[fd] THEN
							/*the implementation does not support the unlink operation on an opened file*/
							errno := EBUSY
							|| OUT_sw := ko
						ELSE
							/*AccCtrl  LET LOC_dirs BE*/
								/*AccCtrl  LOC_dirs = (ids2parentClosure[{IN_pathRoot}] \/ ids2parentClosure[{IN_path}] \/ {IN_path} \/ {IN_pathRoot})*/
									/*AccCtrl  - ids2parent[(ids2parentClosure[{IN_pathRoot}] \/ {IN_pathRoot}) /\ (ids2parentClosure[{IN_path}] \/ {IN_path})]*/
							/*AccCtrl  IN*/
								/*AccCtrl  IF IN_pathRoot /= IN_path */
									/*AccCtrl  & (file2arights[LOC_dirs]  /<: PERMISSIONS_X)*/
									/*AccCtrl  & (file2grights[LOC_dirs]  /<: PERMISSIONS_X or file2group[LOC_dirs] - user2group[{current_user}] /= {})*/
									/*AccCtrl  & (file2urights[LOC_dirs]  /<: PERMISSIONS_X or {current_user} /= file2user[LOC_dirs])*/
									/*AccCtrl  & (current_user /= ROOT_UID)*/
								/*AccCtrl  THEN*/
									/*AccCtrl  /* search permission denied for one or more component of the file name*/
									/*AccCtrl  errno := EACCES*/
									/*AccCtrl  || OUT_sw := ko*/
								/*AccCtrl  ELSE*/
									/*AccCtrl  /* search permissions ok*/
									/*AccCtrl  IF file2arights(IN_path) /: PERMISSIONS_W*/
										/*AccCtrl  & (file2grights(IN_path) /: PERMISSIONS_W or user2group[{current_user}] /\ {file2group(IN_path)} = {})*/
										/*AccCtrl  & (file2urights(IN_path) /: PERMISSIONS_W or current_user /= file2user(IN_path))*/
										/*AccCtrl  & current_user /= ROOT_UID*/
									/*AccCtrl  THEN*/
										/*AccCtrl  /* write permission over the parent directory */
										/*AccCtrl  errno := EACCES*/
										/*AccCtrl  || OUT_sw := ko*/
									/*AccCtrl  ELSE*/
										/*permissions ok */
										errno := OK
										|| OUT_sw := ok
										|| existing_ids := existing_ids - {LOC_id}
										|| existing_files := existing_files - {LOC_id}
										|| ids2name := {LOC_id}<<|ids2name
										|| ids2parent := {LOC_id}<<|ids2parent
										|| ids2parentClosure := {LOC_id}<<|ids2parentClosure
										|| file2content := {LOC_id}<<|file2content
										|| file2size := ({LOC_id}<|file2content)<<|file2size
										/*AccCtrl  || file2user := {LOC_id}<<|file2user*/
										/*AccCtrl  || file2group := {LOC_id}<<|file2group*/
										/*AccCtrl  || file2arights := {LOC_id}<<|file2arights*/
										/*AccCtrl  || file2grights := {LOC_id}<<|file2grights*/
										/*AccCtrl  || file2urights := {LOC_id}<<|file2urights*/
									/*AccCtrl  END*/
								/*AccCtrl  END*/
							/*AccCtrl  END*/
						END
					END
				END
			END
		END
	END
END
