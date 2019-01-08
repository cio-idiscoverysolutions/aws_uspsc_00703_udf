view: super_anc {
  sql_table_name: gps.SUPER_ANC ;;

  dimension: super_anc_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.SUPER_ANC_ID ;;
  }

  dimension: cnt {
    type: number
    sql: ${TABLE}.CNT ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.LAT ;;
  }

  dimension: lon {
    type: number
    sql: ${TABLE}.LON ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.RANK ;;
  }

  dimension: target_id {
    type: number
    sql: ${TABLE}.TARGET_ID ;;
  }

  dimension: target_type {
    type: string
    sql: ${TABLE}.TARGET_TYPE ;;
  }
  dimension: super_anc_location {
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${lon} ;;
  }
  measure: count {
    type: count
    drill_fields: [super_anc_id, name, super_anc_details.count]
  }
}
