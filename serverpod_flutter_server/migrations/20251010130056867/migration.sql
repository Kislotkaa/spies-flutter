BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "games" ADD COLUMN "spyUserId" uuid;

--
-- MIGRATION VERSION FOR serverpod_flutter
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_flutter', '20251010130056867', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251010130056867', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
