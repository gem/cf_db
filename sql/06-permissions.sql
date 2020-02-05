--
-- Suggested permission and ownership settings - for "real" operational use
-- please review and revise according to your own policies
--

-- It is probably OK for cf_common entities to be OWNED by the DB creator

ALTER SCHEMA hazard OWNER TO hazardcontrib;
ALTER TYPE hazard.calc_method_enum OWNER TO hazardcontrib;
ALTER TABLE hazard.contribution OWNER TO hazardcontrib;
ALTER TABLE hazard.contribution_id_seq OWNER TO hazardcontrib;
ALTER TABLE hazard.event OWNER TO hazardcontrib;
ALTER TABLE hazard.event_id_seq OWNER TO hazardcontrib;
ALTER TABLE hazard.event_set OWNER TO hazardcontrib;
ALTER TABLE hazard.event_set_id_seq OWNER TO hazardcontrib;
ALTER TABLE hazard.footprint OWNER TO hazardcontrib;
ALTER TABLE hazard.footprint_data OWNER TO hazardcontrib;
ALTER TABLE hazard.footprint_data_id_seq OWNER TO hazardcontrib;
ALTER TABLE hazard.footprint_id_seq OWNER TO hazardcontrib;
ALTER TABLE hazard.footprint_set OWNER TO hazardcontrib;
ALTER TABLE hazard.footprint_set_id_seq OWNER TO hazardcontrib;

ALTER SCHEMA ged4all OWNER TO ged4allcontrib;
ALTER TYPE ged4all.category_enum OWNER TO ged4allcontrib;
ALTER TABLE ged4all.asset OWNER TO ged4allcontrib;
ALTER TABLE ged4all.cost OWNER TO ged4allcontrib;
ALTER TABLE ged4all.model_cost_type OWNER TO ged4allcontrib;
ALTER TABLE ged4all.occupancy OWNER TO ged4allcontrib;
ALTER TABLE ged4all.all_exposure OWNER TO ged4allcontrib;
ALTER TABLE ged4all.asset_id_seq OWNER TO ged4allcontrib;
ALTER TABLE ged4all.contribution OWNER TO ged4allcontrib;
ALTER TABLE ged4all.contribution_id_seq OWNER TO ged4allcontrib;
ALTER TABLE ged4all.cost_id_seq OWNER TO ged4allcontrib;
ALTER TABLE ged4all.exposure_model OWNER TO ged4allcontrib;
ALTER TABLE ged4all.exposure_model_id_seq OWNER TO ged4allcontrib;
ALTER TABLE ged4all.model_cost_type_id_seq OWNER TO ged4allcontrib;
ALTER TABLE ged4all.occupancy_id_seq OWNER TO ged4allcontrib;
ALTER TABLE ged4all.tags OWNER TO ged4allcontrib;
ALTER TABLE ged4all.tags_id_seq OWNER TO ged4allcontrib;

ALTER SCHEMA loss OWNER TO losscontrib;
ALTER TYPE loss.component_enum OWNER TO losscontrib;
ALTER TYPE loss.frequency_enum OWNER TO losscontrib;
ALTER TYPE loss.loss_type_enum OWNER TO losscontrib;
ALTER TYPE loss.metric_enum OWNER TO losscontrib;
ALTER TABLE loss.loss_map OWNER TO losscontrib;
ALTER TABLE loss.loss_map_values OWNER TO losscontrib;
ALTER TABLE loss.loss_model OWNER TO losscontrib;
ALTER TABLE loss.all_loss_map_values OWNER TO losscontrib;
ALTER TABLE loss.contribution OWNER TO losscontrib;
ALTER TABLE loss.contribution_id_seq OWNER TO losscontrib;
ALTER TABLE loss.loss_curve_map OWNER TO losscontrib;
ALTER TABLE loss.loss_curve_map_id_seq OWNER TO losscontrib;
ALTER TABLE loss.loss_curve_map_values OWNER TO losscontrib;
ALTER TABLE loss.loss_curve_map_values_id_seq OWNER TO losscontrib;
ALTER TABLE loss.loss_map_id_seq OWNER TO losscontrib;
ALTER TABLE loss.loss_map_values_id_seq OWNER TO losscontrib;
ALTER TABLE loss.loss_model_id_seq OWNER TO losscontrib;

