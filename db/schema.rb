# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_12_08_043710) do

  create_table "account_contacts", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "account_id"
    t.string "contact_type_id"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address_2"
    t.index ["account_id"], name: "index_account_contacts_on_account_id"
    t.index ["contact_type_id"], name: "index_account_contacts_on_contact_type_id"
  end

  create_table "account_email_processor_options", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "account_email_processor_id"
    t.string "option_name"
    t.text "option_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "account_email_processors", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "email_processor_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "activated_at"
    t.string "status"
  end

  create_table "account_feature_templates", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "account_id"
    t.string "feature_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "account_folders", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_folders_on_account_id"
  end

  create_table "account_objects", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "parent_id"
    t.integer "originable_id"
    t.string "originable_type"
    t.integer "user_id"
    t.string "visible_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "object_name"
    t.text "object_value"
    t.index ["account_id", "parent_id"], name: "index_account_objects_on_account_id_and_parent_id"
    t.index ["account_id"], name: "index_account_objects_on_account_id"
  end

  create_table "account_queries", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "account_id"
    t.string "name"
    t.string "query_type"
    t.text "filter"
    t.string "date_period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "active_columns"
    t.index ["account_id"], name: "index_account_queries_on_account_id"
  end

  create_table "accounts", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "accountable_type"
    t.integer "accountable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_status"
    t.boolean "agreed_to_terms"
    t.string "sector"
    t.index ["accountable_id"], name: "idx_accounts_accountable_id"
  end

  create_table "address_constituents", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "street_address"
    t.string "street_address_2"
    t.string "city", limit: 50
    t.string "state", limit: 30
    t.string "zip", limit: 10
    t.string "country", limit: 70
    t.integer "address_location_id"
    t.string "status", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_location_id"], name: "index_address_constituents_on_address_location_id"
    t.index ["city"], name: "index_address_constituents_on_city"
    t.index ["state"], name: "index_address_constituents_on_state"
    t.index ["status"], name: "index_address_constituents_on_status"
    t.index ["street_address", "street_address_2", "city", "state", "zip"], name: "uq_address_constituents", unique: true
    t.index ["street_address"], name: "index_address_constituents_on_street_address"
    t.index ["street_address_2"], name: "index_address_constituents_on_street_address_2"
    t.index ["zip"], name: "index_address_constituents_on_zip"
  end

  create_table "address_locations", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "delivery_line_1"
    t.string "last_line"
    t.string "delivery_point_barcode"
    t.string "primary_number"
    t.string "street_name"
    t.string "street_suffix"
    t.string "secondary_number"
    t.string "secondary_designator"
    t.string "city_name"
    t.string "state_abbreviation"
    t.string "zipcode"
    t.string "plus4_code"
    t.string "delivery_point"
    t.string "delivery_point_check_digit"
    t.string "record_type"
    t.string "zip_type"
    t.string "county_fips"
    t.string "county_name"
    t.string "carrier_route"
    t.string "congressional_district"
    t.string "rdi"
    t.string "elot_sequence"
    t.string "elot_sort"
    t.string "latitude"
    t.string "longitude"
    t.string "precision"
    t.string "time_zone"
    t.string "utc_offset"
    t.boolean "dst"
    t.boolean "dpv_match_code"
    t.string "dpv_footnotes"
    t.boolean "dpv_cmra"
    t.boolean "dpv_vacant"
    t.boolean "active"
    t.string "footnotes"
    t.index ["delivery_point_barcode"], name: "idx_address_location_dpv"
  end

  create_table "batches", id: :integer, charset: "utf8", force: :cascade do |t|
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.string "machine_name"
    t.integer "process_id"
    t.index ["finished_at"], name: "idx_batches_finished_at"
  end

  create_table "billings", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "pepl_id"
    t.integer "mcmaster_id"
    t.integer "npo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_billed_date"
    t.index ["npo_id"], name: "idx_billings_npo_id"
  end

  create_table "black_list_activities", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "ip_address"
    t.string "action"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "black_list_id"
    t.integer "black_list_parent_id"
  end

  create_table "black_lists", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "black_list_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reject_count"
    t.string "black_list_type"
    t.string "state", default: "transient"
    t.string "redirect_url"
    t.integer "parent_id"
    t.string "parent_rule"
    t.string "original_url"
    t.index ["black_list_type", "black_list_value"], name: "index_black_lists_on_black_list_type_and_black_list_value"
  end

  create_table "bot_detections", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "bot_pattern"
    t.text "referrer"
    t.text "url"
    t.text "user_agent"
    t.boolean "bot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaign_event_registrations", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "campaign_event_id"
    t.string "status", limit: 30
    t.integer "npos_constituent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "registration_token"
    t.integer "npos_custom_field_id"
    t.string "ticket_name"
    t.integer "transaction_item_id"
    t.integer "transaction_id"
    t.timestamp "checked_in_at"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.index ["campaign_event_id"], name: "index_campaign_event_registrations_on_campaign_event_id"
    t.index ["npos_constituent_id"], name: "index_campaign_event_registrations_on_npos_constituent_id"
    t.index ["npos_custom_field_id"], name: "index_campaign_event_registrations_on_npos_custom_field_id"
    t.index ["registration_token"], name: "idx_cer_on_registration_token"
    t.index ["registration_token"], name: "uq_campaign_event_registration_token", unique: true
    t.index ["status"], name: "index_campaign_event_registrations_on_status"
    t.index ["ticket_name"], name: "index_campaign_event_registrations_on_ticket_name"
    t.index ["transaction_id"], name: "index_campaign_event_registrations_on_transaction_id"
    t.index ["transaction_item_id"], name: "index_campaign_event_registrations_on_transaction_item_id"
  end

  create_table "campaign_events", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "campaign_id"
    t.string "campaign_event_type"
    t.string "name"
    t.text "description"
    t.string "street_address"
    t.datetime "event_start_dt"
    t.datetime "event_end_dt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude", limit: 53
    t.float "longitude", limit: 53
    t.string "street_address_2"
    t.string "city", limit: 50
    t.string "state", limit: 30
    t.string "zip_code", limit: 10
    t.string "venue_name"
    t.string "venue_type", default: "online"
    t.integer "address_location_id"
    t.index ["address_location_id"], name: "index_campaign_events_on_address_location_id"
    t.index ["campaign_id"], name: "index_campaign_events_on_campaign_id"
  end

  create_table "campaign_templates", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "campaign_type"
    t.string "frequency"
    t.integer "keyword_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "display_logo"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer "frequency_period"
    t.boolean "published"
  end

  create_table "campaigns", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "npo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
    t.integer "graph_setting_id"
    t.string "campaign_type", limit: 25
    t.boolean "archived", default: false
    t.integer "constituent_list_id"
    t.index ["constituent_list_id"], name: "index_campaigns_on_constituent_list_id"
    t.index ["graph_setting_id"], name: "index_campaigns_on_graph_setting_id"
    t.index ["npo_id"], name: "index_campaigns_on_npo_id"
  end

  create_table "campaigns_keyword_categories", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "campaigns_keyword_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns_keywords", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "campaign_id"
    t.integer "keyword_id"
    t.date "goal_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "constituent_list_id"
    t.date "keyword_scheduled_date"
    t.decimal "legacy_default_donation_amount", precision: 8, scale: 2
    t.integer "fundraising_goal"
    t.string "call_to_action"
    t.string "fallback_message_long"
    t.string "fallback_message_short"
    t.string "alternate_donation_url"
    t.string "person_seed_image_file_name"
    t.string "person_seed_image_content_type"
    t.integer "person_seed_image_file_size"
    t.datetime "person_seed_image_updated_at"
    t.string "mobile_web_description"
    t.string "tmp_person_seed_image_file_name"
    t.string "tmp_person_seed_image_content_type"
    t.integer "tmp_person_seed_image_file_size"
    t.datetime "tmp_person_seed_image_updated_at"
    t.string "tmp_logo_file_name"
    t.string "tmp_logo_content_type"
    t.integer "tmp_logo_file_size"
    t.datetime "tmp_logo_updated_at"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean "display_default_donation"
    t.text "call_center_script"
    t.integer "fulfillment_options"
    t.integer "fulfillment_options_threshold"
    t.string "default_custom_call_to_action"
    t.integer "graph_setting_id"
    t.string "sub_type"
    t.text "autoresponse_message"
    t.string "donor_landing_url"
    t.string "splash_image_file_name"
    t.string "splash_image_content_type"
    t.integer "splash_image_file_size"
    t.datetime "splash_image_updated_at"
    t.boolean "send_day2_reminders"
    t.boolean "send_day5_reminders"
    t.boolean "send_day9_reminders"
    t.string "locale", default: "en"
    t.text "custom_thank_you_message"
    t.boolean "peer_fundraiser_subtype"
    t.integer "custom_thermometer_id"
    t.string "alternate_id"
    t.integer "metrics_goal_id"
    t.boolean "notify_npo", default: false
    t.string "sms_reply_type"
    t.integer "sms_reply_id"
    t.integer "alternate_type"
    t.date "keyword_scheduled_end_date"
    t.index ["alternate_id"], name: "index_campaigns_keywords_on_alternate_id"
    t.index ["campaign_id"], name: "index_campaigns_keywords_on_campaign_id"
    t.index ["constituent_list_id"], name: "index_campaigns_keywords_on_constituent_list_id"
    t.index ["graph_setting_id"], name: "index_campaigns_keywords_on_graph_setting_id"
    t.index ["id", "campaign_id", "alternate_id"], name: "ck_id_and_campaign_id"
    t.index ["id", "campaign_id"], name: "ck_id_and_campaign_id2"
    t.index ["keyword_id"], name: "index_campaigns_keywords_on_keyword_id"
    t.index ["keyword_scheduled_date", "keyword_id"], name: "uq_keyword_scheduled_date", unique: true
    t.index ["keyword_scheduled_date"], name: "index_campaigns_keywords_on_keyword_scheduled_date"
    t.index ["keyword_scheduled_end_date"], name: "index_campaigns_keywords_on_keyword_scheduled_end_date"
    t.index ["sub_type"], name: "index_campaigns_keywords_on_sub_type"
  end

  create_table "channel_partners", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "organization_email"
    t.string "braintree_vault_token"
  end

  create_table "communication_messages", charset: "utf8", force: :cascade do |t|
    t.string "from_type"
    t.bigint "from_id"
    t.string "to_type"
    t.bigint "to_id"
    t.string "subject"
    t.text "message"
    t.string "status"
    t.string "originable_type"
    t.bigint "originable_id"
    t.text "change_log"
    t.bigint "email_message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "flag"
    t.index ["email_message_id"], name: "index_communication_messages_on_email_message_id"
    t.index ["from_type", "from_id"], name: "index_communication_messages_on_from_type_and_from_id"
    t.index ["originable_type", "originable_id"], name: "index_communication_messages_on_originable"
    t.index ["status"], name: "index_communication_messages_on_status"
    t.index ["to_type", "to_id"], name: "index_communication_messages_on_to_type_and_to_id"
  end

  create_table "communication_settings", id: :integer, charset: "utf8", force: :cascade do |t|
    t.boolean "email_channel"
    t.boolean "sms_channel"
    t.string "owner_type"
    t.integer "owner_id"
    t.string "originable_type"
    t.integer "originable_id"
    t.string "targetable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notification_type", limit: 25
    t.index ["notification_type"], name: "idx_communication_settings_on_notification_type"
    t.index ["originable_id", "originable_type"], name: "idx_communication_settings_on_originable"
    t.index ["owner_id", "owner_type"], name: "idx_communication_settings_on_owner"
    t.index ["targetable"], name: "idx_communication_settings_on_targetable"
  end

  create_table "component_images", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "shared_image_id"
    t.string "component_name"
    t.integer "component_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id", "component_name"], name: "index_component_images_on_component_id_component_name"
  end

  create_table "constituent_list_activities", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "constituent_id"
    t.integer "constituent_list_id"
    t.integer "mobile_originated_id"
    t.integer "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "campaigns_keyword_id"
    t.index ["campaigns_keyword_id"], name: "index_constituent_list_activities_on_campaigns_keyword_id"
    t.index ["constituent_list_id"], name: "idx_npos_constituent_list_activities_constituent_list_id"
  end

  create_table "constituent_list_audits", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "constituent_list_id"
    t.integer "npos_constituent_id"
    t.string "input_phone_number"
    t.string "status"
    t.text "error_msg"
    t.string "source"
    t.string "source_type"
    t.text "raw_data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["constituent_list_id", "input_phone_number"], name: "idx_constituent_list_audits_on_constituent_list_id_phone_number"
    t.index ["input_phone_number"], name: "index_constituent_list_audits_on_input_phone_number"
    t.index ["npos_constituent_id"], name: "index_constituent_list_audits_on_npos_constituent_id"
  end

  create_table "constituent_lists", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.integer "npo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.integer "list_type", limit: 1, default: 0
    t.index ["list_type"], name: "idx_constituent_lists_list_type"
    t.index ["name"], name: "idx_constituent_lists_name"
  end

  create_table "constituent_lists_messages", id: false, charset: "utf8", force: :cascade do |t|
    t.integer "constituent_list_id"
    t.integer "message_id"
    t.index ["constituent_list_id", "message_id"], name: "uq_constituent_list_message", unique: true
    t.index ["message_id"], name: "index_constituent_lists_messages_on_message_id"
  end

  create_table "constituent_lists_npos_constituent_contacts", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "constituent_list_id"
    t.integer "npos_constituent_contact_id"
    t.integer "subscription_status"
    t.integer "source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["constituent_list_id", "npos_constituent_contact_id"], name: "uq_constituent_list_npos_constituent_contact", unique: true
    t.index ["constituent_list_id"], name: "idx_clncc_constituent_list_id"
    t.index ["npos_constituent_contact_id"], name: "idx_constituent_lists_npos_constituent_contact_id"
  end

  create_table "constituent_lists_npos_constituents", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "constituent_list_id"
    t.integer "npos_constituent_id"
    t.integer "source"
    t.index ["constituent_list_id", "npos_constituent_id"], name: "uq_constituent_list_constituent", unique: true
    t.index ["npos_constituent_id"], name: "idx_npos_constituent_id"
  end

  create_table "constituents", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "carrier"
    t.string "password_digest"
    t.string "braintree_vault_token"
    t.datetime "last_verified_at"
    t.string "status"
    t.index ["phone"], name: "uq_phone", unique: true
    t.index ["status"], name: "idx_constituents_status"
  end

  create_table "conversation_participant_messages", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "conversation_participant_id"
    t.integer "originable_id"
    t.string "originable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversation_participants", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "conversation_id"
    t.integer "originable_id"
    t.string "originable_type"
    t.datetime "last_contact_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "npos_constituent_id"
  end

  create_table "conversations", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id"
    t.integer "shortcode_id"
    t.string "name"
    t.string "status"
    t.datetime "last_send_dt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npo_id", "shortcode_id", "name"], name: "uq_conversations", unique: true
  end

  create_table "custom_thermometers", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.text "code", size: :medium
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_custom_thermometers_uq", unique: true
  end

  create_table "discount_codes", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "code", null: false
    t.integer "account_id", null: false
    t.string "type", null: false
    t.integer "usage_limit"
    t.integer "usage_count"
    t.datetime "start_dt"
    t.datetime "end_dt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount", precision: 6, scale: 2, null: false
    t.index ["code", "account_id"], name: "uq_discount_codes", unique: true
  end

  create_table "donation_events", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "donation_id"
    t.integer "donation_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["donation_id"], name: "index_donation_events_on_donation_id"
  end

  create_table "donation_form_setting_custom_fields", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "label"
    t.integer "npos_custom_form_field_template_id"
    t.integer "donation_form_setting_custom_form_layout_id"
    t.boolean "display"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "standard_field"
    t.boolean "required"
    t.string "position"
    t.integer "donation_form_setting_form_section_id"
    t.boolean "numeric", default: false
    t.string "validations"
    t.index ["donation_form_setting_custom_form_layout_id"], name: "idx_donation_form_setting_custom_fields_layout_id"
    t.index ["donation_form_setting_form_section_id"], name: "idx_custom_fields_donation_form_setting_form_section_id"
    t.index ["npos_custom_form_field_template_id"], name: "index_donation_form_setting_cust_field_on_form_field_template_id"
  end

  create_table "donation_form_setting_custom_form_layouts", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "originable_id"
    t.string "originable_type"
    t.index ["name", "originable_id", "originable_type"], name: "idx_page_theme_layouts"
  end

  create_table "donation_form_setting_form_sections", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "section_name"
    t.string "display_name"
    t.string "position"
    t.string "base_section"
    t.integer "parent_id"
    t.integer "donation_form_setting_custom_form_layout_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "display", default: true
    t.string "section_type", limit: 25
    t.index ["donation_form_setting_custom_form_layout_id"], name: "idx_donation_form_setting_form_sections_layout_id"
  end

  create_table "donation_form_settings", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "originable_id"
    t.string "originable_type"
    t.boolean "display_logo"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean "display_bg"
    t.string "bg_file_name"
    t.string "bg_content_type"
    t.integer "bg_file_size"
    t.datetime "bg_updated_at"
    t.string "bg_orientation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "campaigns_keyword_id"
    t.string "tmp_logo_file_name"
    t.string "tmp_logo_content_type"
    t.integer "tmp_logo_file_size"
    t.datetime "tmp_logo_updated_at"
    t.string "tmp_bg_file_name"
    t.string "tmp_bg_content_type"
    t.integer "tmp_bg_file_size"
    t.datetime "tmp_bg_updated_at"
    t.text "tmp_attrs"
    t.string "color_bg"
    t.string "color_button"
    t.boolean "no_suggestion"
    t.decimal "suggested_amount_1", precision: 9, scale: 2
    t.decimal "suggested_amount_2", precision: 9, scale: 2
    t.decimal "suggested_amount_3", precision: 9, scale: 2
    t.integer "donation_form_setting_custom_form_layout_id"
    t.boolean "show_custom_message"
    t.text "custom_message"
    t.boolean "display_frequency", default: true
    t.string "donation_button_text"
    t.boolean "confirmation_page", default: false
    t.boolean "charge_later", default: false
    t.string "form_type", default: "donation"
    t.boolean "display_fundraiser_registration_option", default: false
    t.string "form_name", limit: 50
    t.string "sub_type", limit: 25
    t.boolean "is_default"
    t.string "secure_token", limit: 16
    t.boolean "require_captcha"
    t.boolean "event_form", default: false
    t.boolean "archived", default: false
    t.text "form_attrs", size: :medium
    t.index ["campaigns_keyword_id"], name: "index_donation_form_settings_on_campaigns_keyword_id"
    t.index ["donation_form_setting_custom_form_layout_id"], name: "idx_donation_form_settings_custom_form_layout_id"
    t.index ["form_type"], name: "index_donation_form_settings_on_form_type"
    t.index ["originable_id", "originable_type", "form_name", "form_type"], name: "uq_forms_originable", unique: true
    t.index ["originable_id", "originable_type"], name: "form_originable"
    t.index ["secure_token"], name: "uq_form_secure_token", unique: true
  end

  create_table "donation_location_caches", charset: "utf8", force: :cascade do |t|
    t.string "originable_type"
    t.bigint "originable_id"
    t.boolean "valid_cache", default: false, null: false
    t.datetime "invalidated_at"
    t.datetime "last_update_at"
    t.text "locations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["originable_id", "originable_type"], name: "uq_donation_location_on_originable", unique: true
    t.index ["originable_type", "originable_id"], name: "index_donation_location_on_originable"
  end

  create_table "donation_locations", charset: "utf8", force: :cascade do |t|
    t.integer "donation_id"
    t.string "latitude"
    t.string "longitude"
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donation_id"], name: "index_donation_locations_on_donation_id"
  end

  create_table "donation_notes", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "donation_id"
    t.integer "user_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donation_id"], name: "index_donation_notes_on_donation_id"
  end

  create_table "donations", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "mobile_originated_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount", precision: 10, scale: 2
    t.string "last_4"
    t.integer "campaigns_keyword_id"
    t.string "braintree_vault_token"
    t.integer "npos_constituent_id"
    t.string "status", limit: 30, default: ""
    t.integer "recurring_donation_id"
    t.integer "peer_fundraiser_id"
    t.boolean "anonymous", default: false
    t.integer "credit_card_expiration_month"
    t.integer "credit_card_expiration_year"
    t.string "credit_card_type"
    t.string "ip_address"
    t.text "referrer"
    t.string "post_action"
    t.integer "donation_form_setting_id"
    t.integer "peer_fundraiser_team_id"
    t.integer "npos_constituent_registration_id"
    t.decimal "processing_fee", precision: 8, scale: 2
    t.decimal "fee_rate", precision: 8, scale: 2
    t.decimal "pledged_amount", precision: 10, scale: 2
    t.index ["braintree_vault_token"], name: "index_donations_on_braintree_vault_token"
    t.index ["campaigns_keyword_id", "status"], name: "index_donations_on_campaigns_keyword_id_status"
    t.index ["campaigns_keyword_id"], name: "campaigns_keyword_id_idx"
    t.index ["mobile_originated_id"], name: "index_donations_on_mobile_originated_id"
    t.index ["npos_constituent_id"], name: "index_donations_on_npos_constituent_id"
    t.index ["npos_constituent_registration_id"], name: "index_donations_on_npos_constituent_registration_id"
    t.index ["peer_fundraiser_id"], name: "index_donations_on_peer_fundraiser_id"
    t.index ["recurring_donation_id"], name: "index_donations_on_recurring_donation_id"
  end

  create_table "donor_profile_scores", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npos_constituent_id"
    t.string "score_type", limit: 30, null: false
    t.string "score_value"
    t.text "score_description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "data_link"
  end

  create_table "download_requests", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id"
    t.integer "user_id"
    t.string "status"
    t.text "columns"
    t.text "params"
    t.string "request_type"
    t.datetime "processing_started_at"
    t.datetime "processing_finished_at"
    t.string "download_file_file_name"
    t.string "download_file_content_type"
    t.integer "download_file_file_size"
    t.string "download_file_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "machine_name"
    t.text "error_message"
    t.string "report_name"
    t.integer "parent_id"
    t.index ["npo_id"], name: "index_download_requests_on_npo_id"
    t.index ["parent_id"], name: "index_download_requests_on_parent_id"
    t.index ["request_type"], name: "index_download_requests_on_request_type"
    t.index ["status"], name: "index_download_requests_on_status"
    t.index ["user_id"], name: "index_download_requests_on_user_id"
  end

  create_table "email_broadcasts", id: :integer, charset: "utf8", force: :cascade do |t|
    t.text "email_body"
    t.string "from_email"
    t.string "subject"
    t.string "reply_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "preheader"
    t.boolean "is_custom"
    t.string "template_id"
    t.text "custom_html"
    t.text "email_content"
  end

  create_table "email_constituent_social_profiles", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "email"
    t.string "network_type"
    t.string "network_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "raw_data"
  end

  create_table "email_constituents", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "email"
    t.string "status", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_email_constituents_on_email"
    t.index ["email"], name: "uq_email_constituents", unique: true
  end

  create_table "email_messages", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "client_message_id"
    t.string "to_email"
    t.string "from_email"
    t.string "cc_email"
    t.string "subject"
    t.string "body"
    t.string "status"
    t.string "npo_id"
    t.string "smtp_server"
    t.string "service_name"
    t.string "message_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "message_id"
    t.integer "npos_constituent_id"
    t.integer "sends"
    t.integer "opens"
    t.integer "clicks"
    t.integer "forwards"
    t.integer "bounces"
    t.integer "unsubscribes"
    t.index ["message_id"], name: "index_email_messages_on_message_id"
    t.index ["npo_id"], name: "idx_email_messages_on_npo_id"
    t.index ["npos_constituent_id"], name: "index_email_messages_on_npos_constituent_id"
    t.index ["to_email"], name: "idx_email_messages_on_to_email"
  end

  create_table "email_templates", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "email_from"
    t.string "email_subject"
    t.text "email_body"
    t.integer "template_id"
    t.string "template_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "external_record_values", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.text "value"
    t.integer "external_record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_record_id"], name: "index_external_record_values_on_external_record_id"
    t.index ["name"], name: "index_external_record_values_on_name"
  end

  create_table "external_records", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "originable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "originable_type", limit: 30
    t.integer "recordable_id"
    t.string "recordable_type"
    t.index ["originable_type", "originable_id"], name: "index_external_records_on_originable"
    t.index ["recordable_id"], name: "index_external_records_on_recordable_id"
    t.index ["recordable_type"], name: "index_external_records_on_recordable_type"
  end

  create_table "features", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npo_id", "name"], name: "index_npo_features", unique: true
  end

  create_table "form_conditions", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "donation_form_setting_custom_field_id"
    t.string "form_item_target_type", null: false
    t.integer "form_item_target_id", null: false
    t.integer "donation_form_setting_id", null: false
    t.string "operator"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donation_form_setting_custom_field_id"], name: "index_form_conditions_on_donation_form_setting_custom_field_id"
    t.index ["form_item_target_id", "form_item_target_type"], name: "form_condition_targets"
  end

  create_table "form_discount_codes", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "donation_form_setting_id", null: false
    t.integer "discount_code_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donation_form_setting_id", "discount_code_id"], name: "uq_form_discount_codes", unique: true
  end

  create_table "form_stats", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "donation_form_setting_id"
    t.integer "visits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "free_registrations", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "organization_name"
    t.string "user_email"
    t.string "status"
    t.string "registration_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "primary_contact_name"
    t.string "mobile_number"
    t.string "ein"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "encrypted_password"
    t.integer "user_id"
    t.integer "account_id"
    t.boolean "agreed_to_terms"
    t.string "web_url"
    t.string "sector"
    t.index ["registration_token"], name: "uq_registration_token", unique: true
  end

  create_table "freemiums", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "graph_settings", id: :integer, charset: "utf8", force: :cascade do |t|
    t.boolean "display_cta"
    t.string "cta_text"
    t.string "cta_text_color"
    t.string "cta_text_size"
    t.string "cta_bg_color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "display_background"
    t.string "background_color"
    t.string "bg_file_name"
    t.string "bg_content_type"
    t.integer "bg_file_size"
    t.datetime "bg_updated_at"
    t.boolean "display_logo"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean "display_fundraising_goal"
    t.boolean "display_fundraising_total"
    t.boolean "display_fundraising_remaining"
    t.string "fundraising_title_color"
    t.string "fundraising_title_size"
    t.string "fundraising_amount_color"
    t.string "fundraising_amount_size"
    t.boolean "display_thermometer"
    t.string "thermometer_color"
    t.boolean "display_pledge_amount"
    t.boolean "display_message_body"
    t.string "pledge_amount_color"
    t.string "pledge_amount_size"
    t.string "message_body_color"
    t.string "message_body_size"
    t.boolean "display_fundraising_pledge_count"
    t.boolean "display_pledge_amount_with_decimal", default: false
    t.boolean "display_totals_with_decimal", default: false
    t.string "background_image_path"
    t.integer "display_which_background_id"
    t.integer "bg_orientation"
    t.boolean "use_collected_amount", default: false
    t.datetime "thermometer_reset_date"
    t.datetime "goal_end_dt"
    t.text "welcome_screen"
    t.text "how_to_screen"
    t.text "complete_screen"
    t.text "milestones"
    t.text "recognitions"
    t.boolean "display_countdown_clock"
    t.string "current_page", default: "fundraising-wall"
    t.string "scroll_direction", default: "right_to_left"
    t.boolean "use_polling", default: false
  end

  create_table "identities", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "provider"
    t.string "uid"
    t.text "access_token"
    t.integer "originable_id"
    t.string "originable_type"
    t.integer "account_id"
    t.string "email"
    t.string "notes"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "job_details", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "job_id", null: false
    t.integer "seq_num"
    t.string "detail_type"
    t.text "detail_value"
    t.integer "originable_id"
    t.string "originable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_details_on_job_id"
  end

  create_table "job_stats", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "job_id", null: false
    t.integer "stat_value"
    t.string "stat_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_job_stats_on_job_id"
  end

  create_table "jobs", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "job_type", limit: 30
    t.string "job_class"
    t.string "status"
    t.integer "total_count"
    t.integer "succeeded_count"
    t.integer "failed_count"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.datetime "scheduled_at"
    t.string "process_hostname"
    t.string "process_thread_id"
    t.index ["account_id"], name: "index_jobs_on_account_id"
    t.index ["job_class"], name: "index_jobs_on_job_class"
    t.index ["job_type"], name: "index_jobs_on_job_type"
  end

  create_table "keyword_requests", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id"
    t.integer "account_id"
    t.integer "user_id"
    t.string "request_type"
    t.string "status"
    t.string "keyword_id"
    t.string "new_campaign_name"
    t.integer "reset_date"
    t.string "error_message"
    t.datetime "processing_started_at"
    t.datetime "processing_finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "shortcode_id"
    t.string "keyword_string"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "npo_id"
    t.integer "sms_donation_fallback_amount"
    t.integer "keyword_status_id", default: 0
    t.string "cancelled_reason"
    t.boolean "suspend", default: false
    t.index ["npo_id"], name: "idx_keywords_npo_id"
    t.index ["shortcode_id", "keyword_string"], name: "idx_keywords_on_shortcode_id_keyword_string"
  end

  create_table "list_syncs", id: :integer, charset: "utf8", force: :cascade do |t|
    t.text "lists_to_sync"
    t.integer "account_email_processor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_email_processor_id"], name: "index_list_syncs_on_account_email_processor_id"
  end

  create_table "list_upload_requests", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "constituent_list_id"
    t.datetime "upload_finished_at"
    t.datetime "processing_started_at"
    t.datetime "processing_finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "processed_count", default: 0
    t.integer "total_records"
    t.string "upload_file_name"
    t.string "upload_content_type"
    t.integer "upload_file_size"
    t.datetime "upload_updated_at"
    t.string "upload_source"
    t.string "status"
    t.text "upload_text"
    t.boolean "include_first_row"
    t.text "error_message"
    t.integer "lock_version"
    t.integer "user_id"
    t.text "upload_columns", size: :medium
    t.string "post_processing_action"
    t.integer "parent_id"
    t.boolean "has_children", default: false
    t.integer "file_number", default: 0
    t.string "machine_name"
    t.integer "originable_id"
    t.string "originable_type"
    t.string "request_type", limit: 25
  end

  create_table "message_events", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "event_type"
    t.string "event_status"
    t.string "event_value"
    t.integer "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_type"], name: "index_message_events_on_event_type"
    t.index ["event_value"], name: "index_message_events_on_event_value"
    t.index ["message_id"], name: "index_message_events_on_message_id"
  end

  create_table "message_stat_details", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.integer "message_stat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_stat_id"], name: "index_message_stat_details_on_message_stat_id"
    t.index ["name"], name: "index_message_stat_details_on_name"
  end

  create_table "message_stats", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "message_id", null: false
    t.integer "succeeded_count"
    t.integer "failed_count"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "lock_version"
    t.integer "welcome_count"
    t.integer "constituent_count"
    t.integer "invalid_mobile_count"
    t.integer "unsubscribed_count"
    t.integer "eligible_count"
    t.index ["message_id"], name: "index_message_stats_on_message_id"
  end

  create_table "message_templates", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "title"
    t.string "sms_text"
    t.integer "message_order"
    t.integer "campaign_template_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", id: :integer, charset: "utf8", force: :cascade do |t|
    t.text "old_sms_text"
    t.text "twitter_text"
    t.text "facebook_text"
    t.string "title"
    t.datetime "send_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "send_now", default: false
    t.integer "batch_id"
    t.integer "campaign_id"
    t.integer "old_shortcode_id"
    t.string "message_type"
    t.string "old_locale", default: "en"
    t.string "status", limit: 15
    t.string "external_id"
    t.integer "external_type"
    t.string "old_from_email"
    t.string "old_subject"
    t.string "old_reply_to"
    t.integer "messageable_id"
    t.string "messageable_type"
    t.integer "parent_id"
    t.text "error_message"
    t.integer "conversation_id"
    t.index ["batch_id"], name: "index_messages_on_batch_id"
    t.index ["campaign_id"], name: "idx_msg_campaign_id"
  end

  create_table "mobile_lookups", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "client_message_id"
    t.string "aggregator_message_id"
    t.text "content"
    t.string "phone"
    t.string "state"
    t.text "response_error"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aggregator_message_id"], name: "index_mobile_lookups_on_aggregator_message_id"
  end

  create_table "mobile_originated_details", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "mobile_originated_id", null: false
    t.integer "campaigns_keyword_id"
    t.string "message_body"
    t.integer "mobile_originated_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mobile_originated_id"], name: "idx_mobile_originated_id"
  end

  create_table "mobile_originateds", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "aggregator_message_id"
    t.string "source"
    t.string "destination"
    t.string "carrier"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "origin_type"
    t.index ["destination"], name: "index_mobile_originateds_on_destination"
    t.index ["origin_type"], name: "index_mobile_originateds_on_origin_type"
    t.index ["source"], name: "index_mobile_originateds_on_source"
  end

  create_table "mobile_terminated_responses", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "mobile_terminated_id", null: false
    t.string "delivery_status"
    t.string "response_error_code"
    t.text "response_error_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mobile_terminateds", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "client_message_id"
    t.string "shortcode"
    t.string "phone_number"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "carrier"
    t.string "product_code"
    t.string "aggregator_message_id"
    t.string "state", limit: 50
    t.text "response_error"
    t.string "mt_type"
    t.integer "originable_id"
    t.string "originable_type"
    t.index ["originable_id"], name: "index_mobile_terminateds_on_originable_id"
    t.index ["originable_type", "originable_id"], name: "index_mobile_terminateds_on_originable_type_and_id"
    t.index ["originable_type"], name: "index_mobile_terminateds_on_originable_type"
    t.index ["phone_number"], name: "index_mobile_terminateds_on_phone_number"
  end

  create_table "npo_contracts", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id"
    t.integer "plan_type_id"
    t.string "account_manager"
    t.string "name"
    t.string "friendly_name"
    t.decimal "price", precision: 10, scale: 2
    t.string "frequency"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_executive"
    t.integer "message_count"
    t.float "processing_fee"
    t.datetime "renewal_dt"
    t.index ["npo_id"], name: "index_npo_contracts_on_npo_id"
  end

  create_table "npo_events", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id"
    t.integer "npo_event_status_id"
    t.text "description"
    t.integer "user_id"
    t.integer "originable_id"
    t.string "originable_type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "npo_groups", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "npo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "npo_id"], name: "uq_npo_assigned", unique: true
    t.index ["account_id"], name: "index_npo_groups_on_account_id"
    t.index ["npo_id"], name: "index_npo_groups_on_npo_id"
  end

  create_table "npo_payment_processor_options", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_payment_processor_id"
    t.string "option_name"
    t.text "option_value", size: :medium
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npo_payment_processor_id"], name: "index_npo_payment_processor_options_on_npp_id"
  end

  create_table "npo_payment_processors", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id"
    t.integer "payment_processor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "is_default", default: false
    t.string "status", limit: 15
    t.datetime "activated_at"
    t.index ["npo_id"], name: "idx_npo_payment_processors_npo_id"
  end

  create_table "npo_subscription_activities", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npos_constituent_id"
    t.integer "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "source"
    t.integer "npos_constituent_contact_id"
    t.index ["npos_constituent_contact_id"], name: "index_npo_subscription_activities_on_npos_constituent_contact_id"
    t.index ["npos_constituent_id"], name: "index_npo_subscription_activities_on_npos_constituent_id"
  end

  create_table "npos", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "twitter_token"
    t.string "twitter_secret"
    t.string "twitter_nickname"
    t.string "facebook_access_token"
    t.datetime "facebook_access_token_expires_at"
    t.string "facebook_page_token"
    t.string "facebook_page_id"
    t.string "short_name", limit: 30
    t.string "ein"
    t.string "email"
    t.string "web_url"
    t.string "plan_type"
    t.string "billing_frequency"
    t.string "pay_via"
    t.string "braintree_vault_token"
    t.boolean "legacy_account", default: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.decimal "plan_amount", precision: 8, scale: 2
    t.string "terms_url"
    t.string "whitelabel_domain"
    t.string "google_analytics_key"
    t.decimal "annual_recurring_revenue", precision: 13, scale: 2
    t.boolean "demo"
    t.string "metrics_site_id"
    t.string "support_phone"
  end

  create_table "npos_constituent_contact_cards", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npos_constituent_id", null: false
    t.integer "phone_contact_id"
    t.integer "email_contact_id"
    t.integer "person_contact_id"
    t.integer "address_contact_id"
    t.integer "score", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npos_constituent_id", "phone_contact_id", "email_contact_id", "person_contact_id", "address_contact_id"], name: "uq_npos_constituent_contact_cards", unique: true
    t.index ["npos_constituent_id"], name: "index_npos_constituent_contact_cards_on_npos_constituent_id"
  end

  create_table "npos_constituent_contacts", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npos_constituent_id"
    t.string "contactable_type"
    t.integer "contactable_id"
    t.integer "precedence", default: 0
    t.integer "subscription_status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contactable_id", "contactable_type"], name: "idx_npos_constituent_contact_contactables"
    t.index ["npos_constituent_id"], name: "index_npos_constituent_contacts_on_npos_constituent_id"
  end

  create_table "npos_constituent_npos_custom_fields", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npos_constituent_id", null: false
    t.integer "npos_custom_field_id", null: false
    t.string "custom_field_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npos_constituent_id"], name: "idx_npos_constituent_npos_custom_field"
    t.index ["npos_custom_field_id"], name: "idx_npos_constituent_npos_custom_fields_npos_custom_field_id"
  end

  create_table "npos_constituent_registrations", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npos_constituent_id"
    t.integer "campaigns_keyword_id"
    t.string "registration_type", limit: 16
    t.integer "registration_id"
    t.string "registration_passcode"
    t.string "customer_profile_id"
    t.string "payment_token"
    t.integer "payment_token_expiration_month"
    t.integer "payment_token_expiration_year"
    t.string "last_4", limit: 4
    t.string "session_token"
    t.datetime "session_token_expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "attempts"
    t.integer "user_id"
    t.index ["campaigns_keyword_id"], name: "index_npos_constituent_registrations_on_campaigns_keyword_id"
    t.index ["npos_constituent_id"], name: "index_npos_constituent_registrations_on_npos_constituent_id"
    t.index ["session_token"], name: "uq_npos_constituent_registration_session_token", unique: true
    t.index ["user_id"], name: "index_npos_constituent_registrations_on_user_id"
  end

  create_table "npos_constituents", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id"
    t.integer "constituent_id"
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
    t.string "gender"
    t.integer "age"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "subscription_status"
    t.string "email"
    t.integer "address_location_id"
    t.string "address_status"
    t.string "source", limit: 25
    t.index ["constituent_id"], name: "index_npos_constituents_on_constituent_id"
    t.index ["npo_id", "constituent_id"], name: "uq_npo_constituent", unique: true
    t.index ["npo_id"], name: "index_npos_constituents_on_npo_id"
    t.index ["source"], name: "index_npos_constituents_on_source"
    t.index ["updated_at"], name: "index_npos_constituents_on_updated_at"
  end

  create_table "npos_custom_fields", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id", null: false
    t.string "name", null: false
    t.string "data_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "npo_id"], name: "uq_npos_custom_field", unique: true
    t.index ["npo_id"], name: "idx_npos_custom_fields_npo_id"
  end

  create_table "npos_custom_fields_overrides", id: :integer, charset: "utf8", force: :cascade do |t|
    t.text "override_value"
    t.integer "originable_id"
    t.string "originable_type"
    t.integer "npos_custom_field_id", null: false
    t.integer "precedence", default: 99
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "npos_custom_form_field_limits", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npos_custom_field_id"
    t.integer "originable_id"
    t.string "originable_type"
    t.integer "max_allowed"
    t.text "limit_label"
    t.decimal "running_total", precision: 10, default: "0", null: false
    t.text "redirect_url"
    t.integer "precedence", default: 99
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "sold_out_message"
  end

  create_table "npos_custom_form_field_payment_maps", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npos_custom_form_field_template_id"
    t.string "processor_name"
    t.string "mapped_field_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "npo_payment_processor_id"
    t.index ["npo_payment_processor_id"], name: "index_npos_custom_form_field_payment_maps_on_npp_id"
    t.index ["npos_custom_form_field_template_id"], name: "index_payment_maps_on_npos_custom_form_field_template_id"
  end

  create_table "npos_custom_form_field_template_images", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npos_custom_form_field_template_id"
    t.string "custom_image_file_name"
    t.string "custom_image_content_type"
    t.integer "custom_image_file_size"
    t.datetime "custom_image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["npos_custom_form_field_template_id"], name: "idx_npos_custom_form_field_template_images_template_id"
  end

  create_table "npos_custom_form_field_template_values", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npos_custom_form_field_template_id"
    t.string "display_name"
    t.text "display_value"
    t.integer "position"
    t.boolean "is_default"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "value_type"
    t.index ["npos_custom_form_field_template_id"], name: "idx_npos_custom_form_field_template_values_template_id"
  end

  create_table "npos_custom_form_field_templates", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.integer "npo_id"
    t.integer "npos_custom_field_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "control_type"
    t.integer "reference_id"
    t.integer "account_id"
    t.index ["account_id"], name: "index_npos_custom_form_field_templates_on_account_id"
    t.index ["npo_id"], name: "idx_npos_custom_form_field_templates_npo_id"
    t.index ["npos_custom_field_id"], name: "index_npos_custom_form_field_templates_on_npos_custom_field_id"
    t.index ["reference_id"], name: "index_npos_custom_form_field_templates_on_reference_id"
  end

  create_table "npos_keyword_stats", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "campaigns_keyword_id"
    t.integer "npo_id", null: false
    t.boolean "valid_cache"
    t.datetime "cache_update_dt"
    t.datetime "last_donation_dt"
    t.integer "donor_count", default: 0, null: false
    t.decimal "pledged_amount", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "pending_amount", precision: 12, scale: 2, default: "0.0", null: false
    t.decimal "collected_amount", precision: 12, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "invalidated_at"
    t.decimal "offline_amount", precision: 12, scale: 2
    t.integer "collected_donation_count", default: 0
    t.integer "pending_donation_count", default: 0
    t.integer "offline_donation_count", default: 0
    t.integer "refunded_donation_count", default: 0
    t.index ["campaigns_keyword_id"], name: "idx_npos_keyword_stats_campaigns_keyword_id"
    t.index ["campaigns_keyword_id"], name: "uq_npos_keyword_stats", unique: true
    t.index ["npo_id"], name: "idx_npos_keyword_stats_npo_id"
  end

  create_table "online_gifts", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "campaigns_keyword_id"
    t.integer "npo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "embed_button_color"
    t.string "embed_button_text"
    t.integer "embed_button_shape"
    t.index ["campaigns_keyword_id"], name: "idx_online_gifts_campaigns_keyword_id"
    t.index ["npo_id"], name: "index_online_gifts_on_npo_id", unique: true
  end

  create_table "orders", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id", null: false
    t.integer "external_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.decimal "total_amount", precision: 10, scale: 2
    t.string "description"
    t.datetime "paid_at"
    t.string "plan_name"
    t.string "type"
    t.text "bt_params"
    t.decimal "amount_paid_with_balance", precision: 10, scale: 2
    t.decimal "amount_paid_with_cc", precision: 10, scale: 2
    t.text "notes"
    t.integer "admin_user_id"
    t.string "vault_id"
    t.string "transaction_id"
    t.string "braintree_status"
    t.string "braintree_status_details"
  end

  create_table "page_conversions", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "page_visit_id", null: false
    t.integer "page_link_id"
    t.integer "page_share_id"
    t.string "conversion_type", null: false
    t.integer "conversion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversion_id", "conversion_type"], name: "uq_page_conversions", unique: true
    t.index ["page_link_id"], name: "index_page_conversions_on_page_link_id"
    t.index ["page_visit_id"], name: "index_page_conversions_on_page_visit_id"
  end

  create_table "page_links", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "originator_type", null: false
    t.integer "originator_id", null: false
    t.string "destination_type", null: false
    t.integer "destination_id", null: false
    t.string "visitor_type"
    t.integer "visitor_id"
    t.integer "user_id"
    t.string "share_path", null: false
    t.integer "share_count", default: 0, null: false
    t.string "hashcode"
    t.integer "referring_page_link_id"
    t.integer "referring_page_share_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["originator_id", "originator_type"], name: "index_page_links_on_originator_id_and_originator_type"
  end

  create_table "page_shares", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "page_link_id", null: false
    t.string "utm_source", null: false
    t.string "utm_medium", null: false
    t.string "utm_campaign"
    t.integer "share_count", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["page_link_id", "utm_source", "utm_medium"], name: "uq_page_shares", unique: true
  end

  create_table "page_visits", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "destination_type", null: false
    t.integer "destination_id", null: false
    t.string "visitor_type"
    t.integer "visitor_id"
    t.integer "user_id"
    t.string "utm_source", null: false
    t.string "utm_medium", null: false
    t.string "utm_campaign"
    t.string "utm_term"
    t.string "utm_content"
    t.text "current_path"
    t.text "referrer"
    t.text "user_agent"
    t.integer "page_link_id"
    t.integer "page_share_id"
    t.integer "duplicate_visits", default: -1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "indirect", default: false
    t.index ["destination_id", "destination_type"], name: "index_page_visits_on_destination_id_and_destination_type"
    t.index ["page_link_id", "user_id"], name: "index_page_visits_on_page_link_id_and_user_id"
    t.index ["page_link_id", "visitor_id", "visitor_type"], name: "page_visit_visitors"
    t.index ["page_link_id"], name: "index_page_visits_on_page_link_id"
  end

  create_table "pages", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "donation_form_setting_custom_form_layout_id"
    t.integer "account_id"
    t.string "type", limit: 30, null: false
    t.integer "originable_id", null: false
    t.string "originable_type", limit: 30, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "css_path"
    t.text "form_attrs", size: :medium
  end

  create_table "payment_processor_options", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "option_name"
    t.string "option_type"
    t.integer "payment_processor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "option_values"
  end

  create_table "payment_processors", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "processor_name"
    t.string "processor_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.string "processor_url"
    t.boolean "needs_confirmation_step"
  end

  create_table "peer_fundraiser_donations", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "peer_fundraiser_id"
    t.integer "donation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["peer_fundraiser_id"], name: "idx_peer_fundraiser_donations_peer_fundraiser_id"
  end

  create_table "peer_fundraiser_keyword_sequence_numbers", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "campaigns_keyword_id"
    t.integer "next_sequence_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaigns_keyword_id"], name: "index_peer_fundraiser_keyword_sequence_numbers", unique: true
  end

  create_table "peer_fundraiser_registrations", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "user_email"
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_number"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "campaigns_keyword_id"
    t.string "registration_token"
    t.integer "parent_id"
    t.string "communication_channel"
    t.string "peer_fundraiser_team_name"
    t.integer "peer_fundraiser_team_id"
    t.integer "category_id"
    t.integer "team_status", limit: 1, default: 0
    t.date "custom_date"
    t.string "gender"
    t.boolean "agree_to_terms"
    t.integer "donation_id"
    t.integer "verification_attempts", default: 0
    t.index ["registration_token"], name: "uq_peer_fundraiser_registration_token", unique: true
  end

  create_table "peer_fundraiser_settings", id: :integer, charset: "utf8", force: :cascade do |t|
    t.text "call_to_action"
    t.integer "campaigns_keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "inspirational_img_file_name"
    t.string "inspirational_img_content_type"
    t.integer "inspirational_img_file_size"
    t.datetime "inspirational_img_updated_at"
    t.string "tmp_inspirational_img_file_name"
    t.string "tmp_inspirational_img_content_type"
    t.integer "tmp_inspirational_img_file_size"
    t.datetime "tmp_inspirational_img_updated_at"
    t.text "tmp_attrs"
    t.text "seed_page_call_to_action"
    t.string "accent_color"
    t.string "organization_goal"
    t.text "organization_summary"
    t.string "seed_page_profile_img_file_name"
    t.string "seed_page_profile_img_content_type"
    t.integer "seed_page_profile_img_file_size"
    t.datetime "seed_page_profile_img_updated_at"
    t.string "tmp_seed_page_profile_img_file_name"
    t.string "tmp_seed_page_profile_img_content_type"
    t.integer "tmp_seed_page_profile_img_file_size"
    t.datetime "tmp_seed_page_profile_img_updated_at"
    t.string "organization_img_file_name"
    t.string "organization_img_content_type"
    t.integer "organization_img_file_size"
    t.datetime "organization_img_updated_at"
    t.string "tmp_organization_img_file_name"
    t.string "tmp_organization_img_content_type"
    t.integer "tmp_organization_img_file_size"
    t.datetime "tmp_organization_img_updated_at"
    t.string "fundraising_inspirational_img_file_name"
    t.string "fundraising_inspirational_img_content_type"
    t.integer "fundraising_inspirational_img_file_size"
    t.datetime "fundraising_inspirational_img_updated_at"
    t.string "tmp_fundraising_inspirational_img_file_name"
    t.string "tmp_fundraising_inspirational_img_content_type"
    t.integer "tmp_fundraising_inspirational_img_file_size"
    t.datetime "tmp_fundraising_inspirational_img_updated_at"
    t.text "default_facebook_message"
    t.text "default_twitter_message"
    t.text "default_email_message"
    t.text "default_text_message"
    t.boolean "display_seed_page_profile_img"
    t.string "background_img_file_name"
    t.string "background_img_content_type"
    t.integer "background_img_file_size"
    t.datetime "background_img_updated_at"
    t.string "tmp_background_img_file_name"
    t.string "tmp_background_img_content_type"
    t.integer "tmp_background_img_file_size"
    t.datetime "tmp_background_img_updated_at"
    t.boolean "display_background_img"
    t.string "signup_background_img_file_name"
    t.string "signup_background_img_content_type"
    t.integer "signup_background_img_file_size"
    t.datetime "signup_background_img_updated_at"
    t.boolean "display_signup_background_img"
    t.string "tmp_signup_background_img_file_name"
    t.string "tmp_signup_background_img_content_type"
    t.integer "tmp_signup_background_img_file_size"
    t.datetime "tmp_signup_background_img_updated_at"
    t.integer "default_fundraising_goal", default: 100, null: false
    t.string "category_label"
    t.string "become_fundraiser_button_text"
    t.integer "display_signup_gender"
    t.string "signup_custom_date_label"
    t.integer "display_signup_custom_date"
    t.integer "display_signup_terms"
    t.string "signup_terms_label"
    t.string "tmp_facebook_share_img_file_name"
    t.string "tmp_facebook_share_img_content_type"
    t.integer "tmp_facebook_share_img_file_size"
    t.datetime "tmp_facebook_share_img_updated_at"
    t.string "facebook_share_img_file_name"
    t.string "facebook_share_img_content_type"
    t.integer "facebook_share_img_file_size"
    t.datetime "facebook_share_img_updated_at"
    t.boolean "display_login", default: true
    t.boolean "display_progress_bar", default: true
    t.string "default_email_subject_heading"
    t.boolean "notify_fundraisers", default: false
    t.boolean "notify_fundraisers_via_sms", default: false
    t.boolean "peer_fundraiser_review", default: false
    t.integer "signup_form_id"
    t.boolean "display_fundraiser_button", default: true
    t.string "custom_form_button_text"
    t.integer "donation_form_id"
    t.boolean "display_donors", default: true
    t.index ["campaigns_keyword_id"], name: "idx_peer_fundraiser_settings_campaigns_keyword_id"
  end

  create_table "peer_fundraiser_team_settings", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "peer_fundraiser_setting_id"
    t.text "default_call_to_action"
    t.integer "default_team_goal"
    t.string "default_button_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "allow_team_creation", default: true
    t.boolean "allow_team_participation", default: true
  end

  create_table "peer_fundraiser_teams", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "campaigns_keyword_id", null: false
    t.decimal "total", precision: 10, scale: 2, default: "0.0", null: false
    t.integer "team_fundraising_goal"
    t.text "call_to_action"
    t.integer "campaigns_keyword_category_id"
    t.string "alternative_team_id"
    t.string "display_name"
    t.index ["campaigns_keyword_id"], name: "index_peer_fundraiser_teams_on_campaigns_keyword_id"
  end

  create_table "peer_fundraisers", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "campaigns_keyword_id", null: false
    t.integer "user_id"
    t.string "fundraising_name", null: false
    t.integer "fundraising_goal", default: 100
    t.text "call_to_action"
    t.boolean "use_default_cta", default: false
    t.boolean "receive_email_on_donation", default: false
    t.boolean "receive_sms_on_donation", default: false
    t.string "personal_img_file_name"
    t.string "personal_img_content_type"
    t.integer "personal_img_file_size"
    t.datetime "personal_img_updated_at"
    t.string "thankyou_img_file_name"
    t.string "thankyou_img_content_type"
    t.integer "thankyou_img_file_size"
    t.datetime "thankyou_img_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "npo_id"
    t.string "tmp_personal_img_file_name"
    t.string "tmp_personal_img_content_type"
    t.integer "tmp_personal_img_file_size"
    t.datetime "tmp_personal_img_updated_at"
    t.text "tmp_attrs"
    t.string "personal_keyword"
    t.boolean "team_captain", default: false
    t.integer "peer_fundraiser_team_id"
    t.string "gender"
    t.date "custom_date"
    t.boolean "agree_to_terms"
    t.integer "status", default: 0, null: false
    t.string "alternate_id"
    t.boolean "receive_donation_notifications_via_email", default: true
    t.boolean "receive_donation_notifications_via_sms", default: true
    t.integer "campaigns_keyword_category_id"
    t.string "registration_token"
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.integer "npos_constituent_id"
    t.index ["alternate_id"], name: "index_peer_fundraisers_on_alternate_id"
    t.index ["campaigns_keyword_id", "fundraising_name"], name: "index_peer_fundraising_name", unique: true
    t.index ["campaigns_keyword_id"], name: "idx_peer_fundraisers_campaigns_keyword_id"
    t.index ["fundraising_name", "campaigns_keyword_id"], name: "idx_fundraising_name_campaigns_keyword_id"
    t.index ["npos_constituent_id"], name: "index_peer_fundraisers_on_npos_constituent_id"
    t.index ["parent_id"], name: "index_peer_fundraisers_on_parent_id"
    t.index ["peer_fundraiser_team_id"], name: "index_peer_fundraisers_on_peer_fundraiser_team_id"
    t.index ["personal_keyword"], name: "index_peer_fundraisers_on_personal_keyword"
    t.index ["registration_token"], name: "uq_peer_fundraisers_registration_token", unique: true
    t.index ["user_id"], name: "idx_peer_fundraisers_user_id"
  end

  create_table "person_constituents", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "first_name", limit: 30
    t.string "middle_name", limit: 30
    t.string "last_name", limit: 30
    t.integer "age"
    t.string "gender", limit: 15
    t.string "status", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name", "middle_name", "last_name"], name: "uq_person_constituents", unique: true
    t.index ["first_name"], name: "index_person_constituents_on_first_name"
    t.index ["last_name"], name: "index_person_constituents_on_last_name"
    t.index ["middle_name"], name: "index_person_constituents_on_middle_name"
    t.index ["status"], name: "index_person_constituents_on_status"
  end

  create_table "prospects", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "ein"
    t.string "name"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assets"
    t.integer "income"
    t.date "assets_as_of"
    t.string "latest_990_url"
    t.boolean "current_client", default: false
    t.string "ntee_code"
    t.string "sector"
    t.integer "npo_id"
    t.index ["ein"], name: "idx_prospects_ein"
  end

  create_table "qr_codes", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id"
    t.integer "campaigns_keyword_id"
    t.integer "link_id"
    t.string "name"
    t.string "codeType"
    t.string "rid"
    t.string "iid"
    t.string "value"
    t.string "canonical"
    t.string "label"
    t.string "symbology"
    t.string "encoding"
    t.string "hostname"
    t.string "labelOpt"
    t.string "moduleSize"
    t.string "ecl"
    t.string "description"
    t.string "url"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "qr_type"
    t.string "brand_image_file_name"
    t.string "brand_image_content_type"
    t.integer "brand_image_file_size"
    t.datetime "brand_image_updated_at"
    t.string "branded_code_file_name"
    t.string "branded_code_content_type"
    t.integer "branded_code_file_size"
    t.datetime "branded_code_updated_at"
    t.integer "originable_id"
    t.string "originable_type"
    t.string "qr_processor_type"
  end

  create_table "recent_donation_activities", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "donation_id"
    t.integer "transaction_id"
    t.integer "npo_id"
    t.integer "campaigns_keyword_id"
    t.string "ip_address"
    t.string "email"
    t.string "phone"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "audit_status"
    t.text "description"
    t.index ["created_at"], name: "idx_recent_donation_activities_created_at"
    t.index ["ip_address"], name: "idx_recent_donation_activities_ip_address"
  end

  create_table "recurring_donation_messages", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "batch_id"
    t.integer "donation_id"
    t.string "message_type"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transaction_id"
    t.text "error_message"
    t.boolean "sms_channel", default: true
    t.boolean "email_channel", default: true
    t.index ["batch_id"], name: "index_recurring_donation_messages_on_batch_id"
    t.index ["donation_id"], name: "index_recurring_donation_messages_on_donation_id"
    t.index ["message_type"], name: "index_recurring_donation_messages_on_message_type"
  end

  create_table "recurring_donations", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "frequency"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "next_bill_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "terms_url"
    t.string "payment_processor_class"
    t.string "status"
    t.integer "failed_attempts"
    t.text "error_messages"
    t.boolean "get_messages", default: true
    t.integer "npo_payment_processor_id"
    t.integer "recurring_limit"
    t.decimal "recurring_amount", precision: 10, scale: 2
    t.decimal "amount_before_split", precision: 10, scale: 2
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "constituent_id"
    t.index ["constituent_id"], name: "index_recurring_donations_on_constituent_id"
    t.index ["email"], name: "index_recurring_donations_on_email"
    t.index ["first_name"], name: "index_recurring_donations_on_first_name"
    t.index ["last_name"], name: "index_recurring_donations_on_last_name"
    t.index ["next_bill_date"], name: "index_recurring_donations_on_next_bill_date"
    t.index ["npo_payment_processor_id"], name: "index_recurring_donations_on_npo_payment_processor_id"
    t.index ["status"], name: "index_recurring_donations_on_status"
  end

  create_table "reminders", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "donation_id"
    t.integer "reminders_configuration_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["donation_id", "reminders_configuration_id"], name: "index_reminders_on_donation_id_and_reminders_configuration_id", unique: true
    t.index ["donation_id"], name: "index_reminders_on_donation_id"
    t.index ["reminders_configuration_id"], name: "index_reminders_on_reminders_configuration_id"
  end

  create_table "reminders_configurations", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "message"
    t.integer "delta_days"
    t.string "docs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["delta_days"], name: "index_reminders_configurations_on_delta_days", unique: true
  end

  create_table "request_queues", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "process_type"
    t.text "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "queue_type", limit: 30
    t.text "error"
    t.boolean "auto_clear"
    t.string "status", limit: 15
    t.datetime "processing_started_at"
    t.datetime "processing_finished_at"
    t.string "request_type", limit: 50
    t.integer "retry_count"
    t.string "process_hostname"
    t.string "process_thread_id"
    t.index ["process_type"], name: "index_request_queues_on_process_type"
    t.index ["queue_type"], name: "index_request_queues_on_queue_type"
    t.index ["request_type"], name: "index_request_queues_on_request_type"
    t.index ["status"], name: "index_request_queues_on_status"
  end

  create_table "request_verifications", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "originable_id"
    t.string "originable_type", limit: 30
    t.boolean "verified"
    t.text "encoded_params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "request_type", limit: 10, default: "captcha"
    t.index ["originable_type", "originable_id", "request_type"], name: "index_request_verifications_on_originable_and_request_type"
    t.index ["request_type", "verified"], name: "index_request_verifications_on_request_type_and_verified"
  end

  create_table "resellers", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "organization_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rollup_stats", charset: "utf8", force: :cascade do |t|
    t.string "originable_type"
    t.bigint "originable_id"
    t.boolean "valid_cache", default: false, null: false
    t.datetime "invalidated_at"
    t.decimal "pledged_amount", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "pledged_count", default: 0, null: false
    t.decimal "collected_amount", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "collected_count", default: 0, null: false
    t.decimal "pending_amount", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "pending_count", default: 0, null: false
    t.decimal "offline_amount", precision: 12, scale: 2, default: "0.0", null: false
    t.integer "offline_count", default: 0, null: false
    t.integer "donor_count", default: 0, null: false
    t.integer "subscriber_count", default: 0, null: false
    t.integer "messages_sent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_update_at"
    t.index ["originable_id", "originable_type"], name: "uq_rollup_stats_on_originable", unique: true
    t.index ["originable_type", "originable_id"], name: "index_rollup_stats_on_originable"
  end

  create_table "shared_images", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "shared_img_display_name"
    t.integer "account_id"
    t.integer "user_id"
    t.string "shared_img_file_name"
    t.string "shared_img_content_type"
    t.integer "shared_img_file_size"
    t.datetime "shared_img_updated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shared_settings", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "originable_id"
    t.string "originable_type"
    t.string "name"
    t.text "value"
    t.text "value_type"
    t.integer "precedence", default: 99
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "originable_type", "originable_id", "precedence"], name: "uq_shared_settings", unique: true
    t.index ["name", "originable_type", "originable_id"], name: "index_shared_settings_on_originable"
    t.index ["originable_type", "originable_id"], name: "index_shared_settings_on_originable_originable_id"
  end

  create_table "shortcodes", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "shortcode_string"
    t.integer "keyword_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_code"
    t.string "url_node", limit: 1
  end

  create_table "sms_broadcasts", id: :integer, charset: "utf8", force: :cascade do |t|
    t.text "sms_text"
    t.integer "shortcode_id"
    t.string "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tax_receipts_configs", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id"
    t.text "custom_message"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone", limit: 20
    t.text "compliance_message"
    t.string "email_subject"
    t.integer "donation_form_setting_id"
    t.boolean "include_tax_info", default: true
    t.boolean "include_org_email"
    t.string "type", limit: 50
    t.text "pdf_content"
    t.index ["donation_form_setting_id"], name: "index_tax_receipts_configs_on_donation_form_setting_id"
    t.index ["npo_id"], name: "index_tax_receipts_configs_on_npo_id"
  end

  create_table "transaction_discount_codes", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "transaction_id"
    t.integer "discount_code_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_code_id"], name: "discount_count_uses"
    t.index ["transaction_id"], name: "uq_transaction_discount_codes", unique: true
  end

  create_table "transaction_events", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "transaction_id"
    t.string "event_type"
    t.string "external_record_id"
    t.string "external_confirmation"
    t.datetime "posted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_type"], name: "index_transaction_events_on_event_type"
    t.index ["external_confirmation"], name: "index_transaction_events_on_external_confirmation"
    t.index ["external_record_id"], name: "index_transaction_events_on_external_record_id"
    t.index ["posted_at"], name: "index_transaction_events_on_posted_at"
    t.index ["transaction_id"], name: "index_transaction_events_on_transaction_id"
  end

  create_table "transaction_fees", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "transaction_id"
    t.decimal "fee", precision: 8, scale: 2
    t.string "fee_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transaction_items", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "transaction_id"
    t.text "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.float "price"
    t.string "item_type", default: "ticket_type"
    t.decimal "fair_market_value", precision: 8, scale: 2
    t.decimal "total_discount_amount", precision: 8, scale: 2
    t.index ["item_type"], name: "index_transaction_items_on_item_type"
    t.index ["transaction_id"], name: "index_transaction_items_on_transaction_id"
  end

  create_table "transaction_npos_custom_field_values", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "transaction_id"
    t.string "custom_field_name"
    t.string "custom_field_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "npos_custom_field_id"
    t.index ["npos_custom_field_id"], name: "idx_npos_custom_field_id"
    t.index ["transaction_id", "npos_custom_field_id"], name: "uq_transaction_npos_custom_field_value", unique: true
    t.index ["transaction_id"], name: "idx_transaction_npos_custom_field_values_transaction_id"
  end

  create_table "transactions", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "donation_id", null: false
    t.string "phone"
    t.string "carrier"
    t.string "shortcode"
    t.string "keyword"
    t.decimal "amount", precision: 10, scale: 2
    t.string "cc_type"
    t.integer "campaign_id"
    t.integer "npo_id"
    t.string "product_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "billing_status"
    t.string "billing_response_code"
    t.text "billing_response_text"
    t.string "billing_transaction_id"
    t.string "first_name"
    t.string "last_name"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "email"
    t.string "source"
    t.string "payment_processor_class"
    t.integer "reference_transaction_id"
    t.string "billing_type"
    t.string "billing_authorization_code"
    t.string "gender"
    t.integer "npo_payment_processor_id"
    t.integer "campaign_event_id"
    t.string "country", default: "US"
    t.string "payment_method", limit: 25
    t.integer "account_object_id"
    t.index ["billing_transaction_id"], name: "index_transactions_on_billing_transaction_id"
    t.index ["campaign_event_id"], name: "index_transactions_on_campaign_event_id"
    t.index ["created_at"], name: "index_transactions_on_created_at"
    t.index ["donation_id"], name: "donation_id_idx"
    t.index ["npo_id"], name: "index_transactions_on_npo_id"
    t.index ["npo_payment_processor_id"], name: "index_transactions_on_npo_payment_processor_id"
    t.index ["payment_method"], name: "index_transactions_on_payment_method"
    t.index ["phone"], name: "index_transactions_on_phone"
    t.index ["reference_transaction_id"], name: "idx_transactions_reference_transaction_id"
  end

  create_table "upload_requests", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "npo_id"
    t.integer "user_id"
    t.string "request_type"
    t.string "status"
    t.string "upload_file_name"
    t.string "upload_content_type"
    t.integer "upload_file_size"
    t.datetime "upload_updated_at"
    t.datetime "upload_file_finished_at"
    t.datetime "processing_started_at"
    t.datetime "processing_finished_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "originable_id"
    t.string "originable_type"
    t.integer "account_id"
    t.index ["account_id"], name: "index_upload_requests_on_account_id"
    t.index ["originable_id", "originable_type"], name: "index_upload_requests_on_originable_id_and_originable_type"
  end

  create_table "usage_stats", charset: "utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "user_id"
    t.string "component_type"
    t.string "component_sub_type"
    t.string "properties"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_activity_logs", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "admin_user_id"
    t.string "session_id"
    t.string "browser"
    t.text "referrer"
    t.string "ip_address"
    t.string "controller"
    t.string "action"
    t.text "params"
    t.integer "rpt_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "machine_name"
    t.index ["admin_user_id"], name: "index_user_activity_logs_on_admin_user_id"
    t.index ["user_id"], name: "index_user_activity_logs_on_user_id"
  end

  create_table "user_login_settings", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "failed_attempts", default: 0
    t.datetime "lock_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "mark_pwd_for_reset"
    t.datetime "last_password_update"
    t.index ["user_id"], name: "index_user_login_settings_on_user_id"
  end

  create_table "user_notifications", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "delivery_method"
    t.string "notify_type"
    t.integer "notify_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notify_message"
    t.string "status"
  end

  create_table "user_roles", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "object_type", null: false
    t.integer "object_id", null: false
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.integer "account_id"
    t.datetime "last_role_use"
    t.index ["object_id", "object_type", "role", "account_id"], name: "index_user_roles_on_combos"
    t.index ["object_id", "object_type", "role"], name: "index_user_roles_on_object_id_and_object_type_and_role"
    t.index ["token"], name: "uq_user_roles", unique: true
    t.index ["user_id", "role"], name: "index_user_roles_on_user_id_and_role"
  end

  create_table "user_sessions", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "session_token"
    t.datetime "expire_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_session_uq", unique: true
  end

  create_table "user_settings", id: :integer, charset: "utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "setting_type", null: false
    t.string "setting_name", null: false
    t.text "setting_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "setting_type", "setting_name"], name: "index_user_settings_uq", unique: true
  end

  create_table "users", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "npo_admin", default: false
    t.boolean "mobilecause_admin", default: false
    t.string "time_zone", default: "Eastern Time (US & Canada)"
    t.string "first_name"
    t.string "last_name"
    t.boolean "call_center_user", default: false
    t.string "authentication_token"
    t.integer "participant_id"
    t.integer "pepl_user_id"
    t.string "phone_number"
    t.integer "account_id"
    t.boolean "fundraiser"
    t.string "public_auth_token"
    t.string "username"
    t.datetime "pass_change_dt"
    t.boolean "integration_user", default: false
    t.string "encrypted_otp_secret"
    t.string "encrypted_otp_secret_iv"
    t.string "encrypted_otp_secret_salt"
    t.integer "consumed_timestep"
    t.boolean "otp_required_for_login"
    t.text "otp_backup_codes"
    t.datetime "archived_at"
    t.datetime "last_role_use"
    t.string "global_user_id"
    t.string "global_user_login_domain"
    t.index ["account_id"], name: "idx_users_peer_account_id"
    t.index ["authentication_token"], name: "index_users_on_authentication_token"
    t.index ["email"], name: "index_users_on_email"
    t.index ["global_user_id"], name: "index_users_on_global_user_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "widget_configurations", id: :integer, charset: "utf8", force: :cascade do |t|
    t.string "type"
    t.string "targetable_type"
    t.integer "targetable_id"
    t.integer "campaign_id", null: false
    t.string "layout"
    t.string "logo_file_name"
    t.string "logo_content_type"
    t.integer "logo_file_size"
    t.datetime "logo_updated_at"
    t.text "config_json"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hashed_id"
    t.index ["campaign_id"], name: "idx_widget_configurations_campaign_id"
    t.index ["hashed_id"], name: "index_widget_configurations_on_hashed_id", unique: true
    t.index ["targetable_type", "targetable_id"], name: "idx_widget_configurations_targetable"
  end

  add_foreign_key "campaigns", "constituent_lists"
  add_foreign_key "donations", "recurring_donations", name: "fk_donations_recurring_donations"
  add_foreign_key "identities", "users"
  add_foreign_key "npo_subscription_activities", "npos_constituent_contacts"
  add_foreign_key "peer_fundraisers", "npos_constituents"
end
