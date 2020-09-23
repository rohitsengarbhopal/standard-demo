INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_editCurrentUser_profile','userprofile_editCurrentUser_profile',NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>
<#assign wpsa=JspTaglibs["/apsadmin-core"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>
<h1><@wp.i18n key="userprofile_EDITPROFILE_TITLE" /></h1>
<#if (Session.currentUser != "guest") >
	<form action="<@wp.action path="/ExtStr2/do/Front/CurrentUser/Profile/save.action" />" method="post" class="form-horizontal">
	<@s.if test="hasFieldErrors()">
		<div class="alert alert-block">
			<p><strong><@wp.i18n key="userprofile_MESSAGE_TITLE_FIELDERRORS" /></strong></p>
			<ul class="unstyled">
				<@s.iterator value="fieldErrors">
					<@s.iterator value="value">
						<li><@s.property escapeHtml=false /></li>
					</@s.iterator>
				</@s.iterator>
			</ul>
		</div>
	</@s.if>
	<@s.set var="lang" value="defaultLang" />
	<@s.iterator value="userProfile.attributeList" var="attribute">
		<@s.if test="%{#attribute.active}">
			<@wpsa.tracerFactory var="attributeTracer" lang="%{#lang.code}" />
				<@s.set var="i18n_attribute_name">userprofile_<@s.property value="userProfile.typeCode" />_<@s.property value="#attribute.name" /></@s.set>
				<@s.set var="attribute_id">userprofile_<@s.property value="#attribute.name" /></@s.set>
				<@wp.fragment code="userprofile_is_IteratorAttribute" escapeXml=false />
		</@s.if>
	</@s.iterator>

	<p class="form-actions">
		<@wp.i18n key="userprofile_SAVE_PROFILE" var="userprofile_SAVE_PROFILE" />
		<@wpsf.submit useTabindexAutoIncrement=true value="%{#attr.userprofile_SAVE_PROFILE}" cssClass="btn btn-primary" />
	</p>

	</form>
<#else>
	<p>
		<@wp.i18n key="userprofile_PLEASE_LOGIN" />
	</p>
</#if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-DateAttribute',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>

<#assign currentLangVar ><@wp.info key="currentLang" /></#assign>

