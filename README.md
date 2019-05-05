# Set-up Notes

1. Ran Meltano commands
```
meltano init
meltano add --custom extractor tap-postgres
meltano add --custom loader target-postgres
```
2. Manually set config vars in `meltano.yml` for tap and target.
3. Ran `meltano install`
4. Copied .env to .env_docker (`export ` causes issues with docker-compose)
5. Removed `export ` from .env_docker
6. Ran `docker-compose up -D warehouse_db` from docker-compose venv
7. Added `robmoore/adventureworks-for-postgres` to `docker-compose.yml` and then ran `docker-compose up -D source_db` from docker-compose venv
8. Added tables for tap
```
meltano invoke tap-postgres --discover
meltano select tap-postgres --list --all
meltano select tap-postgres "salesorderdetail" "*"
```
9. Tested tap is working
```
meltano invoke tap-postgres --properties .meltano/run/tap-postgres/tap.properties.json
```
10. Added `dbt`
```
meltano add transformer dbt
```
11. Added airflow
```
meltano add orchestrator airflow
```
