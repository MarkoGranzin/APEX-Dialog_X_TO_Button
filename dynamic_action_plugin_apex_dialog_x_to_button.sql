prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.3.00.05'
,p_default_workspace_id=>100000
,p_default_application_id=>104
,p_default_owner=>'MEDINCHEN'
);
end;
/
prompt --application/shared_components/plugins/dynamic_action/apex_dialog_x_to_button
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(7269592410300092)
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
'    //get the button',
'    var button = parent.$(".ui-dialog-titlebar-close");',
'    var btn = "#" + $(this)[0].action.affectedButtonId;',
'    //remove the behavior',
'    button.unbind(); ',
'    ',
'    //put another behavior to the button',
'    button.on("click", function() {',
'    console.log(btn);',
'       $(btn).click();',
'    });}'';',
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
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
