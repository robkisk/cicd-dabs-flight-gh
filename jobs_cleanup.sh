TARGET="dev";databricks jobs list -t $TARGET -o "json" | jq -r '.[].job_id' | while read -r job; do echo `databricks jobs delete $job -t $TARGET`; done
TARGET="dev"; databricks pipelines list-pipelines -t $TARGET -o "json" | jq -r '.[].pipeline_id' | while read -r pipeline; do echo `databricks pipelines delete $pipeline -t $TARGET`; done

TARGET="staging";databricks jobs list -t $TARGET -o "json" | jq -r '.[].job_id' | while read -r job; do echo `databricks jobs delete $job -t $TARGET`; done
TARGET="staging"; databricks pipelines list-pipelines -t $TARGET -o "json" | jq -r '.[].pipeline_id' | while read -r pipeline; do echo `databricks pipelines delete $pipeline -t $TARGET`; done

TARGET="prod";databricks jobs list -t $TARGET -o "json" | jq -r '.[].job_id' | while read -r job; do echo `databricks jobs delete $job -t $TARGET`; done
TARGET="prod"; databricks pipelines list-pipelines -t $TARGET -o "json" | jq -r '.[].pipeline_id' | while read -r pipeline; do echo `databricks pipelines delete $pipeline -t $TARGET`; done

databricks tables delete bu1_dev.flights_validation_dev.flights_raw -t "dev"
databricks tables delete bu1_qa.flights_validation_staging.flights_raw -t "staging"
databricks tables delete bu1_prod.flights_validation_prod.flights_raw -t "prod"

databricks tables delete bu1_dev.flights_dev.flights_dlt_raw -t "dev"
databricks tables delete bu1_dev.flights_dev.flights_dlt_summary -t "dev"

databricks schemas delete bu1_dev.flights_validation_dev --force -t "dev"
databricks schemas delete bu1_qa.flights_validation_staging --force -t "staging"
databricks schemas delete bu1_prod.flights_validation_prod --force -t "prod"

databricks tables delete bu1_dev.cows_schema.cows_bff -t "dev"
databricks tables delete bu1_qa.cows_schema.cows_bff -t "staging"
databricks tables delete bu1_prod.cows_schema.cows_bff -t "prod"



