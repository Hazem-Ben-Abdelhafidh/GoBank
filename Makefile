postgres:
	docker run --name postgresDB -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres
createdb:
	docker exec -it postgresDB createdb --username=root --owner=root gobank
dropdb:
	docker exec -it postgresDB dropdb gobank
migrateup: 
	migrate -path db/migration -database "postgres://root:secret@localhost:5432/gobank?sslmode=disable" up
migratedown:
	migrate -path db/migration -database "postgres://root:secret@localhost:5432/gobank?sslmode=disable"	down 
sqlc:
	sqlc generate
.PHONY: postgres createdb dropdb migrateup migratedown sqlc