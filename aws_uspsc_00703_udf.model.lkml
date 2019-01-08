connection: "aws_uspsc_00703_udf"

# include all the views
include: "*.view"

datagroup: aws_uspsc_00703_udf_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: aws_uspsc_00703_udf_default_datagroup

explore: anc {}

explore: anc_details {}

explore: evt {}

explore: super_anc {
  join: super_anc_details{
    type: left_outer
    sql_on: ${super_anc.super_anc_id} = ${super_anc_details.super_anc_id} ;;
    relationship: one_to_many
    view_label: "super anchor details"

  }join: anc{
    type: left_outer
    sql_on: ${anc.anc_id} = ${super_anc_details.anc_id} ;;
    relationship: one_to_many
    }
  join: anc_details{
    type: left_outer
    sql_on: ${anc.anc_id} = ${anc_details.anc_id} ;;
    relationship: one_to_many
  }
  join: ppl{
    type: inner
    sql_on: ${super_anc.target_id} = ${ppl.ppl_id} ;;
    relationship: one_to_many
    view_label: "People"

  }
}

explore: super_anc_details {}

explore: gps {
  join: anc_details{
    type: left_outer
    sql_on: ${gps.gps_id} = ${anc_details.gps_id} ;;
    relationship: one_to_many
    view_label: "anchor details"

  }
  join: anc{
    type: left_outer
    sql_on: ${anc.anc_id} = ${anc_details.anc_id} ;;
    relationship: one_to_many
    view_label: "anchors"
  }
  join: ppl{
    type: inner
    sql_on: ${gps.ppl_id} = ${ppl.ppl_id} ;;
    relationship: one_to_many
    view_label: "People"

  }
}

explore: loc {}

explore: obj {}

explore: ppl {}

explore: src {}

explore: udf {
  label: "Universal Data Format"
  join: ppl{
    type: left_outer
    sql_on: ${udf.ppl_id} = ${ppl.ppl_id} ;;
    relationship: one_to_many
    view_label: "People"

  }
  join: obj{
    type: left_outer
    sql_on: ${udf.obj_id} = ${obj.obj_id} ;;
    relationship: one_to_many
    view_label: "Object"
  }
  join: loc{
    type: left_outer
    sql_on: ${udf.loc_id} = ${loc.loc_id} ;;
    relationship: one_to_many
  }
  join: evt{
    type: left_outer
    sql_on: ${udf.evt_id} = ${evt.evt_id} ;;
    relationship: one_to_many
  }
  join: src{
    type: left_outer
    sql_on: ${udf.src_id} = ${src.src_id} ;;
    relationship: one_to_many
  }
  join: gps{
    type: left_outer
    sql_on: ${gps.ppl_id} = ${ppl.ppl_id} ;;
    relationship: one_to_many
  }
  join: anc_details{
    type: left_outer
    sql_on: ${gps.gps_id} = ${anc_details.gps_id} ;;
    relationship: one_to_many
  }
  join: anc{
    type: left_outer
    sql_on: ${anc.anc_id} = ${anc_details.anc_id} ;;
    relationship: one_to_many
  }
  join: super_anc_details{
    type: left_outer
    sql_on: ${anc.anc_id} = ${super_anc_details.anc_id} ;;
    relationship: one_to_many
  }
  join: super_anc{
    type: left_outer
    sql_on: ${super_anc.super_anc_id} = ${super_anc_details.super_anc_id} ;;
    relationship: one_to_many
  }
}
