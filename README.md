# SIMPLE_DBT_PROJECT
## Prerequistite
- run local postgresql
```sh
docker run --name pg_local -p 5432:5432 \
-e POSTGRES_USER=start_data_engineer -e POSTGRES_PASSWORD=password \
-e POSTGRES_DB=tutorial -d postgres:12
```
- edit dbt config profile in ~/.dbt/profiles.yml
```yml
tutorial:
  outputs:
    dev:
      type: postgres
      threads: 1
      host: localhost
      port: 5432
      user: start_data_engineer
      pass: password
      dbname: tutorial
      schema: `dbt`_tutorial
  target: dev
```

## Project stucture after setup
```
.
├── README.md
├── analysis
├── data
│   ├── customer.csv
│   ├── orders.csv
│   └── state.csv
├── dbt_modules
├── logs
├── dbt_project.yml
├── macros
├── models
│   ├── mart
│   │   ├── customer_orders.sql
│   │   └── schema.yml
│   └── staging
│       ├── schema.yml
│       ├── stg_customer.sql
│       ├── stg_orders.sql
│       └── stg_state.sql
├── snapshots
├── target
└── tests
```

## Running dbt
```sh
# check for any errors
dbt debug
# load file into database
dbt seed
# run data pipeline
dbt run
# test table data with schema.yml defined in models
dbt test
# generate doc
dbt docs generate
# run dbt doc server
dbt docs serve
```

- Go to http://localhost:8080 to see the UI
- And remember to remove postgresql container when you finist testing.

## References
[dbt-data-build-tool-tutorial](https://www.startdataengineering.com/post/dbt-data-build-tool-tutorial/)
