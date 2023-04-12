postgresinit:
	docker run --name postgres15 -p 5433:5433 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password -d postgres:15-alpine

postgres:
	docker exec -it postgres15 psql

createdb:
	docker exec -it postgres15 createdb --username=root --owner=root go-chat

dropdb:
	docker exec -it postgres15 dropdb go-chat

migrateup:
	migrate -path db/migrations -database "postgresql://admin:secret@localhost:5432/go-chat?sslmode=disable"  up

migratedown:
	migrate -path db/migrations -database "postgresql://admin:secret@localhost:5432/go-chat?sslmode=disable" -verbose down

.PHONY: postgresinit postgres createdb dropdb migrateup migratedown

# migrate create -ext sql -dir db/migrations/ -seq account_validation