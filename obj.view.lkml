view: obj {
  sql_table_name: dim.OBJ ;;

  dimension: obj_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.OBJ_ID ;;
  }

   dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}.TYPE_ID ;;
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}.UNIQUE_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [obj_id, name, gps.count, udf.count]
  }
}
