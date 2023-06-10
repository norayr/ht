MODULE ht;
IMPORT Strings := oocStrings;

TYPE
  pstr* = POINTER TO ARRAY OF CHAR;

  item* = POINTER TO itemDesc;

  itemDesc* = RECORD
	 key-, val-: pstr
	 END;

  items* = POINTER TO ARRAY OF item;
  
	table* = POINTER TO tableDesc;
  tableDesc* = RECORD
	 size-, count- : LONGINT;
   itms-: items;
	 END;

PROCEDURE hash*(VAR t: table; VAR str: ARRAY OF CHAR): LONGINT;
VAR
  i, j, l : LONGINT;
BEGIN
  i := 0; j := 0; l := Strings.Length(str) - 1;
	REPEAT
    i := i + ORD(str[j]);
		INC(j);
	UNTIL j = l; 
	RETURN i MOD t^.size;
END hash;

PROCEDURE createItem*(key, value: ARRAY OF CHAR): item;
VAR
  k, v: pstr;
	i: item;
BEGIN
	NEW(i);
  NEW(k, LEN(key));
	NEW(v, LEN(value));
	COPY(key, k^);
	COPY(value, v^);
	i^.key := k;
	i^.val := v;
	RETURN i
END createItem;

PROCEDURE createTable*(size: LONGINT): table;
VAR
  t: table;
BEGIN
  NEW(t);
  t^.size := size;
	t^.count := 0;
	NEW(t^.itms, size);
	RETURN t;
END createTable;


END ht.


(* references

https://www.digitalocean.com/community/tutorials/hash-table-in-c-plus-plus
https://www.freecodecamp.org/news/hash-tables/

*)