<@s.if test="#attribute.failedDateString == null">
<@s.set var="dateAttributeValue" value="#attribute.getFormattedDate(''dd/MM/yyyy'')" />
</@s.if>
<@s.else>
<@s.set var="dateAttributeValue" value="#attribute.failedDateString" />
</@s.else>
<@wpsf.textfield
useTabindexAutoIncrement=true id="%{attribute_id}"
name="%{#attributeTracer.getFormFieldName(#attribute)}"
value="%{#dateAttributeValue}" maxlength="10" cssClass="text userprofile-date" />
&#32;
<#assign js_for_datepicker="jQuery(function($){
	$.datepicker.regional[''it''] = {
		closeText: ''Chiudi'',
		prevText: ''&#x3c;Prec'',
		nextText: ''Succ&#x3e;'',
		currentText: ''Oggi'',
		monthNames: [''Gennaio'',''Febbraio'',''Marzo'',''Aprile'',''Maggio'',''Giugno'',
			''Luglio'',''Agosto'',''Settembre'',''Ottobre'',''Novembre'',''Dicembre''],
		monthNamesShort: [''Gen'',''Feb'',''Mar'',''Apr'',''Mag'',''Giu'',
			''Lug'',''Ago'',''Set'',''Ott'',''Nov'',''Dic''],
		dayNames: [''Domenica'',''Luned&#236'',''Marted&#236'',''Mercoled&#236'',''Gioved&#236'',''Venerd&#236'',''Sabato''],
		dayNamesShort: [''Dom'',''Lun'',''Mar'',''Mer'',''Gio'',''Ven'',''Sab''],
		dayNamesMin: [''Do'',''Lu'',''Ma'',''Me'',''Gi'',''Ve'',''Sa''],
		weekHeader: ''Sm'',
		dateFormat: ''dd/mm/yy'',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''''};
});

jQuery(function($){
	if (Modernizr.touch && Modernizr.inputtypes.date) {
		$.each(	$(''input.userprofile-date''), function(index, item) {
			item.type = ''date'';
		});
	} else {
		$.datepicker.setDefaults( $.datepicker.regional[''${currentLangVar}''] );
		$(''input.userprofile-date'').datepicker({
      			changeMonth: true,
      			changeYear: true,
      			dateFormat: ''dd/mm/yyyy''
    		});
	}
});" >

<@wp.headInfo type="JS" info="entando-misc-html5-essentials/modernizr-2.5.3-full.js" />
<@wp.headInfo type="JS_EXT" info="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js" />
<@wp.headInfo type="CSS_EXT" info="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.min.css" />
<@wp.headInfo type="JS_RAW" info="${js_for_datepicker}" />',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front_attributeInfo-help-block',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>

<@s.set var="validationRules" value="#attribute.validationRules.ognlValidationRule" />
<@s.set var="hasValidationRulesVar" value="%{#validationRules != null && #validationRules.expression != null}" />

<@s.if test="%{#hasValidationRulesVar || #attribute.type == ''Date'' || (#attribute.textAttribute && (#attribute.minLength != -1 || #attribute.maxLength != -1))}">
		<span class="help-block">
		<@s.if test="#attribute.type == ''Date''">dd/MM/yyyy&#32;</@s.if>
		<@s.if test="%{#validationRules.helpMessageKey != null}">
			<@s.set var="label" scope="page" value="#validationRules.helpMessageKey" /><@wp.i18n key="${label}" />
		</@s.if>
		<@s.elseif test="%{#validationRules.helpMessage != null}">
			<@s.property value="#validationRules.helpMessage" />
		</@s.elseif>
		<@s.if test="#attribute.minLength != -1">
			&#32;
			<abbr title="<@wp.i18n key="userprofile_ENTITY_ATTRIBUTE_MINLENGTH_FULL" />&#32;<@s.property value="#attribute.minLength" />">
				<@wp.i18n key="userprofile_ENTITY_ATTRIBUTE_MINLENGTH_SHORT" />:&#32;<@s.property value="#attribute.minLength" />
			</abbr>
		</@s.if>
		<@s.if test="#attribute.maxLength != -1">
			&#32;
			<abbr title="<@wp.i18n key="userprofile_ENTITY_ATTRIBUTE_MAXLENGTH_FULL" />&#32;<@s.property value="#attribute.maxLength" />">
				<@wp.i18n key="userprofile_ENTITY_ATTRIBUTE_MAXLENGTH_SHORT" />:&#32;<@s.property value="#attribute.maxLength" />
			</abbr>
		</@s.if>
	</span>
</@s.if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_passwordChanged',NULL,NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign s=JspTaglibs["/struts-tags"]>

<h1><@wp.i18n key="userprofile_EDITPASSWORD_TITLE" /></h1>
<p class="alert alert-success"><@wp.i18n key="userprofile_PASSWORD_UPDATED" /></p>
<@s.if test="!#session.currentUser.credentialsNonExpired">
	<p class="alert alert-info">
		<a href="<@s.url namespace="/do" action="logout" />" ><@wp.i18n key="userprofile_PLEASE_LOGIN_AGAIN" /></a>
	</p>
</@s.if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-HypertextAttribute',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>

<@wpsf.textarea
	useTabindexAutoIncrement=true
	cols="50"
	rows="3"
	id="%{#attribute_id}"
	name="%{#attributeTracer.getFormFieldName(#attribute)}"
	value="%{#attribute.textMap[#lang.code]}"  />',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-NumberAttribute',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>

<@s.if test="#attribute.failedNumberString == null">
	<@s.set var="numberAttributeValue" value="#attribute.value"></@s.set>
</@s.if>
<@s.else>
	<@s.set var="numberAttributeValue" value="#attribute.failedNumberString"></@s.set>
</@s.else>
<@wpsf.textfield
		useTabindexAutoIncrement=true
		id="%{#attribute_id}"
		name="%{#attributeTracer.getFormFieldName(#attribute)}"
		value="%{#numberAttributeValue}"
		maxlength="254" />',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-BooleanAttribute',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>
<label class="radio inline" for="<@s.property value="%{#attribute_id + ''-true''}" />">
	<@wpsf.radio
		useTabindexAutoIncrement=true
		name="%{#attributeTracer.getFormFieldName(#attribute)}"
		id="%{#attribute_id + ''-true''}"
		value="true"
		checked="%{#attribute.value == true}"
		cssClass="radio" />
		<@wp.i18n key="userprofile_YES" />
</label>
&#32;
<label class="radio inline" for="<@s.property value="%{#attribute_id+''-false''}" />">
	<@wpsf.radio
		useTabindexAutoIncrement=true
		name="%{#attributeTracer.getFormFieldName(#attribute)}"
		id="%{#attribute_id + ''-false''}"
		value="false"
		checked="%{#attribute.value == false}"
		cssClass="radio" />
		<@wp.i18n key="userprofile_NO" />
</label>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list_userfilter_ent_Enumer',NULL,'jacms',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign formFieldNameVar = userFilterOptionVar.formFieldNames[0] >
<#assign formFieldValue = userFilterOptionVar.getFormFieldValue(formFieldNameVar) >
<#assign i18n_Attribute_Key = userFilterOptionVar.attribute.name >
<div class="control-group">
	<label for="${formFieldNameVar}" class="control-label"><@wp.i18n key="${i18n_Attribute_Key}" /></label>
	<div class="controls">
		<select name="${formFieldNameVar}" id="${formFieldNameVar}" class="input-xlarge">
			<option value=""><@wp.i18n key="ALL" /></option>
			<#list userFilterOptionVar.attribute.items as enumeratorItemVar>
			<option value="${enumeratorItemVar}" <#if (formFieldValue??) && (enumeratorItemVar == formFieldValue)>selected="selected"</#if> >${enumeratorItemVar}</option>
			</#list>
		</select>
	</div>
</div>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-ThreeStateAttribute',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>
<label class="radio inline" for="<@s.property value="%{#attribute_id + ''-none''}" />">
	<@wpsf.radio
		useTabindexAutoIncrement=true
		name="%{#attributeTracer.getFormFieldName(#attribute)}"
		id="%{#attribute_id + ''-none''}"
		value=""
		checked="%{#attribute.booleanValue == null}"
		cssClass="radio" />
		<@wp.i18n key="userprofile_BOTH_YES_AND_NO" />
</label>
&#32;
<label class="radio inline" for="<@s.property value="%{#attribute_id + ''-true''}" />">
	<@wpsf.radio
		useTabindexAutoIncrement=true
		name="%{#attributeTracer.getFormFieldName(#attribute)}"
		id="%{#attribute_id + ''-true''}"
		value="true"
		checked="%{#attribute.booleanValue != null && #attribute.booleanValue == true}"
		cssClass="radio" />
		<@wp.i18n key="userprofile_YES" />
</label>
&#32;
<label class="radio inline" for="<@s.property value="%{#attribute_id + ''-false''}" />">
	<@wpsf.radio
		useTabindexAutoIncrement=true
		name="%{#attributeTracer.getFormFieldName(#attribute)}"
		id="%{#attribute_id + ''-false''}"
		value="false"
		checked="%{#attribute.booleanValue != null && #attribute.booleanValue == false}"
		cssClass="radio" />
		<@wp.i18n key="userprofile_NO" />
</label>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front_AttributeInfo',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>

<@s.if test="#attribute.required">
	<abbr class="icon icon-asterisk" title="<@wp.i18n key="userprofile_ENTITY_ATTRIBUTE_MANDATORY_FULL" />"><span class="noscreen"><@wp.i18n key="userprofile_ENTITY_ATTRIBUTE_MANDATORY_SHORT" /></span></abbr>
</@s.if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front_AllList_operationModule',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>
<#assign wpsa=JspTaglibs["/apsadmin-core"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>

<@s.if test="null == #operationButtonDisabled">
	<@s.set var="operationButtonDisabled" value="false" />
</@s.if>
<div class="btn-toolbar">
	<div class="btn-group btn-group-sm">
		<@wpsa.actionParam action="moveListElement" var="actionName" >
			<@wpsa.actionSubParam name="attributeName" value="%{#attribute.name}" />
			<@wpsa.actionSubParam name="listLangCode" value="%{#lang.code}" />
			<@wpsa.actionSubParam name="elementIndex" value="%{#elementIndex}" />
			<@wpsa.actionSubParam name="movement" value="UP" />
		</@wpsa.actionParam>
		<@wpsf.submit disabled="%{#operationButtonDisabled}" action="%{#actionName}" type="button" cssClass="btn btn-default" title="%{getText(''label.moveInPositionNumber'')}: %{#elementIndex}">
		<span class="icon fa fa-sort-desc"></span>
		<span class="sr-only"><@s.text name="label.moveInPositionNumber" />: <@s.property value="%{#elementIndex}" /></span>
		</@wpsf.submit>

		<@wpsa.actionParam action="moveListElement" var="actionName" >
			<@wpsa.actionSubParam name="attributeName" value="%{#attribute.name}" />
			<@wpsa.actionSubParam name="listLangCode" value="%{#lang.code}" />
			<@wpsa.actionSubParam name="elementIndex" value="%{#elementIndex}" />
			<@wpsa.actionSubParam name="movement" value="DOWN" />
		</@wpsa.actionParam>
		<@wpsf.submit disabled="%{#operationButtonDisabled}" action="%{#actionName}" type="button" cssClass="btn btn-default" title="%{getText(''label.moveInPositionNumber'')}: %{#elementIndex+2}">
		<span class="icon fa fa-sort-asc"></span>
		<span class="sr-only"><@s.text name="label.moveInPositionNumber" />: <@s.property value="%{#elementIndex}" /></span>
		</@wpsf.submit>
	</div>
	<div class="btn-group btn-group-sm">
		<@wpsa.actionParam action="removeListElement" var="actionName" >
			<@wpsa.actionSubParam name="attributeName" value="%{#attribute.name}" />
			<@wpsa.actionSubParam name="listLangCode" value="%{#lang.code}" />
			<@wpsa.actionSubParam name="elementIndex" value="%{#elementIndex}" />
		</@wpsa.actionParam>
		<@wpsf.submit disabled="%{#operationButtonDisabled}" action="%{#actionName}" type="button" cssClass="btn btn-default btn-warning" title="%{getText(''label.remove'')}: %{#elementIndex}">
		<span class="icon fa fa-times-circle-o"></span>
		<span class="sr-only"><@s.text name="label.remove" />: <@s.property value="%{#elementIndex}" /></span>
		</@wpsf.submit>
	</div>
</div>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-AllList-addElementButton',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>
<#assign wpsa=JspTaglibs["/apsadmin-core"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>

<@s.set var="add_label"><@wp.i18n key="userprofile_ADDITEM_LIST" /></@s.set>

<@wpsa.actionParam action="addListElement" var="actionName" >
	<@wpsa.actionSubParam name="attributeName" value="%{#attribute.name}" />
	<@wpsa.actionSubParam name="listLangCode" value="%{#lang.code}" />
</@wpsa.actionParam>
<@s.set var="iconImagePath" id="iconImagePath"><@wp.resourceURL/>administration/common/img/icons/list-add.png</@s.set>
<@wpsf.submit
	cssClass="btn"
	useTabindexAutoIncrement=true
	action="%{#actionName}"
	value="%{add_label}"
	title="%{i18n_attribute_name}%{'': ''}%{add_label}" />',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_IteratorAttribute',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>
<#assign wpsa=JspTaglibs["/apsadmin-core"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>
<#assign i18n_attribute_name ><@s.property value="#i18n_attribute_name" /></#assign>
<@s.if test="#attribute.type == ''Boolean''">
	<div class="control-group <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label">
			<@wp.i18n key="${i18n_attribute_name}" />
			<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
		</label>
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-BooleanAttribute" escapeXml=false />
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</div>
</@s.if>
<@s.elseif test="#attribute.type == ''CheckBox''">
	<div class="control-group <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label" for="<@s.property value="#attribute_id" />">
			<@wp.i18n key="${i18n_attribute_name}" />
			<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
		</label>
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-CheckboxAttribute" escapeXml=false />
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</div>
</@s.elseif>
<@s.elseif test="#attribute.type == ''Composite''">
	<div class="well well-small">
		<fieldset class=" <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
			<legend class="margin-medium-top">
				<@wp.i18n key="${i18n_attribute_name}" />
				<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
			</legend>
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
			<@wp.fragment code="userprofile_is_front-CompositeAttribute" escapeXml=false />
		</fieldset>
	</div>
</@s.elseif>
<@s.elseif test="#attribute.type == ''Date''">
	<div class="control-group <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label" for="<@s.property value="#attribute_id" />">
			<@wp.i18n key="${i18n_attribute_name}" />
			<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
		</label>
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-DateAttribute" escapeXml=false />
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</div>
</@s.elseif>
<@s.elseif test="#attribute.type == ''Enumerator''">
	<div class="control-group <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label" for="<@s.property value="#attribute_id" />">
			<@wp.i18n key="${i18n_attribute_name}" />
			<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
		</label>
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-EnumeratorAttribute" escapeXml=false />
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</div>
</@s.elseif>
<@s.elseif test="#attribute.type == ''EnumeratorMap''">
	<div class="control-group <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label" for="<@s.property value="#attribute_id" />">
			<@wp.i18n key="${i18n_attribute_name}" />
			<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
		</label>
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-EnumeratorMapAttribute" escapeXml=false />
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</div>
</@s.elseif>
<@s.elseif test="#attribute.type == ''Hypertext''">
	<div class="control-group <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label" for="<@s.property value="#attribute_id" />">
			<@wp.i18n key="${i18n_attribute_name}" />
			<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
		</label>
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-HypertextAttribute" escapeXml=false />
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</div>
</@s.elseif>
<@s.elseif test="#attribute.type == ''List''">
	<div class="well well-small">
		<fieldset class=" <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
			<legend class="margin-medium-top">
				<@wp.i18n key="${i18n_attribute_name}" />
					<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
			</legend>
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
			<@wp.fragment code="userprofile_is_front-MonolistAttribute" escapeXml=false />
		</fieldset>
	</div>
</@s.elseif>
<@s.elseif test="#attribute.type == ''Longtext''">
	<div class="control-group <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label" for="<@s.property value="#attribute_id" />">
			<@wp.i18n key="${i18n_attribute_name}" />
			<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
		</label>
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-LongtextAttribute" escapeXml=false />
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</div>
</@s.elseif>
<@s.elseif test="#attribute.type == ''Monolist''">
	<div class="well well-small">
		<fieldset class=" <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
			<legend class="margin-medium-top"><@wp.i18n key="${i18n_attribute_name}" />
				<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
			</legend>
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
			<@wp.fragment code="userprofile_is_front-MonolistAttribute" escapeXml=false />
		</fieldset>
	</div>
</@s.elseif>
<@s.elseif test="#attribute.type == ''Monotext''">
	<div class="control-group <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label" for="<@s.property value="#attribute_id" />">
			<@wp.i18n key="${i18n_attribute_name}" />
			<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
		</label>
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-MonotextAttribute" escapeXml=false />
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</div>
</@s.elseif>
<@s.elseif test="#attribute.type == ''Number''">
	<div class="control-group <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label" for="<@s.property value="#attribute_id" />">
			<@wp.i18n key="${i18n_attribute_name}" />
			<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
		</label>
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-NumberAttribute" escapeXml=false />
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</div>
</@s.elseif>
<@s.elseif test="#attribute.type == ''Text''">
	<div class="control-group <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label" for="<@s.property value="#attribute_id" />">
			<@wp.i18n key="${i18n_attribute_name}" />
			<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
		</label>
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-MonotextAttribute" escapeXml=false />
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</div>
</@s.elseif>
<@s.elseif test="#attribute.type == ''ThreeState''">
	<div class="control-group <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label" for="<@s.property value="#attribute_id" />">
			<@wp.i18n key="${i18n_attribute_name}" />
			<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
		</label>
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-ThreeStateAttribute" escapeXml=false />
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</div>
</@s.elseif>
<@s.else> <#-- for all other types, insert a simple label and a input[type="text"] -->
	<div class="control-group <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label" for="<@s.property value="attribute_id" />">
			<@wp.i18n key="${i18n_attribute_name}" />
			<@wp.fragment code="userprofile_is_front_AttributeInfo" escapeXml=false />
		</label>
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-MonotextAttribute" escapeXml=false />
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</div>
</@s.else>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_editCurrentUser_password','userprofile_editCurrentUser_password',NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>
<#assign wpsa=JspTaglibs["/apsadmin-core"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>

<h1><@wp.i18n key="userprofile_EDITPASSWORD" /></h1>

<#if (Session.currentUser != "guest") >

	<form action="<@wp.action path="/ExtStr2/do/Front/CurrentUser/changePassword.action" />" method="post" class="form-horizontal">

	<@s.if test="hasFieldErrors()">
		<div class="alert alert-block">
			<p><strong><@wp.i18n key="userprofile_MESSAGE_TITLE_FIELDERRORS" /></strong></p>
			<ul class="unstyled">
				<@s.iterator value="fieldErrors">
					<@s.iterator value="value">
						<li><@s.property escapeHtml=false /></li>
					</@s.iterator>
				</@s.iterator>
			</ul>
		</div>
	</@s.if>

	<p class="noscreen">
		<wpsf:hidden name="username" />
	</p>

	<div class="control-group">
		<label for="userprofile-old-password" class="control-label"><@wp.i18n key="userprofile_OLDPASSWORD" /></label>
		<div class="controls">
			<@wpsf.password
				useTabindexAutoIncrement=true
				name="oldPassword"
				id="userprofile-old-password" />
		</div>
	</div>

	<div class="control-group">
		<label for="userprofile-new-password" class="control-label"><@wp.i18n key="userprofile_NEWPASS" /></label>
		<div class="controls">
			<@wpsf.password
				useTabindexAutoIncrement=true
				name="password"
				id="userprofile-new-password" />
		</div>
	</div>

	<div class="control-group">
		<label for="userprofile-new-password-confirm" class="control-label"><@wp.i18n key="userprofile_CONFIRM_NEWPASS" /></label>
		<div class="controls">
			<@wpsf.password
				useTabindexAutoIncrement=true
				name="passwordConfirm"
				id="userprofile-new-password-confirm" />
		</div>
	</div>

	<p class="form-actions">
		<@wp.i18n key="userprofile_SAVE_PASSWORD" var="userprofile_SAVE_PASSWORD" />
		<@wpsf.submit
			useTabindexAutoIncrement=true
			value="%{#attr.userprofile_SAVE_PASSWORD}"
			cssClass="btn btn-primary" />
	</p>

	</form>

<#else>
	<p>
		<@wp.i18n key="userprofile_PLEASE_LOGIN_TO_EDIT_PASSWORD" />
	</p>
</#if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-MonolistAttribute',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>
<#assign wpsa=JspTaglibs["/apsadmin-core"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>
<@s.if test="#attribute.attributes.size() != 0">
	<ul class="unstyled">
</@s.if>

<@s.set var="masterListAttributeTracer" value="#attributeTracer" />
<@s.set var="masterListAttribute" value="#attribute" />

<@s.iterator value="#attribute.attributes" var="attribute" status="elementStatus">
	<@s.set var="attributeTracer" value="#masterListAttributeTracer.getMonoListElementTracer(#elementStatus.index)"></@s.set>
	<@s.set var="elementIndex" value="#elementStatus.index" />
	<@s.set var="i18n_attribute_name">userprofile_ATTR<@s.property value="#attribute.name" /></@s.set>
	<@s.set var="attribute_id">userprofile_<@s.property value="#attribute.name" />_<@s.property value="#elementStatus.count" /></@s.set>

	<li class="control-group  <@s.property value="%{'' attribute-type-''+#attribute.type+'' ''}" />">
		<label class="control-label" for="<@s.property value="#attribute_id" />">
			<@s.if test="#attribute.type == ''Composite''">
				<@s.property value="#elementStatus.count" /><span class="noscreen">&#32;<@s.text name="label.compositeAttribute.element" /></span>
				&#32;
				<@s.if test="#lang.default">
					<@wp.fragment code="userprofile_is_front_AllList_operationModule" escapeXml=false />
				</@s.if>
			</@s.if>
			<@s.else>
				<@s.property value="#elementStatus.count" />
				&#32;
				<@wp.fragment code="userprofile_is_front_AllList_operationModule" escapeXml=false />
			</@s.else>
		</label>
		<div class="controls">
			<@s.if test="#attribute.type == ''Boolean''">
				<@wp.fragment code="userprofile_is_front-BooleanAttribute" escapeXml=false />
			</@s.if>
			<@s.elseif test="#attribute.type == ''CheckBox''">
				<@wp.fragment code="userprofile_is_front-CheckboxAttribute" escapeXml=false />
			</@s.elseif>
			<@s.elseif test="#attribute.type == ''Composite''">
				<@wp.fragment code="userprofile_is_front-CompositeAttribute" escapeXml=false />
			</@s.elseif>
			<@s.elseif test="#attribute.type == ''Date''">
				<@wp.fragment code="userprofile_is_front-DateAttribute" escapeXml=false />
			</@s.elseif>
			<@s.elseif test="#attribute.type == ''Enumerator''">
				<@wp.fragment code="userprofile_is_front-EnumeratorAttribute" escapeXml=false />
			</@s.elseif>
			<@s.elseif test="#attribute.type == ''EnumeratorMap''">
				<@wp.fragment code="userprofile_is_front-EnumeratorMapAttribute" escapeXml=false />
			</@s.elseif>
			<@s.elseif test="#attribute.type == ''Hypertext''">
				<@wp.fragment code="userprofile_is_front-HypertextAttribute" escapeXml=false />
			</@s.elseif>
			<@s.elseif test="#attribute.type == ''Longtext''">
				<@wp.fragment code="userprofile_is_front-LongtextAttribute" escapeXml=false />
			</@s.elseif>
			<@s.elseif test="#attribute.type == ''Monotext''">
				<@wp.fragment code="userprofile_is_front-MonotextAttribute" escapeXml=false />
			</@s.elseif>
			<@s.elseif test="#attribute.type == ''Number''">
				<@wp.fragment code="userprofile_is_front-NumberAttribute" escapeXml=false />
			</@s.elseif>
			<@s.elseif test="#attribute.type == ''ThreeState''">
				<@wp.fragment code="userprofile_is_front-ThreeStateAttribute" escapeXml=false />
			</@s.elseif>
			<@s.elseif test="#attribute.type == ''Text''">
				<@wp.fragment code="userprofile_is_front-MonotextAttribute" escapeXml=false />
			</@s.elseif>
			<@s.else>
				<@wp.fragment code="userprofile_is_front-MonotextAttribute" escapeXml=false />
			</@s.else>
			<@wp.fragment code="userprofile_is_front_attributeInfo-help-block" escapeXml=false />
		</div>
	</li>
</@s.iterator>

<@s.set var="attributeTracer" value="#masterListAttributeTracer" />
<@s.set var="attribute" value="#masterListAttribute" />
<@s.set var="elementIndex" value="" />
<@s.if test="#attribute.attributes.size() != 0">
</ul>
</@s.if>
<@s.if test="#lang.default">
	<div class="control-group">
		<div class="controls">
			<@wp.fragment code="userprofile_is_front-AllList-addElementButton" escapeXml=false />
		</div>
	</div>
</@s.if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_profileChangeConfirmation',NULL,NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<h1><@wp.i18n key="userprofile_EDITPROFILE_TITLE" /></h1>
<p><@wp.i18n key="userprofile_PROFILE_UPDATED" /></p>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('entandoapi_is_resource_detail_include',NULL,NULL,'','<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>

<@s.if test="#methodVar == null">
	<p>
		<@s.property value="#currentMethodNameVar" />,&#32;<@wp.i18n key="ENTANDO_API_METHOD_KO" />
	</p>
</@s.if>
<@s.else>
	<dl class="dl-horizontal">
		<dt>
			<@wp.i18n key="ENTANDO_API_METHOD" />
		</dt>
			<dd>
				<@wp.i18n key="ENTANDO_API_METHOD_OK" />
			</dd>
		<@s.if test="#methodVar != null">
			<dt>
				<@wp.i18n key="ENTANDO_API_DESCRIPTION" />
			</dt>
				<dd><@s.property value="#methodVar.description" /></dd>
			<dt>
				<@wp.i18n key="ENTANDO_API_METHOD_AUTHORIZATION" />
			</dt>
				<dd>
					<@s.if test="%{null != #methodVar.requiredPermission}">
						<@s.iterator value="methodAuthorityOptions" var="permission"><@s.if test="#permission.key==#methodVar.requiredPermission"><@s.property value="#permission.value" /></@s.if></@s.iterator>
					</@s.if>
					<@s.elseif test="%{#methodVar.requiredAuth}">
						<@wp.i18n key="ENTANDO_API_METHOD_AUTH_SIMPLE" />
					</@s.elseif>
					<@s.else>
						<@wp.i18n key="ENTANDO_API_METHOD_AUTH_FREE" />
					</@s.else>
				</dd>
			<@s.if test=''%{!#methodVar.resourceName.equalsIgnoreCase("getService")}'' >
			<dt>
				<@wp.i18n key="ENTANDO_API_METHOD_SCHEMAS" />
			</dt>
				<dd class="schemas">
					<@s.if test=''%{#methodVar.httpMethod.toString().equalsIgnoreCase("POST") || #methodVar.httpMethod.toString().equalsIgnoreCase("PUT")}''>
						<@wp.action path="/ExtStr2/do/Front/Api/Resource/requestSchema.action" var="requestSchemaURLVar" >
							<@wp.parameter name="resourceName"><@s.property value="#methodVar.resourceName" /></@wp.parameter>
							<@wp.parameter name="namespace"><@s.property value="#methodVar.namespace" /></@wp.parameter>
							<@wp.parameter name="httpMethod"><@s.property value="#methodVar.httpMethod" /></@wp.parameter>
						</@wp.action>
						<a href="${requestSchemaURLVar}" >
							<@wp.i18n key="ENTANDO_API_METHOD_SCHEMA_REQ" />
						</a>
						<br />
					</@s.if>
						<@wp.action path="/ExtStr2/do/Front/Api/Resource/responseSchema.action" var="responseSchemaURLVar" >
							<@wp.parameter name="resourceName"><@s.property value="#methodVar.resourceName" /></@wp.parameter>
							<@wp.parameter name="namespace"><@s.property value="#methodVar.namespace" /></@wp.parameter>
							<@wp.parameter name="httpMethod"><@s.property value="#methodVar.httpMethod" /></@wp.parameter>
						</@wp.action>
						<a href="${responseSchemaURLVar}" >
							<@wp.i18n key="ENTANDO_API_METHOD_SCHEMA_RESP" />
						</a>
				</dd>
			</@s.if>
		</@s.if>
	</dl>
	<@s.if test="#methodVar != null">
		<@s.set var="methodParametersVar" value="#methodVar.parameters" />
		<@s.if test="null != #methodParametersVar && #methodParametersVar.size() > 0">
			<table class="table table-striped table-bordered table-condensed">
				<caption><@wp.i18n key="ENTANDO_API_METHOD_REQUEST_PARAMS" /></caption>
				<tr>
					<th><@wp.i18n key="ENTANDO_API_PARAM_NAME" /></th>
					<th><@wp.i18n key="ENTANDO_API_PARAM_DESCRIPTION" /></th>
					<th><@wp.i18n key="ENTANDO_API_PARAM_REQUIRED" /></th>
				</tr>
				<@s.iterator value="#methodParametersVar" var="apiParameter" >
					<tr>
						<td><@s.property value="#apiParameter.key" /></td>
						<td><@s.property value="#apiParameter.description" /></td>
						<td class="icon required_<@s.property value="#apiParameter.required" />">
							<@s.if test="#apiParameter.required">
								<@wp.i18n key="YES" />
							</@s.if>
							<@s.else>
								<@wp.i18n key="NO" />
							</@s.else>
						</td>
					</tr>
				</@s.iterator>
			</table>
		</@s.if>
	</@s.if>
</@s.else>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('investments','investments',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<div class="NotificationBar__btn">
    <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Frameinvest.png" />
    Investments
</div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_entryCurrentProfile',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>
<#assign wpsa=JspTaglibs["/apsadmin-core"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>

<#if (Session.currentUser != "guest") >
<form action="<@wp.action path="/ExtStr2/do/Front/CurrentUser/Profile/save.action" />" method="post" class="form-horizontal">
	<@s.if test="hasFieldErrors()">
		<div class="alert alert-block">
			<p><strong><@wp.i18n key="userprofile_MESSAGE_TITLE_FIELDERRORS" /></strong></p>
			<ul class="unstyled">
				<@s.iterator value="fieldErrors">
					<@s.iterator value="value">
						<li><@s.property escapeHtml=false /></li>
					</@s.iterator>
				</@s.iterator>
			</ul>
		</div>
	</@s.if>
	<@s.set var="lang" value="defaultLang" />
	<@s.iterator value="userProfile.attributeList" var="attribute">
		<@s.if test="%{#attribute.active}">
			<@wpsa.tracerFactory var="attributeTracer" lang="%{#lang.code}" />
			<@s.set var="i18n_attribute_name">userprofile_<@s.property value="userProfile.typeCode" />_<@s.property value="#attribute.name" /></@s.set>
			<@s.set var="attribute_id">userprofile_<@s.property value="#attribute.name" /></@s.set>
			<@wp.fragment code="userprofile_is_IteratorAttribute" escapeXml=false />
		</@s.if>
	</@s.iterator>
	<p class="form-actions">
		<@wp.i18n key="userprofile_SAVE_PROFILE" var="userprofile_SAVE_PROFILE" />
		<@wpsf.submit useTabindexAutoIncrement=true value="%{#attr.userprofile_SAVE_PROFILE}" cssClass="btn btn-primary" />
	</p>
</form>
<#else>
	<p><@wp.i18n key="userprofile_PLEASE_LOGIN" /></p>
</#if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_currentWithoutProfile',NULL,NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<h1><@wp.i18n key="userprofile_EDITPROFILE_TITLE" /></h1>
<p class="label label-info">
	<@wp.i18n key="userprofile_CURRENT_USER_WITHOUT_PROFILE" />
</p>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-CheckboxAttribute',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>

<@wpsf.checkbox useTabindexAutoIncrement=true
	name="%{#attributeTracer.getFormFieldName(#attribute)}"
	id="%{attribute_id}" value="%{#attribute.value == true}"/>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-MonotextAttribute',NULL,NULL,NULL,'<#assign wpsf=JspTaglibs["/apsadmin-form"]>
<@wpsf.textfield useTabindexAutoIncrement=true id="%{attribute_id}"
	name="%{#attributeTracer.getFormFieldName(#attribute)}" value="%{#attribute.getTextForLang(#lang.code)}"
	maxlength="254" />',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-LongtextAttribute',NULL,NULL,NULL,'<#assign wpsf=JspTaglibs["/apsadmin-form"]>
<@wpsf.textarea useTabindexAutoIncrement=true cols="30" rows="5" id="%{attribute_id}" name="%{#attributeTracer.getFormFieldName(#attribute)}" value="%{#attribute.getTextForLang(#lang.code)}" />',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-CompositeAttribute',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>
<#assign wpsa=JspTaglibs["/apsadmin-core"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>
<@s.set var="i18n_parent_attribute_name" value="#attribute.name" />
<@s.set var="masterCompositeAttributeTracer" value="#attributeTracer" />
<@s.set var="masterCompositeAttribute" value="#attribute" />
<@s.iterator value="#attribute.attributes" var="attribute">
	<@s.set var="attributeTracer" value="#masterCompositeAttributeTracer.getCompositeTracer(#masterCompositeAttribute)"></@s.set>
	<@s.set var="parentAttribute" value="#masterCompositeAttribute"></@s.set>
	<@s.set var="i18n_attribute_name">userprofile_ATTR<@s.property value="%{i18n_parent_attribute_name}" /><@s.property value="#attribute.name" /></@s.set>
	<@s.set var="attribute_id">userprofile_<@s.property value="%{i18n_parent_attribute_name}" /><@s.property value="#attribute.name" />_<@s.property value="#elementIndex" /></@s.set>
	<@wp.fragment code="userprofile_is_IteratorAttribute" escapeXml=false />
</@s.iterator>
<@s.set var="attributeTracer" value="#masterCompositeAttributeTracer" />
<@s.set var="attribute" value="#masterCompositeAttribute" />
<@s.set var="parentAttribute" value=""></@s.set>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-EnumeratorAttribute',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>
<@wpsf.select useTabindexAutoIncrement=true
	name="%{#attributeTracer.getFormFieldName(#attribute)}"
	id="%{attribute_id}"
	headerKey="" headerValue=""
	list="#attribute.items" value="%{#attribute.getText()}" />',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('userprofile_is_front-EnumeratorMapAttribute',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wpsf=JspTaglibs["/apsadmin-form"]>
<@wpsf.select useTabindexAutoIncrement=true
	name="%{#attributeTracer.getFormFieldName(#attribute)}"
	id="%{attribute_id}"
	headerKey="" headerValue=""
	list="#attribute.mapItems" value="%{#attribute.getText()}" listKey="key" listValue="value" />',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('entandoapi_is_resource_list','entando_apis',NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>

<h2><@wp.i18n key="ENTANDO_API_RESOURCES" /></h2>
<@s.if test="hasActionErrors()">
	<div class="alert alert-block alert-error">
		<h3 class="alert-heading"><@wp.i18n key="ENTANDO_API_ERROR" /></h3>
		<ul>
			<@s.iterator value="actionErrors">
				<li><@s.property escapeHtml=false /></li>
			</@s.iterator>
		</ul>
	</div>
</@s.if>
<@s.set var="resourceFlavoursVar" value="resourceFlavours" />

<@s.if test="#resourceFlavoursVar.size() > 0">
	<@s.set var="icon_free"><span class="icon icon-ok"></span><span class="noscreen sr-only"><@wp.i18n key="ENTANDO_API_METHOD_STATUS_FREE" /></span></@s.set>
	<@s.set var="title_free"><@wp.i18n key="ENTANDO_API_METHOD_STATUS_FREE" />. <@wp.i18n key="ENTANDO_API_GOTO_DETAILS" /></@s.set>

	<@s.set var="icon_auth"><span class="icon icon-user"></span><span class="noscreen sr-only"><@wp.i18n key="ENTANDO_API_METHOD_STATUS_AUTH" /></span></@s.set>
	<@s.set var="title_auth"><@wp.i18n key="ENTANDO_API_METHOD_STATUS_AUTH" />. <@wp.i18n key="ENTANDO_API_GOTO_DETAILS" /></@s.set>

	<@s.set var="icon_lock"><span class="icon icon-lock"></span><span class="noscreen sr-only"><@wp.i18n key="ENTANDO_API_METHOD_STATUS_LOCK" /></span></@s.set>
	<@s.set var="title_lock"><@wp.i18n key="ENTANDO_API_METHOD_STATUS_LOCK" />. <@wp.i18n key="ENTANDO_API_GOTO_DETAILS" /></@s.set>

	<@s.iterator var="resourceFlavourVar" value="#resourceFlavoursVar" status="resourceFlavourStatusVar">
		<table class="table table-striped table-bordered table-condensed">
			<@s.iterator value="#resourceFlavourVar" var="resourceVar" status="statusVar" >
				<@s.if test="#statusVar.first">
					<@s.if test="#resourceVar.source==''core''"><@s.set var="captionVar"><@s.property value="#resourceVar.source" escapeHtml=false /></@s.set></@s.if>
					<@s.else><@s.set var="captionVar"><@s.property value="%{getText(#resourceVar.sectionCode+''.name'')}" escapeHtml=false /></@s.set></@s.else>
					<caption>
						<@s.property value="#captionVar" />
					</caption>
					<tr>
						<th class="span3"><@wp.i18n key="ENTANDO_API_RESOURCE" /></th>
						<th><@wp.i18n key="ENTANDO_API_DESCRIPTION" /></th>
						<th class="text-center span1">GET</th>
						<th class="text-center span1">POST</th>
						<th class="text-center span1">PUT</th>
						<th class="text-center span1">DELETE</th>
					</tr>
				</@s.if>
				<tr>
					<td>
						<@wp.action path="/ExtStr2/do/Front/Api/Resource/detail.action" var="detailActionURL">
							<@wp.parameter name="resourceName"><@s.property value="#resourceVar.resourceName" /></@wp.parameter>
							<@wp.parameter name="namespace"><@s.property value="#resourceVar.namespace" /></@wp.parameter>
						</@wp.action>
						<a title="<@wp.i18n key="ENTANDO_API_GOTO_DETAILS" />:&#32;/<@s.property value="%{#resourceVar.namespace.length()>0?#resourceVar.namespace+''/'':''''}" /><@s.property value="#resourceVar.resourceName" />" href="${detailActionURL}" ><@s.property value="#resourceVar.resourceName" /></a>
					</td>
					<td><@s.property value="#resourceVar.description" /></td>
					<td class="text-center">
						<@s.if test="#resourceVar.getMethod != null && #resourceVar.getMethod.active && (!#resourceVar.getMethod.hidden)" >
							<@s.if test="#resourceVar.getMethod.requiredPermission != null" ><@s.set var="icon" value="#icon_lock" /><@s.set var="title" value="#title_lock" /></@s.if>
							<@s.elseif test="#resourceVar.getMethod.requiredAuth" ><@s.set var="icon" value="#icon_auth" /><@s.set var="title" value="#title_auth" /></@s.elseif>
							<@s.else><@s.set var="icon" value="#icon_free" /><@s.set var="title" value="#title_free" /></@s.else>
							<a href="${detailActionURL}#api_method_GET" title="<@s.property value="#title" />">
								<@s.property value="#icon" escapeHtml=false />
							</a>
						</@s.if>
						<@s.else><abbr title="<@wp.i18n key="ENTANDO_API_METHOD_STATUS_NA" />">&ndash;</abbr></@s.else>
					</td>
					<td class="text-center">
						<@s.if test="#resourceVar.postMethod != null && #resourceVar.postMethod.active && (!#resourceVar.postMethod.hidden)" >
							<@s.if test="#resourceVar.postMethod.requiredPermission != null" ><@s.set var="icon" value="#icon_lock" /><@s.set var="title" value="#title_lock" /></@s.if>
							<@s.elseif test="#resourceVar.postMethod.requiredAuth" ><@s.set var="icon" value="#icon_auth" /><@s.set var="title" value="#title_auth" /></@s.elseif>
							<@s.else><@s.set var="icon" value="#icon_free" /><@s.set var="title" value="#title_free" /></@s.else>
							<a href="${detailActionURL}#api_method_POST" title="<@s.property value="#title" />">
								<@s.property value="#icon" escapeHtml=false />
							</a>
						</@s.if>
						<@s.else><abbr title="<@wp.i18n key="ENTANDO_API_METHOD_STATUS_NA" />">&ndash;</abbr></@s.else>
					</td>
					<td class="text-center">
						<@s.if test="#resourceVar.putMethod != null && #resourceVar.putMethod.active && (!#resourceVar.putMethod.hidden)" >
							<@s.if test="#resourceVar.putMethod.requiredPermission != null" ><@s.set var="icon" value="#icon_lock" /><@s.set var="title" value="#title_lock" /></@s.if>
							<@s.elseif test="#resourceVar.putMethod.requiredAuth" ><@s.set var="icon" value="#icon_auth" /><@s.set var="title" value="#title_auth" /></@s.elseif>
							<@s.else><@s.set var="icon" value="#icon_free" /><@s.set var="title" value="#title_free" /></@s.else>
							<a href="${detailActionURL}#api_method_PUT" title="<@s.property value="#title" />">
								<@s.property value="#icon" escapeHtml=false />
							</a>
						</@s.if>
						<@s.else><abbr title="<@wp.i18n key="ENTANDO_API_METHOD_STATUS_NA" />">&ndash;</abbr></@s.else>
					</td>
					<td class="text-center">
						<@s.if test="#resourceVar.deleteMethod != null && #resourceVar.deleteMethod.active && (!#resourceVar.deleteMethod.hidden)" >
							<@s.if test="#resourceVar.deleteMethod.requiredPermission != null" ><@s.set var="icon" value="#icon_lock" /><@s.set var="title" value="#title_lock" /></@s.if>
							<@s.elseif test="#resourceVar.deleteMethod.requiredAuth" ><@s.set var="icon" value="#icon_auth" /><@s.set var="title" value="#title_auth" /></@s.elseif>
							<@s.else><@s.set var="icon" value="#icon_free" /><@s.set var="title" value="#title_free" /></@s.else>
							<a href="${detailActionURL}#api_method_DELETE" title="<@s.property value="#title" />">
								<@s.property value="#icon" escapeHtml=false />
							</a>
						</@s.if>
						<@s.else><abbr title="<@wp.i18n key="ENTANDO_API_METHOD_STATUS_NA" />">&ndash;</abbr></@s.else>
					</td>
				</tr>
			</@s.iterator>
		</table>

		<@s.if test="#resourceVar.source==''core''">
			<a href="<@wp.action path="/ExtStr2/do/Front/Api/Service/list.action" />" class="btn btn-primary pull-right"><@wp.i18n key="ENTANDO_API_GOTO_SERVICE_LIST" /></a>
		</@s.if>
	</@s.iterator>
</@s.if>
<@s.else>
	<p><@wp.i18n key="ENTANDO_API_NO_RESOURCES" /></p>
</@s.else>
<script>
  $(function () {
    $(''#api-togglers a:first'').tab(''show'');
  })
</script>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('entandoapi_is_resource_detail','entando_apis',NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>

<@s.set var="apiResourceVar" value="apiResource" />
<@s.set var="GETMethodVar" value="#apiResourceVar.getMethod" />
<@s.set var="POSTMethodVar" value="#apiResourceVar.postMethod" />
<@s.set var="PUTMethodVar" value="#apiResourceVar.putMethod" />
<@s.set var="DELETEMethodVar" value="#apiResourceVar.deleteMethod" />
<@s.set var="apiNameVar" value="(#apiResourceVar.namespace!=null && #apiResourceVar.namespace.length()>0 ? ''/'' + #apiResourceVar.namespace : '''')+''/''+#apiResourceVar.resourceName" />
<section>
<p>
	<a href="<@wp.action path="/ExtStr2/do/Front/Api/Resource/list.action" />" class="btn btn-primary"><i class="icon-arrow-left icon-white"></i>&#32;<@wp.i18n key="ENTANDO_API_GOTO_LIST" /></a>
</p>
<h2><@wp.i18n key="ENTANDO_API_RESOURCE" />&#32;<@s.property value="#apiNameVar" /></h2>
<@s.if test="hasActionMessages()">
	<div class="alert alert-box alert-success">
		<h3 class="alert-heading"><@wp.i18n key="ENTANDO_API_ERROR" /></h3>
		<ul>
			<@s.iterator value="actionMessages">
				<li><@s.property escapeHtml=false /></li>
			</@s.iterator>
		</ul>
	</div>
</@s.if>
<@s.if test="hasActionErrors()">
	<div class="alert alert-box alert-error">
		<h3 class="alert-heading"><@wp.i18n key="ENTANDO_API_ERROR" /></h3>
		<ul>
			<@s.iterator value="actionErrors">
				<li><@s.property escapeHtml=false /></li>
			</@s.iterator>
		</ul>
	</div>
</@s.if>
<!-- DESCRIPTION -->
<p><@s.property value="#apiResourceVar.description" /></p>

<!-- INFO -->
<dl class="dl-horizontal">
	<dt><@wp.i18n key="ENTANDO_API_RESOURCE_NAME" /></dt>
		<dd><@s.property value="#apiResourceVar.resourceName" /></dd>
	<dt><span lang="en"><@wp.i18n key="ENTANDO_API_RESOURCE_NAMESPACE" /></span></dt>
		<dd>/<@s.property value="#apiResourceVar.namespace" /></dd>
	<dt><@wp.i18n key="ENTANDO_API_RESOURCE_SOURCE" /></dt>
		<dd>
			<@s.property value="#apiResourceVar.source" /><@s.if test="%{#apiResourceVar.pluginCode != null && #apiResourceVar.pluginCode.length() > 0}">,&#32;<@s.property value="%{getText(#apiResourceVar.pluginCode+''.name'')}" />&#32;(<@s.property value="%{#apiResourceVar.pluginCode}" />)</@s.if>
		</dd>
	<dt><@wp.i18n key="ENTANDO_API_RESOURCE_URI" /></dt>
		<dd>
			<a href="<@wp.info key="systemParam" paramName="applicationBaseURL" />legacyapi/rs/<@wp.info key="currentLang" /><@s.if test="null != #apiResourceVar.namespace">/<@s.property value="#apiResourceVar.namespace" /></@s.if>/<@s.property value="#apiResourceVar.resourceName" />"><@wp.info key="systemParam" paramName="applicationBaseURL" />legacyapi/rs/<@wp.info key="currentLang" /><@s.if test="null != #apiResourceVar.namespace">/<@s.property value="#apiResourceVar.namespace" /></@s.if>/<@s.property value="#apiResourceVar.resourceName" /></a>
		</dd>
	<dt>
		<@wp.i18n key="ENTANDO_API_EXTENSION" />
	</dt>
		<dd>
			<@wp.i18n key="ENTANDO_API_EXTENSION_NOTE" />
		</dd>
</dl>

	<@s.set var="methodVar" value="#GETMethodVar" />
	<@s.set var="currentMethodNameVar" value="%{''GET''}" />
	<h3 id="api_method_GET">GET</h3>
	<@wp.fragment code="entandoapi_is_resource_detail_include" escapeXml=false />

	<@s.set var="methodVar" value="#POSTMethodVar" />
	<@s.set var="currentMethodNameVar" value="%{''POST''}" />
	<h3 id="api_method_POST">POST</h3>
	<@wp.fragment code="entandoapi_is_resource_detail_include" escapeXml=false />

	<@s.set var="methodVar" value="#PUTMethodVar" />
	<@s.set var="currentMethodNameVar" value="%{''PUT''}" />
	<h3 id="api_method_PUT">PUT</h3>
	<@wp.fragment code="entandoapi_is_resource_detail_include" escapeXml=false />

	<@s.set var="methodVar" value="#DELETEMethodVar" />
	<@s.set var="currentMethodNameVar" value="%{''DELETE''}" />
	<h3 id="api_method_DELETE">DELETE</h3>
	<@wp.fragment code="entandoapi_is_resource_detail_include" escapeXml=false />
<p>
	<a href="<@wp.action path="/ExtStr2/do/Front/Api/Resource/list.action" />" class="btn btn-primary"><i class="icon-arrow-left icon-white"></i>&#32;<@wp.i18n key="ENTANDO_API_GOTO_LIST" /></a>
</p>
</section>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('entandoapi_is_service_list','entando_apis',NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>

<section>

<p>
	<a href="<@wp.action path="/ExtStr2/do/Front/Api/Resource/list.action" />" class="btn btn-primary"><i class="icon-arrow-left icon-white"></i>&#32;<@wp.i18n key="ENTANDO_API_GOTO_LIST" /></a>
</p>

<h2><@wp.i18n key="ENTANDO_API_GOTO_SERVICE_LIST" /></h2>
<@s.if test="hasActionErrors()">
	<div class="alert alert-block alert-error">
		<h3 class="alert-heading"><@s.text name="message.title.ActionErrors" /></h3>
		<ul>
			<@s.iterator value="actionErrors">
				<li><@s.property escapeHtml=false /></li>
			</@s.iterator>
		</ul>
	</div>
</@s.if>
<@s.if test="hasFieldErrors()">
	<div class="alert alert-block alert-error">
		<h3 class="alert-heading"><@s.text name="message.title.FieldErrors" /></h3>
		<ul>
			<@s.iterator value="fieldErrors">
				<@s.iterator value="value">
				<li><@s.property escapeHtml=false /></li>
				</@s.iterator>
			</@s.iterator>
		</ul>
	</div>
</@s.if>
<@s.if test="hasActionMessages()">
	<div class="alert alert-block alert-info">
		<h3 class="alert-heading"><@s.text name="messages.confirm" /></h3>
		<ul>
			<@s.iterator value="actionMessages">
				<li><@s.property escapeHtml=false /></li>
			</@s.iterator>
		</ul>
	</div>
</@s.if>
<@s.set var="resourceFlavoursVar" value="resourceFlavours" />
<@s.set var="serviceFlavoursVar" value="serviceFlavours" />

<@s.if test="#serviceFlavoursVar != null && #serviceFlavoursVar.size() > 0">
<div class="tabbable tabs-left">
	<ul class="nav nav-tabs">
		<@s.iterator var="resourceFlavour" value="#resourceFlavoursVar" status="statusVar">
			<@s.set var="serviceGroupVar" value="#resourceFlavour.get(0).getSectionCode()" />
			<@s.set var="servicesByGroupVar" value="#serviceFlavoursVar[#serviceGroupVar]" />
			<@s.if test="null != #servicesByGroupVar && #servicesByGroupVar.size() > 0">
				<@s.if test="#serviceGroupVar == ''core''"><@s.set var="captionVar" value="%{#serviceGroupVar}" /></@s.if>
				<@s.else><@s.set var="captionVar" value="%{getText(#serviceGroupVar + ''.name'')}" /></@s.else>
				<li<@s.if test="#statusVar.first"> class="active"</@s.if>>
					<a href="#api-flavour-<@s.property value=''%{#captionVar.toLowerCase().replaceAll("[^a-z0-9-]", "")}'' />" data-toggle="tab"><@s.property value=''%{#captionVar}'' /></a>
				</li>
			</@s.if>
		</@s.iterator>
	</ul>

  <div class="tab-content">
	<@s.iterator var="resourceFlavour" value="#resourceFlavoursVar" status="moreStatusVar">
		<@s.set var="serviceGroupVar" value="#resourceFlavour.get(0).getSectionCode()" />
		<@s.set var="servicesByGroupVar" value="#serviceFlavoursVar[#serviceGroupVar]" />
		<@s.if test="null != #servicesByGroupVar && #servicesByGroupVar.size() > 0">
			<@s.if test="#serviceGroupVar == ''core''"><@s.set var="captionVar" value="%{#serviceGroupVar}" /></@s.if>
			<@s.else><@s.set var="captionVar" value="%{getText(#serviceGroupVar + ''.name'')}" /></@s.else>
			<div class="tab-pane<@s.if test="#moreStatusVar.first"> active</@s.if>" id="api-flavour-<@s.property value=''%{#captionVar.toLowerCase().replaceAll("[^a-z0-9]", "")}'' />">
			<table class="table table-striped table-bordered table-condensed">
				<caption>
					<@s.property value="#captionVar" />
				</caption>
				<tr>
					<th><@wp.i18n key="ENTANDO_API_SERVICE" /></th>
					<th><@wp.i18n key="ENTANDO_API_DESCRIPTION" /></th>
				</tr>
				<@s.iterator var="serviceVar" value="#servicesByGroupVar" >
					<tr>
						<td class="monospace">
							<@wp.action path="/ExtStr2/do/Front/Api/Service/detail.action" var="detailActionURL">
								<@wp.parameter name="serviceKey"><@s.property value="#serviceVar.key" /></@wp.parameter>
							</@wp.action>
							<a href="${detailActionURL}"><@s.property value="#serviceVar.key" /></a>
						</td>
						<td><@s.property value="#serviceVar.value" /></td>
					</tr>
				</@s.iterator>
			</table>
			</div>
		</@s.if>
	</@s.iterator>
	</div>
</div>
</@s.if>
<@s.else>
<div class="alert alert-block alert-info">
	<p><@wp.i18n key="ENTANDO_API_NO_SERVICES" escapeXml=false /></p>
</div>
</@s.else>

<p>
	<a href="<@wp.action path="/ExtStr2/do/Front/Api/Resource/list.action" />" class="btn btn-primary"><i class="icon-arrow-left icon-white"></i>&#32;<@wp.i18n key="ENTANDO_API_GOTO_LIST" /></a>
</p>

</section>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('entandoapi_is_service_detail','entando_apis',NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<#assign wp=JspTaglibs["/aps-core"]>

<@wp.headInfo type="CSS" info="widgets/api.css"/>
<@s.set var="apiServiceVar" value="%{getApiService(serviceKey)}" />
<div class="entando-api api-resource-detail">
<h2><@wp.i18n key="ENTANDO_API_SERVICE" />&#32;<@s.property value="serviceKey" /></h2>
<@s.if test="hasActionMessages()">
	<div class="message message_confirm">
		<h3><@wp.i18n key="ENTANDO_API_ERROR" /></h3>
		<ul>
			<@s.iterator value="actionMessages">
				<li><@s.property escapeHtml=false /></li>
			</@s.iterator>
		</ul>
	</div>
</@s.if>
<@s.if test="hasActionErrors()">
	<div class="message message_error">
		<h3><@wp.i18n key="ENTANDO_API_ERROR" /></h3>
		<ul>
			<@s.iterator value="actionErrors">
				<li><@s.property escapeHtml=false /></li>
			</@s.iterator>
		</ul>
	</div>
</@s.if>

<p class="description"><@s.property value="getTitle(serviceKey, #apiServiceVar.description)" /></p>

<@s.set var="masterMethodVar" value="#apiServiceVar.master" />

<dl class="dl-horizontal">
	<dt><@wp.i18n key="ENTANDO_API_SERVICE_KEY" /></dt>
		<dd><@s.property value="serviceKey" /></dd>
	<dt><@wp.i18n key="ENTANDO_API_SERVICE_PARENT_API" /></dt>
		<dd><@s.property value="#masterMethodVar.description" />&#32;(/<@s.if test="#masterMethodVar.namespace!=null && #masterMethodVar.namespace.length()>0"><@s.property value="#masterMethodVar.namespace" />/</@s.if><@s.property value="#masterMethodVar.resourceName" />)</dd>
	<dt>
		<@wp.i18n key="ENTANDO_API_SERVICE_AUTHORIZATION" />
	</dt>
		<dd>
			<@s.if test="%{!#apiServiceVar.requiredAuth}" >
				<@wp.i18n key="ENTANDO_API_SERVICE_AUTH_FREE" />
			</@s.if>
			<@s.elseif test="%{null == #apiServiceVar.requiredPermission && null == #apiServiceVar.requiredGroup}">
				<@wp.i18n key="ENTANDO_API_SERVICE_AUTH_SIMPLE" />
			</@s.elseif>
			<@s.else>
				<@s.set var="serviceAuthGroupVar" value="%{getGroup(#apiServiceVar.requiredGroup)}" />
				<@s.set var="serviceAuthPermissionVar" value="%{getPermission(#apiServiceVar.requiredPermission)}" />
				<@s.if test="%{null != #serviceAuthPermissionVar}">
					<@wp.i18n key="ENTANDO_API_SERVICE_AUTH_WITH_PERM" />&#32;<@s.property value="#serviceAuthPermissionVar.description" />
				</@s.if>
				<@s.if test="%{null != #serviceAuthGroupVar}">
					<@s.if test="%{null != #serviceAuthPermissionVar}"><br /></@s.if>
					<@wp.i18n key="ENTANDO_API_SERVICE_AUTH_WITH_GROUP" />&#32;<@s.property value="#serviceAuthGroupVar.descr" />
				</@s.if>
			</@s.else>
		</dd>
	<dt><@wp.i18n key="ENTANDO_API_SERVICE_URI" /></dt>
		<dd>
			<a href="<@wp.info key="systemParam" paramName="applicationBaseURL" />legacyapi/rs/<@wp.info key="currentLang" />/getService?key=<@s.property value="serviceKey" />"><@wp.info key="systemParam" paramName="applicationBaseURL" />legacyapi/rs/<@wp.info key="currentLang" />/getService?key=<@s.property value="serviceKey" /></a>
		</dd>
	<dt>
		<@wp.i18n key="ENTANDO_API_EXTENSION" />
	</dt>
		<dd>
			<@wp.i18n key="ENTANDO_API_EXTENSION_NOTE" />
		</dd>
	<dt>
		<@wp.i18n key="ENTANDO_API_SERVICE_SCHEMAS" />
	</dt>
		<dd class="schemas">
			<@wp.action path="/ExtStr2/do/Front/Api/Service/responseSchema.action" var="responseSchemaURLVar" >
				<@wp.parameter name="serviceKey"><@s.property value="serviceKey" /></@wp.parameter>
			</@wp.action>
			<a href="${responseSchemaURLVar}" >
				<@wp.i18n key="ENTANDO_API_SERVICE_SCHEMA_RESP" />
			</a>
		</dd>
</dl>

<@s.if test="%{null != #apiServiceVar.freeParameters && #apiServiceVar.freeParameters.length > 0}" >
<table class="table table-striped table-bordered table-condensed" summary="<@wp.i18n key="ENTANDO_API_SERVICE_PARAMETERS_SUMMARY" />">
	<caption><span><@wp.i18n key="ENTANDO_API_SERVICE_PARAMETERS" /></span></caption>
	<tr>
		<th><@wp.i18n key="ENTANDO_API_SERVICE_PARAM_NAME" /></th>
		<th><@wp.i18n key="ENTANDO_API_SERVICE_PARAM_DESCRIPTION" /></th>
		<th><@wp.i18n key="ENTANDO_API_SERVICE_PARAM_REQUIRED" /></th>
		<th><@wp.i18n key="ENTANDO_API_SERVICE_PARAM_DEFAULT_VALUE" /></th>
	</tr>
	<@s.iterator value="#apiServiceVar.freeParameters" var="apiParameterNameVar" >
		<@s.set var="apiParameterValueVar" value="%{#apiServiceVar.parameters[#apiParameterNameVar]}" />
		<@s.set var="apiParameterVar" value="%{#apiServiceVar.master.getParameter(#apiParameterNameVar)}" />
		<@s.set var="apiParameterRequiredVar" value="%{#apiParameterVar.required && null == #apiParameterValueVar}" />
		<tr>
			<td><label for="<@s.property value="#apiParameterNameVar" />"><@s.property value="#apiParameterNameVar" /></label></td>
			<td><@s.property value="%{#apiParameterVar.description}" /></td>
			<td class="icon required_<@s.property value="#apiParameterRequiredVar" />">
				<@s.if test="#apiParameterRequiredVar" ><@wp.i18n key="YES" /></@s.if>
				<@s.else><@wp.i18n key="NO" /></@s.else>
			</td>
			<td><@s.if test="null != #apiParameterValueVar"><@s.property value="#apiParameterValueVar" /></@s.if><@s.else>-</@s.else></td>
		</tr>
	</@s.iterator>
</table>
</@s.if>
<p class="api-back">
	<a class="btn btn-primary" href="<@wp.action path="/ExtStr2/do/Front/Api/Resource/list.action" />"><span class="icon-arrow-left icon-white"></span>&#32;<@wp.i18n key="ENTANDO_API_GOTO_LIST" /></a>
</p>
</div>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('login_form','login_form',NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<h1><@wp.i18n key="RESERVED_AREA" /></h1>
<#if (Session.currentUser.username != "guest") >
	<p><@wp.i18n key="WELCOME" />, <em>${Session.currentUser}</em>!</p>
	<#if (Session.currentUser.entandoUser) >
	<table class="table table-condensed">
		<tr>
			<th><@wp.i18n key="USER_DATE_CREATION" /></th>
			<th><@wp.i18n key="USER_DATE_ACCESS_LAST" /></th>
			<th><@wp.i18n key="USER_DATE_PASSWORD_CHANGE_LAST" /></th>
		</tr>
		<tr>
			<td>${Session.currentUser.creationDate?default("-")}</td>
			<td>${Session.currentUser.lastAccess?default("-")}</td>
			<td>${Session.currentUser.lastPasswordChange?default("-")}</td>
		</tr>
	</table>
		<#if (!Session.currentUser.credentialsNotExpired) >
		<div class="alert alert-block">
			<p><@wp.i18n key="USER_STATUS_EXPIRED_PASSWORD" />: <a href="<@wp.info key="systemParam" paramName="applicationBaseURL" />do/editPassword.action"><@wp.i18n key="USER_STATUS_EXPIRED_PASSWORD_CHANGE" /></a></p>
		</div>
		</#if>
	</#if>
	<@wp.ifauthorized permission="enterBackend">
	<div class="btn-group">
		<a href="<@wp.info key="systemParam" paramName="applicationBaseURL" />do/main.action?request_locale=<@wp.info key="currentLang" />" class="btn"><@wp.i18n key="ADMINISTRATION" /></a>
	</div>
	</@wp.ifauthorized>
	<p class="pull-right"><a href="<@wp.info key="systemParam" paramName="applicationBaseURL" />do/logout.action" class="btn"><@wp.i18n key="LOGOUT" /></a></p>
	<@wp.pageWithWidget widgetTypeCode="userprofile_editCurrentUser" var="userprofileEditingPageVar" listResult=false />
	<#if (userprofileEditingPageVar??) >
	<p><a href="<@wp.url page="${userprofileEditingPageVar.code}" />" ><@wp.i18n key="userprofile_CONFIGURATION" /></a></p>
	</#if>
<#else>
	<#if (accountExpired?? && accountExpired == true) >
	<div class="alert alert-block alert-error">
		<p><@wp.i18n key="USER_STATUS_EXPIRED" /></p>
	</div>
	</#if>
	<#if (wrongAccountCredential?? && wrongAccountCredential == true) >
	<div class="alert alert-block alert-error">
		<p><@wp.i18n key="USER_STATUS_CREDENTIALS_INVALID" /></p>
	</div>
	</#if>
	<form action="<@wp.url/>" method="post" class="form-horizontal margin-medium-top">
		<#if (RequestParameters.returnUrl??) >
		<input type="hidden" name="returnUrl" value="${RequestParameters.returnUrl}" />
		</#if>
		<div class="control-group">
			<label for="username" class="control-label"><@wp.i18n key="USERNAME" /></label>
			<div class="controls">
				<input id="username" type="text" name="username" class="input-xlarge" />
			</div>
		</div>
		<div class="control-group">
			<label for="password" class="control-label"><@wp.i18n key="PASSWORD" /></label>
			<div class="controls">
				<input id="password" type="password" name="password" class="input-xlarge" />
			</div>
		</div>
		<div class="form-actions">
			<input type="submit" value="<@wp.i18n key="SIGNIN" />" class="btn btn-primary" />
		</div>
	</form>
</#if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('internal_servlet_generic_error',NULL,NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<@wp.i18n key="GENERIC_ERROR" />',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('internal_servlet_user_not_allowed',NULL,NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<@wp.i18n key="USER_NOT_ALLOWED" />',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('messages_system','messages_system',NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]>

<#assign currentPageCode><@wp.currentPage param="code" /></#assign>

<#if (currentPageCode == ''notfound'')>
<div class="alert alert-error alert-block">
	<h1 class="alert-heading"><@wp.i18n key="PAGE_NOT_FOUND" escapeXml=false /></h1>
</div>
</#if>
<#if (currentPageCode == ''errorpage'')>
<div class="alert alert-error alert-block">
	<h1 class="alert-heading"><@wp.i18n key="GENERIC_ERROR" escapeXml=false /></h1>
</div>
</#if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('default_pagerInfo_is',NULL,NULL,NULL,'<#assign s=JspTaglibs["/struts-tags"]>
<p><@s.text name="note.searchIntro" />&#32;<@s.property value="#group.size" />&#32;<@s.text name="note.searchOutro" />.<br />
<@s.text name="label.page" />: [<@s.property value="#group.currItem" />/<@s.property value="#group.maxItem" />].</p>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('default_pagerFormBlock_is',NULL,NULL,NULL,'<#assign wpsf=JspTaglibs["/apsadmin-form"]>
<#assign s=JspTaglibs["/struts-tags"]>
<@s.if test="#group.size > #group.max">
<ul class="pagination">
	<@s.if test="null != #group.pagerId">
		<@s.set var="pagerIdMarker" value="#group.pagerId" />
	</@s.if>
	<@s.else>
		<@s.set var="pagerIdMarker">pagerItem</@s.set>
	</@s.else>
	<@s.if test="#group.advanced">
	<li>
		<@wpsf.submit name="%{#pagerIdMarker + ''_1''}" type="button" disabled="%{1 == #group.currItem}" title="%{getText(''label.goToFirst'')}">
			<span class="icon fa fa-step-backward"></span>
		</@wpsf.submit>
	</li>
	<li>
		<@wpsf.submit name="%{#pagerIdMarker + ''_'' + (#group.currItem - #group.offset) }" type="button" disabled="%{1 == #group.beginItemAnchor}" title="%{getText(''label.jump'') + '' '' + #group.offset + '' '' + getText(''label.backward'')}">
			<span class="icon fa fa-fast-backward"></span>
		</@wpsf.submit>
	</li>
	</@s.if>
	<li>
		<@wpsf.submit name="%{#pagerIdMarker + ''_'' + #group.prevItem}" type="button" title="%{getText(''label.prev.full'')}" disabled="%{1 == #group.currItem}">
			<span class="icon fa fa-long-arrow-left"></span>
		</@wpsf.submit>
	</li>
	<@s.subset source="#group.items" count="#group.endItemAnchor-#group.beginItemAnchor+1" start="#group.beginItemAnchor-1">
		<@s.iterator id="item">
			<li>
				<@wpsf.submit name="%{#pagerIdMarker + ''_'' + #item}" type="button" disabled="%{#item == #group.currItem}">
					<@s.property value="%{#item}" />
				</@wpsf.submit>
			</li>
		</@s.iterator>
	</@s.subset>
	<li>
		<@wpsf.submit name="%{#pagerIdMarker + ''_'' + #group.nextItem}" type="button" title="%{getText(''label.next.full'')}" disabled="%{#group.maxItem == #group.currItem}">
			<span class="icon fa fa-long-arrow-right"></span>
		</@wpsf.submit>
	</li>
	<@s.if test="#group.advanced">
	<@s.set var="jumpForwardStep" value="#group.currItem + #group.offset"></@s.set>
	<li>
		<@wpsf.submit name="%{#pagerIdMarker + ''_'' + (#jumpForwardStep)}" type="button" disabled="%{#group.maxItem == #group.endItemAnchor}" title="%{getText(''label.jump'') + '' '' + #group.offset + '' '' + getText(''label.forward'')}">
			<span class="icon fa fa-fast-forward"></span>
		</@wpsf.submit>
	</li>
	<li>
		<@wpsf.submit name="%{#pagerIdMarker + ''_'' + #group.size}" type="button" disabled="%{#group.maxItem == #group.currItem}" title="%{getText(''label.goToLast'')}">
			<span class="icon fa fa-step-forward"></span>
		</@wpsf.submit>
	</li>
	</@s.if>
	<@s.set var="pagerIdMarker" value="null" />
</ul>
</@s.if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('seedscard-transaction-table','seedscard-transaction-table',NULL,'<#assign wp=JspTaglibs[ "/aps-core"]>
<script async src="<@wp.resourceURL />widgets/seedscard-transaction/runtime.js"></script>
<script async src="<@wp.resourceURL />widgets/seedscard-transaction/vendor.js"></script>
<script async src="<@wp.resourceURL />widgets/seedscard-transaction/main.js"></script>
<seedscardtransaction-table   pagination-mode="pagination" />',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list_userfilter_ent_EnumerMap',NULL,'jacms',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign formFieldNameVar = userFilterOptionVar.formFieldNames[0] >
<#assign formFieldValue = userFilterOptionVar.getFormFieldValue(formFieldNameVar) >
<#assign i18n_Attribute_Key = userFilterOptionVar.attribute.name >
<div class="control-group">
	<label for="${formFieldNameVar}" class="control-label"><@wp.i18n key="${i18n_Attribute_Key}" /></label>
	<div class="controls">
		<select name="${formFieldNameVar}" id="${formFieldNameVar}" class="input-xlarge">
			<option value=""><@wp.i18n key="ALL" /></option>
			<#list userFilterOptionVar.attribute.mapItems as enumeratorMapItemVar>
			<option value="${enumeratorMapItemVar.key}" <#if (formFieldValue??) && (enumeratorMapItemVar.key == formFieldValue)>selected="selected"</#if> >${enumeratorMapItemVar.value}</option>
			</#list>
		</select>
	</div>
</div>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list_userfilter_ent_Number',NULL,'jacms',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<fieldset>
<legend>
<#assign i18n_Attribute_Key = userFilterOptionVar.attribute.name >
<@wp.i18n key="${i18n_Attribute_Key}" />
</legend>
<div class="control-group">
	<#assign formFieldStartNameVar = userFilterOptionVar.formFieldNames[0] >
	<#assign formFieldStartValueVar = userFilterOptionVar.getFormFieldValue(formFieldStartNameVar) >
	<label for="${formFieldStartNameVar}" class="control-label">
		<@wp.i18n key="NUMBER_FROM" />
	</label>
	<div class="controls">
		<input id="${formFieldStartNameVar}" name="${formFieldStartNameVar}" value="${formFieldStartValueVar?default("")}" type="number" class="input-medium" />
	</div>
</div>
<div class="control-group">
	<#assign formFieldEndNameVar = userFilterOptionVar.formFieldNames[1] >
	<#assign formFieldEndValueVar = userFilterOptionVar.getFormFieldValue(formFieldEndNameVar) >
	<label for="${formFieldEndNameVar}" class="control-label">
		<@wp.i18n key="NUMBER_TO" />
	</label>
	<div class="controls">
		<input id="${formFieldEndNameVar}" name="${formFieldEndNameVar}" value="${formFieldEndValueVar?default("")}" type="number" class="input-medium" />
	</div>
</div>
</fieldset>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list_userfilter_met_fulltext',NULL,'jacms',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign formFieldNameVar = userFilterOptionVar.formFieldNames[0] >
<#assign formFieldValue = userFilterOptionVar.getFormFieldValue(formFieldNameVar) >
<div class="control-group">
    <label for="${formFieldNameVar}" class="control-label"><@wp.i18n key="TEXT" /></label>
    <div class="controls">
        <input name="${formFieldNameVar}" id="${formFieldNameVar}" value="${formFieldValue}" type="text" class="input-xlarge"/>
    </div>
</div>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer','content_viewer','jacms',NULL,'<#assign jacms=JspTaglibs["/jacms-aps-core"]>
<#assign wp=JspTaglibs["/aps-core"]>
<@jacms.contentInfo param="authToEdit" var="canEditThis" />
<@jacms.contentInfo param="contentId" var="myContentId" />
<#if (canEditThis?? && canEditThis)>
	<div class="bar-content-edit">
		<a href="<@wp.info key="systemParam" paramName="applicationBaseURL" />do/jacms/Content/edit.action?contentId=<@jacms.contentInfo param="contentId" />" class="btn btn-info">
		<@wp.i18n key="EDIT_THIS_CONTENT" /> <i class="icon-edit icon-white"></i></a>
	</div>
</#if>
<@jacms.content publishExtraTitle=true />',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list_userfilters',NULL,'jacms','<#assign wp=JspTaglibs["/aps-core"]>
<#if (userFilterOptionsVar??) && userFilterOptionsVar?has_content && (userFilterOptionsVar?size > 0)>
<div class="row-fluid">
    <div class="filter-wrapper">
        <#assign hasUserFilterError = false >
        <#list userFilterOptionsVar as userFilterOptionVar>
        <#if (userFilterOptionVar.formFieldErrors??) && userFilterOptionVar.formFieldErrors?has_content && (userFilterOptionVar.formFieldErrors?size > 0)>
        <#assign hasUserFilterError = true >
        </#if>
        </#list>
        <#if (hasUserFilterError)>
        <div class="alert alert-error">
            <a class="close" data-dismiss="alert" href="#">
                <i class="icon-remove"></i>
            </a>
            <h2 class="alert-heading"><@wp.i18n key="ERRORS" /></h2>
            <ul>
                <#list userFilterOptionsVar as userFilterOptionVar>
                <#if (userFilterOptionVar.formFieldErrors??) && (userFilterOptionVar.formFieldErrors?size > 0)>
                <#assign formFieldErrorsVar = userFilterOptionVar.formFieldErrors >
                <#list formFieldErrorsVar?keys as formFieldErrorKey>
                <li>
                    <@wp.i18n key="jacms_LIST_VIEWER_FIELD" />&#32;<em>${formFieldErrorsVar[formFieldErrorKey].attributeName}</em><#if (formFieldErrorsVar[formFieldErrorKey].rangeFieldType??)>:&#32;<em><@wp.i18n key="${formFieldErrorsVar[formFieldErrorKey].rangeFieldType}" /></em></#if>&#32;<@wp.i18n key="${formFieldErrorsVar[formFieldErrorKey].errorKey}" />
                </li>
                </#list>
                </#if>
                </#list>
            </ul>
        </div>
        </#if>
        <#assign hasUserFilterError = false >
        <form action="<@wp.url />" method="post" class="form-horizontal" id="content-viewer-list-filters">
            <div class="form-inline">
                <#list userFilterOptionsVar as userFilterOptionVar>
                <@wp.freemarkerTemplateParameter var="userFilterOptionVar" valueName="userFilterOptionVar" removeOnEndTag=true >
                <#if !userFilterOptionVar.attributeFilter && (userFilterOptionVar.key == "fulltext" || userFilterOptionVar.key == "category")>
                <@wp.fragment code="jacms_content_viewer_list_userfilter_met_${userFilterOptionVar.key}" escapeXml=false />
                </#if>
                <#if userFilterOptionVar.attributeFilter >
                <#if userFilterOptionVar.attribute.type == "Monotext" || userFilterOptionVar.attribute.type == "Text" || userFilterOptionVar.attribute.type == "Longtext" || userFilterOptionVar.attribute.type == "Hypertext">
                <@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Text" escapeXml=false />
                </#if>
                <#if userFilterOptionVar.attribute.type == "Enumerator" >
                <@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Enumer" escapeXml=false />
                </#if>
                <#if userFilterOptionVar.attribute.type == "EnumeratorMap" >
                <@wp.fragment code="jacms_content_viewer_list_userfilter_ent_EnumerMap" escapeXml=false />
                </#if>
                <#if userFilterOptionVar.attribute.type == "Number">
                <@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Number" escapeXml=false />
                </#if>
                <#if userFilterOptionVar.attribute.type == "Date">
                <@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Date" escapeXml=false />
                </#if>
                <#if userFilterOptionVar.attribute.type == "Boolean">
                <@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Boolean" escapeXml=false />
                </#if>
                <#if userFilterOptionVar.attribute.type == "CheckBox">
                <@wp.fragment code="jacms_content_viewer_list_userfilter_ent_CheckBox" escapeXml=false />
                </#if>
                <#if userFilterOptionVar.attribute.type == "ThreeState">
                <@wp.fragment code="jacms_content_viewer_list_userfilter_ent_ThreeSt" escapeXml=false />
                </#if>
                </#if>
                </@wp.freemarkerTemplateParameter>
                </#list>
                <div class="form-group">
                    <input type="submit" value="<@wp.i18n key="SEARCH" />" class="btn login" />
                </div>
            </div>
        </form>
    </div>
</div>
</#if>','<#assign wp=JspTaglibs["/aps-core"]>
<#if (userFilterOptionsVar??) && userFilterOptionsVar?has_content && (userFilterOptionsVar?size > 0)>
<div class="row-fluid"><div class="span12 padding-medium-top">
<#assign hasUserFilterError = false >
<#list userFilterOptionsVar as userFilterOptionVar>
<#if (userFilterOptionVar.formFieldErrors??) && userFilterOptionVar.formFieldErrors?has_content && (userFilterOptionVar.formFieldErrors?size > 0)>
<#assign hasUserFilterError = true >
</#if>
</#list>
<#if (hasUserFilterError)>
<div class="alert alert-error">
	<a class="close" data-dismiss="alert" href="#"><i class="icon-remove"></i></a>
	<h2 class="alert-heading"><@wp.i18n key="ERRORS" /></h2>
	<ul>
		<#list userFilterOptionsVar as userFilterOptionVar>
			<#if (userFilterOptionVar.formFieldErrors??) && (userFilterOptionVar.formFieldErrors?size > 0)>
			<#assign formFieldErrorsVar = userFilterOptionVar.formFieldErrors >
			<#list formFieldErrorsVar?keys as formFieldErrorKey>
			<li>
			<@wp.i18n key="jacms_LIST_VIEWER_FIELD" />&#32;<em>${formFieldErrorsVar[formFieldErrorKey].attributeName}</em><#if (formFieldErrorsVar[formFieldErrorKey].rangeFieldType??)>:&#32;<em><@wp.i18n key="${formFieldErrorsVar[formFieldErrorKey].rangeFieldType}" /></em></#if>&#32;<@wp.i18n key="${formFieldErrorsVar[formFieldErrorKey].errorKey}" />
			</li>
			</#list>
			</#if>
		</#list>
	</ul>
</div>
</#if>
<#assign hasUserFilterError = false >
<p><button type="button" class="btn btn-info" data-toggle="collapse" data-target="#content-viewer-list-filters"><@wp.i18n key="SEARCH_FILTERS_BUTTON" /> <i class="icon-zoom-in icon-white"></i></button></p>
<form action="<@wp.url />" method="post" class="form-horizontal collapse" id="content-viewer-list-filters">
	<#list userFilterOptionsVar as userFilterOptionVar>
		<@wp.freemarkerTemplateParameter var="userFilterOptionVar" valueName="userFilterOptionVar" removeOnEndTag=true >
		<#if !userFilterOptionVar.attributeFilter && (userFilterOptionVar.key == "fulltext" || userFilterOptionVar.key == "category")>
			<@wp.fragment code="jacms_content_viewer_list_userfilter_met_${userFilterOptionVar.key}" escapeXml=false />
		</#if>
		<#if userFilterOptionVar.attributeFilter >
			<#if userFilterOptionVar.attribute.type == "Monotext" || userFilterOptionVar.attribute.type == "Text" || userFilterOptionVar.attribute.type == "Longtext" || userFilterOptionVar.attribute.type == "Hypertext">
				<@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Text" escapeXml=false />
			</#if>
			<#if userFilterOptionVar.attribute.type == "Enumerator" >
				<@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Enumer" escapeXml=false />
			</#if>
			<#if userFilterOptionVar.attribute.type == "EnumeratorMap" >
				<@wp.fragment code="jacms_content_viewer_list_userfilter_ent_EnumerMap" escapeXml=false />
			</#if>
			<#if userFilterOptionVar.attribute.type == "Number">
				<@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Number" escapeXml=false />
			</#if>
			<#if userFilterOptionVar.attribute.type == "Date">
				<@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Date" escapeXml=false />
			</#if>
			<#if userFilterOptionVar.attribute.type == "Boolean">
				<@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Boolean" escapeXml=false />
			</#if>
			<#if userFilterOptionVar.attribute.type == "CheckBox">
				<@wp.fragment code="jacms_content_viewer_list_userfilter_ent_CheckBox" escapeXml=false />
			</#if>
			<#if userFilterOptionVar.attribute.type == "ThreeState">
				<@wp.fragment code="jacms_content_viewer_list_userfilter_ent_ThreeSt" escapeXml=false />
			</#if>
		</#if>
		</@wp.freemarkerTemplateParameter>
	</#list>
	<p class="form-actions">
		<input type="submit" value="<@wp.i18n key="SEARCH" />" class="btn btn-primary" />
	</p>
</form>
</div></div>
</#if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list_userfilter_met_category',NULL,'jacms','<#assign wp=JspTaglibs["/aps-core"]>
<#assign formFieldNameVar = userFilterOptionVar.formFieldNames[0] >
<#assign formFieldValue = userFilterOptionVar.getFormFieldValue(formFieldNameVar) >
<#assign userFilterCategoryCodeVar = userFilterOptionVar.userFilterCategoryCode?default("") >
<@wp.categories var="systemCategories" titleStyle="prettyFull" root="${userFilterCategoryCodeVar}" />
 
<div class="form-group">
  <select id="category" name="${formFieldNameVar}" class="form-control">
   <option value=""><@wp.i18n key="ALL" /></option>
   <#list systemCategories as systemCategory>
   <option value="${systemCategory.key}" <#if (formFieldValue == systemCategory.key)>selected="selected"</#if> >${systemCategory.value}</option>
   </#list>
  </select>
</div>','<#assign wp=JspTaglibs["/aps-core"]>
<#assign formFieldNameVar = userFilterOptionVar.formFieldNames[0] >
<#assign formFieldValue = userFilterOptionVar.getFormFieldValue(formFieldNameVar) >
<#assign userFilterCategoryCodeVar = userFilterOptionVar.userFilterCategoryCode?default("") >
<@wp.categories var="systemCategories" titleStyle="prettyFull" root="${userFilterCategoryCodeVar}" />
<div class="control-group">
	<label for="category" class="control-label"><@wp.i18n key="CATEGORY" /></label>
	<div class="controls">
		<select id="category" name="${formFieldNameVar}" class="input-xlarge">
			<option value=""><@wp.i18n key="ALL" /></option>
			<#list systemCategories as systemCategory>
			<option value="${systemCategory.key}" <#if (formFieldValue == systemCategory.key)>selected="selected"</#if> >${systemCategory.value}</option>
			</#list>
		</select>
	</div>
</div>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list_userfilter_ent_Date',NULL,'jacms',NULL,'<#assign wp=JspTaglibs["/aps-core"]>

<#assign currentLangVar ><@wp.info key="currentLang" /></#assign>

<#assign js_for_datepicker="jQuery(function($){
	$.datepicker.regional[''it''] = {
		closeText: ''Chiudi'',
		prevText: ''&#x3c;Prec'',
		nextText: ''Succ&#x3e;'',
		currentText: ''Oggi'',
		monthNames: [''Gennaio'',''Febbraio'',''Marzo'',''Aprile'',''Maggio'',''Giugno'',
			''Luglio'',''Agosto'',''Settembre'',''Ottobre'',''Novembre'',''Dicembre''],
		monthNamesShort: [''Gen'',''Feb'',''Mar'',''Apr'',''Mag'',''Giu'',
			''Lug'',''Ago'',''Set'',''Ott'',''Nov'',''Dic''],
		dayNames: [''Domenica'',''Luned&#236'',''Marted&#236'',''Mercoled&#236'',''Gioved&#236'',''Venerd&#236'',''Sabato''],
		dayNamesShort: [''Dom'',''Lun'',''Mar'',''Mer'',''Gio'',''Ven'',''Sab''],
		dayNamesMin: [''Do'',''Lu'',''Ma'',''Me'',''Gi'',''Ve'',''Sa''],
		weekHeader: ''Sm'',
		dateFormat: ''yy-mm-dd'',
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''''};
});

jQuery(function($){
	if (Modernizr.touch && Modernizr.inputtypes.date) {
		$.each(	$(''input[data-isdate=true]''), function(index, item) {
			item.type = ''date'';
		});
	} else {
		$.datepicker.setDefaults( $.datepicker.regional[''${currentLangVar}''] );
		$(''input[data-isdate=true]'').datepicker({
      			changeMonth: true,
      			changeYear: true,
      			dateFormat: ''yyyy-mm-dd''
    		});
	}
});" >

<@wp.headInfo type="JS" info="entando-misc-html5-essentials/modernizr-2.5.3-full.js" />
<@wp.headInfo type="JS_EXT" info="http://code.jquery.com/ui/1.10.0/jquery-ui.min.js" />
<@wp.headInfo type="CSS_EXT" info="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.min.css" />
<@wp.headInfo type="JS_RAW" info="${js_for_datepicker}" />
<fieldset>
<legend>
<#assign i18n_Attribute_Key = userFilterOptionVar.attribute.name >
<@wp.i18n key="${i18n_Attribute_Key}" />
</legend>
<div class="control-group">
	<#assign formFieldStartNameVar = userFilterOptionVar.formFieldNames[0] >
	<#assign formFieldStartValueVar = userFilterOptionVar.getFormFieldValue(formFieldStartNameVar) >
	<label for="${formFieldStartNameVar}" class="control-label">
		<@wp.i18n key="DATE_FROM" />
	</label>
	<div class="controls">
		<input id="${formFieldStartNameVar}" name="${formFieldStartNameVar}" value="${formFieldStartValueVar?default("")}" type="text" data-isdate="true" class="input-xlarge" />
	</div>
</div>
<div class="control-group">
	<#assign formFieldEndNameVar = userFilterOptionVar.formFieldNames[1] >
	<#assign formFieldEndValueVar = userFilterOptionVar.getFormFieldValue(formFieldEndNameVar) >
	<label for="${formFieldEndNameVar}" class="control-label">
		<@wp.i18n key="DATE_TO" />
	</label>
	<div class="controls">
		<input id="${formFieldEndNameVar}" name="${formFieldEndNameVar}" value="${formFieldEndValueVar?default("")}" type="text" data-isdate="true" class="input-xlarge" />
	</div>
</div>
</fieldset>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list_userfilter_ent_Boolean',NULL,'jacms',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign formFieldNameVar = userFilterOptionVar.formFieldNames[0] >
<#assign formFieldValue = userFilterOptionVar.getFormFieldValue(formFieldNameVar) >
<#assign i18n_Attribute_Key = userFilterOptionVar.attribute.name >
<fieldset>
<legend><@wp.i18n key="${i18n_Attribute_Key}" /></legend>
<@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Bool_io" escapeXml=false />
<div class="control-group">
	<div class="controls">
		<label for="${formFieldNameVar}" class="radio">
		<input name="${formFieldNameVar}" id="true_${formFieldNameVar}" <#if (formFieldValue??) && (formFieldValue == "true")>checked="checked"</#if> value="true" type="radio" />
		<@wp.i18n key="YES"/></label>
	</div>
	<div class="controls">
		<label for="false_${formFieldNameVar}" class="radio">
		<input name="${formFieldNameVar}" id="false_${formFieldNameVar}" <#if (formFieldValue??) && (formFieldValue == "false")>checked="checked"</#if> value="false" type="radio" />
		<@wp.i18n key="NO"/></label>
	</div>
</div>
</fieldset>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list_userfilter_ent_Bool_io',NULL,'jacms',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign formFieldNameControlVar = userFilterOptionVar.formFieldNames[2] >
<input name="${formFieldNameControlVar}" type="hidden" value="true" />
<#assign formFieldNameIgnoreVar = userFilterOptionVar.formFieldNames[1] >
<#assign formFieldIgnoreValue = userFilterOptionVar.getFormFieldValue(formFieldNameIgnoreVar) >
<#assign formFieldControlValue = userFilterOptionVar.getFormFieldValue(formFieldNameControlVar) >
<div class="controls">
	<label for="ignore_${formFieldNameIgnoreVar}" class="checkbox">
	<input id="ignore_${formFieldNameIgnoreVar}" name="${formFieldNameIgnoreVar}" <#if (formFieldIgnoreValue?? && formFieldIgnoreValue == "true")>checked="checked"</#if> value="true" type="checkbox" />
	<@wp.i18n key="IGNORE" /></label>
</div>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list_userfilter_ent_CheckBox',NULL,'jacms',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign formFieldNameVar = userFilterOptionVar.formFieldNames[0] >
<#assign formFieldValue = userFilterOptionVar.getFormFieldValue(formFieldNameVar) >
<#assign i18n_Attribute_Key = userFilterOptionVar.attribute.name >
<fieldset>
<legend><@wp.i18n key="${i18n_Attribute_Key}" /></legend>
<@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Bool_io" escapeXml=false />
<div class="control-group">
	<div class="controls">
		<label for="true_${formFieldNameVar}" class="checkbox">
		<input name="${formFieldNameVar}" id="true_${formFieldNameVar}" <#if (formFieldValue??) && (formFieldValue == "true")>checked="checked"</#if> value="true" type="checkbox" />
		<@wp.i18n key="YES"/></label>
	</div>
</div>
</fieldset>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list_userfilter_ent_ThreeSt',NULL,'jacms',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign formFieldNameVar = userFilterOptionVar.formFieldNames[0] >
<#assign formFieldValue = userFilterOptionVar.getFormFieldValue(formFieldNameVar) >
<#assign i18n_Attribute_Key = userFilterOptionVar.attribute.name >
<fieldset>
<legend><@wp.i18n key="${i18n_Attribute_Key}" /></legend>
<@wp.fragment code="jacms_content_viewer_list_userfilter_ent_Bool_io" escapeXml=false />
<div class="control-group">
	<div class="controls">
		<label for="true_${formFieldNameVar}" class="radio">
		<input name="${formFieldNameVar}" id="true_${formFieldNameVar}" <#if (formFieldValue??) && (formFieldValue == "true")>checked="checked"</#if> value="true" type="radio" />
		<@wp.i18n key="YES"/></label>
		<label for="false_${formFieldNameVar}" class="radio">
		<input name="${formFieldNameVar}" id="false_${formFieldNameVar}" <#if (formFieldValue??) && (formFieldValue == "false")>checked="checked"</#if> value="false" type="radio" />
		<@wp.i18n key="NO"/></label>
		<label for="both_${formFieldNameVar}" class="radio">
		<input name="${formFieldNameVar}" id="both_${formFieldNameVar}" <#if (formFieldValue??) && (formFieldValue == "both")>checked="checked"</#if> value="both" type="radio" />
		<@wp.i18n key="BOTH"/></label>
	</div>
</div>
</fieldset>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('search_result','search_result','jacms',NULL,'<#assign jacms=JspTaglibs["/jacms-aps-core"]>
<#assign wp=JspTaglibs["/aps-core"]>
<h1><@wp.i18n key="SEARCH_RESULTS" /></h1>
<#if (RequestParameters.search?? && RequestParameters.search!='''')>
<@jacms.searcher listName="contentListResult" />
</#if>
<p><@wp.i18n key="SEARCHED_FOR" />: <em><strong><#if (RequestParameters.search??)>${RequestParameters.search}</#if></strong></em></p>
<#if (contentListResult??) && (contentListResult?has_content) && (contentListResult?size > 0)>
<@wp.pager listName="contentListResult" objectName="groupContent" max=10 pagerIdFromFrame=true advanced=true offset=5>
	<@wp.freemarkerTemplateParameter var="group" valueName="groupContent" removeOnEndTag=true >
	<p><em><@wp.i18n key="SEARCH_RESULTS_INTRO" /> <!-- infamous whitespace hack -->
	${groupContent.size}
	<@wp.i18n key="SEARCH_RESULTS_OUTRO" /> [${groupContent.begin + 1} &ndash; ${groupContent.end + 1}]:</em></p>
	<@wp.fragment code="default_pagerBlock" escapeXml=false />
	<#list contentListResult as contentId>
	<#if (contentId_index >= groupContent.begin) && (contentId_index <= groupContent.end)>
		<@jacms.content contentId="${contentId}" modelId="list" />
	</#if>
	</#list>
	<@wp.fragment code="default_pagerBlock" escapeXml=false />
	</@wp.freemarkerTemplateParameter>
</@wp.pager>
<#else>
<p class="alert alert-info"><@wp.i18n key="SEARCH_NOTHING_FOUND" /></p>
</#if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('main_banner_green','main_banner_green',NULL,'<#assign wp=JspTaglibs["/aps-core"]>

 <div class="main-banner-green">
            <div class="row">
                <div class="col-lg-6 col-xs-12">
                    <div class="text-wrapper">

                        <h1>We Got Your Back</h1>
                        <p>Traditional banks earn between 20-30% of their revenue from banking fees. Seed is a modern, online bank that passes along the savings we receive from lower operating costs to our customers by eliminating fees that don?t have a direct cost to us.</p>
                    </div>
                </div>
                <div class="lg col-xs-12">
                    <div class="centered-image">
                        <img src="<@wp.imgURL />we-got-your-back.png"  />
                    </div>
                </div>
            </div>
        </div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_row_content_viewer_list','row_content_viewer_list','jacms',NULL,'<#assign jacms=JspTaglibs["/jacms-aps-core"]>
<#assign wp=JspTaglibs["/aps-core"]>
<@jacms.rowContentList listName="contentInfoList" titleVar="titleVar"
	pageLinkVar="pageLinkVar" pageLinkDescriptionVar="pageLinkDescriptionVar" />
<#if (titleVar??)>
	<h1>${titleVar}</h1>
</#if>
<#if (contentInfoList??) && (contentInfoList?has_content) && (contentInfoList?size > 0)>
	<@wp.pager listName="contentInfoList" objectName="groupContent" pagerIdFromFrame=true advanced=true offset=5>
	<@wp.freemarkerTemplateParameter var="group" valueName="groupContent" removeOnEndTag=true >
	<@wp.fragment code="default_pagerBlock" escapeXml=false />
	<#list contentInfoList as contentInfoVar>
	<#if (contentInfoVar_index >= groupContent.begin) && (contentInfoVar_index <= groupContent.end)>
		<#if (contentInfoVar[''modelId'']??)>
		<@jacms.content contentId="${contentInfoVar[''contentId'']}" modelId="${contentInfoVar[''modelId'']}" />
		<#else>
		<@jacms.content contentId="${contentInfoVar[''contentId'']}" />
		</#if>
	</#if>
	</#list>
	<@wp.fragment code="default_pagerBlock" escapeXml=false />
	</@wp.freemarkerTemplateParameter>
	</@wp.pager>
</#if>
<#if (pageLinkVar??) && (pageLinkDescriptionVar??)>
	<p class="text-right"><a class="btn btn-primary" href="<@wp.url page="${pageLinkVar}"/>">${pageLinkDescriptionVar}</a></p>
</#if>
<#assign contentInfoList="">',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('login-widget','login-widget',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<script src="<@wp.resourceURL />login-bundle/static/js/2.62ce5324.chunk.js"></script>
<script src="<@wp.resourceURL />login-bundle/static/js/main.4e1fef2a.chunk.js"></script>
<script src="<@wp.resourceURL />login-bundle/static/js/runtime~main.10481437.js"></script>
<script src="<@wp.resourceURL />login-bundle/static/js/2.62ce5324.chunk.js"></script>
<script src="<@wp.resourceURL />login-bundle/static/js/main.4e1fef2a.chunk.js"></script>
<script src="<@wp.resourceURL />login-bundle/static/js/runtime~main.10481437.js"></script>
<script src="<@wp.resourceURL />login-bundle/static/js/2.62ce5324.chunk.js"></script>
<script src="<@wp.resourceURL />login-bundle/static/js/main.4e1fef2a.chunk.js"></script>
<script src="<@wp.resourceURL />login-bundle/static/js/runtime~main.10481437.js"></script>
<script src="<@wp.resourceURL />login-bundle/static/js/2.62ce5324.chunk.js"></script>
<script src="<@wp.resourceURL />login-bundle/static/js/main.4e1fef2a.chunk.js"></script>
<script src="<@wp.resourceURL />login-bundle/static/js/runtime~main.10481437.js"></script>
<#-- entando_resource_injection_point -->
<#-- Don''t add anything above this line. The build scripts will automatically link the compiled JS and CSS for you and add them above this line so that the widget can be loaded-->

<#-- This is the custom element -->
<app-user-form />
',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('main_banner_inner','main_banner_inner',NULL,'<#assign wp=JspTaglibs["/aps-core"]>

<div class="main-banner-12">
            <div class="main-banner-12-inner-wrapper">

                <div class="row">
                    <div class="col-xs-12 col-lg-6">
                        <div class="text-wrapper-inner">
                            <h2>Earn interest on your checking account at 16x the national average*</h2>
                            <p>Get up to 1.90% APY with a FDIC insured checking or savings account.</p>
                            <p class="fine-print">* Rates based on the weekly rate cap from the FDIC for the week of February 10, 2020.</p>
                        </div>
                    </div>

                    <div class="col-lg-6 col-xs-12">
                        <div class="centered-image">
                            <img src="<@wp.imgURL />infographic.png"  />
                        </div>
                    </div>
                </div>

            </div>
        </div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('main_banner_darkgreen','main_banner_darkgreen',NULL,'<#assign wp=JspTaglibs["/aps-core"]>

<div class="main-banner-darkgreen ">
            <div class="row">
                <div class="col-lg-6 col-xs-12">
                    <div class="text-wrapper">
                        <h1>Financial Health Dashboard</h1>
                        <p>Take charge of your finances. Stay informed of your cash and savings, and know where your money is going so you can invest your money where you want it to go. Seed automatically organizes the data from all of your Seed accounts so you can see how much and where your money is being spent.</p>
                    </div>
                </div>
                <div class="col-lg-6 col-xs-12">
                    <div class="col-md-12 col-xs-12">
                        <div class="centered-image">
                            <img  src="<@wp.imgURL />dashboard.png"  />
                        </div>
                    </div>
                </div>
            </div>
        </div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('main_banner_accordion','main_banner_accordion',NULL,'<#assign wp=JspTaglibs["/aps-core"]>

<div class="main-banner-accordion">
            <div class="row">
                <div class="col-lg-6 col-xs-12">
                    <div class="text-wrapper">
                        <h1>Helping You Reach Financial Freedom</h1>
                        <p>It?s easier to make money once you have money. But how do you get there? At Seed, we help you build savings, and get your money to work for you.</p>
                        <div class="col-md-12 col-xs-12">
                            <img  class="img-footer "  src="<@wp.imgURL />potted-plants.png"  />
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-xs-12">

                    <div class="accordion md-accordion " id="accordion-seed" role="tablist" aria-multiselectable="true">
                        <div class="card">
                            <div class="card-header" role="tab" id="headingOne1">
                                <a data-toggle="collapse" data-parent="#accordion-seed" href="#collapse-one" aria-expanded="true" aria-controls="collapse-one">
                                    <h2 class="mb-0">
                                        <span class=" rotate-icon"></span><div class="card-header-left-margin"> Save</div>  
                                    </h2>
                                </a>
                            </div>

                            <div id="collapse-one" class="collapse show" role="tabpanel" aria-labelledby="headingOne1" data-parent="#accordion-seed">
                                <div class="card-body">
                                    <h3>No Hidden Fees</h3>
                                    <p>No monthly service fees, minimum balance fees, or overdraft fees. Get peace of mind knowing that your money in the bank stays in the bank, and you?re not getting hit by hidden charges.<br/>
                                        Get instant alerts whenever a fee is charged to your account, and know up front what fees we do charge for.</p>
                                </div>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-header" role="tab" id="headingTwo2">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion-seed" href="#collapse-two" aria-expanded="false" aria-controls="collapse-two">
                                    <h2 class="mb-0">
                                        <span class=" rotate-icon"></span><div class="card-header-left-margin"> Grow</div>
                                    </h2>
                                </a>
                            </div>


                            <div id="collapse-two" class="collapse" role="tabpanel" aria-labelledby="headingTwo2" data-parent="#accordion-seed">
                                <div class="card-body">
                                    <h3>Get Paid to Bank with Us</h3>
                                    <p>Put money in your pocket. Earn 1.00% APY on our basic checking account, and automatically earn more as your average monthly balance increases. Always get a return on your money with Seed checking and savings.</p>
                                </div>
                            </div>
                        </div>
                        <div class="card">

                            <div class="card-header" role="tab" id="headingThree3">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion-seed" href="#collapse-three"
                                   aria-expanded="false" aria-controls="collapse-three">
                                    <h2 class="mb-0">
                                        <span class=" rotate-icon"></span> <div class="card-header-left-margin">Earn</div>
                                    </h2>
                                </a>
                            </div>

                            <div id="collapse-three" class="collapse" role="tabpanel" aria-labelledby="headingThree3" data-parent="#accordion-seed">
                                <div class="card-body">
                                    <h3>Save for What Matters</h3>
                                    <p>Whether you?re saving for your wedding, investing in a new business, or preparing for retirement, having a clear goal will help you take concrete steps to achieve it.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('main_banner_white','main_banner_white',NULL,'<#assign wp=JspTaglibs["/aps-core"]>

<div class="main-banner-white">
            <div class="row">
                <div class="col-lg-6 col-xs-12">
                    <div class="text-wrapper">
                        <h1>Open a Seed Checking Account Today</h1>
                        <p>Sign up for an account today in less than 5 minutes.</p>
                        <a href="#" target="" class="btn btn-lg btn-cta">Apply Now</a>
                    </div>
                </div>
                <div class="col-lg-6 col-xs-12">
                    <div class="centered-image">
                        <img  src="<@wp.imgURL />cta-image.png"  />
                    </div>
                </div>
            </div>
        </div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('transfer_money','transfer_money',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
                            <div class="NotificationBar__btn">
                                <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Frametransfer.png" />
                                Transfer Money
                            </div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('pay_bill','pay_bill',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<div class="NotificationBar__btn">
    <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Framepay.png" />
    Pay bills
</div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('footer','footer',NULL,'<div class="footer">
                <div class="footer-content">
                    <div class="row justify-content-center">
                        <div class="col-12 col-lg-4">  
                            <p>All Rights Reserved by Seed @2020</p>
                            <p>Seed, Inc. | NMLS #: 000000 | Licenses | NMLS Consumer Access</p>
                            <p>Deposits are FDIC insured to at least $250,000 through Seed, Inc. Member FDIC.</p>
                        </div>
                        <div class="col-12 col-lg-4">  
                            <p>All trademarks and brand names belong to their respective owners. Use of these trademarks and brand names do not represent endorsement by or association with this program.</p>
                            <p>See the Seed Account and Savings Account Agreement for terms and conditions.</p>
                        </div>

                    </div>
                </div>
            </div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('Savings','Savings',NULL,'<#assign wp=JspTaglibs["/aps-core"]>

<div class="col-12 col-lg-4">
                        <div class="CheckingCard">
                            <div class="CheckingCard__header">
                                <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Framepiggy.png" />
                                <div class="CheckingCard__title"> Savings</div>
                                <div class="CheckingCard__value">.... 7621</div>
                                <div class="CheckingCard__action">
                                    <i class="fas fa-ellipsis-v"></i>
                                </div>
                            </div>
                            <p class="CheckingCard__balance">$7,341.69</p>
                            <p class="CheckingCard__balance-caption">balance</p>
                        </div>
                    </div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('Credit-card','Credit-card',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<div class="col-12 col-lg-4">
                        <div class="CheckingCard">
                            <div class="CheckingCard__header">
                                <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Framecredit-card.png" />
                                <div class="CheckingCard__title"> Credit Card</div>
                                <div class="CheckingCard__value">.... 8494</div>
                                <div class="CheckingCard__action">
                                    <i class="fas fa-ellipsis-v"></i>
                                </div>
                            </div>
                            <p class="CheckingCard__balance">$775.95</p>
                            <p class="CheckingCard__balance-caption">balance</p>
                            <p class="CheckingCard__balance-reward">
                                Reward Points: 
                                <span class="CheckingCard__balance-reward-value">14,643</span>
                            </p>
                        </div>
                    </div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('Checking-Table','Checking-Table',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<div class="col-12" >
                        <div class="table-wrapper-scroll-y my-custom-scrollbar">
                            <table id="DtTable__Notification" class="Table__notification table table-responsive" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <th class="th-sm">date
                                        </th>
                                        <th class="th-sm">descrition
                                        </th>
                                        <th class="th-sm">amount
                                        </th>
                                        <th class="th-sm">balance
                                        </th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>02/27/20</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$383.21 </td>
                                    </tr>
                                    <tr>
                                        <td>02/27/20</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$483.21 </td>
                                    </tr>
                                    <tr>
                                        <td>02/27/20</td>
                                        <td>Seven Eleven</td>
                                        <td>$34.56</td>
                                        <td>$443.21 </td>
                                    </tr>
                                    <tr>
                                        <td>02/27/20</td>
                                        <td>Electricity</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/20</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/20</td>
                                        <td>Rental</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/20</td>
                                        <td>Family Mart</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/20</td>
                                        <td>Eneos Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/20</td>
                                        <td>Netflix</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/20</td>
                                        <td>Sky TV</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/20</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/20</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/20</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/20</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/20</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/20</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>12/12/19</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>11/17/19</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>12/07/19</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>01/27/20</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/19</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/12</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr><tr>
                                        <td>02/27/19</td>
                                        <td>Mobile Gas Station</td>
                                        <td>$34.56</td>
                                        <td>$983.21 </td>
                                    </tr>


                                </tbody>
                            </table>
                        </div>
                    </div>
                    <script>

                        $(document).ready(function () {
                            $(''#DtTable__Notification'').DataTable();
                            $(''#DtTable__Notification_wrapper'').find(''label'').each(function () {
                                $(this).parent().append($(this).children());
                            });
                            $(''#DtTable__Notification_wrapper .dataTables_filter'').find(''input'').each(function () {
                                const $this = $(this);
                                $this.attr("placeholder", "Search");
                                $this.removeClass(''form-control-sm'');
                            });
                            $(''#DtTable__Notification_wrapper .dataTables_length'').addClass(''d-flex flex-row'');
                            $(''#DtTable__Notification_wrapper .dataTables_filter'').addClass(''md-form'');
                            $(''#DtTable__Notification_wrapper select'').removeClass(
                                    ''custom-select custom-select-sm form-control form-control-sm'');
                            $(''#DtTable__Notification_wrapper select'').addClass(''mdb-select'');
                            $(''#DtTable__Notification_wrapper .mdb-select'').materialSelect();
                            $(''#DtTable__Notification_wrapper .dataTables_filter'').find(''label'').remove();
                        });
                    </script>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('Brand-Logo','Brand-Logo',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<a class="logo" href="<@wp.url page="homepage" />" >
        <img src="<@wp.imgURL />seed-logo.svg" />
  </a>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('Checking','Checking',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<div class="col-12 col-lg-4">
                        <div class="CheckingCard">
                            <div class="CheckingCard__header">
                                <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Framecredit-card.png" />
                                <div class="CheckingCard__title"> Checking</div>
                                <div class="CheckingCard__value">.... 8494</div>
                                <div class="CheckingCard__action">
                                    <i class="fas fa-ellipsis-v"></i>
                                </div>
                            </div>
                            <p class="CheckingCard__balance">$2,675.65</p>
                            <p class="CheckingCard__balance-caption">balance</p>
                        </div>
                    </div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('applyform','applyform',NULL,'<div class="ApplyForm">
    <div class="row ">
        <div class="col-sm-12 my-auto">
            <div class="ApplyForm__wrapper mx-auto">
                <form class="ApplyForm__form" action="#!">
                    <p class="ApplyForm__title  h4 mb-4">Let’s get started</p>

                    <div class="form-row mb-2">
                        <div class="col-12 col-lg-6">
                            <label>First name </label>
                            <input type="text" id="ApplyFormFirstName" class="form-control" placeholder="First name">
                        </div>
                        <div class="col-12 col-lg-6">
                           <label> Last name </label>
                            <input type="text" id="ApplyFormLastName" class="form-control" placeholder="Last name">
                        </div>
                    </div>

                    <div class="form-row mb-4">
                        <div class="col-12 col-lg-6">
                           <label> Phone number </label>
                            <input type="text" id="ApplyFormFirstName" class="form-control" placeholder="First name">
                        </div>
                        <div class="col-12 col-lg-6">
                            <label>Email</label>
                            <input type="text" id="ApplyFormLastName" class="form-control" placeholder="Last name">
                        </div>
                    </div>
                    <div class="col-sm-12 text-center">
                        <button type="submit" class="btn apply my-3 " type="submit">Apply now</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('list_item','list_item',NULL,'<#assign wp=JspTaglibs[ "/aps-core"]>
<link rel="stylesheet" type="text/css" href="<@wp.resourceURL />widgets/list-item/css/main.css">
<link rel="stylesheet" type="text/css" href="<@wp.resourceURL />widgets/list-item/css/vendor.css">
<script async src="<@wp.resourceURL />widgets/list-item/js/runtime.js"></script>
<script async src="<@wp.resourceURL />widgets/list-item/js/vendor.js"></script>
<script async src="<@wp.resourceURL />widgets/list-item/js/main.js"></script>
<@wp.currentWidget param="config" configParam="icon" var="iconString"/>
<@wp.currentWidget param="config" configParam="title" var="titleString"/>
<@wp.currentWidget param="config" configParam="count" var="countNumber"/>
<list-item icon="${iconString}" title="${titleString}"/>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('dropdown_sign_in','dropdown_sign_in',NULL,'<#assign wp=JspTaglibs["/aps-core"]>

<#if (Session.currentUser != "guest")>
<div class="btn-group login-group">
    <button type="button" class="btn login dropdown-toggle px-3" data-toggle="dropdown" aria-haspopup="true"  aria-expanded="false">
        ${Session.currentUser} <span class="sr-only">${Session.currentUser}</span>
    </button>
    <div class="dropdown-menu login-drop">

        <@wp.ifauthorized permission="enterBackend">
        <a class="dropdown-item" href="<@wp.info key="systemParam" paramName="applicationBaseURL" />do/main.action?request_locale=<@wp.info key="currentLang" />">
           <@wp.i18n key="ESLF_ADMINISTRATION" />
    </a>
    </@wp.ifauthorized>
    <a class="dropdown-item"  href="<@wp.info key="systemParam" paramName="applicationBaseURL" />do/logout.action">       
       <@wp.i18n key="ESLF_SIGNOUT" />
</a>

<@wp.pageWithWidget var="editProfilePageVar" widgetTypeCode="userprofile_editCurrentUser" />
<#if (editProfilePageVar??) >
<a class="dropdown-item" href="<@wp.url page="${editProfilePageVar.code}" />" ><@wp.i18n key="ESLF_PROFILE_CONFIGURATION" /></a>
</#if>
</div>
</div>

<a class="dropdown-item d-none d-sm-block d-md-none"
   ${Session.currentUser} <span class="sr-only">${Session.currentUser}</span>
</a>

<#else>

<div class="btn-group login-drop">
    <button type="button" class="btn login dropdown-toggle mr-3" data-toggle="dropdown" aria-haspopup="true"  aria-expanded="false">
        <@wp.i18n key="ESLF_SIGNIN" />
    </button>
    <a class="btn sign-up " href="<@wp.url page="sign_up" />" >
       <@wp.i18n key="SIGN_UP" />
</a>
<div class="dropdown-menu">
    <form method="POST">
        <#if (accountExpired?? && accountExpired == true)>
        <div class="alert alert-danger m-2" role="alert">
            <button class="close" data-dismiss="alert">x</button>
            <@wp.i18n key="ESLF_USER_STATUS_EXPIRED" />
        </div>
        </#if>
        <#if (wrongAccountCredential?? && wrongAccountCredential == true)>
        <div class="alert alert-danger m-2" role="alert">
            <@wp.i18n key="ESLF_USER_STATUS_CREDENTIALS_INVALID" />
        </div>
        </#if>
        <div class="md-form mb-2 px-5">
            <i class="fas fas fa-user prefix grey-text"></i>
            <input type="text" name="username" class="form-control" placeholder="<@wp.i18n key="ESLF_USERNAME" />">
        </div>

        <div class="md-form mb-2 px-5">
            <i class="fas fa-lock prefix grey-text"></i>
            <input type="password" name="password" class="form-control"  placeholder="<@wp.i18n key="ESLF_PASSWORD" />">
        </div>
        <div class="d-flex justify-content-center">
            <input type="submit" class="btn login btn-sm" value="<@wp.i18n key="ESLF_SIGNIN" />" />
        </div>
    </form>
</div>
</div>
</#if>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('login','login',NULL,'<#assign wp=JspTaglibs[ "/aps-core"]>
<link rel="stylesheet" type="text/css" href="<@wp.resourceURL />widgets/login/form/css/main.css">
<script async src="<@wp.resourceURL />widgets/login/form/js/runtime.js"></script>
<script async src="<@wp.resourceURL />widgets/login/form/js/vendor.js"></script>
<script async src="<@wp.resourceURL />widgets/login/form/js/main.js"></script>
<user-form />',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('apply_form_banner','apply_form_banner',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<div class="ApplyBanner">
    <!-- Block parent element -->
    <div class="row">
        <div class="col-sm-12 ApplyBanner__title">
            <h1>A Credit Card That Makes Your Life Easier</h1>
        </div>
        <div class="ApplyBanner__image-wrapper">
            <img  class="ApplyBanner__image-imposed" src="<@wp.imgURL />creditcard.png"  />
        </div>
        <div class="col-sm-12 ApplyBanner__footer">
            <h3>The Seed Flourish Credit Card </h3>
            <button id="clickApply" class="btn apply my-3 " type="submit">Apply now</button>
        </div>
    </div>
</div>

<script>
$("#clickApply").click(function() {
    $(''html,body'').animate({
        scrollTop: $(".ApplyForm").offset().top}, 2000);
});
</script>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('seed-user-form','seed-user-form',NULL,'<div class="UserForm">
    <div class="row h-100">
        <div class="col-sm-12 my-auto">
            <div class="card card-block UserForm__wrapper mx-auto">

                <form class="text-center border border-light p-5" action="#!">

                    <p class="h4 mb-4">Registration</p>

                    <div class="form-row mb-4">
                        <div class="col">
                            <!-- First name -->
                            <input type="text" id="UserFormFirstName" class="form-control" placeholder="First name">
                        </div>
                        <div class="col">
                            <!-- Last name -->
                            <input type="text" id="UserFormLastName" class="form-control" placeholder="Last name">
                        </div>
                    </div>


                    <!-- E-mail -->
                    <input type="email" id="UserFormEmail" class="form-control mb-4" placeholder="E-mail">

                    <!-- Username -->
                    <input type="text" id="UserFormUsername" class="form-control mb-4" placeholder="Username">

                    <!-- Password -->
                    <input type="password" id="UserFormPassword" class="form-control" placeholder="Password" aria-describedby="UserFormPasswordHelpBlock">
                    <small id="UserFormPasswordHelpBlock" class="form-text text-muted mb-4">
                        At least 8 characters and 1 digit
                    </small>

                    <!-- Sign up -->
                    <button class="btn sign-in my-4 btn-block" type="submit">Sign up</button>

                    <!-- Social register -->
                    <p>or sign up with:</p>

                    <a href="#" class="mx-2" role="button"><i class="fab fa-facebook-f UserForm--icon"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-twitter UserForm--icon"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-linkedin-in UserForm--icon"></i></a>
                    <a href="#" class="mx-2" role="button"><i class="fab fa-github UserForm--icon"></i></a>

                    <hr>

                    <!-- Terms of service -->
                    <p>By clicking
                        <em>Sign up</em> you agree to our
                        <a href="" target="_blank">terms of service</a>
                </form>
            </div>
        </div>
    </div>
</div>   
',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('Notification-Bar','Notification-Bar',NULL,'<#assign wp=JspTaglibs["/aps-core"]>

<div class="NotificationBar">
                        <div class="NotificationBar__btn">
                            <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Frametransfer.png" />
                            Transfer Money
                        </div>
                        <div class="NotificationBar__btn">
                            <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Framepay.png" />

                            Pay bills
                        </div>
                        <div class="NotificationBar__btn">
                            <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Framemoney.png" />

                            Send money
                        </div>
                        <div class="NotificationBar__btn">
                            <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Frameinvest.png" />

                            Investments
                        </div>
                        <div class="NotificationBar__btn">
                            <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Framestatements.png" />
                            <button type="button" class="btn NotificationBar__modal" data-toggle="modal" data-target="#modal2">
                                View statements
                                <span class="badge badge-danger ml-2 NotificationBar__counter">1</span>
                            </button>


                            <!-- Modal -->
                            <div class="modal fade" id="modal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Statements</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row" >
                                                <div class="col-12" >
                                                    <table class="Table__notification table table-responsive">

                                                        <thead>
                                                            <tr>
                                                                <th>Date</th>
                                                                <th>Description</th>
                                                                <th>Amount</th>
                                                                <th>file</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <tr>
                                                                <td>02/27/20</td>
                                                                <td>Mobile Gas Station</td>
                                                                <td>$34.56</td>
                                                                <td>
                                                                    <a href="http://www.africau.edu/images/default/sample.pdf" target="_blank"
                                                                       <img src="<@wp.imgURL />dashboard/Framestatements.png" /> <i class="fas fa-file-download"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>

                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn login btn-sm" data-dismiss="modal">Close</button>
                                          
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="NotificationBar__btn">
                            <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Frametransfer.png" />

                            <button type="button" class="btn NotificationBar__modal" data-toggle="modal" data-target="#madal1">
                                Manage alerts
                                <span class="badge badge-danger ml-2 NotificationBar__counter">3</span>
                            </button>


                            <!-- Modal -->
                            <div class="modal  fade" id="madal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog"  role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Manage alerts</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row" >
                                                <div class="col-12" >
                                                    <!--<div class="table-wrapper-scroll-y my-custom-scrollbar">-->
                                                    <table class="Table__notification table table-responsive">

                                                        <thead>
                                                            <tr>
                                                                <th>Date</th>
                                                                <th>Description</th>
                                                                <th>Amount</th>
                                                            </tr>
                                                        </thead>

                                                        <tbody>
                                                            <tr>
                                                                <td>02/27/20</td>
                                                                <td>Mobile Gas Station</td>
                                                                <td>$34.56</td>
                                                            </tr>
                                                            <tr>
                                                                <td>02/27/20</td>
                                                                <td>Mobile Gas Station</td>
                                                                <td>$34.56</td>
                                                            </tr>
                                                            <tr>
                                                                <td>02/27/20</td>
                                                                <td>Mobile Gas Station</td>
                                                                <td>$34.56</td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <!--</div>-->
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn login btn-sm" data-dismiss="modal">Close</button>
                                        
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('find-atm','find-atm',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<div class="FindAtm">
    <div class="row">
        <div class="col-12">
            <div class="text-center">
                <h1>Find an ATM near you.</h1>
            </div>
        </div>
        <div class="col-12">
            <div class="FindAtm__wrapper" >
                <div class="input-group my-3">
                    <input type="text" class="form-control" placeholder="ATM location" aria-label="find atm" aria-describedby="find atm">
                    <div class="input-group-append">
                        <button class="btn FindAtm__btn m-0 px-3 py-2 z-depth-0 waves-effect" type="button" >Search</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('signup','signup',NULL,'<#assign wp=JspTaglibs[ "/aps-core"]>

<script async src="<@wp.resourceURL />widgets/signup/form/js/runtime.js"></script>
<script async src="<@wp.resourceURL />widgets/signup/form/js/vendor.js"></script>
<script async src="<@wp.resourceURL />widgets/signup/form/js/main.js"></script>
<user-form/>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('credit_card_user_apply_form','credit_card_user_apply_form',NULL,'<#assign wp=JspTaglibs[ "/aps-core"]>
<link rel="stylesheet" type="text/css" href="<@wp.resourceURL />widgets/creditCardApplyForm/css/main.css">
<script async src="<@wp.resourceURL />widgets/creditCardApplyForm/js/runtime.js"></script>
<script async src="<@wp.resourceURL />widgets/creditCardApplyForm/js/vendor.js"></script>
<script async src="<@wp.resourceURL />widgets/creditCardApplyForm/js/main.js"></script>
<credit-card-user-form />',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('send_money','send_money',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<div class="NotificationBar__btn">
    <img class="CheckingCard__icon" src="<@wp.imgURL />dashboard/Framemoney.png" />
    Send money
</div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('seeds_card','seeds_card',NULL,'<#assign wp=JspTaglibs[ "/aps-core"]>
<script async src="<@wp.resourceURL />widgets/seeds-card/js/runtime.js"></script>
<script async src="<@wp.resourceURL />widgets/seeds-card/js/vendor.js"></script>
<script async src="<@wp.resourceURL />widgets/seeds-card/js/main.js"></script>
<@wp.currentWidget param="config" configParam="cardname" var="configName" />
<seedscard-details  cardname="${configName}" />',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('search_form','search_form',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<@wp.pageWithWidget var="searchResultPageVar" widgetTypeCode="search_result" />
<form class="navbar-search " action="<#if (searchResultPageVar??) ><@wp.url page="${searchResultPageVar.code}" /></#if>" method="get">
<i class="fas fa-search"></i>
<input type="text" name="search" class="search-query" placeholder="<@wp.i18n key="ESSF_SEARCH" />" />
</form>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('keycloak',NULL,NULL,'<script src="http://sd-kc-sales-demo.sales.entando.org/auth/js/keycloak.js"></script>
<script>
 const keycloak = Keycloak(''/entando-de-app/keycloak.json'');
  function createKcDispatcher(payload) {
    return () =>
      window.dispatchEvent(new CustomEvent("keycloak", { detail: payload }));
  }
  keycloak.onReady = createKcDispatcher({ eventType: "onReady" });
  keycloak.onAuthSuccess = createKcDispatcher({
    eventType: "onAuthSuccess"
  });
  keycloak.onAuthError = createKcDispatcher({
    eventType: "onAuthError"
  });
  keycloak.onAuthRefreshSuccess = createKcDispatcher({
    eventType: "onAuthRefreshSuccess"
  });
  keycloak.onAuthRefreshError = createKcDispatcher({
    eventType: "onAuthRefreshError"
  });
  keycloak.onAuthLogout = createKcDispatcher({
    eventType: "onAuthLogout"
  });
  keycloak.onTokenExpired = createKcDispatcher({
    eventType: "onTokenExpired"
  });
  const onInit = createKcDispatcher({ eventType: ''onInit'' });
  window.entando = {
    ...(window.entando || {}),
    keycloak
  };
  window.entando.keycloak.init({ onLoad: "check-sso" }).success(onInit);
</script>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('manage_users','manage_users',NULL,'<#assign wp=JspTaglibs[ "/aps-core"]>

<script async src="<@wp.resourceURL />widgets/manageusers/js/runtime.js"></script>
<script async src="<@wp.resourceURL />widgets/manageusers/js/vendor.js"></script>
<script async src="<@wp.resourceURL />widgets/manageusers/js/main.js"></script>
<manageusers-table  pagination-mode="pagination" service-url="http://sd-sales-demo.sales.entando.org" keycloak-url="http://sd-kc-sales-demo.sales.entando.org" realm="entando"/>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('transfer_money_angular','transfer_money_angular',NULL,'<#assign wp=JspTaglibs[ "/aps-core"]>
<link rel="stylesheet" type="text/css" href="<@wp.resourceURL />widgets/angular/list-item/css/styles.css">
<script async src="<@wp.resourceURL />widgets/angular/list-item/js/runtime-es2015.js"></script>
<script async src="<@wp.resourceURL />widgets/angular/list-item/js/polyfills-es2015.js"></script>
<script async src="<@wp.resourceURL />widgets/angular/list-item/js/main-es2015.js"></script>
<@wp.currentWidget param="config" configParam="serviceurl" var="serviceurl"/>
<@wp.currentWidget param="config" configParam="title" var="title"/>
<my-widget serviceurl="${serviceurl}" title="${title}" />',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('angular',NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<script src="<@wp.resourceURL />libs/angular.js"></script>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('seeds_card_ng','seeds_card_ng',NULL,'<#assign wp=JspTaglibs[ "/aps-core"]>
<script async src="<@wp.resourceURL />widgets/seeds-card-ng/js/main-es2015.js"></script>
<@wp.currentWidget param="config" configParam="cardname" var="configName" />
<ng-seedscard-details cardname="${configName}"/>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('brand_insurance','brand_insurance',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<@wp.currentWidget param="config" configParam="name" var="configName" />
<a class="logo-insurance navbar-brand" href="<@wp.url page="homepage" />" name="insurance-logo.svg" >
        <img src="<@wp.imgURL />insurance-logo.svg" />
  </a>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('Login_buttons','Login_buttons',NULL,'<#assign wp=JspTaglibs["/aps-core"]>

<#if (Session.currentUser != "guest")>
<div class="btn-group login-group">
    <button type="button" class="btn login dropdown-toggle px-3" data-toggle="dropdown" aria-haspopup="true"  aria-expanded="false">
        ${Session.currentUser} <span class="sr-only">${Session.currentUser}</span>
    </button>
    <div class="dropdown-menu login-drop">

        <@wp.ifauthorized permission="enterBackend">
        <a class="dropdown-item" href="<@wp.info key="systemParam" paramName="applicationBaseURL" />do/main.action?request_locale=<@wp.info key="currentLang" />">
           <@wp.i18n key="ESLF_ADMINISTRATION" />
        </a>
           <a class="dropdown-item" href="<@wp.url page="subsite" />" >
           <@wp.i18n key="ELSF_SUBSITE" />
        </a> 
    <a class="dropdown-item" href="<@wp.url page="manage_users" />" >
       <@wp.i18n key="ELSF_MANAGE_USERS" />
    </a>

        </@wp.ifauthorized>
        <a class="dropdown-item"  href="<@wp.info key="systemParam" paramName="applicationBaseURL" />do/logout.action">       
         <@wp.i18n key="ESLF_SIGNOUT" />
        </a>

<@wp.pageWithWidget var="editProfilePageVar" widgetTypeCode="userprofile_editCurrentUser" />
<#if (editProfilePageVar??) >
<a class="dropdown-item" href="<@wp.url page="${editProfilePageVar.code}" />" ><@wp.i18n key="ESLF_PROFILE_CONFIGURATION" /></a>
</#if>
</div>
</div>

<a class="dropdown-item d-none d-sm-block d-md-none"
   ${Session.currentUser} <span class="sr-only">${Session.currentUser}</span>
</a>

<#else>
<script>
function login () {  
  window.entando.keycloak.login();
  location.href = ''<@wp.info key="systemParam" paramName="applicationBaseURL" />do/login?redirectTo=<@wp.url page="homepage"/>'';
}
</script>
<script>
window.addEventListener("user.form.login", (evt) => {
  if(evt.detail.payload){
    login();
  }
});
</script>

<div class="btn-group login-drop">
    <button type="button" class="btn login dropdown-toggle mr-3"  onclick="login()" >
        <@wp.i18n key="ESLF_SIGNIN" />
    </button>
    <a class="btn sign-up " href="<@wp.url page="sign_up" />" >
       <@wp.i18n key="SIGN_UP" />
    </a>

</div>
</#if>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('insurance_inclusions_footer',NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]>

 <script type="text/javascript"  src="<@wp.resourceURL />static/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="<@wp.resourceURL />static/js/mdb.min.js"></script>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('navigation_menu_include',NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign liClass="">
<#assign aClass="">
<#if (previousPage.code == currentPageCode)>
  <#assign liClass='' class="active" ''>
</#if>
<#if previousPage.voidPage>
 <#assign liClass='' class="nav-header" ''>
    <#assign aClass='' class="a-void" ''>
</#if>
<#if previousLevel == 0>
  <#assign aClass='' class="root-a" ''>
</#if>
<li ${liClass}>
   <#if (!previousPage.voidPage)>
   	<a href="${previousPage.url}"  ${aClass}>
   <#else>
        <a ${aClass}>
   </#if>
   <!-- [ ${previousLevel} ]-->
<#--  CHECK THIS
${homeIcon}
-->
   ${previousPage.title}
     </a>

   <#if (previousLevel == level)>
	</li>
   </#if>
   <#if (previousLevel < level)>
	<ul class="nav-list">
   </#if>
   <#if (previousLevel > level)>
	<#list 1..(previousLevel - level) as ignoreMe>
		</li></ul>
	</#list>
   </#if>
',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('ootbc-header-widget','ootbc-header-widget',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<script src="<@wp.resourceURL />ootbc-bundle/static/js/2.3b049955.chunk.js"></script>
<script src="<@wp.resourceURL />ootbc-bundle/static/js/main.3f90a792.chunk.js"></script>
<script src="<@wp.resourceURL />ootbc-bundle/static/js/runtime-main.b759d654.js"></script>
<link href="<@wp.resourceURL />ootbc-bundle/static/css/main.fbc3daf0.chunk.css" rel="stylesheet">
<#-- entando_resource_injection_point -->
<#-- Don''t add anything above this line. The build scripts will automatically link the compiled JS and CSS for you and add them above this line so that the widget can be loaded-->

<#-- This is the custom element -->
<@wp.currentWidget param="config" configParam="logo" var="configLogo" />
<@wp.currentWidget param="config" configParam="tagline" var="configTagline" />
<@wp.currentWidget param="config" configParam="theme" var="configTheme" />
<@wp.currentWidget param="config" configParam="sideNavigation" var="configSideNavigation" />
<@wp.currentWidget param="config" configParam="icons" var="configIcons" />
<@wp.currentWidget param="config" configParam="menuItems" var="configMenuItems" />

<header-widget
  logo="${configLogo}"
  logoAction="<@wp.url page="homepage" />"
  tagline="${configTagline}"
  theme="${configTheme}"
  sideNavigation="${configSideNavigation}"
  icons="${configIcons}"
  menuItems="${configMenuItems}"
  action="<@wp.url />"
  imgUrl="<@wp.imgURL />"
/>
',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('ootbc-footer-widget','ootbc-footer-widget',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<@wp.currentWidget param="config" configParam="copyright" var="configCopyright" />
<@wp.currentWidget param="config" configParam="theme" var="configTheme" />

<@wp.currentWidget param="config" configParam="linkSocial1" var="configLinkSocial1" />
<@wp.currentWidget param="config" configParam="social1" var="configSocial1" />
<@wp.currentWidget param="config" configParam="linkSocial2" var="configLinkSocial2" />
<@wp.currentWidget param="config" configParam="social2" var="configSocial2" />
<@wp.currentWidget param="config" configParam="linkSocial3" var="configLinkSocial3" />
<@wp.currentWidget param="config" configParam="social3" var="configSocial3" />
<@wp.currentWidget param="config" configParam="linkSocial4" var="configLinkSocial4" />
<@wp.currentWidget param="config" configParam="social4" var="configSocial4" />
<@wp.currentWidget param="config" configParam="linkSocial5" var="configLinkSocial5" />
<@wp.currentWidget param="config" configParam="social5" var="configSocial5" />
<@wp.currentWidget param="config" configParam="linkSocial6" var="configLinkSocial6" />
<@wp.currentWidget param="config" configParam="social6" var="configSocial6" />

<@wp.currentWidget param="config" configParam="page1" var="configPage1" />
<@wp.currentWidget param="config" configParam="page2" var="configPage2" />
<@wp.currentWidget param="config" configParam="page3" var="configPage3" />
<@wp.currentWidget param="config" configParam="page4" var="configPage4" />

<#if !(configCopyright?has_content)>
    <#assign configCopyright="">
</#if>
<#if !(configTheme?has_content)>
    <#assign configTheme="">
</#if>

<#assign configCopyrightYear=.now?string(''yyyy'')>
<#assign copyrightSymbol="&#xA9;">

<link rel="stylesheet" type="text/css" href="<@wp.resourceURL />ootbc-bundle/static/css/footer.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div class="footer__ootb ${configTheme}">
    <div class="footer__ootb--column">
        <div class="footer__ootb--utilities">
        <#if configPage1?has_content>
            <#assign refPage1=configPage1?lower_case?replace(" ", "_", "r")>
            <a href="<@wp.url page="${refPage1}" />">
                ${configPage1}
            </a>
            <span>&nbsp;|&nbsp;</span>
        </#if>
        <#if configPage2?has_content>
            <#assign refPage2=configPage2?lower_case?replace(" ", "_", "r")>
            <a href="<@wp.url page="${refPage2}" />">
                ${configPage2}
            </a>
            <span>&nbsp;|&nbsp;</span>
        </#if>
        <#if configPage3?has_content>
            <#assign refPage3=configPage3?lower_case?replace(" ", "_", "r")>
            <a href="<@wp.url page="${refPage3}" />">
                ${configPage3}
            </a>
            <span>&nbsp;|&nbsp;</span>
        </#if>
        <#if configPage4?has_content>
            <#assign refPage4=configPage4?lower_case?replace(" ", "_", "r")>
            <a href="<@wp.url page="${refPage4}" />">
                ${configPage4}
            </a>
        </#if>
        </div>
        <div class="footer__ootb--copyright">
            <span>${copyrightSymbol} Copyright ${configCopyrightYear} ${configCopyright}</span>
        </div>
    </div>
    <div class="footer__ootb--column">
        <div class="footer__ootb--social-badge">
            <#if configLinkSocial1?has_content && configSocial1?has_content>
            <a href="${configLinkSocial1}" class="fa fa-${configSocial1}"></a>
            </#if>
            <#if configLinkSocial2?has_content && configSocial2?has_content>
            <a href="${configLinkSocial2}" class="fa fa-${configSocial2}"></a>
            </#if>
            <#if configLinkSocial3?has_content && configSocial3?has_content>
            <a href="${configLinkSocial3}" class="fa fa-${configSocial3}"></a>
            </#if>
            <#if configLinkSocial4?has_content && configSocial4?has_content>
            <a href="${configLinkSocial4}" class="fa fa-${configSocial4}"></a>
            </#if>
            <#if configLinkSocial5?has_content && configSocial5?has_content>
            <a href="${configLinkSocial5}" class="fa fa-${configSocial5}"></a>
            </#if>
            <#if configLinkSocial6?has_content && configSocial6?has_content>
            <a href="${configLinkSocial6}" class="fa fa-${configSocial6}"></a>
            </#if>
        </div>
    </div>
</div>
',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('ootbc-sitemap-widget','ootbc-sitemap-widget',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<@wp.currentPage param="code" var="currentPageCode" />
<@wp.freemarkerTemplateParameter var="currentPageCode" valueName="currentPageCode" />
<link rel="stylesheet" type="text/css" href="<@wp.resourceURL />ootbc-bundle/static/css/sitemap.css">


<div class="well well-small sitemap">
<h2>Site Map</h2>

<ul class="nav nav-list">
<@wp.nav spec="code(homepage).subtree(50)" var="page">
   <#if (previousPage?? && previousPage.code??)>
	<#assign previousLevel=previousPage.level>
	<#assign level=page.level>
	<@wp.freemarkerTemplateParameter var="previousLevel" valueName="previousLevel" />
	<@wp.freemarkerTemplateParameter var="level" valueName="level" />
	<@wp.fragment code="navigation_menu_include" escapeXml=false />
   </#if>
   <@wp.freemarkerTemplateParameter var="previousPage" valueName="page" />
</@wp.nav>
<#if (previousPage??)>
   <#assign previousLevel=previousPage.level>
   <#assign level=0>
   <@wp.freemarkerTemplateParameter var="previousLevel" valueName="previousLevel" />
   <@wp.freemarkerTemplateParameter var="level" valueName="level" />
   <@wp.fragment code="navigation_menu_include" escapeXml=false />
   <#if (previousLevel != 0)>
	<#list 0..(previousLevel - 1) as ignoreMe>
		</ul></li>
	</#list>
   </#if>
</#if>
</ul>
</div>
<@wp.freemarkerTemplateParameter var="previousPage" valueName="" removeOnEndTag=true />
',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('back_to_seed','back_to_seed',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<@wp.currentWidget param="config" configParam="name" var="configName" />
<a class="btn go-back" href="<@wp.url page="homepage" />"  >
        <@wp.i18n key="GO_SEED_BANK" />
  </a>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('insurance_login','insurance_login',NULL,'<#assign wp=JspTaglibs["/aps-core"]>


<#if (Session.currentUser != "guest")>
<div class="btn-group login-group insurance-login">
    <button type="button" class="btn login dropdown-toggle px-3" data-toggle="dropdown" aria-haspopup="true"  aria-expanded="false">
        ${Session.currentUser} <span class="sr-only">${Session.currentUser}</span>
    </button>
    <div class="dropdown-menu login-drop">

        <@wp.ifauthorized permission="enterBackend">
        <a class="dropdown-item" href="<@wp.info key="systemParam" paramName="applicationBaseURL" />do/main.action?request_locale=<@wp.info key="currentLang" />">
           <@wp.i18n key="ESLF_ADMINISTRATION" />
    </a>

    <a class="dropdown-item" href="<@wp.url page="manage_users" />" >
       <@wp.i18n key="ELSF_MANAGE_USERS" />
</a>

<a class="dropdown-item" href="<@wp.url page="pda_dashboard" />">
   <@wp.i18n key="ESLF_BACK_OFFICE" />
</a>

<a class="dropdown-item" href="<@wp.url page="portal_page_sample" />">
   Portal Sample Page
</a>

<a class="dropdown-item" href="<@wp.url page="mortgage_status" />">
   My Requests
</a>
</@wp.ifauthorized>
<a class="dropdown-item"  href="<@wp.info key="systemParam" paramName="applicationBaseURL" />do/logout.action">       
   <@wp.i18n key="ESLF_SIGNOUT" />
</a>

<@wp.pageWithWidget var="editProfilePageVar" widgetTypeCode="userprofile_editCurrentUser" />
<#if (editProfilePageVar??) >
<a class="dropdown-item" href="<@wp.url page="${editProfilePageVar.code}" />" ><@wp.i18n key="ESLF_PROFILE_CONFIGURATION" /></a>
</#if>
</div>
</div>

<a class="dropdown-item d-none d-sm-block d-md-none"
   ${Session.currentUser} <span class="sr-only">${Session.currentUser}</span>
</a>

<#else>
<script>
    function login() {
        window.entando.keycloak.login();
        location.href = ''<@wp.info key="systemParam" paramName="applicationBaseURL" />do/login?redirectTo=<@wp.url page="homepage"/>'';
    }
</script>
<script>
    window.addEventListener("user.form.login", (evt) => {
        if (evt.detail.payload) {
            login();
        }
    });
</script>

<div class="btn-group login-drop">
    <button type="button" class="btn login dropdown-toggle mr-3"  onclick="login()" >
        <@wp.i18n key="ESLF_SIGNIN" />
    </button>
    <a class="btn sign-up " href="<@wp.url page="sign_up" />" >
       <@wp.i18n key="SIGN_UP" />
</a>

</div>
</#if>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('footer-insurance','footer-insurance',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<div class="footer">
            <div class="half-side">  
                <p>All Rights Reserved by Seed @2020</p>
                <p>Seed, Inc. | NMLS #: 000000 | Licenses | NMLS Consumer Access</p>
                <p>Deposits are FDIC insured to at least $250,000 through Seed, Inc. Member FDIC.</p>
            </div>

            <div class="half-side">  
                <img src="<@wp.imgURL />insurance-logo.svg" />
            </div>
</div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('Breadcrumb','Breadcrumb',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<@wp.currentPage param="code" var="currentViewCode" />

<div class="navbar-position">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">

            <span class="noscreen">
                <@wp.i18n key="ESNB_YOU_ARE_HERE" />
            </span>
            <#assign first=true>
            <@wp.nav spec="current.path" var="currentTarget">
            <#assign currentCode=currentTarget.code>

            <!--            <#if first>
                        <span class="divider">/</span>
                        </#if>-->

            <#if !currentTarget.voidPage>
            <#if (currentCode == currentViewCode)>
            <li class="breadcrumb-item active" aria-current="page">${currentTarget.title}</li>
            <#else>
            <li class="breadcrumb-item">
                <a href="${currentTarget.url}">${currentTarget.title}</a>
            </li>
            </#if>
            <#else>
            ${currentTarget.title}
            </#if>
            <#assign first=false>
            </@wp.nav>
        </ol>
    </nav>
</div>
',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('language_choose','language_choose',NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<@wp.info key="langs" var="langsVar" />
<@wp.info key="currentLang" var="currentLangVar" />

<style>
 .language {
    grid-area: login;
    background: #fff;
    border: 1px solid #4e4e4e;
    color: #4e4e4e;
    font-family: Cabin-Regular;
    font-style: normal;
    font-weight: 400;
    font-size: 15px;
    height: 42px;
    min-width: 94px;
    width: auto;
    text-transform: capitalize;
    padding: .1em;
}
</style>

<div class="dropdown">
    <button class="btn language dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <@wp.i18n key="ESLC_LANGUAGE" />
    </button>

    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
        <@wp.freemarkerTemplateParameter var="langsListVar" valueName="langsVar" removeOnEndTag=true >
        <#list langsListVar as curLangVar>
            <a class="dropdown-item <#if (curLangVar.code == currentLangVar)>active</#if>"  href="<@wp.url lang="${curLangVar.code}" paramRepeat=true />">
            <@wp.i18n key="ESLC_LANG_${curLangVar.code}" />
            </a>
        </#list>
        </@wp.freemarkerTemplateParameter>
    </div>
</div>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('insurance_inclusions',NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]>

<link rel="stylesheet" href="<@wp.resourceURL />static/css/all.css">
<link href="<@wp.resourceURL />static/css/bootstrap.min.css" rel="stylesheet">
<link href="<@wp.resourceURL />static/css/mdb.min.css" rel="stylesheet">
<link rel="stylesheet" href="<@wp.resourceURL />static/css/seed.css" rel="stylesheet">
<link rel="stylesheet" href="<@wp.resourceURL />static/css/media-queries.css" rel="stylesheet">
<link rel="stylesheet" href="<@wp.resourceURL />static/css/seed-insurance.css" rel="stylesheet">
<link rel="stylesheet" href="<@wp.resourceURL />static/css/media-queries-insurance.css" rel="stylesheet">
<script type="text/javascript" src="<@wp.resourceURL />static/js/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>',NULL,0);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list','content_viewer_list','jacms','<#assign jacms=JspTaglibs["/jacms-aps-core"]>
<#assign wp=JspTaglibs["/aps-core"]>

<section class="list-with-row if-insurance">
    <@jacms.contentList listName="contentList" titleVar="titleVar"
    pageLinkVar="pageLinkVar" pageLinkDescriptionVar="pageLinkDescriptionVar" userFilterOptionsVar="userFilterOptionsVar" />

    <div>			  
            <#if (titleVar??)>
            <div class="line_title"><h1>${titleVar}</h1></div>
            
            </#if>

            <@wp.freemarkerTemplateParameter var="userFilterOptionsVar" valueName="userFilterOptionsVar" removeOnEndTag=true >
            <@wp.fragment code="jacms_content_viewer_list_userfilters" escapeXml=false />

            </@wp.freemarkerTemplateParameter>

            <#if (contentList??) && (contentList?has_content) && (contentList?size > 0)>
            <@wp.pager listName="contentList" objectName="groupContent" pagerIdFromFrame=true advanced=true offset=5>
            <@wp.freemarkerTemplateParameter var="group" valueName="groupContent" removeOnEndTag=true >

            <div class="row no-gutters justify-content-start">
                <#list contentList as contentId>
                <#if (contentId_index >= groupContent.begin) && (contentId_index <= groupContent.end)>
                  <@jacms.content contentId="${contentId}" />
                </#if>
                </#list>
            </div>

            <@wp.fragment code="default_pagerBlock" escapeXml=false />
            </@wp.freemarkerTemplateParameter>
            </@wp.pager>
            <#else>
            <p class="alert alert-info">
                <@wp.i18n key="LIST_VIEWER_EMPTY" />
            </p>
            </#if>

            <#if (pageLinkVar??) && (pageLinkDescriptionVar??)>
            <div class="text-right p-4">
                <a class="list-link"  href="<@wp.url page="${pageLinkVar}"/>">
                ${pageLinkDescriptionVar}    <i class="fas fa-arrow-right"></i>
                </a>
            </div>
            </#if>
            <#assign contentList="">
    </div>
</section>','<#assign jacms=JspTaglibs["/jacms-aps-core"]>
<#assign wp=JspTaglibs["/aps-core"]>
<@wp.headInfo type="JS_EXT" info="http://code.jquery.com/ui/1.10.3/jquery-ui.min.js" />
<@jacms.contentList listName="contentList" titleVar="titleVar"
	pageLinkVar="pageLinkVar" pageLinkDescriptionVar="pageLinkDescriptionVar" userFilterOptionsVar="userFilterOptionsVar" />
<#if (titleVar??)>
	<h1>${titleVar}</h1>
</#if>
<@wp.freemarkerTemplateParameter var="userFilterOptionsVar" valueName="userFilterOptionsVar" removeOnEndTag=true >
<@wp.fragment code="jacms_content_viewer_list_userfilters" escapeXml=false />
</@wp.freemarkerTemplateParameter>
<#if (contentList??) && (contentList?has_content) && (contentList?size > 0)>
	<@wp.pager listName="contentList" objectName="groupContent" pagerIdFromFrame=true advanced=true offset=5>
		<@wp.freemarkerTemplateParameter var="group" valueName="groupContent" removeOnEndTag=true >
		<@wp.fragment code="default_pagerBlock" escapeXml=false />
<#list contentList as contentId>
<#if (contentId_index >= groupContent.begin) && (contentId_index <= groupContent.end)>
	<@jacms.content contentId="${contentId}" />
</#if>
</#list>
		<@wp.fragment code="default_pagerBlock" escapeXml=false />
		</@wp.freemarkerTemplateParameter>
	</@wp.pager>
<#else>
		<p class="alert alert-info"><@wp.i18n key="LIST_VIEWER_EMPTY" /></p>
</#if>
<#if (pageLinkVar??) && (pageLinkDescriptionVar??)>
	<p class="text-right"><a class="btn btn-primary" href="<@wp.url page="${pageLinkVar}"/>">${pageLinkDescriptionVar}</a></p>
</#if>
<#assign contentList="">',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('default_pagerBlock',NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]>
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"]>

<#if (group.size > group.max)>
	<nav aria-label="FAQ paginator" class="nav-pagination">
		<ul class="entando-pagination pagination justify-content-end">
		<#if (1 != group.currItem)>
			<#if (group.advanced)>
				<#if (1 != group.beginItemAnchor)>
					<li class="page-item">
						<a
								class="page-link"
								href="<@wp.url paramRepeat=true ><@wp.parameter name="${group.paramItemName}" ><@c.out value="${group.currItem - group.offset}" /></@wp.parameter></@wp.url>"
								title="<@wp.i18n key="PAGER_STEP_BACKWARD" />&#32;<@c.out value="${group.offset}" />">
								<i class="fas fa-angle-left"></i>
						</a>
					</li>
				</#if>
			</#if>
		</#if>
		<#list group.items as item>
		<#if (item_index >= (group.beginItemAnchor-1)) && (item_index <= (group.endItemAnchor-1))>
			<#if (item == group.currItem)>
			<li class="page-item active"><a class="page-link" href="#"><@c.out value="${item}"/></a></li>
			<#else>
			<li class="page-item" ><a class="page-link" href="<@wp.url paramRepeat=true ><@wp.parameter name="${group.paramItemName}" ><@c.out value="${item}"/></@wp.parameter></@wp.url>"><@c.out value="${item}"/></a></li>
			</#if>
		</#if>
		</#list>
		<#if (group.maxItem != group.currItem)>
			<#if (group.advanced)>
				<#if (group.maxItem != group.endItemAnchor)>
					<li class="page-item" >
                                             <a 
                                                  class="page-link" 
                                                  href="<@wp.url paramRepeat=true ><@wp.parameter name="${group.paramItemName}" ><@c.out value="${group.currItem + group.offset}" /></@wp.parameter></@wp.url>" 
                                                  title="<@wp.i18n key="PAGER_STEP_FORWARD" />&#32;<@c.out value="${group.offset}" />">
                                                       <i class="fas fa-angle-right"></i>
                                             </a>
                                       </li>
				</#if>
			</#if>
		</#if>
		</ul>
	</nav>
</#if>
','<#assign wp=JspTaglibs["/aps-core"]>

<#if (group.size > group.max)>
	<div class="pagination pagination-centered">
		<ul>
		<#if (1 != group.currItem)>
			<#if (group.advanced)>
				<li><a href="<@wp.url paramRepeat=true ><@wp.parameter name="${group.paramItemName}" >1</@wp.parameter></@wp.url>" title="<@wp.i18n key="PAGER_FIRST" />"><i class="icon-fast-backward"></i></a></li>
				<#if (1 != group.beginItemAnchor)>
					<li><a href="<@wp.url paramRepeat=true ><@wp.parameter name="${group.paramItemName}" >${group.currItem - group.offset}</@wp.parameter></@wp.url>" title="<@wp.i18n key="PAGER_STEP_BACKWARD" />&#32;${group.offset}"><i class="icon-step-backward"></i></a></li>
				</#if>
			</#if>
			<li><a href="<@wp.url paramRepeat=true ><@wp.parameter name="${group.paramItemName}" >${group.prevItem}</@wp.parameter></@wp.url>"><@wp.i18n key="PAGER_PREV" /></a></li>
		</#if>
		<#list group.items as item>
		<#if (item_index >= (group.beginItemAnchor-1)) && (item_index <= (group.endItemAnchor-1))>
			<#if (item == group.currItem)>
			<li class="active"><a href="#">${item}</a></li>
			<#else>
			<li><a href="<@wp.url paramRepeat=true ><@wp.parameter name="${group.paramItemName}" >${item}</@wp.parameter></@wp.url>">${item}</a></li>
			</#if>
		</#if>
		</#list>
		<#if (group.maxItem != group.currItem)>
			<li><a href="<@wp.url paramRepeat=true ><@wp.parameter name="${group.paramItemName}" >${group.nextItem}</@wp.parameter></@wp.url>"><@wp.i18n key="PAGER_NEXT" /></a></li>
			<#if (group.advanced)>
				<#if (group.maxItem != group.endItemAnchor)>
					<li><a href="<@wp.url paramRepeat=true ><@wp.parameter name="${group.paramItemName}" >${group.currItem + group.offset}</@wp.parameter></@wp.url>" title="<@wp.i18n key="PAGER_STEP_FORWARD" />&#32;${group.offset}"><i class="icon-step-forward"></i></a></li>
				</#if>
				<li><a href="<@wp.url paramRepeat=true ><@wp.parameter name="${group.paramItemName}" >${group.maxItem}</@wp.parameter></@wp.url>" title="<@wp.i18n key="PAGER_LAST" />"><i class="icon-fast-forward"></i></a></li>
			</#if>
		</#if>
		</ul>
	</div>
</#if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('jacms_content_viewer_list_userfilter_ent_Text',NULL,'jacms','<#assign wp=JspTaglibs["/aps-core"]>
<#assign formFieldNameVar = userFilterOptionVar.formFieldNames[0] >
<#assign formFieldValue = userFilterOptionVar.getFormFieldValue(formFieldNameVar) >
<#assign i18n_Attribute_Key = userFilterOptionVar.attribute.name >

<div class="form-group">
  <input name="${formFieldNameVar}" id="${formFieldNameVar}" value="${formFieldValue}" type="text" class="form-control" placeholder="<@wp.i18n key="TEXT_PLACEHOLDER" />"/>
 </div>
','<#assign wp=JspTaglibs["/aps-core"]>
<#assign formFieldNameVar = userFilterOptionVar.formFieldNames[0] >
<#assign formFieldValue = userFilterOptionVar.getFormFieldValue(formFieldNameVar) >
<#assign i18n_Attribute_Key = userFilterOptionVar.attribute.name >
<div class="control-group">
	<label for="${formFieldNameVar}" class="control-label"><@wp.i18n key="${i18n_Attribute_Key}" /></label>
	<div class="controls">
		<input name="${formFieldNameVar}" id="${formFieldNameVar}" value="${formFieldValue}" type="text" class="input-xlarge"/>
	</div>
</div>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('entando-widget-navigation_bar_include',NULL,NULL,'<#assign wp=JspTaglibs["/aps-core"]> 
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"]> 
<#assign liClass='' class="nav-item dropdown no-son-page"''>
<#assign homeIcon="">
<#assign caret="">
<#assign ulClass='' ''>
<#assign aClassAndData="">
<#assign aURL=previousPage.url>
<#if (previousPage.voidPage)>
  <#assign aURL=''#'' />
</#if>
<#if (previousPage.code?contains("homepage"))>
  <#assign homeIcon=''<i class="icon-home"></i>&#32;''>
</#if>
<#if (previousPage.code==currentPageCode)>
  <#assign liClass='' class="nav-item active dropdown "''>
</#if>
<#if (previousLevel < level)>
  <#assign liClass='' class="nav-item dropdown "''>
    <#if (previousPage.code==currentPageCode)>
      <#assign liClass='' class="dropdown active"''>
    </#if>
    <#if previousPage.voidPage>
      <#assign liClass='' class="dropdown"''>
    </#if>
    <#if (previousLevel> 0) >
      <#assign liClass='' class="dropdown-submenu"''>
        <#if (previousPage.code==currentPageCode)>
          <#assign liClass='' class="dropdown-submenu active''>
        </#if>
        <#assign ulClass='' class="dropdown-menu"''>
    </#if>
    <#assign aClassAndData='' class="nav-link dropdown-toggle" data-toggle="dropdown"''>
      <#if (previousLevel==0)>
        <#assign caret='' ''>
          <#assign liClass='' class="nav-item dropdown "''>
      </#if>
</#if>
<#if (previousLevel==0)>
  <li ${liClass} padre>
</#if>
<#if (aURL !='''' )>
 
  <a href="${aURL}" ${aClassAndData} class="nav-link no-son-page">${homeIcon}${previousPage.title}${caret}</a>
</#if>


<#if (aURL=='''' )>
  <a href="#">
</#if>
<#if (previousLevel==level)>
  <#if (previousLevel==0)>
    </li>
  </#if>
</#if>
<#if (previousLevel < level)>
  <ul class="dropdown-menu">
</#if>
<#if (previousLevel> level)>
  <#list 1..(previousLevel - level) as ignoreMe>
    </ul>
  </#list>
  </li>
</#if>','<#assign wp=JspTaglibs["/aps-core"]>
<#assign c=JspTaglibs["http://java.sun.com/jsp/jstl/core"]>


<#assign liClass="">
<#assign homeIcon="">
<#assign caret="">
<#assign ulClass='' class="dropdown-menu"''>
<#assign aClassAndData="">
<#assign aURL=previousPage.url>

<#if (previousPage.voidPage)>
       <#assign aURL=''#'' />
</#if>

<#if (previousPage.code?contains("homepage"))>
     <#assign homeIcon=''<i class="icon-home"></i>&#32;''>
</#if>

<#if (previousPage.code == currentPageCode)>
     <#assign liClass='' class="active"''>
</#if>

<#if (previousLevel < level)>
    <#assign liClass='' class="dropdown"'' >

    <#if (previousPage.code == currentPageCode)>
	<#assign liClass='' class="dropdown active"''>
    </#if>

    <#if previousPage.voidPage>
	<#assign liClass='' class=" dropdown"'' >
    </#if>

    <#if (previousLevel > 0) >
	<#assign liClass='' class="dropdown-submenu"''>
	<#if (previousPage.code == currentPageCode)>
		<#assign liClass='' class="dropdown-submenu active"''>
    	</#if>

	<#assign ulClass='' class="dropdown-menu"''>
    </#if>

    <#assign aClassAndData='' class="dropdown-toggle" data-toggle="dropdown"''>

    <#if (previousLevel == 0)>
	<#assign caret='' <span class="caret"></span>''>
    </#if>
</#if>

<li ${liClass} >
	<a href="${aURL}"  ${aClassAndData} >
				<!-- [ ${previousLevel} ] -->
				${homeIcon}
				${previousPage.title}
				${caret}
	</a>

<#if (previousLevel == level)></li></#if>
<#if (previousLevel < level)>
    <ul ${ulClass}>
</#if>
<#if (previousLevel > level)>
     <#list 1..(previousLevel - level) as ignoreMe>
            </li></ul>
     </#list>
    </li>
</#if>',1);
INSERT INTO guifragment (code,widgettypecode,plugincode,gui,defaultgui,locked) VALUES ('entando-widget-navigation_bar','entando-widget-navigation_bar',NULL,'<#assign c=JspTaglibs[ "http://java.sun.com/jsp/jstl/core" ]>
<#assign wp=JspTaglibs[ "/aps-core" ]>
<@wp.currentPage param="code" var="currentPageCode" />
<@wp.freemarkerTemplateParameter var="currentPageCode" valueName="currentPageCode" />
<ul class="navbar-nav navbar-menu">
    <#assign homeClass=''class="home"''>
    <#if (currentPageCode=="home" )>
    <#assign homeClass=''class="home active"''>
    </#if>
    <@wp.nav var="page">
    <#if (previousPage?? && previousPage.code??)>
    <#assign previousLevel=previousPage.level>
    <#assign level=page.level>
    <@wp.freemarkerTemplateParameter var="level" valueName="level" />
    <@wp.freemarkerTemplateParameter var="previousLevel" valueName="previousLevel" />
    <@wp.fragment code="entando-widget-navigation_bar_include" escapeXml=false />
    </#if>
    <@wp.freemarkerTemplateParameter var="previousPage" valueName="page" />
    </@wp.nav>
    <#if (previousPage??)>
    <#assign previousLevel=previousPage.level>
    <#assign level=0>
    <@wp.freemarkerTemplateParameter var="level" valueName="level" />
    <@wp.freemarkerTemplateParameter var="previousLevel" valueName="previousLevel" />
    <@wp.fragment code="entando-widget-navigation_bar_include" escapeXml=false />
    <#if (previousLevel !=0 )>
    <#list 0..(previousLevel - 1) as ignoreMe>
</ul>
</li>
</#list>
<#else>
</ul>
</#if>
</#if>

<@wp.freemarkerTemplateParameter var="previousPage" valueName="" removeOnEndTag=true />','<#assign wp=JspTaglibs["/aps-core"]>

<@wp.headInfo type="JS" info="entando-misc-jquery/jquery-3.4.1.min.js" />
<@wp.headInfo type="JS" info="entando-misc-bootstrap/bootstrap.min.js" />

<@wp.currentPage param="code" var="currentPageCode" />
<@wp.freemarkerTemplateParameter var="currentPageCode" valueName="currentPageCode" />
<ul class="nav">
<@wp.nav var="page">

<#if (previousPage?? && previousPage.code??)>
	<#assign previousLevel=previousPage.level>
	<#assign level=page.level>
        <@wp.freemarkerTemplateParameter var="level" valueName="level" />
	<@wp.freemarkerTemplateParameter var="previousLevel" valueName="previousLevel" />
	<@wp.fragment code="entando-widget-navigation_bar_include" escapeXml=false />
</#if>

	<@wp.freemarkerTemplateParameter var="previousPage" valueName="page" />
</@wp.nav>

<#if (previousPage??)>
	<#assign previousLevel=previousPage.level>
        <#assign level=0>
	<@wp.freemarkerTemplateParameter var="level" valueName="level" />
	<@wp.freemarkerTemplateParameter var="previousLevel" valueName="previousLevel" />
	<@wp.fragment code="entando-widget-navigation_bar_include" escapeXml=false />

        <#if (previousLevel != 0)>
        <#list 0..(previousLevel - 1) as ignoreMe>
            </ul></li>
        </#list>

	</#if>
</#if>

</ul>
<@wp.freemarkerTemplateParameter var="previousPage" valueName="" removeOnEndTag=true />',1);
