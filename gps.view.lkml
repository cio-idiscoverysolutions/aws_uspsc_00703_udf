view: gps {
  sql_table_name: gps.GPS ;;

  dimension: pr_gps_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.PR_GPS_ID ;;
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

  dimension_group: date_lcl {
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
    sql: ${TABLE}.DATE_LCL ;;
  }

  dimension_group: date_source {
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
    sql: ${TABLE}.DATE_SOURCE ;;
  }

  dimension_group: date_utc {
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
    sql: ${TABLE}.DATE_UTC ;;
  }

  dimension: gps_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.GPS_ID ;;
  }

  dimension: gps_movement {
    type: string
    sql: ${TABLE}.GPS_MOVEMENT ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.LAT ;;
  }

  dimension: lon {
    type: number
    sql: ${TABLE}.LON ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.NOTES ;;
  }

  dimension: nx_delta_ft {
    type: number
    sql: ${TABLE}.NX_DELTA_FT ;;
  }

  dimension: nx_delta_secs {
    type: number
    sql: ${TABLE}.NX_DELTA_SECS ;;
  }

  dimension: nx_gps_id {
    type: number
    sql: ${TABLE}.NX_GPS_ID ;;
  }

  dimension: obj_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.OBJ_ID ;;
  }

  dimension: ppl_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.PPL_ID ;;
  }

  dimension: pr_delta_ft {
    type: number
    sql: ${TABLE}.PR_DELTA_FT ;;
  }

  dimension: pr_delta_secs {
    type: number
    sql: ${TABLE}.PR_DELTA_SECS ;;
  }

  dimension: src_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.SRC_ID ;;
  }

  dimension: src_record_id {
    type: number
    sql: ${TABLE}.SRC_RECORD_ID ;;
  }
  dimension: gps_location {
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${lon} ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      pr_gps_id,
      gps.pr_gps_id,
      ppl.ppl_id,
      ppl.full_name,
      ppl.first_name,
      ppl.middle_name,
      ppl.last_name,
      obj.obj_id,
      obj.name,
      src.src_id,
      src.name,
      src.disp_name,
      anc_details.count,
      gps.count
    ]
  }
}
