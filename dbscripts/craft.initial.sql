/*
 Navicat Premium Data Transfer

 Source Server         : craft.supbase.dev
 Source Server Type    : PostgreSQL
 Source Server Version : 120006
 Source Host           : db.gvgdufzttamxwkcscefr.supabase.co:5432
 Source Catalog        : postgres
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120006
 File Encoding         : 65001

 Date: 18/06/2021 15:54:12
*/


-- ----------------------------
-- Sequence structure for appellants_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."appellants_id_seq";
CREATE SEQUENCE "public"."appellants_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."appellants_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for cases_analysis_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cases_analysis_id_seq";
CREATE SEQUENCE "public"."cases_analysis_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."cases_analysis_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for cases_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cases_id_seq";
CREATE SEQUENCE "public"."cases_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."cases_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for citations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."citations_id_seq";
CREATE SEQUENCE "public"."citations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;
ALTER SEQUENCE "public"."citations_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for courts_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."courts_id_seq";
CREATE SEQUENCE "public"."courts_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."courts_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for issues_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."issues_id_seq";
CREATE SEQUENCE "public"."issues_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."issues_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for judges_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."judges_id_seq";
CREATE SEQUENCE "public"."judges_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."judges_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for jurisdictions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."jurisdictions_id_seq";
CREATE SEQUENCE "public"."jurisdictions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."jurisdictions_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for lawyers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."lawyers_id_seq";
CREATE SEQUENCE "public"."lawyers_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."lawyers_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for matters_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."matters_id_seq";
CREATE SEQUENCE "public"."matters_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."matters_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for opinions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."opinions_id_seq";
CREATE SEQUENCE "public"."opinions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."opinions_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for rationes_decidendi_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."rationes_decidendi_id_seq";
CREATE SEQUENCE "public"."rationes_decidendi_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."rationes_decidendi_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for reporters_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."reporters_id_seq";
CREATE SEQUENCE "public"."reporters_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."reporters_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for summaries_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."summaries_id_seq";
CREATE SEQUENCE "public"."summaries_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."summaries_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Sequence structure for volumes_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."volumes_id_seq";
CREATE SEQUENCE "public"."volumes_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;
ALTER SEQUENCE "public"."volumes_id_seq" OWNER TO "supabase_admin";

-- ----------------------------
-- Table structure for cases
-- ----------------------------
DROP TABLE IF EXISTS "public"."cases";
CREATE TABLE "public"."cases" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "name" varchar COLLATE "pg_catalog"."default",
  "name_abbreviation" varchar COLLATE "pg_catalog"."default",
  "decision_date" varchar COLLATE "pg_catalog"."default",
  "docket_number" varchar COLLATE "pg_catalog"."default",
  "first_page" int4,
  "last_page" int4,
  "volume_id" int8 NOT NULL,
  "reportor_id" int8 NOT NULL,
  "court_id" int8 NOT NULL,
  "jurisdiction_id" int8 NOT NULL,
  "last_updated" timestamp(6) NOT NULL DEFAULT now(),
  "status" varchar COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."cases" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."cases"."name" IS 'The official name of the of the case';
COMMENT ON COLUMN "public"."cases"."name_abbreviation" IS 'The abbreviated name of the case';
COMMENT ON COLUMN "public"."cases"."decision_date" IS 'The decision date of this case in the format YYYY-MM';
COMMENT ON COLUMN "public"."cases"."docket_number" IS 'The suite/docket number of the case';
COMMENT ON COLUMN "public"."cases"."first_page" IS 'The first page of the opinion';
COMMENT ON COLUMN "public"."cases"."last_page" IS 'The last page of the opinion';
COMMENT ON COLUMN "public"."cases"."volume_id" IS 'The volume this case is part of';
COMMENT ON COLUMN "public"."cases"."reportor_id" IS 'Case reporter';
COMMENT ON COLUMN "public"."cases"."court_id" IS 'The court that case held';
COMMENT ON COLUMN "public"."cases"."jurisdiction_id" IS 'Jurisdiction that this case applies';
COMMENT ON COLUMN "public"."cases"."status" IS 'The status of the case';
COMMENT ON TABLE "public"."cases" IS 'All  judgement across jurisdictions';

-- ----------------------------
-- Records of cases
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cases_analysis
-- ----------------------------
DROP TABLE IF EXISTS "public"."cases_analysis";
CREATE TABLE "public"."cases_analysis" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "char_count" int4 NOT NULL,
  "word_count" int4 NOT NULL,
  "case_id" int8 NOT NULL
)
;
ALTER TABLE "public"."cases_analysis" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."cases_analysis"."case_id" IS 'The case in reference';
COMMENT ON TABLE "public"."cases_analysis" IS 'The key analysis of a case';

