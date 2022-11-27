CREATE TABLE "climber" (
	"id" INT NOT NULL,
	"name" VARCHAR2(255) NOT NULL,
	"surname" VARCHAR2(255) NOT NULL,
	"address" VARCHAR2(255) NOT NULL,
	constraint CLIMBER_PK PRIMARY KEY ("id"));

CREATE sequence "CLIMBER_ID_SEQ";

CREATE trigger "BI_CLIMBER_ID"
  before insert on "climber"
  for each row
begin
  select "CLIMBER_ID_SEQ".nextval into :NEW."id" from dual;
end;

/
CREATE TABLE "climbing" (
	"id" INT NOT NULL,
	"start_date" DATE NOT NULL,
	"end_date" DATE,
	"peak_id" INT NOT NULL,
	constraint CLIMBING_PK PRIMARY KEY ("id"));

CREATE sequence "CLIMBING_ID_SEQ";

CREATE trigger "BI_CLIMBING_ID"
  before insert on "climbing"
  for each row
begin
  select "CLIMBING_ID_SEQ".nextval into :NEW."id" from dual;
end;

/
CREATE TABLE "peak" (
	"id" INT NOT NULL,
	"name" VARCHAR2(255) NOT NULL,
	"height" FLOAT NOT NULL,
	"country_id" INT NOT NULL,
	"mountain_range_id" INT NOT NULL,
	constraint PEAK_PK PRIMARY KEY ("id"));

CREATE sequence "PEAK_ID_SEQ";

CREATE trigger "BI_PEAK_ID"
  before insert on "peak"
  for each row
begin
  select "PEAK_ID_SEQ".nextval into :NEW."id" from dual;
end;

/
CREATE TABLE "climbing_climber" (
	"climber_id" INT NOT NULL,
	"climbing_id" INT NOT NULL,
	constraint CLIMBING_CLIMBER_PK PRIMARY KEY ("climber_id","climbing_id"));

CREATE sequence "CLIMBING_CLIMBER_CLIMBER_ID_SEQ";

CREATE trigger "BI_CLIMBING_CLIMBER_CLIMBER_ID"
  before insert on "climbing_climber"
  for each row
begin
  select "CLIMBING_CLIMBER_CLIMBER_ID_SEQ".nextval into :NEW."climber_id" from dual;
end;
CREATE sequence "CLIMBING_CLIMBER_CLIMBING_ID_SEQ";

CREATE trigger "BI_CLIMBING_CLIMBER_CLIMBING_ID"
  before insert on "climbing_climber"
  for each row
begin
  select "CLIMBING_CLIMBER_CLIMBING_ID_SEQ".nextval into :NEW."climbing_id" from dual;
end;

/
CREATE TABLE "country" (
	"id" INT NOT NULL,
	"country_name" VARCHAR2(255) NOT NULL,
	constraint COUNTRY_PK PRIMARY KEY ("id"));

CREATE sequence "COUNTRY_ID_SEQ";

CREATE trigger "BI_COUNTRY_ID"
  before insert on "country"
  for each row
begin
  select "COUNTRY_ID_SEQ".nextval into :NEW."id" from dual;
end;

/
CREATE TABLE "mountain_range" (
	"id" INT NOT NULL,
	"name" VARCHAR2(255) NOT NULL,
	constraint MOUNTAIN_RANGE_PK PRIMARY KEY ("id"));

CREATE sequence "MOUNTAIN_RANGE_ID_SEQ";

CREATE trigger "BI_MOUNTAIN_RANGE_ID"
  before insert on "mountain_range"
  for each row
begin
  select "MOUNTAIN_RANGE_ID_SEQ".nextval into :NEW."id" from dual;
end;

/

ALTER TABLE "climbing" ADD CONSTRAINT "climbing_fk0" FOREIGN KEY ("peak_id") REFERENCES "peak"("id");

ALTER TABLE "peak" ADD CONSTRAINT "peak_fk0" FOREIGN KEY ("country_id") REFERENCES "country"("id");
ALTER TABLE "peak" ADD CONSTRAINT "peak_fk1" FOREIGN KEY ("mountain_range_id") REFERENCES "mountain_range"("id");

ALTER TABLE "climbing_climber" ADD CONSTRAINT "climbing_climber_fk0" FOREIGN KEY ("climber_id") REFERENCES "climber"("id");
ALTER TABLE "climbing_climber" ADD CONSTRAINT "climbing_climber_fk1" FOREIGN KEY ("climbing_id") REFERENCES "climbing"("id");


