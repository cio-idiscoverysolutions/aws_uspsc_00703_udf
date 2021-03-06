view: anc_details {
  sql_table_name: gps.ANC_DETAILS ;;

  dimension: anc_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ANC_ID ;;
  }


  dimension: gps_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.GPS_ID ;;
  }

  dimension: target_id {
    type: number
    sql: ${TABLE}.TARGET_ID ;;
  }

  dimension: target_type {
    type: string
    sql: ${TABLE}.TARGET_TYPE ;;
  }

  measure: count {
    type: count
    drill_fields: [anc.anc_id, anc.name, gps.pr_gps_id]
  }
}
