BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "lineitems" (
	"id"	integer,
	"quantity"	integer NOT NULL,
	"total"	real NOT NULL,
	"product_id"	integer,
	"order_id"	integer,
	PRIMARY KEY("id"),
	FOREIGN KEY("order_id") REFERENCES "orders"("id"),
	FOREIGN KEY("product_id") REFERENCES "products"("id")
);
CREATE TABLE IF NOT EXISTS "orders" (
	"id"	integer,
	"date"	text NOT NULL,
	"customer_id"	integer,
	FOREIGN KEY("customer_id") REFERENCES "customers"("id"),
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "products" (
	"id"	integer,
	"name"	text NOT NULL,
	"price"	real NOT NULL,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "customers" (
	"id"	integer,
	"first_name"	text NOT NULL,
	"last_name"	text NOT NULL,
	PRIMARY KEY("id")
);
INSERT INTO "lineitems" ("id","quantity","total","product_id","order_id") VALUES (1,1,3.0,2,1);
INSERT INTO "lineitems" ("id","quantity","total","product_id","order_id") VALUES (2,1,2.5,3,2);
INSERT INTO "lineitems" ("id","quantity","total","product_id","order_id") VALUES (3,1,2.0,4,3);
INSERT INTO "lineitems" ("id","quantity","total","product_id","order_id") VALUES (4,1,4.0,5,4);
INSERT INTO "lineitems" ("id","quantity","total","product_id","order_id") VALUES (5,1,5.5,6,5);
INSERT INTO "orders" ("id","date","customer_id") VALUES (1,'2019-04-20',1);
INSERT INTO "orders" ("id","date","customer_id") VALUES (2,'2019-04-21',2);
INSERT INTO "orders" ("id","date","customer_id") VALUES (3,'2019-04-22',3);
INSERT INTO "orders" ("id","date","customer_id") VALUES (4,'2019-04-23',4);
INSERT INTO "orders" ("id","date","customer_id") VALUES (5,'2019-04-24',5);
INSERT INTO "products" ("id","name","price") VALUES (1,'Veggie Pizza',5.0);
INSERT INTO "products" ("id","name","price") VALUES (2,'BBQ Chicken Pizza',3.0);
INSERT INTO "products" ("id","name","price") VALUES (3,'Hawaiian Pizza',2.5);
INSERT INTO "products" ("id","name","price") VALUES (4,'Pepperoni Pizza',2.0);
INSERT INTO "products" ("id","name","price") VALUES (5,'Deluxe  Pizza',4.0);
INSERT INTO "products" ("id","name","price") VALUES (6,'Chicken Bacon Ranch  Pizza',5.5);
INSERT INTO "customers" ("id","first_name","last_name") VALUES (1,'Raman','Sandhu');
INSERT INTO "customers" ("id","first_name","last_name") VALUES (2,'Robie','Karuzas');
INSERT INTO "customers" ("id","first_name","last_name") VALUES (3,'Carl','Janzen');
INSERT INTO "customers" ("id","first_name","last_name") VALUES (4,'Doctor','Python');
INSERT INTO "customers" ("id","first_name","last_name") VALUES (5,'Doctor','Phil');
COMMIT;
