# Set-up Notes

1. Ran Meltano commands
```
meltano init
meltano add --custom extractor tap-postgres
meltano add --custom loader target-postgres
```
2. Manually set config vars in `meltano.yml` for tap and target.
3. Ran `meltano install`
4. Created `.env_template` file with default values.
5. Copied `.env_template` to `.env`
6. Ran `docker-compose up -d warehouse_db` from separate docker-compose virtual env.
7. Added `robmoore/adventureworks-for-postgres` to `docker-compose.yml` and then ran `docker-compose up -d source_db` from docker-compose virtual env.
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
And then manually edited `sql_alchemy_conn` value to point to postgres with
`sql_alchemy_conn: postgresql+psycopg2://$PG_USERNAME:$PG_PASSWORD@$PG_ADDRESS:$PG_PORT/$PG_DATABASE`
and `load_examples: 'False'`.

12. Initialize airflow db

```
meltano invoke airflow initdb
```

13. Start the airflow ui
```
meltano invoke airflow webserver -D
```

14. Start the airflow scheduler, enabling background job processing
```
meltano invoke airflow scheduler -D
```

15. Scheduled job
```
meltano schedule adventureworks tap-postgres target-postgres @hourly --transform run
```

16. Unpause DAG

Log into Airflow at http://localhost:8080 and click on the 'off' control to the left.


# Miscellaneous

See https://www.sqldatadictionary.com/AdventureWorks2014/ for data dictionary.
Generated bootstrap model using `dbt-helper` from the `transform` directory:
`dbt-helper bootstrap --profiles-dir ./profile/ --schemas raw`

See also [Running Airflow on Heroku](https://medium.com/@damesavram/running-airflow-on-heroku-ed1d28f8013d).
