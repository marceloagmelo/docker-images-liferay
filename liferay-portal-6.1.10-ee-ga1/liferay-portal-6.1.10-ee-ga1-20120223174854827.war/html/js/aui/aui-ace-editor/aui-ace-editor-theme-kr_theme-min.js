AUI.add("aui-ace-editor-theme-kr_theme",function(a){define("ace/theme/kr_theme",["require","exports","module"],function(g,f,j){var i=g("pilot/dom"),h=".ace-kr-theme .ace_editor {\n  border: 2px solid rgb(159, 159, 159);\n}\n\n.ace-kr-theme .ace_editor.ace_focus {\n  border: 2px solid #327fbd;\n}\n\n.ace-kr-theme .ace_gutter {\n  width: 50px;\n  background: #e8e8e8;\n  color: #333;\n  overflow : hidden;\n}\n\n.ace-kr-theme .ace_gutter-layer {\n  width: 100%;\n  text-align: right;\n}\n\n.ace-kr-theme .ace_gutter-layer .ace_gutter-cell {\n  padding-right: 6px;\n}\n\n.ace-kr-theme .ace_print_margin {\n  width: 1px;\n  background: #e8e8e8;\n}\n\n.ace-kr-theme .ace_scroller {\n  background-color: #0B0A09;\n}\n\n.ace-kr-theme .ace_text-layer {\n  cursor: text;\n  color: #FCFFE0;\n}\n\n.ace-kr-theme .ace_cursor {\n  border-left: 2px solid #FF9900;\n}\n\n.ace-kr-theme .ace_cursor.ace_overwrite {\n  border-left: 0px;\n  border-bottom: 1px solid #FF9900;\n}\n \n.ace-kr-theme .ace_marker-layer .ace_selection {\n  background: rgba(170, 0, 255, 0.45);\n}\n\n.ace-kr-theme .ace_marker-layer .ace_step {\n  background: rgb(198, 219, 174);\n}\n\n.ace-kr-theme .ace_marker-layer .ace_bracket {\n  margin: -1px 0 0 -1px;\n  border: 1px solid rgba(255, 177, 111, 0.32);\n}\n\n.ace-kr-theme .ace_marker-layer .ace_active_line {\n  background: #38403D;\n}\n\n       \n.ace-kr-theme .ace_invisible {\n  color: rgba(255, 177, 111, 0.32);\n}\n\n.ace-kr-theme .ace_keyword {\n  color:#949C8B;\n}\n\n.ace-kr-theme .ace_keyword.ace_operator {\n  \n}\n\n.ace-kr-theme .ace_constant {\n  color:rgba(210, 117, 24, 0.76);\n}\n\n.ace-kr-theme .ace_constant.ace_language {\n  \n}\n\n.ace-kr-theme .ace_constant.ace_library {\n  \n}\n\n.ace-kr-theme .ace_constant.ace_numeric {\n  \n}\n\n.ace-kr-theme .ace_invalid {\n  color:#F8F8F8;\nbackground-color:#A41300;\n}\n\n.ace-kr-theme .ace_invalid.ace_illegal {\n  \n}\n\n.ace-kr-theme .ace_invalid.ace_deprecated {\n  \n}\n\n.ace-kr-theme .ace_support {\n  color:#9FC28A;\n}\n\n.ace-kr-theme .ace_support.ace_function {\n  color:#85873A;\n}\n\n.ace-kr-theme .ace_function.ace_buildin {\n  \n}\n\n.ace-kr-theme .ace_string {\n  \n}\n\n.ace-kr-theme .ace_string.ace_regexp {\n  color:rgba(125, 255, 192, 0.65);\n}\n\n.ace-kr-theme .ace_comment {\n  font-style:italic;\ncolor:#706D5B;\n}\n\n.ace-kr-theme .ace_comment.ace_doc {\n  \n}\n\n.ace-kr-theme .ace_comment.ace_doc.ace_tag {\n  \n}\n\n.ace-kr-theme .ace_variable {\n  color:#D1A796;\n}\n\n.ace-kr-theme .ace_variable.ace_language {\n  color:#FF80E1;\n}\n\n.ace-kr-theme .ace_xml_pe {\n  \n}\n\n.ace-kr-theme .ace_meta {\n  \n}\n\n.ace-kr-theme .ace_meta.ace_tag {\n  color:#BABD9C;\n}\n\n.ace-kr-theme .ace_meta.ace_tag.ace_input {\n  \n}\n\n.ace-kr-theme .ace_entity.ace_other.ace_attribute-name {\n  \n}\n\n\n.ace-kr-theme .ace_collab.ace_user1 {\n     \n}";i.importCssString(h),f.cssClass="ace-kr-theme";});},"1.5.0",{requires:["aui-ace-editor-base"],skinnable:false});