-- ----------------------------
-- Records of cases_analysis
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cases_citations
-- ----------------------------
DROP TABLE IF EXISTS "public"."cases_citations";
CREATE TABLE "public"."cases_citations" (
  "case_id" int8 NOT NULL,
  "cites_to_id" int8 NOT NULL
)
;
ALTER TABLE "public"."cases_citations" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."cases_citations"."case_id" IS 'The primary case';
COMMENT ON COLUMN "public"."cases_citations"."cites_to_id" IS 'The case that is cited';
COMMENT ON TABLE "public"."cases_citations" IS 'Cases and their respective citations';

-- ----------------------------
-- Records of cases_citations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cases_issues
-- ----------------------------
DROP TABLE IF EXISTS "public"."cases_issues";
CREATE TABLE "public"."cases_issues" (
  "case_id" int8,
  "issue_id" int8
)
;
ALTER TABLE "public"."cases_issues" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."cases_issues"."issue_id" IS 'The reference to the issue';
COMMENT ON TABLE "public"."cases_issues" IS 'The issues of cases';

-- ----------------------------
-- Records of cases_issues
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cases_judges
-- ----------------------------
DROP TABLE IF EXISTS "public"."cases_judges";
CREATE TABLE "public"."cases_judges" (
  "case_id" int8 NOT NULL,
  "judge_id" int8 NOT NULL
)
;
ALTER TABLE "public"."cases_judges" OWNER TO "supabase_admin";
COMMENT ON TABLE "public"."cases_judges" IS 'Judges involved in a case';

-- ----------------------------
-- Records of cases_judges
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cases_lawyers
-- ----------------------------
DROP TABLE IF EXISTS "public"."cases_lawyers";
CREATE TABLE "public"."cases_lawyers" (
  "case_id" int8,
  "lawyer_id" int8 NOT NULL
)
;
ALTER TABLE "public"."cases_lawyers" OWNER TO "supabase_admin";
COMMENT ON TABLE "public"."cases_lawyers" IS 'All the lawyers involved in a case';

-- ----------------------------
-- Records of cases_lawyers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cases_matters
-- ----------------------------
DROP TABLE IF EXISTS "public"."cases_matters";
CREATE TABLE "public"."cases_matters" (
  "case_id" int8,
  "matter_id" int8
)
;
ALTER TABLE "public"."cases_matters" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."cases_matters"."case_id" IS 'Reference to the case';
COMMENT ON COLUMN "public"."cases_matters"."matter_id" IS 'References to the matters';
COMMENT ON TABLE "public"."cases_matters" IS 'All the matters references on cases';

-- ----------------------------
-- Records of cases_matters
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cases_parties
-- ----------------------------
DROP TABLE IF EXISTS "public"."cases_parties";
CREATE TABLE "public"."cases_parties" (
  "case_id" int8,
  "party_id" int8 NOT NULL
)
;
ALTER TABLE "public"."cases_parties" OWNER TO "supabase_admin";
COMMENT ON TABLE "public"."cases_parties" IS 'The parties involved in cases';

-- ----------------------------
-- Records of cases_parties
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for citations
-- ----------------------------
DROP TABLE IF EXISTS "public"."citations";
CREATE TABLE "public"."citations" (
  "id" int4 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
),
  "type" varchar COLLATE "pg_catalog"."default",
  "cite" varchar COLLATE "pg_catalog"."default",
  "case_id" int8 NOT NULL
)
;
ALTER TABLE "public"."citations" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."citations"."type" IS 'The type of citation used., values (nominative, official)';
COMMENT ON COLUMN "public"."citations"."cite" IS 'Report  citation for reference';
COMMENT ON TABLE "public"."citations" IS 'All case citations';

-- ----------------------------
-- Records of citations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for courts
-- ----------------------------
DROP TABLE IF EXISTS "public"."courts";
CREATE TABLE "public"."courts" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "name" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "name_abbreviation" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."courts" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."courts"."name" IS 'The court full name';
COMMENT ON COLUMN "public"."courts"."name_abbreviation" IS 'The court name abbreviation';
COMMENT ON TABLE "public"."courts" IS 'Courts with respective case laws';

