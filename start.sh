cd serverpod_flutter_server

docker compose up -d

dart run bin/main.dart --apply-migrations
