prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.3.00.05'
,p_default_workspace_id=>18626159959134733651
,p_default_application_id=>59820
,p_default_id_offset=>20788415747469946654
,p_default_owner=>'MEDINCHEN'
);
end;
/
 
prompt APPLICATION 59820 - Demo App
--
-- Application Export:
--   Application:     59820
--   Name:            Demo App
--   Date and Time:   16:32 Mittwoch Januar 22, 2020
--   Exported By:     MARKO.GRANZIN@GMX.DE
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 20795685339880246746
--   Manifest End
--   Version:         19.2.0.00.18
--   Instance ID:     63113759365424
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/apex_dialog_x_to_button
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(20795685339880246746)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'APEX_DIALOG_X_TO_BUTTON'
,p_display_name=>'APEX Dialog X to Button'
,p_category=>'STYLE'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION F_RENDER (',
'    P_DYNAMIC_ACTION   IN APEX_PLUGIN.T_DYNAMIC_ACTION,',
'    P_PLUGIN           IN APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'    VR_RESULT         APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'BEGIN',
'    VR_RESULT.JAVASCRIPT_FUNCTION   := ''function () {  ',
'    var button = parent.$(".ui-dialog-titlebar-close");',
'    var btn = "#" + $(this)[0].action.affectedButtonId;',
'    button.unbind();',
'    button.on("click", function() {$(btn).click();});',
'    }'';',
'',
'    RETURN VR_RESULT;',
'END;'))
,p_api_version=>2
,p_render_function=>'F_RENDER'
,p_standard_attributes=>'BUTTON'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'1 Install this plugin ',
'2. create an dialog',
'3. add an on page load dynamic action with this plugin',
'4. Select an Button to Click',
'...'))
,p_version_identifier=>'1.0'
,p_about_url=>'https://https://github.com/MarkoGranzin/APEX_DIALOG_X_TO_BUTTON'
,p_plugin_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'MIT License',
'',
'Copyright (c) 2020 Marko Granzin'))
,p_files_version=>2
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