-- ----------------------------
-- Records of courts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for issues
-- ----------------------------
DROP TABLE IF EXISTS "public"."issues";
CREATE TABLE "public"."issues" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "text" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."issues" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."issues"."text" IS 'The issue of the case';
COMMENT ON TABLE "public"."issues" IS 'The issues of cases';

-- ----------------------------
-- Records of issues
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for judges
-- ----------------------------
DROP TABLE IF EXISTS "public"."judges";
CREATE TABLE "public"."judges" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "name" text COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."judges" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."judges"."name" IS 'The full name of the judge';

-- ----------------------------
-- Records of judges
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jurisdictions
-- ----------------------------
DROP TABLE IF EXISTS "public"."jurisdictions";
CREATE TABLE "public"."jurisdictions" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "name_long" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "slug" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "name" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "whitelisted" bool NOT NULL DEFAULT true
)
;
ALTER TABLE "public"."jurisdictions" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."jurisdictions"."name_long" IS 'The longer name of the jurisdiction';
COMMENT ON COLUMN "public"."jurisdictions"."slug" IS 'The URL referenceable name';
COMMENT ON COLUMN "public"."jurisdictions"."name" IS 'The formal name of the jurisdiction';
COMMENT ON COLUMN "public"."jurisdictions"."whitelisted" IS 'A marker on if this juris is live';
COMMENT ON TABLE "public"."jurisdictions" IS 'The jurisdictions that cases apply';

-- ----------------------------
-- Records of jurisdictions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for lawyers
-- ----------------------------
DROP TABLE IF EXISTS "public"."lawyers";
CREATE TABLE "public"."lawyers" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "name" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."lawyers" OWNER TO "supabase_admin";
COMMENT ON TABLE "public"."lawyers" IS 'The lawyers involved in the case';

-- ----------------------------
-- Records of lawyers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for matters
-- ----------------------------
DROP TABLE IF EXISTS "public"."matters";
CREATE TABLE "public"."matters" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "name" text COLLATE "pg_catalog"."default",
  "description" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."matters" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."matters"."name" IS 'The name of the matter involved';
COMMENT ON COLUMN "public"."matters"."description" IS 'The description of the matter';
COMMENT ON TABLE "public"."matters" IS 'The matters of all cases';

-- ----------------------------
-- Records of matters
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for opinions
-- ----------------------------
DROP TABLE IF EXISTS "public"."opinions";
CREATE TABLE "public"."opinions" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "type" text COLLATE "pg_catalog"."default",
  "case_id" int8 NOT NULL,
  "author_id" int8 NOT NULL,
  "text" text COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."opinions" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."opinions"."type" IS 'The type of this opinions (majority | minority)';
COMMENT ON COLUMN "public"."opinions"."case_id" IS 'The case this is relevant to';
COMMENT ON COLUMN "public"."opinions"."author_id" IS 'The judge delivering the opinion';
COMMENT ON COLUMN "public"."opinions"."text" IS 'The content of the judgement/opinion as delivered';
COMMENT ON TABLE "public"."opinions" IS 'The opinions for the judgement';

-- ----------------------------
-- Records of opinions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for parties
-- ----------------------------
DROP TABLE IF EXISTS "public"."parties";
CREATE TABLE "public"."parties" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "name" text COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "case_id" int8 NOT NULL
)
;
ALTER TABLE "public"."parties" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."parties"."type" IS 'The role in the case (appellants, respondents)';
COMMENT ON TABLE "public"."parties" IS 'The parties involved in the court decisions';

-- ----------------------------
-- Records of parties
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for rationes_decidendi
-- ----------------------------
DROP TABLE IF EXISTS "public"."rationes_decidendi";
CREATE TABLE "public"."rationes_decidendi" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "case_id" int8 NOT NULL,
  "matter" text COLLATE "pg_catalog"."default" NOT NULL,
  "number" int4 NOT NULL,
  "topic" text COLLATE "pg_catalog"."default" NOT NULL,
  "text" text COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."rationes_decidendi" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."rationes_decidendi"."matter" IS 'The matter in question for the case';
COMMENT ON COLUMN "public"."rationes_decidendi"."number" IS 'The position as is relevant to the judgement in question';
COMMENT ON COLUMN "public"."rationes_decidendi"."topic" IS 'All the topics that the case covers';
COMMENT ON COLUMN "public"."rationes_decidendi"."text" IS 'The content of the ratio decidendi ';
COMMENT ON TABLE "public"."rationes_decidendi" IS 'All cases rationes (the point in a case that determines the judgement)';

