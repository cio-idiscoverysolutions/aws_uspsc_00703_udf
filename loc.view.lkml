view: loc {
  sql_table_name: dim.LOC ;;

  dimension: loc_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.LOC_ID ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.ADDRESS ;;
  }



  dimension: description {
    type: string
    sql: ${TABLE}.DESCRIPTION ;;
  }

  dimension: gps_lat {
    type: number
    sql: ${TABLE}.GPS_LAT ;;
  }

  dimension: gps_lon {
    type: number
    sql: ${TABLE}.GPS_LON ;;
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
  dimension: location {
    type: location
    sql_latitude: ${gps_lat} ;;
    sql_longitude: ${gps_lon} ;;
  }
  measure: count {
    type: count
    drill_fields: [loc_id, name, udf.count]
  }
}
