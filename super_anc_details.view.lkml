view: super_anc_details {
  sql_table_name: gps.SUPER_ANC_DETAILS ;;

  dimension: anc_id {
    type: number
    sql: ${TABLE}.ANC_ID ;;
  }

  dimension: super_anc_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.SUPER_ANC_ID ;;
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
    drill_fields: [super_anc.super_anc_id, super_anc.name]
  }
}
