CREATE TABLE "medical_centers" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "doctors" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "medical_center_id" int
);

CREATE TABLE "patients" (
  "id" SERIAL PRIMARY KEY,
  "name" text,
  "disease" text
);

CREATE TABLE "doctors_patients" (
  "id" int PRIMARY KEY,
  "doctor_id" int,
  "patient_id" int
);

CREATE TABLE "diseases" (
  "id" int PRIMARY KEY,
  "name" text,
  "severity" int
);

CREATE TABLE "patients_diseases" (
  "id" int PRIMARY KEY,
  "patient_id" int,
  "disease_id" int
);

ALTER TABLE "doctors" ADD FOREIGN KEY ("medical_center_id") REFERENCES "medical_centers" ("id");

ALTER TABLE "doctors_patients" ADD FOREIGN KEY ("doctor_id") REFERENCES "doctors" ("id");

ALTER TABLE "doctors_patients" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("id");

ALTER TABLE "patients_diseases" ADD FOREIGN KEY ("patient_id") REFERENCES "patients" ("id");

ALTER TABLE "patients_diseases" ADD FOREIGN KEY ("disease_id") REFERENCES "diseases" ("id");