ALTER SCHEMA mover OWNER TO movercontrib;
ALTER TYPE mover.an_analysis_type_enum OWNER TO movercontrib;
ALTER TYPE mover.damage_states_all_enum OWNER TO movercontrib;
ALTER TYPE mover.dm_scale_ty_enum OWNER TO movercontrib;
ALTER TYPE mover.em_analysis_type_enum OWNER TO movercontrib;
ALTER TYPE mover.f_math_enum OWNER TO movercontrib;
ALTER TYPE mover.f_mathtype_enum OWNER TO movercontrib;
ALTER TYPE mover.f_relationship_enum OWNER TO movercontrib;
ALTER TYPE mover.f_subtype_enum OWNER TO movercontrib;
ALTER TYPE mover.fit_ref_enum OWNER TO movercontrib;
ALTER TYPE mover.function_type_enum OWNER TO movercontrib;
ALTER TYPE mover.geographic_relevance_score_enum OWNER TO movercontrib;
ALTER TYPE mover.im_method_enum OWNER TO movercontrib;
ALTER TYPE mover.jd_analysis_type_enum OWNER TO movercontrib;
ALTER TYPE mover.nonsampling_err_enum OWNER TO movercontrib;
ALTER TYPE mover.sample_enum OWNER TO movercontrib;
ALTER TYPE mover.scale_app_enum OWNER TO movercontrib;
ALTER TYPE mover.sim_method_enum OWNER TO movercontrib;
ALTER TYPE mover.type_nonsampling_err_enum OWNER TO movercontrib;
ALTER TABLE mover.damage_scale OWNER TO movercontrib;
ALTER TABLE mover.damage_scale_id_seq OWNER TO movercontrib;
ALTER TABLE mover.edp_table OWNER TO movercontrib;
ALTER TABLE mover.f_additional OWNER TO movercontrib;
ALTER TABLE mover.f_additional_f_additional_id_seq OWNER TO movercontrib;
ALTER TABLE mover.f_core OWNER TO movercontrib;
ALTER TABLE mover.f_core_id_seq OWNER TO movercontrib;
ALTER TABLE mover.f_scoring OWNER TO movercontrib;
ALTER TABLE mover.f_scoring_f_core_id_seq OWNER TO movercontrib;
ALTER TABLE mover.f_scoring_id_seq OWNER TO movercontrib;
ALTER TABLE mover.f_specifics OWNER TO movercontrib;
ALTER TABLE mover.f_specifics_f_specifics_id_seq OWNER TO movercontrib;
ALTER TABLE mover.lp_table OWNER TO movercontrib;
ALTER TABLE mover.reference_table OWNER TO movercontrib;


-- 
GRANT USAGE ON SCHEMA cf_common TO commonusers;
GRANT SELECT ON ALL TABLES IN SCHEMA cf_common TO commonusers;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA cf_common TO commonusers;

GRANT USAGE ON SCHEMA hazard TO hazardusers;
GRANT SELECT ON TABLES IN SCHEMA hazard TO hazardusers;
GRANT SELECT, USAGE ON ALL SEQUENCES IN SCHEMA hazard TO hazardusers;

GRANT USAGE ON SCHEMA ged4all TO ged4allusers;
GRANT SELECT ON TABLES IN SCHEMA ged4all TO ged4allusers;
GRANT SELECT,USAGE ON ALL SEQUENCES IN SCHEMA ged4all TO ged4allusers;

GRANT USAGE ON SCHEMA loss TO lossusers;
GRANT SELECT ON TABLES IN SCHEMA loss TO lossusers;
GRANT SELECT,USAGE ON ALL SEQUENCES IN SCHEMA loss TO lossusers;

GRANT USAGE ON SCHEMA mover TO moverusers;
GRANT SELECT ON TABLES IN SCHEMA mover TO moverusers;
GRANT SELECT,USAGE ON ALL SEQUENCES IN SCHEMA mover TO moverusers;

