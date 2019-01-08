view: evt {
  sql_table_name: dim.EVT ;;

  dimension: evt_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.EVT_ID ;;
  }

  dimension_group: date_created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DATE_CREATED ;;
  }

  dimension_group: date_lastmodified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DATE_LASTMODIFIED ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: ditl {
    type: string
    sql: ${TABLE}.DITL ;;
  }

  dimension: ditlcat {
    type: string
    sql: ${TABLE}.DITLCat ;;
  }

  dimension: ditlsort {
    type: number
    sql: ${TABLE}.DITLSort ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.SOURCE ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}.TYPE_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [evt_id, name, udf.count]
  }
}
