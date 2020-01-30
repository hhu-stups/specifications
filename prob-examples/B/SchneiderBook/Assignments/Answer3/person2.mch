MACHINE

  Person2(max_person)

CONSTRAINTS

  max_person:1..2147483646

SEES

  String_TYPE, Bool_TYPE, Scalar_TYPE

SETS

  PERSON;
  SEX = {male,female}

VARIABLES

  person, names, person_name, person_age, person_sex

INVARIANT

  person <: PERSON &
  card(person) <= max_person &
  names <: STRING &
  person_name: person >->> names &
  person_age: person --> SCALAR &
  person_sex: person --> SEX

INITIALISATION

  BEGIN
    person,names,person_name,person_age,person_sex := {},{},{},{},{}
  END

OPERATIONS

  rep <-- Add_person(name_inp,age_inp,sex_inp) =
    PRE
      name_inp: STRING-names &
      age_inp: SCALAR &
      sex_inp: SEX &
      card(person) < max_person
    THEN
      CHOICE
        ANY new_person WHERE new_person: PERSON-person THEN
          person:= person\/{new_person} ||
          names:= names\/{name_inp} ||
          person_name:=person_name\/{new_person|->name_inp} ||
          person_age:=person_age\/{new_person|->age_inp} ||
          person_sex:=person_sex\/{new_person|->sex_inp} ||
          rep:=TRUE
        END
      OR
        rep:=FALSE
      END
    END;

  rep,age_out,sex_out <-- Get_person_details(name_inp) =
    PRE name_inp: STRING THEN
      IF name_inp: names THEN
        age_out:=(person_age(person_name~(name_inp))) ||
        sex_out:=(person_sex(person_name~(name_inp))) ||
        rep:=TRUE
      ELSE
        rep:=FALSE ||
        age_out:: SCALAR ||
        sex_out:: SEX
      END
    END;

  rep<--Remove_person(name_inp) =
      PRE  name_inp: STRING THEN
        IF name_inp: names THEN
          person:= person-{person_name~(name_inp)} ||
          names:= names-{name_inp} ||
          person_name:=person_name |>> {name_inp} ||
          person_age:={person_name~(name_inp)} <<| person_age ||
          person_sex:={person_name~(name_inp)} <<| person_sex ||
          rep:=TRUE
       ELSE
          rep:=FALSE
       END
    END;

  Save_Person = skip;

  Restore_Person =
    ANY
      rst_person, rst_names, rst_person_name, rst_person_age, rst_person_sex
    WHERE
      rst_person <: PERSON &
      card(rst_person) <= max_person &
      rst_names <: STRING &
      rst_person_name: rst_person >->> rst_names &
      rst_person_age: rst_person --> SCALAR &
      rst_person_sex: rst_person --> SEX
    THEN
      person,names,person_name,person_age,person_sex:=
        rst_person,rst_names,rst_person_name,rst_person_age,rst_person_sex
    END;

  rep <-- Increment_age(name_inp) =
    PRE name_inp: STRING &         
        (name_inp : names => person_age(person_name~(name_inp)) < 140) 
    THEN
      IF name_inp: names THEN
        person_age(person_name~(name_inp)) := 
           person_age(person_name~(name_inp)) + 1 ||
        rep := TRUE
      ELSE
        rep := FALSE
      END
    END;

/* The base machine's operation to modify the name of a person is not always guaranteed to be successful.  Thus even when the inputs are appropriate, we must allow for the possibility of the operation failing. */

  rep <-- Change_name(name1_inp, name2_inp) =
    PRE name1_inp : STRING & name2_inp : STRING THEN
      IF name1_inp : names & name2_inp /: names THEN
        CHOICE
          person_name(person_name~(name1_inp)) := name2_inp
          || names := (names - {name1_inp}) \/ {name2_inp}
          || rep := TRUE
        OR
             rep := FALSE
        END
      ELSE
        rep := FALSE
      END
    END;


/* Under_age_query outputs the number of people in the database whose
age is less than or equal to the input age.  The bijection
`locate_personbase' in the BASE machine might be useful in traversing
the set `person'.  */

  num <-- Under_age_query(age_inp) =
    PRE age_inp : NAT THEN
      num := card(person_age~[0..age_inp])
    END;

  rep, num <-- Average_age_query =
  BEGIN
    IF names = {} 
    THEN rep := FALSE || num := 0
    ELSE rep := TRUE ||
         num := (SIGMA (ii) . (ii : person | person_age(ii))) / card(person)
    END
  END



END

