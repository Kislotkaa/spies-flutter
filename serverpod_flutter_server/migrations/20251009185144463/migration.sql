BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "games" ADD COLUMN "createAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP;

--
-- MIGRATION VERSION FOR serverpod_flutter
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_flutter', '20251009185144463', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251009185144463', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
