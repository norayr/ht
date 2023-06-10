MODULE test;
IMPORT ht, Out;

VAR
  t : ht.table;

PROCEDURE ok;
BEGIN
  Out.String("OK"); Out.Ln
END ok;

PROCEDURE nok;
BEGIN
  Out.String("NOK"); Out.Ln
END nok;

PROCEDURE createItem;
VAR
  i: ht.item;
BEGIN
  i := ht.createItem("aaa", "bbb");
	IF i^.key^ = "aaa" THEN ok ELSE nok END;
	IF i^.val^ = "bbb" THEN ok ELSE nok END;
END createItem;

PROCEDURE createTable(): ht.table;
VAR
  t: ht.table;
BEGIN
  t := ht.createTable(100);
	IF t^.itms[5] = NIL THEN ok ELSE nok END;
	RETURN t;
END createTable;

PROCEDURE hash(VAR t: ht.table);
VAR
  s: ARRAY 16 OF CHAR;
	i: LONGINT;
BEGIN
  s := "aoeu";
  i := ht.hash(t, s);
	Out.String(s); Out.Int(i, 5); Out.Ln;
  s := "zvwm";
  i := ht.hash(t, s);
	Out.String(s); Out.Int(i, 5); Out.Ln;
END hash;

BEGIN
  createItem;
	t := createTable();
	hash(t);
END test.
