psql -d postgres://db:dbJy32s2sk7@0.0.0.0:5432/postgres -c 'DROP DATABASE IF EXISTS adi;'
psql -d postgres://db:dbJy32s2sk7@0.0.0.0:5432/postgres -c 'CREATE DATABASE adi;'
psql -d postgres://db:dbJy32s2sk7@0.0.0.0:5432/cb3p < ../pgdump/dump.sql
