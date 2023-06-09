MODULE ht;

TYPE
  pstr = POINTER TO ARRAY OF CHAR;

  item = POINTER TO itemDesc;

  itemDesc = RECORD
	 key, val: pstr
	 END;

  items = POINTER TO ARRAY OF item;

  table = RECORD
	 size, count : LONGINT;
   items: items;
	 END;

PROCEDURE createItem(key, value: ARRAY OF CHAR);
VAR k, v: pstr;
BEGIN
  NEW(k, LEN(key));
	NEW(v, LEN(value));
END createItem;


END ht.


(* references

https://www.digitalocean.com/community/tutorials/hash-table-in-c-plus-plus
https://www.freecodecamp.org/news/hash-tables/

*)