-- ----------------------------
-- Records of rationes_decidendi
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for reporters
-- ----------------------------
DROP TABLE IF EXISTS "public"."reporters";
CREATE TABLE "public"."reporters" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "full_name" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "short_name" varchar COLLATE "pg_catalog"."default" NOT NULL
)
;
ALTER TABLE "public"."reporters" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."reporters"."full_name" IS 'The full name of the reporter';
COMMENT ON COLUMN "public"."reporters"."short_name" IS 'The short name of the reporter';
COMMENT ON TABLE "public"."reporters" IS 'The case law reporter';

-- ----------------------------
-- Records of reporters
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for summaries
-- ----------------------------
DROP TABLE IF EXISTS "public"."summaries";
CREATE TABLE "public"."summaries" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "case_id" int8,
  "text" text COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."summaries" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."summaries"."case_id" IS 'The reference to the case';
COMMENT ON COLUMN "public"."summaries"."text" IS 'The content of the summary';
COMMENT ON TABLE "public"."summaries" IS 'The summary of the case';

-- ----------------------------
-- Records of summaries
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for volumes
-- ----------------------------
DROP TABLE IF EXISTS "public"."volumes";
CREATE TABLE "public"."volumes" (
  "id" int8 NOT NULL GENERATED BY DEFAULT AS IDENTITY (
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
),
  "name" varchar COLLATE "pg_catalog"."default",
  "barcode" varchar COLLATE "pg_catalog"."default"
)
;
ALTER TABLE "public"."volumes" OWNER TO "supabase_admin";
COMMENT ON COLUMN "public"."volumes"."name" IS 'The name of the volume';
COMMENT ON COLUMN "public"."volumes"."barcode" IS 'The barcode of the volume';
COMMENT ON TABLE "public"."volumes" IS 'Volumes that cases are part part of';

-- ----------------------------
-- Records of volumes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."appellants_id_seq"
OWNED BY "public"."parties"."id";
SELECT setval('"public"."appellants_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cases_analysis_id_seq"
OWNED BY "public"."cases_analysis"."id";
SELECT setval('"public"."cases_analysis_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."cases_id_seq"
OWNED BY "public"."cases"."id";
SELECT setval('"public"."cases_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."citations_id_seq"
OWNED BY "public"."citations"."id";
SELECT setval('"public"."citations_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."courts_id_seq"
OWNED BY "public"."courts"."id";
SELECT setval('"public"."courts_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."issues_id_seq"
OWNED BY "public"."issues"."id";
SELECT setval('"public"."issues_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."judges_id_seq"
OWNED BY "public"."judges"."id";
SELECT setval('"public"."judges_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."jurisdictions_id_seq"
OWNED BY "public"."jurisdictions"."id";
SELECT setval('"public"."jurisdictions_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."lawyers_id_seq"
OWNED BY "public"."lawyers"."id";
SELECT setval('"public"."lawyers_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."matters_id_seq"
OWNED BY "public"."matters"."id";
SELECT setval('"public"."matters_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."opinions_id_seq"
OWNED BY "public"."opinions"."id";
SELECT setval('"public"."opinions_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."rationes_decidendi_id_seq"
OWNED BY "public"."rationes_decidendi"."id";
SELECT setval('"public"."rationes_decidendi_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."reporters_id_seq"
OWNED BY "public"."reporters"."id";
SELECT setval('"public"."reporters_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."summaries_id_seq"
OWNED BY "public"."summaries"."id";
SELECT setval('"public"."summaries_id_seq"', 2, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."volumes_id_seq"
OWNED BY "public"."volumes"."id";
SELECT setval('"public"."volumes_id_seq"', 2, false);

-- ----------------------------
-- Primary Key structure for table cases
-- ----------------------------
ALTER TABLE "public"."cases" ADD CONSTRAINT "cases_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table cases_analysis
-- ----------------------------
ALTER TABLE "public"."cases_analysis" ADD CONSTRAINT "cases_analysis_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table citations
-- ----------------------------
ALTER TABLE "public"."citations" ADD CONSTRAINT "citations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table courts
-- ----------------------------
ALTER TABLE "public"."courts" ADD CONSTRAINT "courts_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table issues
-- ----------------------------
ALTER TABLE "public"."issues" ADD CONSTRAINT "issues_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table judges
-- ----------------------------
ALTER TABLE "public"."judges" ADD CONSTRAINT "judges_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table jurisdictions
-- ----------------------------
ALTER TABLE "public"."jurisdictions" ADD CONSTRAINT "jurisdictions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table lawyers
-- ----------------------------
ALTER TABLE "public"."lawyers" ADD CONSTRAINT "lawyers_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table matters
-- ----------------------------
ALTER TABLE "public"."matters" ADD CONSTRAINT "matters_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table opinions
-- ----------------------------
ALTER TABLE "public"."opinions" ADD CONSTRAINT "opinions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table parties
-- ----------------------------
ALTER TABLE "public"."parties" ADD CONSTRAINT "appellants_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table rationes_decidendi
-- ----------------------------
ALTER TABLE "public"."rationes_decidendi" ADD CONSTRAINT "rationes_decidendi_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table reporters
-- ----------------------------
ALTER TABLE "public"."reporters" ADD CONSTRAINT "reporters_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table summaries
-- ----------------------------
ALTER TABLE "public"."summaries" ADD CONSTRAINT "summaries_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table volumes
-- ----------------------------
ALTER TABLE "public"."volumes" ADD CONSTRAINT "volumes_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Keys structure for table cases
-- ----------------------------
ALTER TABLE "public"."cases" ADD CONSTRAINT "cases_court_id_fkey" FOREIGN KEY ("court_id") REFERENCES "public"."courts" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."cases" ADD CONSTRAINT "cases_jurisdiction_id_fkey" FOREIGN KEY ("jurisdiction_id") REFERENCES "public"."jurisdictions" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."cases" ADD CONSTRAINT "cases_reportor_id_fkey" FOREIGN KEY ("reportor_id") REFERENCES "public"."reporters" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."cases" ADD CONSTRAINT "cases_volume_id_fkey" FOREIGN KEY ("volume_id") REFERENCES "public"."volumes" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table cases_analysis
-- ----------------------------
ALTER TABLE "public"."cases_analysis" ADD CONSTRAINT "cases_analysis_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table cases_citations
-- ----------------------------
ALTER TABLE "public"."cases_citations" ADD CONSTRAINT "cases_citations_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."cases_citations" ADD CONSTRAINT "cases_citations_cites_to_id_fkey" FOREIGN KEY ("cites_to_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table cases_issues
-- ----------------------------
ALTER TABLE "public"."cases_issues" ADD CONSTRAINT "cases_issues_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."cases_issues" ADD CONSTRAINT "cases_issues_issue_id_fkey" FOREIGN KEY ("issue_id") REFERENCES "public"."issues" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table cases_judges
-- ----------------------------
ALTER TABLE "public"."cases_judges" ADD CONSTRAINT "cases_judges_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."cases_judges" ADD CONSTRAINT "cases_judges_judge_id_fkey" FOREIGN KEY ("judge_id") REFERENCES "public"."judges" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table cases_lawyers
-- ----------------------------
ALTER TABLE "public"."cases_lawyers" ADD CONSTRAINT "cases_lawyers_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."cases_lawyers" ADD CONSTRAINT "cases_lawyers_lawyer_id_fkey" FOREIGN KEY ("lawyer_id") REFERENCES "public"."lawyers" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table cases_matters
-- ----------------------------
ALTER TABLE "public"."cases_matters" ADD CONSTRAINT "cases_matters_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."cases_matters" ADD CONSTRAINT "cases_matters_matter_id_fkey" FOREIGN KEY ("matter_id") REFERENCES "public"."matters" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table cases_parties
-- ----------------------------
ALTER TABLE "public"."cases_parties" ADD CONSTRAINT "cases_parties_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."cases_parties" ADD CONSTRAINT "cases_parties_party_id_fkey" FOREIGN KEY ("party_id") REFERENCES "public"."parties" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table citations
-- ----------------------------
ALTER TABLE "public"."citations" ADD CONSTRAINT "citations_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table opinions
-- ----------------------------
ALTER TABLE "public"."opinions" ADD CONSTRAINT "opinions_author_id_fkey" FOREIGN KEY ("author_id") REFERENCES "public"."judges" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."opinions" ADD CONSTRAINT "opinions_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table parties
-- ----------------------------
ALTER TABLE "public"."parties" ADD CONSTRAINT "parties_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table rationes_decidendi
-- ----------------------------
ALTER TABLE "public"."rationes_decidendi" ADD CONSTRAINT "rationes_decidendi_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table summaries
-- ----------------------------
ALTER TABLE "public"."summaries" ADD CONSTRAINT "summaries_case_id_fkey" FOREIGN KEY ("case_id") REFERENCES "public"."cases" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
