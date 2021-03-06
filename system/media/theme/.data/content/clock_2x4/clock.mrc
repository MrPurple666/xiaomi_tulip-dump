PK
     8NAk         description.xml<?xml version="1.0" encoding="utf-8" standalone="no"?>
<MIUI-Theme category="clock" size="2:4">
    <autoChange>true</autoChange>
</MIUI-Theme>
PK
     8Nr©¤       manifest.xml<?xml version="1.0" encoding="utf-8"?>
<Clock version="1" frameRate="0" type="awesome" useVariableUpdater="DateTime.Minute" resDensity="480" pivotX="0.25" pivotY="0.3">
    <VariableBinders>
         <ContentProviderBinder
            uri="content://weather/weather"
            columns="city_name,weather_type,temperature"
            countName="hasweather">
             <Variable name="weather_id" type="int" column="weather_type"/>
             <Variable name="temperature_unit" type="string" column="temperature_unit"/>
             <Variable name="weather_temperature" type="int" column="temperature"/>
             <Variable name="weather_temperature_str" type="string" column="temperature"/>
         </ContentProviderBinder>
    </VariableBinders>
    <Var name="weather_description" expression="eval('@weather_type_'+#weather_id)" type="string"/>
    <Var name="weather_description_null" expression="eval(@weather_type_null)" type="string"/>
	<Var name="color_time" type="string" expression="ifelse(#applied_light_wallpaper,'#b3000000','#ffffffff')" />
	<Var name="color_date" type="string" expression="ifelse(#applied_light_wallpaper,'#80000000','#ccffffff')" />
	
	<Var name="is_rain" expression="ge(#weather_id,4)*le(#weather_id,6)+ge(#weather_id,8)*le(#weather_id,11)+eq(#weather_id,25)" />
    <Var name="is_snow" expression="ge(#weather_id,13)*le(#weather_id,17)" />
    <Var name="is_dust" expression="ge(#weather_id,18)*le(#weather_id,21)+eq(#weather_id,23)" />
	
	<Var name="not_null" expression="#hasweather*len(@weather_temperature_str)*not(isnull(#weather_id))" />
    <Var name="icon_suffix" expression="ifelse(not(#not_null),1,gt(#weather_id,25),1,#weather_id)" />
    <Var name="icon_index" expression="ifelse(#is_rain,4,#is_snow,13,#is_dust,18,#icon_suffix)" />
		
    
	<DateTime x="34" y="-2" size="150" color="@color_time" format="h:mm" fontFamily="miui-thin" visibility="eq(#time_format,0)"/>
	<DateTime x="34" y="-2" size="150" color="@color_time" format="HH:mm" fontFamily="miui-thin" visibility="eq(#time_format,1)"/>
    <DateTime enableFontScale="true" x="40" y="172" w="450" marqueeSpeed="30" format="@date_time" size="36" color="@color_date" contentDescriptionFormat="@desc_date_format" visibility="#time_format"/>
    <DateTime enableFontScale="true" x="40" y="172" w="450" marqueeSpeed="30" format="@date_time_12" size="36" color="@color_date" contentDescriptionFormat="@desc_date_format_12" visibility="not(#time_format)"/>
    
	<Group visibility="#not_null">
	    <Text name="weather_temperature" enableFontScale="true" x="#view_width-40" y="168" align="right" textExp="#weather_temperature + ifelse(eq(@temperature_unit,'1'),'Â°C',eq(@temperature_unit,'0'),'Â°F','Â°C')" size="38" color="@color_date"/>
	    <Text name="text_description" enableFontScale="true" x="#view_width-64-#weather_temperature.text_width" y="170" w="310" marqueeSpeed="30" align="right" textExp="@weather_description" size="36" color="@color_date"/>
	</Group>
	<Text name="weather_degree" enableFontScale="true" x="#view_width-40" y="170" textExp="@weather_description_null" align="right" size="36" color="@color_date" visibility="not(#not_null)"/>
	<Image name="img_weather" srcExp="'weather/weather.png'" srcid="ifelse(gt(#weather_id,25)+lt(#weather_id,0),1,#icon_index)" x="#view_width-33" y="10" align="right" touchable="true"/>
           
	<Button x="#view_width-39" y="0" w="159" h="270" align="right" contentDescriptionExp="eval(@desc_weather)">
            <Triggers>
                <Trigger action="up">
                    <IntentCommand action="android.intent.action.MAIN" package="com.miui.weather2" class="com.miui.weather2.ActivityWeatherMain"/>
                </Trigger>
            </Triggers>
        </Button>
	<Button name="clock_button" x="0" y="0" width="480" height="193" contentDescriptionExp="eval(@desc_time)"/>
	<Button x="0" y="194" width="480" height="77" >
		<Triggers>
			<Trigger action="up">
				<IntentCommand action="android.intent.action.MAIN" package="com.android.calendar" class="com.android.calendar.AllInOneActivity"/>
			</Trigger>
		</Triggers>
	</Button>
</Clock>
PK
     68N               strings/PK
     8NIÑ49~  ~     strings/strings_km_KH.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE dd MMMM</string>
    <string name="date_time_12">EEE dd MMMM</string>
    <string name="desc_date_format">EEEE dd MMM</string>
    <string name="desc_date_format_12">EEEE dd MMM</string>
    <string name="desc_time">'ááááááá¶ááááá»áááááá\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', ááááá¸ááááá¾áááá¸ááááá¼ááááááá·áá¸áá¶á¡á·áá¶'</string>
    <string name="weather_type_null">'áá·ááá¶ááá·áááááá'</string>
    <string name="weather_type_0">áááá¡á</string>
    <string name="weather_type_1">áá¶áááá</string>
    <string name="weather_type_2">áá»áá¢áááá</string>
    <string name="weather_type_3">áá»áá¢á¶áááááá¶áá</string>
    <string name="weather_type_4">áááá»ááááááâáááá¶áá</string>
    <string name="weather_type_5">áááá»áááááá</string>
    <string name="weather_type_6">ááááááááá¶ááâááá¶áâáááá¶áá</string>
    <string name="weather_type_7">áááá»ááá¶áááááááááá</string>
    <string name="weather_type_8">áááááááá¹á</string>
    <string name="weather_type_9">ááááááááá¶ááâáááá¶áá</string>
    <string name="weather_type_10">ááááá</string>
    <string name="weather_type_11">ááá¹áááááááá</string>
    <string name="weather_type_12">ááááááá¶ááááá·á</string>
    <string name="weather_type_13">áááá»ááá¶ááááá¶áááá¹áááááá¡á¸</string>
    <string name="weather_type_14">ááááâááâáá¶ááááá¶áááá¹áááááá¡á¸âáá¶âá¢áááá¾á</string>
    <string name="weather_type_15">áá¶ááááá¶áááá¹áááááá¡á¸âáááá¶áá</string>
    <string name="weather_type_16">áá¶ááááá¶áááá¹áááááá¡á¸</string>
    <string name="weather_type_17">áá¶ááááá¶áááá¹áááááá¡á¸âááá»áá</string>
    <string name="weather_type_18">áááá»ááááá¶ááâáááá¶áá</string>
    <string name="weather_type_19">áááá»ááááá¶áá</string>
    <string name="weather_type_20">áááá»ááááá¶ááâáááá¶áá</string>
    <string name="weather_type_21">áááá»ááááá¶áá</string>
    <string name="weather_type_22">áááá¶áááááá·á</string>
    <string name="weather_type_23">áá¼áá¸âá¢ááááá</string>
    <string name="weather_type_24">áá»áá¢áááá</string>
    <string name="weather_type_25">áááááâááááá¶áááá</string>
</resources>
PK
     8Nþ¢ø	  ø	     strings/strings_pa_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'à¨µà¨°à¨¤à¨®à¨¾à¨¨ à¨¸à¨®à¨¾à¨\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', à¨à©à© à¨à¨ª à¨µà¨¿à©±à¨ à¨¦à¨¾à¨à¨² à¨¹à©à¨£ à¨²à¨ à¨¦à© à¨µà¨¾à¨° à¨à©à¨ª à¨à¨°à©'</string>
    <string name="weather_type_null">'à¨à©à¨ à¨¡à¨¾à¨à¨¾ à¨¨à¨¹à©à¨'</string>
    <string name="weather_type_0">à¨¸à¨¾à¨«à¨¼</string>
    <string name="weather_type_1">à¨¬à©±à¨¦à¨²à¨µà¨¾à¨ à¨µà¨¾à¨²à¨¾</string>
    <string name="weather_type_2">à¨§à©à©°à¨¦à¨²à¨¾</string>
    <string name="weather_type_3">à¨§à©à©°à¨¦ à¨µà¨¾à¨²à¨¾</string>
    <string name="weather_type_4">à¨­à¨¾à¨°à© à¨¤à©à¨«à¨¼à¨¾à¨¨à© à¨µà¨°à¨à¨¾</string>
    <string name="weather_type_5">à¨¤à©à¨«à¨¼à¨¾à¨¨à© à¨µà¨°à¨à¨¾</string>
    <string name="weather_type_6">à¨¬à¨¹à©à¨¤ à¨­à¨¾à¨°à© à¨µà¨°à¨à¨¾</string>
    <string name="weather_type_7">à¨à¨°à¨à¨¨ à¨µà¨¾à¨²à¨¾ à¨¤à©à¨«à¨¼à¨¾à¨¨</string>
    <string name="weather_type_8">à¨µà¨°à¨à¨¾ à¨¦à© à¨à©à©</string>
    <string name="weather_type_9">à¨­à¨¾à¨°à© à¨µà¨°à¨à¨¾</string>
    <string name="weather_type_10">à¨µà¨°à¨à¨¾</string>
    <string name="weather_type_11">à¨¬à©à©°à¨¦à¨¾à¨¬à¨¾à¨à¨¦à©</string>
    <string name="weather_type_12">à¨à©à¨¿à¨à¨ à¨¦à© à¨¨à¨¾à¨² à¨µà¨°à¨à¨¾</string>
    <string name="weather_type_13">à¨¬à¨°à©à©à¨²à¨¾ à¨¤à©à¨«à¨¼à¨¾à¨¨</string>
    <string name="weather_type_14">à¨à¨¿à¨¤à©-à¨à¨¿à¨¤à© à¨¬à¨°à©à¨¬à¨¾à¨°à©</string>
    <string name="weather_type_15">à¨­à¨¾à¨°à© à¨¬à¨°à©à¨¬à¨¾à¨°à©</string>
    <string name="weather_type_16">à¨¬à¨°à©à¨¬à¨¾à¨°à©</string>
    <string name="weather_type_17">à¨¹à¨²à¨à© à¨¬à¨°à©à¨¬à¨¾à¨°à©</string>
    <string name="weather_type_18">à¨­à¨¾à¨°à© à¨°à©à¨¤à¨²à© à¨¹à¨¨à©à¨°à©</string>
    <string name="weather_type_19">à¨°à©à¨¤à¨²à© à¨¹à¨¨à©à¨°à©</string>
    <string name="weather_type_20">à¨¹à¨²à¨à© à¨°à©à¨¤à¨²à© à¨¹à¨¨à©à¨°à©</string>
    <string name="weather_type_21">à¨°à©à¨¤à¨²à© à¨¹à¨¨à©à¨°à©</string>
    <string name="weather_type_22">à¨à©à©</string>
    <string name="weather_type_23">à¨à¨¸à¨¥à¨¾à¨ à¨§à©à©</string>
    <string name="weather_type_24">à¨§à©à©°à¨¦</string>
    <string name="weather_type_25">à¨¬à¨¹à©à¨¤ à¨ à©°à¨¡à© à¨¬à¨¾à¨°à¨¶</string>
</resources>
PK
     8N+
  
     strings/strings_ne_NP.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'à¤¹à¤¾à¤²à¤à¥ à¤¸à¤®à¤¯\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', à¤à¤¡à¥ à¤à¤ª à¤­à¤¿à¤¤à¥à¤° à¤à¤¾à¤¨ à¤¦à¥à¤à¤ªà¤à¤ à¤à¥à¤¯à¤¾à¤ª à¤à¤°à¥à¤¨à¥à¤¹à¥à¤¸à¥'</string>
    <string name="weather_type_null">'à¤¡à¤¾à¤à¤¾ à¤à¥à¤¨'</string>
    <string name="weather_type_0">à¤à¤¾à¤²à¥ à¤à¤°à¥à¤¨à¥à¤¹à¥à¤¸à¥</string>
    <string name="weather_type_1">à¤¬à¤¾à¤¦à¤² à¤²à¤¾à¤à¥à¤à¥</string>
    <string name="weather_type_2">à¤§à¤®à¤¿à¤²à¥</string>
    <string name="weather_type_3">à¤¤à¥à¤µà¤¾à¤à¤²à¥ à¤²à¤¾à¤à¥à¤à¥</string>
    <string name="weather_type_4">à¤¤à¥à¤ à¤¤à¥à¤«à¤¾à¤¨</string>
    <string name="weather_type_5">à¤à¤à¤§à¥</string>
    <string name="weather_type_6">à¤ à¥à¤²à¥ à¤­à¤¾à¤°à¥ à¤¬à¤°à¥à¤·à¤¾</string>
    <string name="weather_type_7">à¤à¤à¥à¤¯à¤¾à¤à¥</string>
    <string name="weather_type_8">à¤¬à¤°à¥à¤¸à¤¾</string>
    <string name="weather_type_9">à¤­à¤¾à¤°à¥ à¤¬à¤°à¥à¤·à¤¾</string>
    <string name="weather_type_10">à¤¬à¤°à¥à¤·à¤¾</string>
    <string name="weather_type_11">à¤¹à¤²à¥à¤à¤¾ à¤¬à¤°à¥à¤·à¤¾</string>
    <string name="weather_type_12">à¤à¤¸à¤¿à¤¨à¤¾ à¤¸à¤¹à¤¿à¤¤à¤à¥ à¤¬à¤°à¥à¤·à¤¾</string>
    <string name="weather_type_13">à¤¹à¤¿à¤®à¤ªà¤¾à¤¤</string>
    <string name="weather_type_14">à¤¹à¤¿à¤®à¤ªà¤¾à¤¤à¤à¥ à¤à¤£à¥à¤¡à¤¹à¤°à¥</string>
    <string name="weather_type_15">à¤­à¤¾à¤°à¥ à¤¹à¤¿à¤®à¤ªà¤¾à¤¤</string>
    <string name="weather_type_16">à¤¹à¤¿à¤®à¤ªà¤¾à¤¤</string>
    <string name="weather_type_17">à¤¹à¤²à¥à¤à¤¾ à¤¹à¤¿à¤®à¤ªà¤¾à¤¤</string>
    <string name="weather_type_18">à¤¬à¤²à¤¿à¤¯à¥ à¤¬à¤¾à¤²à¥à¤µà¤¾à¤à¥ à¤à¤à¤§à¥</string>
    <string name="weather_type_19">à¤§à¥à¤²à¥ à¤¸à¤¹à¤¿à¤¤à¤à¥ à¤¤à¥à¤«à¤¾à¤¨</string>
    <string name="weather_type_20">à¤¹à¤²à¥à¤à¤¾ à¤§à¥à¤²à¥ à¤¸à¤¹à¤¿à¤¤à¤à¥ à¤¤à¥à¤«à¤¾à¤¨</string>
    <string name="weather_type_21">à¤¤à¥à¤«à¤¾à¤¨</string>
    <string name="weather_type_22">à¤à¤¸à¤¿à¤¨à¤¾</string>
    <string name="weather_type_23">à¤¤à¥à¤°à¤¿à¤°à¤¹à¥à¤à¥ à¤«à¥à¤¹à¥à¤°</string>
    <string name="weather_type_24">à¤¤à¥à¤µà¤¾à¤à¤²à¥</string>
    <string name="weather_type_25">à¤à¤ à¥à¤¯à¤¾à¤à¤à¥à¤°à¤¿à¤¨à¥ à¤µà¤°à¥à¤·à¤¾</string>
</resources>
PK
     8NëH¸  ¸     strings/strings_ur_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">MMMM dd, EEEE</string>
    <string name="desc_date_format_12">MMMM dd, EEEE</string>
    <string name="desc_time">'Ø­Ø§ÙÛÛ ÙÙØª \' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\' Ú¯Ú¾ÚÛ Ø§ÛÙ¾ ÙÛÚº Ø¬Ø§ÙÛ Ú©Û ÙÛÛ Ø¯Ù Ø¨Ø§Ø± Ù¹ÛÙ¾ Ú©Ø±ÛÚº'</string>
    <string name="weather_type_null">'Ú©ÙØ¦Û ÚÛÙ¹Ø§ ÙÛÛÚº ÛÛ'</string>
    <string name="weather_type_0">ØµØ§Ù</string>
    <string name="weather_type_1">Ø§Ø¨Ø±Ø¢ÙÙØ¯</string>
    <string name="weather_type_2">Ú¯Ø±Ø¯ Ù ØºØ¨Ø§Ø± ÙØ§ÙØ§</string>
    <string name="weather_type_3">Ú©ÛØ± Ø¢ÙÙØ¯</string>
    <string name="weather_type_4">Ø´Ø¯ÛØ¯ Ø·ÙÙØ§ÙÛ Ø¨Ø§Ø±Ø´</string>
    <string name="weather_type_5">Ø·ÙÙØ§ÙÛ Ø¨Ø§Ø±Ø´</string>
    <string name="weather_type_6">Ø¨ÛØª Ø´Ø¯ÛØ¯ Ø¨Ø§Ø±Ø´</string>
    <string name="weather_type_7">Ø·ÙÙØ§Ù Ø¨Ø±Ù ÙØ¨Ø§Ø¯</string>
    <string name="weather_type_8">Ø¨ÙÚÚ¾Ø§Ø±</string>
    <string name="weather_type_9">Ø´Ø¯ÛØ¯ Ø¨Ø§Ø±Ø´</string>
    <string name="weather_type_10">Ø¨Ø§Ø±Ø´</string>
    <string name="weather_type_11">Ù¾Ú¾ÙØ§Ø±</string>
    <string name="weather_type_12">ÚØ§ÙÛ Ø¨Ø§Ø±Û</string>
    <string name="weather_type_13">Ø¨Ø±Ù Ú©Ø§ Ø·ÙÙØ§Ù</string>
    <string name="weather_type_14">Ù¹Ú©ÚÙÚº ÙÛÚº Ø¨Ø±Ù Ø¨Ø§Ø±Û</string>
    <string name="weather_type_15">Ø¨Ú¾Ø§Ø±Û Ø¨Ø±Ù Ø¨Ø§Ø±Û</string>
    <string name="weather_type_16">Ø¨Ø±Ù Ø¨Ø§Ø±Û</string>
    <string name="weather_type_17">ÛÙÚ©Û Ø¨Ø±Ù Ø¨Ø§Ø±Û</string>
    <string name="weather_type_18">Ø´Ø¯ÛØ¯ Ø±ÛØª Ú©Ø§ Ø·ÙÙØ§Ù</string>
    <string name="weather_type_19">Ø±ÛØª Ú©Ø§ Ø·ÙÙØ§Ù</string>
    <string name="weather_type_20">ÛÙÚ©Ø§ Ø±ÛØª Ú©Ø§ Ø·ÙÙØ§Ù</string>
    <string name="weather_type_21">Ø±ÛØª Ú©Ø§ Ø·ÙÙØ§Ù</string>
    <string name="weather_type_22">Ø§ÙÙØ§</string>
    <string name="weather_type_23">Ø¯Ú¾ÙÙ Ú©Ø§ ØºØ¨Ø§Ø±</string>
    <string name="weather_type_24">Ú¯Ø±Ø¯Ù ØºØ¨Ø§Ø±</string>
    <string name="weather_type_25">Ø¨Ø±ÙÛÙÛ Ø¨Ø§Ø±Ø´</string>
</resources>
PK
     8Näâ       strings/strings_ms_MY.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'masa semasa\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', klik berganda untuk masuk apl jam'</string>
    <string name="weather_type_null">'Tiada data'</string>
    <string name="weather_type_0">Cerah</string>
    <string name="weather_type_1">Mendung</string>
    <string name="weather_type_2">Jerebu</string>
    <string name="weather_type_3">Berkabus</string>
    <string name="weather_type_4">Hujan lebat yang teruk</string>
    <string name="weather_type_5">Hujan kilat</string>
    <string name="weather_type_6">Hujan yang sangat lebat</string>
    <string name="weather_type_7">Ribut petir</string>
    <string name="weather_type_8">Hujan renyai</string>
    <string name="weather_type_9">Hujan lebat</string>
    <string name="weather_type_10">Hujan</string>
    <string name="weather_type_11">Hujan renyai</string>
    <string name="weather_type_12">Hujan Batu</string>
    <string name="weather_type_13">Ribut salji</string>
    <string name="weather_type_14">Tompok-tompok salji</string>
    <string name="weather_type_15">Salji lebat</string>
    <string name="weather_type_16">Salji</string>
    <string name="weather_type_17">Salji ringan</string>
    <string name="weather_type_18">Ribut pasir yang kuat</string>
    <string name="weather_type_19">Ribut pasir</string>
    <string name="weather_type_20">Ribut pasir yang ringan</string>
    <string name="weather_type_21">Ribut pasir</string>
    <string name="weather_type_22">Hujan batu</string>
    <string name="weather_type_23">Debu terapung</string>
    <string name="weather_type_24">Jerebu</string>
    <string name="weather_type_25">Hujan beku</string>
</resources>
PK
     8Nz)N7û  û     strings/strings_iw_IL.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'×©×¢× × ×××××ª\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ××§×© ×¤×¢×××× ××× ××¡× ××××©×× ××©×¢××'</string>
    <string name="weather_type_null">'××× × ×ª×× ××'</string>
    <string name="weather_type_0">××××¨</string>
    <string name="weather_type_1">××¢×× ×</string>
    <string name="weather_type_2">××××</string>
    <string name="weather_type_3">×¢×¨×¤×××</string>
    <string name="weather_type_4">×¡××¤×ª ××©××× ×¨×¦×× ××ª</string>
    <string name="weather_type_5">×¡××¤×ª ××©×××</string>
    <string name="weather_type_6">××©× ××× ××××</string>
    <string name="weather_type_7">×¡××¤×ª ××¨×§××</string>
    <string name="weather_type_8">××××¨</string>
    <string name="weather_type_9">××©× ×××</string>
    <string name="weather_type_10">××©×</string>
    <string name="weather_type_11">××¤×××£</string>
    <string name="weather_type_12">××©× ××©××</string>
    <string name="weather_type_13">×¡××¤×ª ×©××××</string>
    <string name="weather_type_14">×©×× ×××§×</string>
    <string name="weather_type_15">×©×× ×××</string>
    <string name="weather_type_16">×©××</string>
    <string name="weather_type_17">×©×× ×§×</string>
    <string name="weather_type_18">×¡××¤×ª ××× ×××§×</string>
    <string name="weather_type_19">×¡××¤×ª ×××</string>
    <string name="weather_type_20">×¡××¤×ª ××× ×§××</string>
    <string name="weather_type_21">×¡××¤×ª ×××</string>
    <string name="weather_type_22">××¨×</string>
    <string name="weather_type_23">×××§</string>
    <string name="weather_type_24">××××</string>
    <string name="weather_type_25">××©× ××§×¤××</string>
</resources>
PK
     8NH<e¦ª  ª     strings/strings_uz_UZ.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">dd MMMM, EEE</string>
    <string name="date_time_12">dd MMMM, EEE</string>
    <string name="desc_date_format">dd MMMM, EEEE</string>
    <string name="desc_date_format_12">dd MMMM, EEEE</string>
    <string name="desc_time">'hozirgi vaqt\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', soat ilovasiga kirish uchun ikki marta bosing'</string>
    <string name="weather_type_null">'Maâlumot yoâq'</string>
    <string name="weather_type_0">Tiniq</string>
    <string name="weather_type_1">Bulutli</string>
    <string name="weather_type_2">Tumanli</string>
    <string name="weather_type_3">Tumanli</string>
    <string name="weather_type_4">Qattiq yomgâir</string>
    <string name="weather_type_5">Jala</string>
    <string name="weather_type_6">Juda kuchli yogâingarchilik</string>
    <string name="weather_type_7">Momaqaldiroq</string>
    <string name="weather_type_8">Jala</string>
    <string name="weather_type_9">Kuchli yogâingarchilik</string>
    <string name="weather_type_10">Yomgâir</string>
    <string name="weather_type_11">Mayda yomgâir</string>
    <string name="weather_type_12">Qorli yomgâir</string>
    <string name="weather_type_13">Qor boâroni</string>
    <string name="weather_type_14">Qorli jala</string>
    <string name="weather_type_15">Kuchli qor</string>
    <string name="weather_type_16">Qor</string>
    <string name="weather_type_17">Yengil qor</string>
    <string name="weather_type_18">Kuchli qum boâroni</string>
    <string name="weather_type_19">Qum boâroni</string>
    <string name="weather_type_20">Engil qum boâroni</string>
    <string name="weather_type_21">Qum boâroni</string>
    <string name="weather_type_22">Doâl</string>
    <string name="weather_type_23">Chang</string>
    <string name="weather_type_24">Tuman</string>
    <string name="weather_type_25">Qorli yomgâir</string>
</resources>
PK
     8N]ïi°w  w     strings/strings_ar_EG.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEEØ dd MMMM</string>
    <string name="date_time_12">EEEØ dd MMMM</string>
    <string name="desc_date_format">EEEEØ dd MMM</string>
    <string name="desc_date_format_12">EEEEØ dd MMM</string>
    <string name="desc_time">'Ø§ÙÙÙØª Ø§ÙØ­Ø§ÙÙ "+ #hour12+\' \'+ifelse(#minute,#minute,\'\')+"Ø Ø§ÙÙØ± ÙØ±ØªÙÙ ÙØ¯Ø®ÙÙ ØªØ·Ø¨ÙÙ Ø§ÙØ³Ø§Ø¹Ø©'</string>
    <string name="weather_type_null">'ÙØ§ ØªÙØ¬Ø¯ Ø¨ÙØ§ÙØ§Øª'</string>
    <string name="weather_type_0">ØµØ§ÙÙ</string>
    <string name="weather_type_1">ØºØ§Ø¦Ù</string>
    <string name="weather_type_2">Ø¶Ø¨Ø§Ø¨Ù</string>
    <string name="weather_type_3">Ø¶Ø¨Ø§Ø¨Ù</string>
    <string name="weather_type_4">Ø¹Ø§ØµÙØ© ÙØ·Ø±ÙØ© Ø´Ø¯ÙØ¯Ø©</string>
    <string name="weather_type_5">Ø¹Ø§ØµÙØ© ÙØ·Ø±ÙØ©</string>
    <string name="weather_type_6">Ø£ÙØ·Ø§Ø± ØºØ²ÙØ±Ø© Ø¬Ø¯Ø§</string>
    <string name="weather_type_7">Ø¹Ø§ØµÙØ© Ø±Ø¹Ø¯ÙØ©</string>
    <string name="weather_type_8">Ø£ÙØ·Ø§Ø± Ø®ÙÙÙØ©</string>
    <string name="weather_type_9">Ø£ÙØ·Ø§Ø± ØºØ²ÙØ±Ø©</string>
    <string name="weather_type_10">ÙØ·Ø±</string>
    <string name="weather_type_11">Ø±Ø°Ø§Ø°</string>
    <string name="weather_type_12">ÙØ·Ø± ÙØªØ¬ÙØ¯</string>
    <string name="weather_type_13">Ø¹Ø§ØµÙØ© Ø«ÙØ¬ÙØ©</string>
    <string name="weather_type_14">ÙØ·Ø¹ Ø«ÙÙØ¬ ÙØªØ³Ø§ÙØ·Ø©</string>
    <string name="weather_type_15">Ø«ÙØ¬ ÙØ«ÙÙ</string>
    <string name="weather_type_16">Ø«ÙÙØ¬</string>
    <string name="weather_type_17">Ø«ÙÙØ¬ Ø®ÙÙÙØ©</string>
    <string name="weather_type_18">Ø¹Ø§ØµÙØ© Ø±ÙÙÙØ© ÙÙÙØ©</string>
    <string name="weather_type_19">Ø¹Ø§ØµÙØ© Ø±ÙÙÙØ©</string>
    <string name="weather_type_20">Ø¹Ø§ØµÙØ© Ø±ÙÙÙØ© Ø®ÙÙÙØ©</string>
    <string name="weather_type_21">Ø¹Ø§ØµÙØ© Ø±ÙÙÙØ©</string>
    <string name="weather_type_22">Ø¨Ø±Ø¯</string>
    <string name="weather_type_23">ØºØ¨Ø§Ø± ÙÙ Ø§ÙÙÙØ§Ø¡</string>
    <string name="weather_type_24">Ø¶Ø¨Ø§Ø¨</string>
    <string name="weather_type_25">Ø§ÙØ·Ø§Ø± ÙØªØ¬ÙØ¯Ø©</string>
</resources>
PK
     8NÔÜqÃ  Ã     strings/strings_es_ES.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'hora actual\' + #hora12+\' \'+ifelse(#minute,#minute,\'\')+\', doble toque para abrir la aplicaciÃ³n reloj'</string>
    <string name="weather_type_null">'Sin datos'</string>
    <string name="weather_type_0">Despejado</string>
    <string name="weather_type_1">Nublado</string>
    <string name="weather_type_2">Con bruma</string>
    <string name="weather_type_3">Niebla</string>
    <string name="weather_type_4">Aguacero fuerte</string>
    <string name="weather_type_5">Tormentas de lluvia</string>
    <string name="weather_type_6">Lluvia muy fuerte</string>
    <string name="weather_type_7">Tormenta</string>
    <string name="weather_type_8">Chubascos</string>
    <string name="weather_type_9">Lluvia intensa</string>
    <string name="weather_type_10">Lluvia</string>
    <string name="weather_type_11">Llovizna</string>
    <string name="weather_type_12">Aguanieve</string>
    <string name="weather_type_13">Tormenta de nieve</string>
    <string name="weather_type_14">Nevada intermitente</string>
    <string name="weather_type_15">Nevada intensa</string>
    <string name="weather_type_16">Nevada</string>
    <string name="weather_type_17">Nevada ligera</string>
    <string name="weather_type_18">Tormenta de arena fuerte</string>
    <string name="weather_type_19">Tormneta de arena</string>
    <string name="weather_type_20">Tormenta de arena ligera</string>
    <string name="weather_type_21">Tormneta de arena</string>
    <string name="weather_type_22">Granizo</string>
    <string name="weather_type_23">Polvo en suspensiÃ³n</string>
    <string name="weather_type_24">Neblina</string>
    <string name="weather_type_25">Lluvia helada</string>
</resources>
PK
     8N.P^Þ  Þ     strings/strings_tr_TR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">dd MMMM, EEE</string>
    <string name="date_time_12">dd MMMM, EEE</string>
    <string name="desc_date_format">dd MMM, EEEE</string>
    <string name="desc_date_format_12">dd MMM, EEEE</string>
    <string name="desc_time">'mevcut saat\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', saat uygulamasÄ± aÃ§mak iÃ§in iki kere dokunun'</string>
    <string name="weather_type_null">'Veri yok'</string>
    <string name="weather_type_0">AÃ§Ä±k</string>
    <string name="weather_type_1">Bulutlu</string>
    <string name="weather_type_2">Puslu</string>
    <string name="weather_type_3">Sisli</string>
    <string name="weather_type_4">Åiddetli saÄanak</string>
    <string name="weather_type_5">SaÄanak</string>
    <string name="weather_type_6">Ãok Åiddetli saÄanak</string>
    <string name="weather_type_7">GÃ¶k gÃ¼rÃ¼ltÃ¼lÃ¼ saÄanak</string>
    <string name="weather_type_8">Hafif yaÄÄ±ÅlÄ±</string>
    <string name="weather_type_9">YoÄun saÄanak</string>
    <string name="weather_type_10">YaÄmurlu</string>
    <string name="weather_type_11">Ãiseleme</string>
    <string name="weather_type_12">Sulu kar</string>
    <string name="weather_type_13">Kar fÄ±rtÄ±nasÄ±</string>
    <string name="weather_type_14">Kar kalÄ±ntÄ±larÄ±</string>
    <string name="weather_type_15">YoÄun kar yaÄÄ±ÅÄ±</string>
    <string name="weather_type_16">Kar yaÄÄ±ÅÄ±</string>
    <string name="weather_type_17">Hafif kar yaÄÄ±ÅÄ±</string>
    <string name="weather_type_18">Åiddetli kum fÄ±rtÄ±nasÄ±</string>
    <string name="weather_type_19">Kum fÄ±rtÄ±nasÄ±</string>
    <string name="weather_type_20">Hafif kum fÄ±rtÄ±nasÄ±</string>
    <string name="weather_type_21">Kum fÄ±rtÄ±nasÄ±</string>
    <string name="weather_type_22">Dolu</string>
    <string name="weather_type_23">Tozlu</string>
    <string name="weather_type_24">Sisli</string>
    <string name="weather_type_25">Buzlanma ve yaÄmur</string>
</resources>
PK
     8N¢éZ  Z     strings/strings_kk_KZ.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMM</string>
    <string name="date_time_12">EEEE, d MMMM</string>
    <string name="desc_date_format">EEEE, d MMMM</string>
    <string name="desc_date_format_12">EEEE, d MMMM</string>
    <string name="desc_time">'Ð°ÒÑÐ¼Ð´Ð°ÒÑ ÑÐ°ÒÑÑ\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', "Ð¡Ð°ÒÐ°Ñ" ÒÐ¾Ð»Ð´Ð°Ð½Ð±Ð°ÑÑÐ½Ð° ÐºÑÑÑ Ò¯ÑÑÐ½ ÐµÐºÑ ÑÐµÑ Ð±Ð°ÑÑÒ£ÑÐ·'</string>
    <string name="weather_type_null">'ÐÐµÑÐµÐºÑÐµÑ Ð¶Ð¾Ò'</string>
    <string name="weather_type_0">Ð¢Ð°Ð·Ð°Ð»Ð°Ñ</string>
    <string name="weather_type_1">ÐÒ±Ð»ÑÑÑ</string>
    <string name="weather_type_2">ÐÒ±Ð»ÑÒ£ÒÑÑ</string>
    <string name="weather_type_3">Ð¢Ò±Ð¼Ð°Ð½</string>
    <string name="weather_type_4">ÒÐ°ÑÑÑ Ð¶Ð°Ò£Ð±ÑÑ</string>
    <string name="weather_type_5">ÐÐ°ÑÑÐ»</string>
    <string name="weather_type_6">ÒÐ°ÑÑÑ Ð½Ó©ÑÐµÑ</string>
    <string name="weather_type_7">ÐÐ°Ð¹Ð·Ð°ÒÐ°Ð¹</string>
    <string name="weather_type_8">ÐÓ©ÑÐµÑ</string>
    <string name="weather_type_9">ÒÐ°ÑÑÑ Ð¶Ð°Ò£Ð±ÑÑ</string>
    <string name="weather_type_10">ÐÐ°Ò£Ð±ÑÑ</string>
    <string name="weather_type_11">Ò°ÑÐ°Ò Ð¶Ð°ÑÑÐ½</string>
    <string name="weather_type_12">ÐÑÐ¼ÒÑÐ» ÒÐ°Ñ</string>
    <string name="weather_type_13">ÐÐ¾ÑÐ°Ð½</string>
    <string name="weather_type_14">ÐÐµÐ¹ Ð¶ÐµÑÐ»ÐµÑÐ´Ðµ ÒÐ°Ñ</string>
    <string name="weather_type_15">ÒÐ°Ð»ÑÒ£ ÒÐ°Ñ</string>
    <string name="weather_type_16">ÒÐ°Ñ</string>
    <string name="weather_type_17">ÐÑÑÑÐ³ÑÑÑÐ¼ ÒÐ°Ñ</string>
    <string name="weather_type_18">ÐÒ¯ÑÑÑ ÑÐ°Ò£Ð´Ñ Ð´Ð°ÑÑÐ»</string>
    <string name="weather_type_19">Ð¨Ð°Ò£Ð´Ñ Ð´Ð°ÑÑÐ»</string>
    <string name="weather_type_20">Ð¨Ð°Ò£</string>
    <string name="weather_type_21">Ð¨Ð°Ò£Ð´Ñ Ð´Ð°ÑÑÐ»</string>
    <string name="weather_type_22">ÐÒ±ÑÑÐ°Ò</string>
    <string name="weather_type_23">Ð¨Ð°Ò£Ð´Ñ</string>
    <string name="weather_type_24">ÐÒ±Ð½Ð°Ñ</string>
    <string name="weather_type_25">ÒÑÐ»Ð°Ñ</string>
</resources>
PK
     8N&q9s  s     strings/strings_ja_JP.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">Mædæ¥ EEE</string>
    <string name="date_time_12">Mædæ¥ EEE</string>
    <string name="desc_date_format">Mædæ¥ EEEE</string>
    <string name="desc_date_format_12">Mædæ¥ EEEE</string>
    <string name="desc_time">'ç¾å¨æå»\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ããã«ã¿ãããã¦æè¨ã¢ããªãéã'</string>
    <string name="weather_type_null">'ãã¼ã¿ãããã¾ãã'</string>
    <string name="weather_type_0">æ´ã</string>
    <string name="weather_type_1">æã</string>
    <string name="weather_type_2">ã¹ã¢ãã°</string>
    <string name="weather_type_3">é§</string>
    <string name="weather_type_4">éåº¦ã®æ´é¢¨é¨</string>
    <string name="weather_type_5">æ´é¢¨é¨</string>
    <string name="weather_type_6">æ¿ããé¨</string>
    <string name="weather_type_7">é·é¨</string>
    <string name="weather_type_8">ã«ããé¨</string>
    <string name="weather_type_9">å¼·ãé¨</string>
    <string name="weather_type_10">é¨</string>
    <string name="weather_type_11">é§é¨</string>
    <string name="weather_type_12">ã¿ãã</string>
    <string name="weather_type_13">å¹éª</string>
    <string name="weather_type_14">ã«ããéª</string>
    <string name="weather_type_15">å¼·ãéª</string>
    <string name="weather_type_16">ééª</string>
    <string name="weather_type_17">å¼±ãéª</string>
    <string name="weather_type_18">å¼·ãç åµ</string>
    <string name="weather_type_19">ç åµ</string>
    <string name="weather_type_20">å¼±ãç åµ</string>
    <string name="weather_type_21">ç åµ</string>
    <string name="weather_type_22">é¹</string>
    <string name="weather_type_23">æµ®éç²ãã</string>
    <string name="weather_type_24">ã¹ã¢ãã°</string>
    <string name="weather_type_25">æ°·æ¶é¨</string>
</resources>
PK
     8N¦Ãp¶  ¶     strings/strings_ur_PK.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'Ø­Ø§ÙÛÛ ÙÙØª \' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\' Ú¯Ú¾ÚÛ Ø§ÛÙ¾ ÙÛÚº Ø¬Ø§ÙÛ Ú©Û ÙÛÛ Ø¯Ù Ø¨Ø§Ø± Ù¹ÛÙ¾ Ú©Ø±ÛÚº'</string>
    <string name="weather_type_null">'Ú©ÙØ¦Û ÚÛÙ¹Ø§ ÙÛÛÚº ÛÛ'</string>
    <string name="weather_type_0">ØµØ§Ù</string>
    <string name="weather_type_1">Ø§Ø¨Ø±Ø¢ÙÙØ¯</string>
    <string name="weather_type_2">Ú¯Ø±Ø¯ Ù ØºØ¨Ø§Ø± ÙØ§ÙØ§</string>
    <string name="weather_type_3">Ú©ÛØ± Ø¢ÙÙØ¯</string>
    <string name="weather_type_4">Ø´Ø¯ÛØ¯ Ø·ÙÙØ§ÙÛ Ø¨Ø§Ø±Ø´</string>
    <string name="weather_type_5">Ø·ÙÙØ§ÙÛ Ø¨Ø§Ø±Ø´</string>
    <string name="weather_type_6">Ø¨ÛØª Ø´Ø¯ÛØ¯ Ø¨Ø§Ø±Ø´</string>
    <string name="weather_type_7">Ø·ÙÙØ§Ù Ø¨Ø±Ù ÙØ¨Ø§Ø¯</string>
    <string name="weather_type_8">Ø¨ÙÚÚ¾Ø§Ø±</string>
    <string name="weather_type_9">Ø´Ø¯ÛØ¯ Ø¨Ø§Ø±Ø´</string>
    <string name="weather_type_10">Ø¨Ø§Ø±Ø´</string>
    <string name="weather_type_11">Ù¾Ú¾ÙØ§Ø±</string>
    <string name="weather_type_12">ÚØ§ÙÛ Ø¨Ø§Ø±Û</string>
    <string name="weather_type_13">Ø¨Ø±Ù Ú©Ø§ Ø·ÙÙØ§Ù</string>
    <string name="weather_type_14">Ù¹Ú©ÚÙÚº ÙÛÚº Ø¨Ø±Ù Ø¨Ø§Ø±Û</string>
    <string name="weather_type_15">Ø¨Ú¾Ø§Ø±Û Ø¨Ø±Ù Ø¨Ø§Ø±Û</string>
    <string name="weather_type_16">Ø¨Ø±Ù Ø¨Ø§Ø±Û</string>
    <string name="weather_type_17">ÛÙÚ©Û Ø¨Ø±Ù Ø¨Ø§Ø±Û</string>
    <string name="weather_type_18">Ø´Ø¯ÛØ¯ Ø±ÛØª Ú©Ø§ Ø·ÙÙØ§Ù</string>
    <string name="weather_type_19">Ø±ÛØª Ú©Ø§ Ø·ÙÙØ§Ù</string>
    <string name="weather_type_20">ÛÙÚ©Ø§ Ø±ÛØª Ú©Ø§ Ø·ÙÙØ§Ù</string>
    <string name="weather_type_21">Ø±ÛØª Ú©Ø§ Ø·ÙÙØ§Ù</string>
    <string name="weather_type_22">Ø§ÙÙØ§</string>
    <string name="weather_type_23">Ø¯Ú¾ÙÙ Ú©Ø§ ØºØ¨Ø§Ø±</string>
    <string name="weather_type_24">Ú¯Ø±Ø¯Ù ØºØ¨Ø§Ø±</string>
    <string name="weather_type_25">Ø¨Ø±ÙÛÙÛ Ø¨Ø§Ø±Ø´</string>
</resources>
PK
     8N!6Oå	  å	     strings/strings_hi_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'à¤µà¤°à¥à¤¤à¤®à¤¾à¤¨ à¤¸à¤®à¤¯\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', à¤à¥à¥ à¤à¤ªà¥à¤ª à¤®à¥à¤ à¤ªà¥à¤°à¤µà¥à¤¶ à¤à¤°à¤¨à¥ à¤à¥ à¤²à¤¿à¤ à¤¦à¥ à¤¬à¤¾à¤° à¤à¥à¤ª à¤à¤°à¥à¤'</string>
    <string name="weather_type_null">'à¤à¥à¤ à¤¡à¥à¤à¤¾ à¤¨à¤¹à¥à¤'</string>
    <string name="weather_type_0">à¤¸à¤¾à¤«</string>
    <string name="weather_type_1">à¤¬à¤¾à¤¦à¤²</string>
    <string name="weather_type_2">à¤§à¥à¤à¤§à¤²à¤¾</string>
    <string name="weather_type_3">à¤à¥à¤¹à¤°à¤¾</string>
    <string name="weather_type_4">à¤­à¤¾à¤°à¥ à¤µà¤°à¥à¤·à¤¾</string>
    <string name="weather_type_5">à¤¤à¥à¤«à¤¾à¤¨à¥ à¤¬à¤¾à¤°à¤¿à¤¶</string>
    <string name="weather_type_6">à¤¬à¤¹à¥à¤¤ à¤­à¤¾à¤°à¥ à¤µà¤°à¥à¤·à¤¾</string>
    <string name="weather_type_7">à¤à¤°à¤ à¤à¥ à¤¸à¤¾à¤¥ à¤¤à¥à¤«à¤¾à¤¨</string>
    <string name="weather_type_8">à¤«à¥à¤¹à¤¾à¤°</string>
    <string name="weather_type_9">à¤­à¤¾à¤°à¥ à¤µà¤°à¥à¤·à¤¾</string>
    <string name="weather_type_10">à¤µà¤°à¥à¤·à¤¾</string>
    <string name="weather_type_11">à¤¬à¥à¤à¤¦à¤¾ à¤¬à¤¾à¤à¤¦à¥</string>
    <string name="weather_type_12">à¤à¤²à¥ à¤à¥ à¤¸à¤¾à¤¥ à¤µà¤°à¥à¤·à¤¾</string>
    <string name="weather_type_13">à¤¬à¤°à¥à¤« à¤à¤¾ à¤¤à¥à¤«à¤¾à¤¨</string>
    <string name="weather_type_14">à¤à¤¹à¥à¤-à¤à¤¹à¥à¤ à¤ªà¤° à¤¬à¤°à¥à¤«à¤¼à¤¬à¤¾à¤°à¥</string>
    <string name="weather_type_15">à¤­à¤¾à¤°à¥ à¤¬à¤°à¥à¤«à¤¬à¤¾à¤°à¥</string>
    <string name="weather_type_16">à¤¬à¤°à¥à¤«à¤¬à¤¾à¤°à¥</string>
    <string name="weather_type_17">à¤¹à¤²à¥à¤à¥ à¤¬à¤°à¥à¤«à¤¬à¤¾à¤°à¥</string>
    <string name="weather_type_18">à¤­à¥à¤·à¤£ à¤°à¥à¤¤à¥à¤²à¥ à¤à¤à¤§à¥</string>
    <string name="weather_type_19">à¤°à¥à¤¤à¥à¤²à¥ à¤à¤à¤§à¥</string>
    <string name="weather_type_20">à¤¹à¤²à¥à¤à¥ à¤°à¥à¤¤à¥à¤²à¥ à¤à¤à¤§à¥</string>
    <string name="weather_type_21">à¤°à¥à¤¤à¥à¤²à¥ à¤à¤à¤§à¥</string>
    <string name="weather_type_22">à¤à¤²à¤¾</string>
    <string name="weather_type_23">à¤à¤¸à¥à¤¥à¤¾à¤¯à¥ à¤§à¥à¤²</string>
    <string name="weather_type_24">à¤§à¥à¤à¤§</string>
    <string name="weather_type_25">à¤¹à¤¿à¤® à¤µà¤°à¥à¤·à¤¾</string>
</resources>
PK
     8NÖ½UUÊ  Ê     strings/strings_sq_AL.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ora aktuale\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', prek dy herÃ« pÃ«r tÃ« hyrÃ« nÃ« aplikacionin e orÃ«s'</string>
    <string name="weather_type_null">'Nuk ka tÃ« dhÃ«na'</string>
    <string name="weather_type_0">KthjellÃ«t</string>
    <string name="weather_type_1">Me re</string>
    <string name="weather_type_2">I mjegullt</string>
    <string name="weather_type_3">Me mjegull</string>
    <string name="weather_type_4">Shi i stuhishÃ«m</string>
    <string name="weather_type_5">Stuhi shiu</string>
    <string name="weather_type_6">ShumÃ« shi i rÃ«ndÃ«</string>
    <string name="weather_type_7">Stuhi me bubullima</string>
    <string name="weather_type_8">Rrebesh</string>
    <string name="weather_type_9">Shi i rÃ«ndÃ«</string>
    <string name="weather_type_10">Shi</string>
    <string name="weather_type_11">Shi i imÃ«t</string>
    <string name="weather_type_12">BorÃ« me shi</string>
    <string name="weather_type_13">Stuhi dÃ«bore</string>
    <string name="weather_type_14">Fjolla bore</string>
    <string name="weather_type_15">BorÃ« e rÃ«ndÃ«</string>
    <string name="weather_type_16">Reshje bore</string>
    <string name="weather_type_17">BorÃ« e lehtÃ«</string>
    <string name="weather_type_18">Stuhi e fortÃ« rÃ«re</string>
    <string name="weather_type_19">Stuhi rÃ«re</string>
    <string name="weather_type_20">Stuhi e lehtÃ« rÃ«re</string>
    <string name="weather_type_21">Stuhi rÃ«re</string>
    <string name="weather_type_22">BreshÃ«r</string>
    <string name="weather_type_23">Pluhur qarkullues</string>
    <string name="weather_type_24">Mjegullim</string>
    <string name="weather_type_25">Shi i akullt</string>
</resources>
PK
     8N1       strings/strings_fa_IR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEEØ dd MMMM</string>
    <string name="date_time_12">EEEØ dd MMMM</string>
    <string name="desc_date_format">EEEEØ dd MMM</string>
    <string name="desc_date_format_12">EEEEØ dd MMM</string>
    <string name="desc_time">'Ø²ÙØ§Ù Ú©ÙÙÙÛ\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', Ø¯ÙØ¨Ø§Ø± Ø¨Ø²ÙÛØ¯ ØªØ§ ÙØ§Ø±Ø¯ Ø¨Ø±ÙØ§ÙÙ Ø³Ø§Ø¹Øª Ø´ÙÛØ¯'</string>
    <string name="weather_type_null">'Ø¨Ø¯ÙÙ Ø¯Ø§Ø¯Ù'</string>
    <string name="weather_type_0">ØµØ§Ù</string>
    <string name="weather_type_1">Ø§Ø¨Ø±Û</string>
    <string name="weather_type_2">ØºØ¨Ø§Ø±Ø¢ÙÙØ¯</string>
    <string name="weather_type_3">ÙÙâØ¢ÙÙØ¯</string>
    <string name="weather_type_4">Ø±Ú¯Ø¨Ø§Ø± Ø´Ø¯ÛØ¯</string>
    <string name="weather_type_5">Ø±Ú¯Ø¨Ø§Ø± Ø¨Ø§Ø±Ø§Ù</string>
    <string name="weather_type_6">Ø¨Ø§Ø±Ø´ Ø¨Ø³ÛØ§Ø± Ø³ÙÚ¯ÛÙ Ø¨Ø§Ø±Ø§Ù</string>
    <string name="weather_type_7">ØªÙÙØ§Ù Ø±Ø¹Ø¯ Ù Ø¨Ø±Ù</string>
    <string name="weather_type_8">Ø¨Ø§Ø±ÙØ¯Ú¯Û</string>
    <string name="weather_type_9">Ø¨Ø§Ø±Ø´ Ø³ÙÚ¯ÛÙ Ø¨Ø§Ø±Ø§Ùâ</string>
    <string name="weather_type_10">Ø¨Ø§Ø±Ø§ÙÛ</string>
    <string name="weather_type_11">ÙÙâÙÙ Ø¨Ø§Ø±Ø§Ù</string>
    <string name="weather_type_12">Ø¨Ø±Ù Ù Ø¨Ø§Ø±Ø§Ù</string>
    <string name="weather_type_13">Ú©ÙÙØ§Ú©</string>
    <string name="weather_type_14">Ø¨Ø§Ø±Ø´ Ù¾Ø±Ø§Ú©ÙØ¯Ù Ø¨Ø±Ù</string>
    <string name="weather_type_15">Ø¨Ø§Ø±Ø´ Ø³ÙÚ¯ÛÙ Ø¨Ø±Ù</string>
    <string name="weather_type_16">Ø¨Ø§Ø±Ø´ Ø¨Ø±Ù</string>
    <string name="weather_type_17">Ø¨Ø§Ø±Ø´ Ø³Ø¨Ú© Ø¨Ø±Ù</string>
    <string name="weather_type_18">ØªÙÙØ§Ù Ø´Ø¯ÛØ¯ Ø´Ù</string>
    <string name="weather_type_19">ØªÙÙØ§Ù Ø´Ù</string>
    <string name="weather_type_20">ØªÙÙØ§Ù Ø³Ø¨Ú© Ø´Ù</string>
    <string name="weather_type_21">ØªÙÙØ§Ù Ø´Ù</string>
    <string name="weather_type_22">ØªÚ¯Ø±Ú¯</string>
    <string name="weather_type_23">Ú¯Ø±Ø¯ Ù ØºØ¨Ø§Ø± Ø´ÙØ§ÙØ±</string>
    <string name="weather_type_24">ÙÙ</string>
    <string name="weather_type_25">Ø¨Ø§Ø±Ø§Ù ÛØ®Û</string>
</resources>
PK
     8NÛÛöU
  U
     strings/strings_as_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'à¦¬à§°à§à¦¤à¦®à¦¾à¦¨à§° à¦¸à¦®à§\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', à¦à¦¡à¦¼à§ à¦à¦ªà¦¤ à¦ªà§à§°à§±à§à¦¶ à¦à§°à¦¿à¦¬à¦²à§ à¦¦à§à¦¬à¦¾à§° à¦à§à¦ª à¦à§°à¦'</string>
    <string name="weather_type_null">'à¦à§à¦¨à§ à¦¡à¦¾à¦à¦¾ à¦¨à¦¾à¦'</string>
    <string name="weather_type_0">à¦«à§°à¦à¦¾à¦²</string>
    <string name="weather_type_1">à¦¡à¦¾à§±à§°à§à§à¦¾</string>
    <string name="weather_type_2">à¦§à§à§±à¦²à§-à¦à§à¦à§±à¦²à§</string>
    <string name="weather_type_3">à¦à§à¦à§±à¦²à§à¦®à§</string>
    <string name="weather_type_4">à¦à¦¤à§à¦¯à¦¾à¦§à¦¿à¦ à¦§à§à¦®à§à¦¹à¦¾-à¦¬à§°à¦·à§à¦£</string>
    <string name="weather_type_5">à¦§à§à¦®à§à¦¹à¦¾-à¦¬à§°à¦·à§à¦£</string>
    <string name="weather_type_6">à¦à¦¤à¦¿ à¦¤à§à¦¬à§à§° à¦¬à§°à¦·à§à¦£</string>
    <string name="weather_type_7">à¦¬à¦¿à¦à§à¦²à§-à¦¢à§à§°à§à¦à¦¨à¦¿</string>
    <string name="weather_type_8">à¦¬à§à¦·à§à¦à¦¿à¦ªà¦¾à¦¤</string>
    <string name="weather_type_9">à¦ªà§à§°à¦à¦£à§à¦¡ à¦¬à§°à¦·à§à¦£</string>
    <string name="weather_type_10">à¦¬à§°à¦·à§à¦£</string>
    <string name="weather_type_11">à¦à¦¿à¦¨à¦à¦¿à¦¨à§à§à¦¾ à¦¬à§°à¦·à§à¦£</string>
    <string name="weather_type_12">à¦¶à¦¿à¦²à¦¾à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_13">à¦¤à§à¦·à¦¾à§°-à¦§à§à¦®à§à¦¹à¦¾</string>
    <string name="weather_type_14">à¦ªà¦¾à¦¤à¦²à§à§à¦¾ à¦¤à§à¦·à¦¾à§°à¦ªà¦¾à¦¤</string>
    <string name="weather_type_15">à¦ªà§à§°à¦à¦£à§à¦¡ à¦¤à§à¦·à¦¾à§°à¦ªà¦¾à¦¤</string>
    <string name="weather_type_16">à¦¤à§à¦·à¦¾à§°à¦ªà¦¾à¦¤</string>
    <string name="weather_type_17">à¦ªà¦¾à¦¤à¦² à¦¤à§à¦·à¦¾à§°à¦ªà¦¾à¦¤</string>
    <string name="weather_type_18">à¦¶à¦à§à¦¤à¦¿à¦¶à¦¾à¦²à§ à¦§à§à¦²à¦¿-à¦§à§à¦®à§à¦¹à¦¾</string>
    <string name="weather_type_19">à¦§à§à¦²à¦¿-à¦§à§à¦®à§à¦¹à¦¾</string>
    <string name="weather_type_20">à¦ªà¦¾à¦¤à¦² à¦§à§à¦²à¦¿-à¦§à§à¦®à§à¦¹à¦¾</string>
    <string name="weather_type_21">à¦§à§à¦²à¦¿-à¦§à§à¦®à§à¦¹à¦¾</string>
    <string name="weather_type_22">à¦¶à¦¿à¦²à¦¾à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_23">à¦à§°à¦¿ à¦«à§à§°à¦¾ à¦§à§à¦²à¦¿</string>
    <string name="weather_type_24">à¦à§à¦à§±à¦²à§</string>
    <string name="weather_type_25">à¦à§à¦ à¦®à§°à¦¾ à¦¬à§°à¦·à§à¦£</string>
</resources>
PK
     8N Ô"Å  Å     strings/strings_it_IT.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ora attuale\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', doppio tocco per entrare nell\'applicazione orologio'</string>
    <string name="weather_type_null">'Nessun dato'</string>
    <string name="weather_type_0">Sereno</string>
    <string name="weather_type_1">Nuvoloso</string>
    <string name="weather_type_2">Foschia</string>
    <string name="weather_type_3">Nebbia</string>
    <string name="weather_type_4">Forte temporale</string>
    <string name="weather_type_5">Temporale</string>
    <string name="weather_type_6">Precipitazioni molto forti</string>
    <string name="weather_type_7">Temporale</string>
    <string name="weather_type_8">Acquazzone</string>
    <string name="weather_type_9">Forti piogge</string>
    <string name="weather_type_10">Pioggia</string>
    <string name="weather_type_11">Pioggerella</string>
    <string name="weather_type_12">Nevischio</string>
    <string name="weather_type_13">Bufera di neve</string>
    <string name="weather_type_14">Neve a tratti</string>
    <string name="weather_type_15">Forti nevicate</string>
    <string name="weather_type_16">Nevicate</string>
    <string name="weather_type_17">Nevicate leggere</string>
    <string name="weather_type_18">Forte tempesta di sabbia</string>
    <string name="weather_type_19">Tempesta di sabbia</string>
    <string name="weather_type_20">Leggera tempesta di sabbia</string>
    <string name="weather_type_21">Tempesta di sabbia</string>
    <string name="weather_type_22">Grandine</string>
    <string name="weather_type_23">Polvere sospesa</string>
    <string name="weather_type_24">Foschia</string>
    <string name="weather_type_25">Nevischio</string>
</resources>
PK
     8N4Tfkõ  õ     strings/strings_hy_AM.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM
 </string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'Ô¸Õ¶Õ©Õ¡ÖÕ«Õ¯ ÕªÕ¡Õ´Õ¡Õ¶Õ¡Õ¯Õ¨\' +#hour12+\' \'+ifelse(#minute,#minute,\'\')+\', Õ¯ÖÕ¯Õ¶Õ¡Õ¯Õ« Õ½Õ¥Õ²Õ´Õ¥Ö ÔºÕ¡Õ´Õ¡ÖÕ¸ÖÕµÖ Õ°Õ¡Õ¾Õ¥Õ¬Õ¾Õ¡Õ®Õ¨ Õ´Õ¸ÖÕ¿Ö Õ£Õ¸ÖÕ®Õ¥Õ¬Õ¸Ö Õ°Õ¡Õ´Õ¡Ö'</string>
    <string name="weather_type_null">'ÕÕ¾ÕµÕ¡Õ¬Õ¶Õ¥Ö Õ¹Õ¯Õ¡Õ¶'</string>
    <string name="weather_type_0">ÕÕ¡ÖÖÕ¥Õ¬</string>
    <string name="weather_type_1">Ô±Õ´ÕºÕ¸Õ¿ Õ§</string>
    <string name="weather_type_2">Ô±Õ´ÕºÕ¡Õ´Õ¡Õ® Õ§</string>
    <string name="weather_type_3">ÕÕ¡Õ¼Õ¡Õ­Õ¸ÖÕ²</string>
    <string name="weather_type_4">ÕÖÕªÕ¥Õ² Õ¡Õ¶Õ±ÖÖÕ¡Õ´ÖÖÕ«Õ¯</string>
    <string name="weather_type_5">Ô±Õ¶Õ±ÖÖÕ¡Õ´ÖÖÕ«Õ¯</string>
    <string name="weather_type_6">ÕÕ¡Õ¿ Õ¸ÖÕªÕ¥Õ² Õ¡Õ¶Õ±ÖÖ</string>
    <string name="weather_type_7">Ô±Õ´ÕºÖÕ¸Õº</string>
    <string name="weather_type_8">ÕÕ¸ÖÕ¤Õ¡Õ¼Õ¡Õ¿ Õ¡Õ¶Õ±ÖÕ¥Ö</string>
    <string name="weather_type_9">ÕÖÕªÕ¥Õ² Õ¡Õ¶Õ±ÖÖ</string>
    <string name="weather_type_10">Ô±Õ¶Õ±ÖÖ</string>
    <string name="weather_type_11">Ô¹Õ¥Õ©Ö Õ¡Õ¶Õ±ÖÖ</string>
    <string name="weather_type_12">ÕÕµÕ¸ÖÕ¶Õ¡Õ­Õ¡Õ¼Õ¶ Õ¡Õ¶Õ±ÖÖ</string>
    <string name="weather_type_13">ÕÕ¶Õ¡Õ¢Õ¸ÖÖ</string>
    <string name="weather_type_14">ÕÕ¥Õ²-Õ¿Õ¥Õ² Õ±ÕµÕ¸ÖÕ¶</string>
    <string name="weather_type_15">ÕÖÕªÕ¥Õ² Õ±ÕµÕ¸ÖÕ¶Õ¡Õ¿Õ¥Õ²Õ¸ÖÕ´</string>
    <string name="weather_type_16">ÕÕµÕ¸ÖÕ¶Õ¡Õ¿Õ¥Õ²Õ¸ÖÕ´</string>
    <string name="weather_type_17">Ô¹Õ¥Õ©Ö Õ±ÕµÕ¸ÖÕ¶Õ¡Õ¿Õ¥Õ²Õ¸ÖÕ´</string>
    <string name="weather_type_18">ÕÖÕªÕ¥Õ² Õ¡Õ¾Õ¡Õ¦Õ¡Õ°Õ¸Õ²Õ´</string>
    <string name="weather_type_19">Ô±Õ¾Õ¡Õ¦Õ¡Õ°Õ¸Õ²Õ´</string>
    <string name="weather_type_20">Ô¹Õ¥Õ©Ö Õ¡Õ¾Õ¡Õ¦Õ¡Õ°Õ¸Õ²Õ´</string>
    <string name="weather_type_21">Ô±Õ¾Õ¡Õ¦Õ¡Õ°Õ¸Õ²Õ´</string>
    <string name="weather_type_22">Ô¿Õ¡ÖÕ¯Õ¸ÖÕ¿</string>
    <string name="weather_type_23">ÕÕ¸Õ·Õ«</string>
    <string name="weather_type_24">ÕÕ·Õ¸ÖÕ·</string>
    <string name="weather_type_25">ÕÕ¶Õ¡Õ­Õ¡Õ¼Õ¶ Õ¡Õ¶Õ±ÖÖ</string>
</resources>
PK
     8NÊÑ´	  ´	     strings/strings_mr_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE dd MMM</string>
    <string name="desc_date_format_12">EEEE dd MMM</string>
    <string name="desc_time">'à¤¸à¤¦à¥à¤¯ à¤µà¥à¤³\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', à¤à¤¡à¥à¤¯à¤¾à¤³ à¤à¥à¤ªà¤®à¤§à¥à¤¯à¥ à¤ªà¥à¤°à¤µà¥à¤¶ à¤à¤°à¤£à¥à¤¯à¤¾à¤¸à¤¾à¤ à¥ à¤¡à¤¬à¤² à¤à¥à¤ª à¤à¤°à¤¾'</string>
    <string name="weather_type_null">'à¤¡à¥à¤à¤¾ à¤¨à¤¾à¤¹à¥'</string>
    <string name="weather_type_0">à¤¨à¤¿à¤°à¤­à¥à¤°</string>
    <string name="weather_type_1">à¤¢à¤à¤¾à¤³</string>
    <string name="weather_type_2">à¤§à¥à¤°à¤à¤</string>
    <string name="weather_type_3">à¤§à¥à¤à¥</string>
    <string name="weather_type_4">à¤à¥à¤°à¤¦à¤¾à¤° à¤µà¤¾à¤¦à¤³à¥ à¤ªà¤¾à¤à¤¸</string>
    <string name="weather_type_5">à¤µà¤¾à¤¦à¤³à¤µà¤¾à¤°à¥</string>
    <string name="weather_type_6">à¤®à¥à¤¸à¤³à¤§à¤¾à¤° à¤ªà¤¾à¤à¤¸</string>
    <string name="weather_type_7">à¤µà¤¾à¤¦à¤³</string>
    <string name="weather_type_8">à¤ªà¤¾à¤à¤¸à¤§à¤¾à¤°à¤¾</string>
    <string name="weather_type_9">à¤à¥à¤°à¤¦à¤¾à¤° à¤ªà¤¾à¤à¤¸</string>
    <string name="weather_type_10">à¤ªà¤¾à¤à¤¸</string>
    <string name="weather_type_11">à¤°à¤¿à¤®à¤à¤¿à¤® à¤ªà¤¾à¤à¤¸</string>
    <string name="weather_type_12">à¤à¤¾à¤°à¤¾ à¤µ à¤ªà¤¾à¤à¤¸</string>
    <string name="weather_type_13">à¤¹à¤¿à¤®à¤µà¤¾à¤¦à¤³</string>
    <string name="weather_type_14">à¤¬à¤°à¥à¤«à¤µà¥à¤·à¥à¤à¥à¤à¥ à¤ªà¤à¥à¤à¥</string>
    <string name="weather_type_15">à¤à¥à¤°à¤¦à¤¾à¤° à¤¬à¤°à¥à¤«à¤µà¥à¤·à¥à¤à¥</string>
    <string name="weather_type_16">à¤¬à¤°à¥à¤«à¤µà¥à¤·à¥à¤à¥</string>
    <string name="weather_type_17">à¤¹à¤²à¤à¥ à¤¬à¤°à¥à¤«à¤µà¥à¤·à¥à¤à¥</string>
    <string name="weather_type_18">à¤µà¤¾à¤³à¥à¤à¥ à¤à¥à¤°à¤¾à¤à¥ à¤µà¤¾à¤¦à¤³</string>
    <string name="weather_type_19">à¤§à¥à¤³à¥à¤à¥ à¤µà¤¾à¤¦à¤³</string>
    <string name="weather_type_20">à¤µà¤¾à¤³à¥à¤à¥ à¤¹à¤²à¤à¥ à¤µà¤¾à¤¦à¤³</string>
    <string name="weather_type_21">à¤§à¥à¤³à¥à¤à¥ à¤µà¤¾à¤¦à¤³</string>
    <string name="weather_type_22">à¤à¤¾à¤°à¤¾</string>
    <string name="weather_type_23">à¤¤à¤°à¤à¤à¤¤à¥ à¤§à¥à¤³</string>
    <string name="weather_type_24">à¤§à¥à¤à¤</string>
    <string name="weather_type_25">à¤¥à¤à¤¡ à¤ªà¤¾à¤à¤¸</string>
</resources>
PK
     8N¤ø°       strings/strings_lt_LT.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, MMMM dd</string>
    <string name="desc_date_format">EEEE, MMM dd</string>
    <string name="desc_date_format_12">EEEE, MMM dd</string>
    <string name="desc_time">'dabartinis laikas\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', norÄdami atidaryti laikrodÄ¯, dukart palieskite'</string>
    <string name="weather_type_null">'NÄra duomenÅ³'</string>
    <string name="weather_type_0">Giedra</string>
    <string name="weather_type_1">Debesuota</string>
    <string name="weather_type_2">Miglota</string>
    <string name="weather_type_3">Åªkanota</string>
    <string name="weather_type_4">Stiprus lietus</string>
    <string name="weather_type_5">Audra</string>
    <string name="weather_type_6">Labai stiprus lietus</string>
    <string name="weather_type_7">PerkÅ«nija</string>
    <string name="weather_type_8">LiÅ«tis</string>
    <string name="weather_type_9">Stiprus lietus</string>
    <string name="weather_type_10">Lietus</string>
    <string name="weather_type_11">Dulksna</string>
    <string name="weather_type_12">KruÅ¡a</string>
    <string name="weather_type_13">PÅ«ga</string>
    <string name="weather_type_14">Vietomis sninga</string>
    <string name="weather_type_15">Stipriai sninga</string>
    <string name="weather_type_16">Sninga</string>
    <string name="weather_type_17">Lengvai sninga</string>
    <string name="weather_type_18">Smarki smÄlio audra</string>
    <string name="weather_type_19">SmÄlio audra</string>
    <string name="weather_type_20">Silpna smÄlio audra</string>
    <string name="weather_type_21">SmÄlio audra</string>
    <string name="weather_type_22">KruÅ¡a</string>
    <string name="weather_type_23">DulkÄta</string>
    <string name="weather_type_24">Migla</string>
    <string name="weather_type_25">Plikledis</string>
</resources>
PK
     38Nåæ`-  -     strings/strings_zh_HK.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">Mædæ¥ E</string>
    <string name="date_time_12">Mædæ¥ Eaa</string>
    <string name="desc_date_format">Mædæ¥ EEEE</string>
    <string name="desc_date_format_12">Mædæ¥ Eaa</string>
    <string name="desc_time">ifelse(eq(#time_format,0),#hour12,eq(#time_format,1),#hour24,#hour24)+\'é»\'+ifelse(gt(#minute,0)*le(#minute,9),0,\'\')+ifelse(#minute,#minute+\'å\',\'æ´\')+\', æå©ä¸é²å¥æéApp\'</string>
    <string name="desc_weather">\@weather_description+\', \'+#weather_temperature+\'åº¦\'</string>
    <string name="desc_weather_null">'é»æç²åå¤©æ°£æ¸æ'</string>
    <string name="weather_type_null">'é»æç²åå¤©æ°£æ¸æ'</string>
    <string name="weather_type_0">æ´</string>
    <string name="weather_type_1">å¤é²</string>
    <string name="weather_type_2">é°</string>
    <string name="weather_type_3">é§</string>
    <string name="weather_type_4">ç¹å¤§æ´é¨</string>
    <string name="weather_type_5">å¤§æ´é¨</string>
    <string name="weather_type_6">æ´é¨</string>
    <string name="weather_type_7">é·é£é¨</string>
    <string name="weather_type_8">é£é¨</string>
    <string name="weather_type_9">å¤§é¨</string>
    <string name="weather_type_10">ä¸­é¨</string>
    <string name="weather_type_11">å°é¨</string>
    <string name="weather_type_12">é¨å¤¾å¸¶éª</string>
    <string name="weather_type_13">æ´éª</string>
    <string name="weather_type_14">é£éª</string>
    <string name="weather_type_15">å¤§éª</string>
    <string name="weather_type_16">ä¸­éª</string>
    <string name="weather_type_17">å°éª</string>
    <string name="weather_type_18">å¼·æ²å¡µæ´</string>
    <string name="weather_type_19">æ²å¡µæ´</string>
    <string name="weather_type_20">æ²å¡µ</string>
    <string name="weather_type_21">ææ²</string>
    <string name="weather_type_22">å°é¹</string>
    <string name="weather_type_23">æµ®å¡µ</string>
    <string name="weather_type_24">é¾</string>
    <string name="weather_type_25">åé¨</string>
</resources>
PK
     8Nß=²|  |     strings/strings_ml_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'à´¨à´¿à´²à´µà´¿à´²àµ à´¸à´®à´¯à´\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', à´àµà´²àµà´àµà´àµ à´à´ªàµà´ªàµ à´¨àµ½à´à´¾àµ» à´°à´£àµà´àµà´¤à´µà´£ à´à´¾à´ªàµà´ªàµà´àµà´¯àµà´¯àµà´'</string>
    <string name="weather_type_null">'à´¡à´¾à´±àµà´± à´à´²àµà´²'</string>
    <string name="weather_type_0">à´®à´¾à´¯àµà´àµà´àµà´</string>
    <string name="weather_type_1">à´®àµà´à´¾à´µàµà´¤à´</string>
    <string name="weather_type_2">à´¤àµà´³à´¿à´àµà´à´®à´¿à´²àµà´²à´¾à´¤àµà´¤à´¤àµ</string>
    <string name="weather_type_3">à´®àµà´à´¿à´àµà´àµà´àµà´à´¿à´¯à´¤àµ</string>
    <string name="weather_type_4">à´àµà´¾à´àµà´àµà´à´¾à´±àµà´±àµà´¾à´àµà´àµà´à´¿à´¯ à´à´àµà´¤àµà´¤ à´ªàµà´®à´¾à´°à´¿</string>
    <string name="weather_type_5">à´à´àµà´¤àµà´¤ à´ªàµà´®à´¾à´°à´¿</string>
    <string name="weather_type_6">à´µà´³à´°àµ à´à´àµà´¤àµà´¤ à´®à´´</string>
    <string name="weather_type_7">à´à´à´¿à´¯àµà´ à´®à´¿à´¨àµà´¨à´²àµà´®àµà´³àµà´³ à´àµà´¾à´àµà´àµà´à´¾à´±àµà´±àµâ</string>
    <string name="weather_type_8">à´à´¾à´±àµà´±à´²àµâà´®à´´</string>
    <string name="weather_type_9">à´à´¨à´¤àµà´¤ à´®à´´</string>
    <string name="weather_type_10">à´®à´´</string>
    <string name="weather_type_11">à´à´¾à´±àµà´±àµ½à´®à´´</string>
    <string name="weather_type_12">à´à´²à´¿à´ªàµà´ªà´´à´ à´ªàµà´¾à´´à´¿à´¯àµ½</string>
    <string name="weather_type_13">à´à´àµà´¤àµà´¤ à´¹à´¿à´®à´ªà´¾à´¤à´</string>
    <string name="weather_type_14">à´à´àµà´àµ à´à´àµà´àµ à´®à´àµà´àµà´µàµà´´àµà´</string>
    <string name="weather_type_15">à´à´àµà´¤àµà´¤ à´®à´àµà´àµà´µàµà´´àµà´àµà´</string>
    <string name="weather_type_16">à´®à´àµà´àµà´µàµà´´àµà´àµà´</string>
    <string name="weather_type_17">à´àµà´±à´¿à´¯ à´®à´àµà´àµà´µàµà´´àµà´àµà´</string>
    <string name="weather_type_18">à´à´àµà´¤àµà´¤ à´ªàµà´à´¿à´àµà´à´¾à´±àµà´±àµ</string>
    <string name="weather_type_19">à´ªàµà´à´¿à´àµà´à´¾à´±àµà´±àµ</string>
    <string name="weather_type_20">à´àµà´±à´¿à´¯ à´ªàµà´à´¿à´àµà´à´¾à´±àµà´±àµ</string>
    <string name="weather_type_21">à´ªàµà´à´¿à´àµà´à´¾à´±àµà´±àµ</string>
    <string name="weather_type_22">à´à´²à´¿à´ªàµà´ªà´´à´</string>
    <string name="weather_type_23">à´ªà´±à´¨àµà´¨àµà´¨à´à´àµà´àµà´¨àµà´¨ à´ªàµà´à´¿à´àµà´à´¾à´±àµà´±àµ</string>
    <string name="weather_type_24">à´®àµà´à´²àµâà´®à´àµà´àµ</string>
    <string name="weather_type_25">à´®à´°à´µà´¿à´ªàµà´ªà´¿à´àµà´àµà´¨àµà´¨ à´®à´´</string>
</resources>
PK
     8NPDù»t  t     strings/strings_nl_NL.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE dd MMMM</string>
    <string name="date_time_12">EEE dd MMMM</string>
    <string name="desc_date_format">EEEE dd MMM</string>
    <string name="desc_date_format_12">EEEE dd MMM</string>
    <string name="desc_time">'huidige tijd\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dubbelklik om klokapp te openen'</string>
    <string name="weather_type_null">'Geen data'</string>
    <string name="weather_type_0">Helder</string>
    <string name="weather_type_1">Bewolkt</string>
    <string name="weather_type_2">Nevelig</string>
    <string name="weather_type_3">Mistig</string>
    <string name="weather_type_4">Hevige regenbuien</string>
    <string name="weather_type_5">Regenbui</string>
    <string name="weather_type_6">Zeer zware regenval</string>
    <string name="weather_type_7">Onweersbui</string>
    <string name="weather_type_8">Regenbui</string>
    <string name="weather_type_9">Zware regenval</string>
    <string name="weather_type_10">Regen</string>
    <string name="weather_type_11">Motregen</string>
    <string name="weather_type_12">IJzel</string>
    <string name="weather_type_13">Sneeuwstorm</string>
    <string name="weather_type_14">Plaatselijke sneeuwval</string>
    <string name="weather_type_15">Zware sneeuwval</string>
    <string name="weather_type_16">Sneeuwval</string>
    <string name="weather_type_17">Lichte sneeuwval</string>
    <string name="weather_type_18">Sterke zandstorm</string>
    <string name="weather_type_19">Zandstorm</string>
    <string name="weather_type_20">Lichte zandstorm</string>
    <string name="weather_type_21">Zandstorm</string>
    <string name="weather_type_22">Hagel</string>
    <string name="weather_type_23">Zwevend stof</string>
    <string name="weather_type_24">Nevel</string>
    <string name="weather_type_25">IJzel</string>
</resources>
PK
     8N\XIÖ  Ö     strings/strings_bg_BG.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'Ð² Ð¼Ð¾Ð¼ÐµÐ½ÑÐ°\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', Ð´Ð²Ð¾Ð¹Ð½Ð¾ Ð¿Ð¾ÑÑÐºÐ²Ð°Ð½Ðµ Ð·Ð° Ð¾ÑÐ²Ð°ÑÑÐ½Ðµ Ð½Ð° ÑÐ°ÑÐ¾Ð²Ð½Ð¸ÐºÐ°'</string>
    <string name="weather_type_null">'ÐÑÐ¼Ð° Ð´Ð°Ð½Ð½Ð¸'</string>
    <string name="weather_type_0">Ð¯ÑÐ½Ð¾</string>
    <string name="weather_type_1">ÐÐ±Ð»Ð°ÑÐ½Ð¾</string>
    <string name="weather_type_2">ÐÑÐ³Ð»Ð¸Ð²Ð¾</string>
    <string name="weather_type_3">ÐÑÐ³Ð»Ð°</string>
    <string name="weather_type_4">Ð¡Ð¸Ð»Ð½Ð° Ð±ÑÑÑ</string>
    <string name="weather_type_5">ÐÑÐ¶Ð´Ð¾Ð²Ð½Ð° Ð±ÑÑÑ</string>
    <string name="weather_type_6">ÐÐ½Ð¾Ð³Ð¾ Ð¾Ð±Ð¸Ð»Ð½Ð¸ Ð²Ð°Ð»ÐµÐ¶Ð¸</string>
    <string name="weather_type_7">ÐÑÑÐ¼Ð¾ÑÐµÐ²Ð¸ÑÐ½Ð° Ð±ÑÑÑ</string>
    <string name="weather_type_8">ÐÑÐµÐ²Ð°Ð»ÑÐ²Ð°Ð½Ð¸Ñ</string>
    <string name="weather_type_9">Ð¡Ð¸Ð»Ð½Ð¸ Ð²Ð°Ð»ÐµÐ¶Ð¸</string>
    <string name="weather_type_10">ÐÑÐ¶Ð´</string>
    <string name="weather_type_11">Ð ÑÐ¼ÐµÐ¶</string>
    <string name="weather_type_12">Ð¡ÑÐ³ÑÐ°ÑÐ¸ÑÐ°</string>
    <string name="weather_type_13">Ð¡Ð½ÐµÐ¶Ð½Ð° Ð±ÑÑÑ</string>
    <string name="weather_type_14">Ð¡Ð½ÑÐ³ Ð½Ð° Ð¿Ð°ÑÑÐ°Ð»Ð¸</string>
    <string name="weather_type_15">Ð¡Ð¸Ð»ÐµÐ½ ÑÐ½ÐµÐ³Ð¾Ð²Ð°Ð»ÐµÐ¶</string>
    <string name="weather_type_16">Ð¡Ð½ÐµÐ³Ð¾Ð²Ð°Ð»ÐµÐ¶</string>
    <string name="weather_type_17">Ð¡Ð»Ð°Ð± ÑÐ½ÐµÐ³Ð¾Ð²Ð°Ð»ÐµÐ¶</string>
    <string name="weather_type_18">Ð¡Ð¸Ð»Ð½Ð° Ð¿ÑÑÑÑÐ½Ð° Ð±ÑÑÑ</string>
    <string name="weather_type_19">ÐÑÑÑÑÐ½Ð° Ð±ÑÑÑ</string>
    <string name="weather_type_20">ÐÐµÐºÐ° Ð¿ÑÑÑÑÐ½Ð° Ð±ÑÑÑ</string>
    <string name="weather_type_21">ÐÑÑÑÑÐ½Ð° Ð±ÑÑÑ</string>
    <string name="weather_type_22">ÐÑÐ°Ð´ÑÑÐºÐ°</string>
    <string name="weather_type_23">Ð¡Ð¸Ð»Ð½Ð¾ Ð·Ð°Ð¿ÑÐ°ÑÐµÐ½Ð¾</string>
    <string name="weather_type_24">ÐÐ°ÑÐ°Ð½Ñ</string>
    <string name="weather_type_25">ÐÐµÐ´ÐµÐ½ Ð´ÑÐ¶Ð´</string>
</resources>
PK
     8NûjeÅ	  Å	     strings/strings_th_TH.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE dd MMMM</string>
    <string name="date_time_12">EEE dd MMMM</string>
    <string name="desc_date_format">EEEE dd MMM</string>
    <string name="desc_date_format_12">EEEE dd MMM</string>
    <string name="desc_time">'à¹à¸§à¸¥à¸²à¸à¸±à¸à¸à¸¸à¸à¸±à¸\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', à¹à¸à¸°à¸ªà¸­à¸à¸à¸£à¸±à¹à¸à¸à¸´à¸à¸à¸±à¸à¹à¸à¸·à¹à¸­à¹à¸à¹à¸²à¸ªà¸¹à¹à¹à¸­à¸à¸à¸²à¸¬à¸´à¸à¸²'</string>
    <string name="weather_type_null">'à¹à¸¡à¹à¸à¸à¸à¹à¸­à¸¡à¸¹à¸¥'</string>
    <string name="weather_type_0">à¹à¸à¹à¸¡à¹à¸ª</string>
    <string name="weather_type_1">à¸¡à¸µà¹à¸¡à¸à¸¡à¸²à¸</string>
    <string name="weather_type_2">à¸«à¸¡à¸­à¸à¸«à¸à¸²</string>
    <string name="weather_type_3">à¸¡à¸µà¸«à¸¡à¸­à¸à¸à¸±à¸</string>
    <string name="weather_type_4">à¸à¸à¸à¹à¸²à¸à¸°à¸à¸­à¸à¸£à¸¸à¸à¹à¸£à¸</string>
    <string name="weather_type_5">à¸à¸à¸à¹à¸²à¸à¸°à¸à¸­à¸</string>
    <string name="weather_type_6">à¸à¸à¸à¸à¸«à¸à¸±à¸à¸¡à¸²à¸</string>
    <string name="weather_type_7">à¸à¹à¸²à¸à¸°à¸à¸­à¸</string>
    <string name="weather_type_8">à¸à¸à¸à¸¹à¹</string>
    <string name="weather_type_9">à¸à¸à¸à¸à¸«à¸à¸±à¸</string>
    <string name="weather_type_10">à¸à¸à¸à¸</string>
    <string name="weather_type_11">à¸à¸à¸à¸£à¸°à¸à¸£à¸²à¸¢</string>
    <string name="weather_type_12">à¸¥à¸¹à¸à¹à¸«à¹à¸à¸à¸</string>
    <string name="weather_type_13">à¸à¸²à¸¢à¸¸à¸«à¸´à¸¡à¸°</string>
    <string name="weather_type_14">à¸«à¸´à¸¡à¸°à¸à¸à¸«à¸à¸²</string>
    <string name="weather_type_15">à¸«à¸´à¸¡à¸°à¸à¸à¸«à¸à¸±à¸</string>
    <string name="weather_type_16">à¸«à¸´à¸¡à¸°à¸à¸</string>
    <string name="weather_type_17">à¸«à¸´à¸¡à¸°à¸à¸à¹à¸¥à¹à¸à¸à¹à¸­à¸¢</string>
    <string name="weather_type_18">à¸à¸²à¸¢à¸¸à¸à¸£à¸²à¸¢à¸£à¸¸à¸à¹à¸£à¸</string>
    <string name="weather_type_19">à¸à¸²à¸¢à¸¸à¸à¸£à¸²à¸¢</string>
    <string name="weather_type_20">à¸à¸²à¸¢à¸¸à¸à¸£à¸²à¸¢à¹à¸¥à¹à¸à¸à¹à¸­à¸¢</string>
    <string name="weather_type_21">à¸à¸²à¸¢à¸¸à¸à¸£à¸²à¸¢</string>
    <string name="weather_type_22">à¸¥à¸¹à¸à¹à¸«à¹à¸à¸à¸</string>
    <string name="weather_type_23">à¸à¸±à¸¨à¸à¸§à¸´à¸ªà¸±à¸¢à¸à¹à¸³</string>
    <string name="weather_type_24">à¸¡à¸µà¹à¸¡à¸à¸«à¸¡à¸­à¸</string>
    <string name="weather_type_25">à¸à¸à¹à¸¢à¸·à¸­à¸à¹à¸à¹à¸</string>
</resources>
PK
     8N)E
  E
     strings/strings_bn_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'à¦à¦à¦¨à¦à¦¾à¦° à¦¸à¦®à§\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', à¦à¦¡à¦¼à¦¿à¦° à¦à§à¦¯à¦¾à¦ªà§ à¦ªà§à¦°à¦¬à§à¦¶ à¦à¦°à¦¾à¦° à¦à¦¨à§à¦¯ à¦¦à§à¦¬à¦¾à¦° à¦à§à¦¯à¦¾à¦ª à¦à¦°à§à¦¨'</string>
    <string name="weather_type_null">'à¦à§à¦¨à§ à¦¡à§à¦à¦¾ à¦¨à§à¦'</string>
    <string name="weather_type_0">à¦ªà¦°à¦¿à¦·à§à¦à¦¾à¦° à¦à¦à¦¾à¦¶</string>
    <string name="weather_type_1">à¦®à§à¦à¦²à¦¾</string>
    <string name="weather_type_2">à¦à¦¸à§à¦ªà¦·à§à¦</string>
    <string name="weather_type_3">à¦à§à¦¯à¦¼à¦¾à¦¶à¦¾à¦à§à¦à¦¨à§à¦¨</string>
    <string name="weather_type_4">à¦®à¦¾à¦°à¦¾à¦¤à§à¦®à¦ à¦à§à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_5">à¦à§à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_6">à¦ªà§à¦°à¦à¦¨à§à¦¡ à¦¬à§à¦·à§à¦à¦¿à¦ªà¦¾à¦¤</string>
    <string name="weather_type_7">à¦¬à¦à§à¦°à¦¬à¦¿à¦¦à§à¦¯à§à¦¤à¦¸à¦¹ à¦à§</string>
    <string name="weather_type_8">à¦¬à¦°à§à¦·à¦£</string>
    <string name="weather_type_9">à¦­à¦¾à¦°à§ à¦¬à§à¦·à§à¦à¦¿à¦ªà¦¾à¦¤</string>
    <string name="weather_type_10">à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_11">à¦à§à¦à¦¡à¦¼à¦¿ à¦à§à¦à¦¡à¦¼à¦¿ à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_12">à¦¶à¦¿à¦²à¦¾à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_13">à¦¤à§à¦·à¦¾à¦°à¦à§</string>
    <string name="weather_type_14">à¦¹à¦¾à¦²à¦à¦¾ à¦¤à§à¦·à¦¾à¦°à¦ªà¦¾à¦¤</string>
    <string name="weather_type_15">à¦ªà§à¦°à¦à¦¨à§à¦¡ à¦¤à§à¦·à¦¾à¦°à¦ªà¦¾à¦¤</string>
    <string name="weather_type_16">à¦¤à§à¦·à¦¾à¦°à¦ªà¦¾à¦¤</string>
    <string name="weather_type_17">à¦¹à¦¾à¦²à¦à¦¾ à¦¤à§à¦·à¦¾à¦°à¦ªà¦¾à¦¤</string>
    <string name="weather_type_18">à¦ªà§à¦°à¦à¦¨à§à¦¡ à¦¬à¦¾à¦²à¦¿à¦à¦¡à¦¼</string>
    <string name="weather_type_19">à¦¬à¦¾à¦²à§à¦à¦¡à¦¼</string>
    <string name="weather_type_20">à¦¹à¦¾à¦²à¦à¦¾ à¦¬à¦¾à¦²à§à¦à¦¡à¦¼</string>
    <string name="weather_type_21">à¦¬à¦¾à¦²à§à¦à¦¡à¦¼</string>
    <string name="weather_type_22">à¦¶à¦¿à¦²à¦¾à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_23">à¦­à¦¾à¦¸à¦®à¦¾à¦¨ à¦§à§à¦²à§</string>
    <string name="weather_type_24">à¦à§à¦¯à¦¼à¦¾à¦¶à¦¾</string>
    <string name="weather_type_25">à¦¤à§à¦·à¦¾à¦° à¦ à¦¬à§à¦·à§à¦à¦¿</string>
</resources>
PK
     8N÷.áÐ  Ð     strings/strings_ro_RO.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEE, dd MMM</string>
    <string name="desc_date_format_12">EEE, dd MMM</string>
    <string name="desc_time">'ora curentÄ\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', atingeÈi de douÄ ori pentru a intra Ã®n aplicaÈia Ceas'</string>
    <string name="weather_type_null">'Nu existÄ date'</string>
    <string name="weather_type_0">Senin</string>
    <string name="weather_type_1">Ãnnorat</string>
    <string name="weather_type_2">CeaÅ£Ä</string>
    <string name="weather_type_3">CeaÈÄ</string>
    <string name="weather_type_4">FurtunÄ severÄ</string>
    <string name="weather_type_5">FurtunÄ</string>
    <string name="weather_type_6">PrecipitaÈii puternice</string>
    <string name="weather_type_7">FurtunÄ cu trÄsnete</string>
    <string name="weather_type_8">Averse</string>
    <string name="weather_type_9">PrecipitaÈii puternice</string>
    <string name="weather_type_10">Ploaie</string>
    <string name="weather_type_11">BurniÈÄ</string>
    <string name="weather_type_12">LapoviÈÄ</string>
    <string name="weather_type_13">Viscol</string>
    <string name="weather_type_14">Ninsoare moderatÄ</string>
    <string name="weather_type_15">Ninsoare puternicÄ</string>
    <string name="weather_type_16">Ninsoare</string>
    <string name="weather_type_17">Ninsoare slabÄ</string>
    <string name="weather_type_18">FurtunÄ de nisip puternicÄ</string>
    <string name="weather_type_19">FurtunÄ de nisip</string>
    <string name="weather_type_20">FurtunÄ de nisip uÈoarÄ</string>
    <string name="weather_type_21">FurtunÄ de nisip</string>
    <string name="weather_type_22">GrindinÄ</string>
    <string name="weather_type_23">Praf</string>
    <string name="weather_type_24">CeaÅ£Ä</string>
    <string name="weather_type_25">Polei</string>
</resources>
PK
     8N<H½]       strings/strings_in_ID.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'waktu sekarang\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ketuk 2x untuk masuk ke apl jam'</string>
    <string name="weather_type_null">'Tidak ada data'</string>
    <string name="weather_type_0">Cerah</string>
    <string name="weather_type_1">Berawan</string>
    <string name="weather_type_2">Berkabut</string>
    <string name="weather_type_3">Berkabut</string>
    <string name="weather_type_4">Hujan badai parah</string>
    <string name="weather_type_5">Hujan badai</string>
    <string name="weather_type_6">Hujan sangat deras</string>
    <string name="weather_type_7">Badai petir</string>
    <string name="weather_type_8">Hujan lebat</string>
    <string name="weather_type_9">Hujan deras</string>
    <string name="weather_type_10">Hujan</string>
    <string name="weather_type_11">Gerimis</string>
    <string name="weather_type_12">Hujan es salju</string>
    <string name="weather_type_13">Badai salju</string>
    <string name="weather_type_14">Gerimis salju</string>
    <string name="weather_type_15">Hujan salju deras</string>
    <string name="weather_type_16">Hujan salju</string>
    <string name="weather_type_17">Hujan salju ringan</string>
    <string name="weather_type_18">Badai pasir kuat</string>
    <string name="weather_type_19">Badai pasir</string>
    <string name="weather_type_20">Badai pasir ringan</string>
    <string name="weather_type_21">Badai pasir</string>
    <string name="weather_type_22">Hujan es</string>
    <string name="weather_type_23">Berdebu</string>
    <string name="weather_type_24">Kabut</string>
    <string name="weather_type_25">Hujan yang dingin</string>
</resources>
PK
     8N	¡ °       strings/strings_gl_ES.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'hora actual\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', duplo toque para abrir o reloxo'</string>
    <string name="weather_type_null">'Sen datos'</string>
    <string name="weather_type_0">Ceo claro</string>
    <string name="weather_type_1">Anubrado</string>
    <string name="weather_type_2">BrÃ©tema</string>
    <string name="weather_type_3">Bretemoso</string>
    <string name="weather_type_4">Tempestade</string>
    <string name="weather_type_5">Tormenta</string>
    <string name="weather_type_6">Choivas fortes</string>
    <string name="weather_type_7">Tormenta</string>
    <string name="weather_type_8">Chuvieira</string>
    <string name="weather_type_9">Chuvias fortes</string>
    <string name="weather_type_10">Chuvia</string>
    <string name="weather_type_11">Orballo</string>
    <string name="weather_type_12">Auganeve</string>
    <string name="weather_type_13">Nevarada</string>
    <string name="weather_type_14">Nevadas intermitentes</string>
    <string name="weather_type_15">Nevada intensa</string>
    <string name="weather_type_16">Nevada</string>
    <string name="weather_type_17">Nevada leve</string>
    <string name="weather_type_18">Tempestade de area</string>
    <string name="weather_type_19">Tormenta de area</string>
    <string name="weather_type_20">Tormentas febles de area</string>
    <string name="weather_type_21">Tormenta de area</string>
    <string name="weather_type_22">Sarabia</string>
    <string name="weather_type_23">Poeira</string>
    <string name="weather_type_24">BrÃ©tema</string>
    <string name="weather_type_25">Coriscada</string>
</resources>
PK
     8N"!¤dÎ  Î     strings/strings_cs_CZ.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMM</string>
    <string name="desc_time">'aktuÃ¡lnÃ­ Äas\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', klepnÄte dvakrÃ¡t pro otevÅenÃ­ hodin'</string>
    <string name="weather_type_null">'Å½Ã¡dnÃ¡ data'</string>
    <string name="weather_type_0">Jasno</string>
    <string name="weather_type_1">OblaÄno</string>
    <string name="weather_type_2">ZataÅ¾eno</string>
    <string name="weather_type_3">Mlhavo</string>
    <string name="weather_type_4">SilnÃ© bouÅky</string>
    <string name="weather_type_5">BouÅka</string>
    <string name="weather_type_6">Velmi silnÃ½ dÃ©Å¡Å¥</string>
    <string name="weather_type_7">BouÅky s blesky</string>
    <string name="weather_type_8">PÅehÃ¡nky</string>
    <string name="weather_type_9">SilnÃ½ dÃ©Å¡Å¥</string>
    <string name="weather_type_10">DÃ©Å¡Å¥</string>
    <string name="weather_type_11">MrholenÃ­</string>
    <string name="weather_type_12">DÃ©Å¡Å¥ se snÄhem</string>
    <string name="weather_type_13">SnÄhovÃ¡ bouÅe</string>
    <string name="weather_type_14">SnÄhovÃ© jazyky</string>
    <string name="weather_type_15">SilnÃ© snÄÅ¾enÃ­</string>
    <string name="weather_type_16">SnÄÅ¾enÃ­</string>
    <string name="weather_type_17">SlabÃ© snÄÅ¾enÃ­</string>
    <string name="weather_type_18">SilnÃ¡ pÃ­seÄnÃ¡ bouÅe</string>
    <string name="weather_type_19">PÃ­seÄnÃ¡ bouÅe</string>
    <string name="weather_type_20">SlabÃ¡ pÃ­seÄnÃ¡ bouÅe</string>
    <string name="weather_type_21">PÃ­seÄnÃ¡ bouÅe</string>
    <string name="weather_type_22">KrupobitÃ­</string>
    <string name="weather_type_23">Prach</string>
    <string name="weather_type_24">Mlha</string>
    <string name="weather_type_25">MrznoucÃ­ dÃ©Å¡Å¥</string>
</resources>
PK
     8N¢9¤  ¤     strings/strings_hu_HU.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">MMMM dd., EEE</string>
    <string name="date_time_12">MMMM dd., EEE</string>
    <string name="desc_date_format">MMM dd., EEEE</string>
    <string name="desc_date_format_12">MMM dd., EEEE</string>
    <string name="desc_time">'jelenlegi idÅ\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', Ã©rintse meg kÃ©tszer az Ã³ra megnyitÃ¡sÃ¡hoz'</string>
    <string name="weather_type_null">'Nincs adat'</string>
    <string name="weather_type_0">Tiszta</string>
    <string name="weather_type_1">FelhÅs</string>
    <string name="weather_type_2">PÃ¡rÃ¡s</string>
    <string name="weather_type_3">KÃ¶dÃ¶s</string>
    <string name="weather_type_4">IntenzÃ­v felhÅszakadÃ¡s</string>
    <string name="weather_type_5">FelhÅszakadÃ¡s</string>
    <string name="weather_type_6">Nagyon heves esÅzÃ©s</string>
    <string name="weather_type_7">Zivatar</string>
    <string name="weather_type_8">ZÃ¡por</string>
    <string name="weather_type_9">Heves esÅzÃ©s</string>
    <string name="weather_type_10">EsÅ</string>
    <string name="weather_type_11">SzitÃ¡lÃ¡s</string>
    <string name="weather_type_12">Ãnos esÅ</string>
    <string name="weather_type_13">HÃ³vihar</string>
    <string name="weather_type_14">Foltokban hÃ³esÃ©s</string>
    <string name="weather_type_15">SÅ±rÅ± havazÃ¡s</string>
    <string name="weather_type_16">HavazÃ¡s</string>
    <string name="weather_type_17">HÃ³szÃ¡llingÃ³zÃ¡s</string>
    <string name="weather_type_18">ErÅs homokvihar</string>
    <string name="weather_type_19">Homokvihar</string>
    <string name="weather_type_20">Enyhe homokvihar</string>
    <string name="weather_type_21">Homokvihar</string>
    <string name="weather_type_22">JÃ©gesÅ</string>
    <string name="weather_type_23">SzÃ¡llÃ³ por</string>
    <string name="weather_type_24">PÃ¡ra</string>
    <string name="weather_type_25">Ãnos esÅ</string>
</resources>
PK
     8NA 8ý	  ý	     strings/strings_or_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'à¬¬à¬°à­à¬¤à­à¬¤à¬®à¬¾à¬¨à¬° à¬¸à¬®à­\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', à¬à­à¬²à¬ à¬à¬ªà¬°à­ à¬ªà­à¬°à¬¬à­à¬¶ à¬à¬°à¬¿à¬¬à¬¾à¬à­ à¬¦à­à¬à¬¥à¬° à¬à­à­à¬¾à¬ª à¬à¬°à¬¨à­à¬¤à­'</string>
    <string name="weather_type_null">'à¬à­à¬£à¬¸à¬¿ à¬¡à¬¾à¬à¬¾ à¬¨à¬¾à¬¹à¬¿à¬'</string>
    <string name="weather_type_0">à¬¸à¬«à¬¾ à¬ªà¬¾à¬</string>
    <string name="weather_type_1">à¬®à­à¬à­à¬</string>
    <string name="weather_type_2">à¬à­à¬¹à­à¬¡à¬¼à¬¿à¬</string>
    <string name="weather_type_3">à¬à¬¨à¬à­à¬¹à­à¬¡à¬¿</string>
    <string name="weather_type_4">à¬ªà­à¬°à¬à¬£à­à¬¡ à¬à¬¡à¬¼à¬¬à¬°à­à¬·à¬¾</string>
    <string name="weather_type_5">à¬à¬¡à¬¼à¬¬à¬°à­à¬·à¬¾</string>
    <string name="weather_type_6">à¬à¬¤à¬¿ à¬¬à­à¬·à­à¬à¬¿à¬ªà¬¾à¬¤</string>
    <string name="weather_type_7">à¬à¬¡à¬¼à¬à¬¡à¬¼à¬¿ à¬¬à¬°à­à¬·à¬¾</string>
    <string name="weather_type_8">à¬¹à¬¾à¬²à­à¬à¬¾ à¬¬à¬°à­à¬·à¬¾</string>
    <string name="weather_type_9">à¬­à¬¾à¬°à¬¿ à¬¬à­à¬·à­à¬à¬¿à¬ªà¬¾à¬¤</string>
    <string name="weather_type_10">à¬¬à¬°à­à¬·à¬¾</string>
    <string name="weather_type_11">à¬à¬³à­à¬ª à¬¬à¬°à­à¬·à¬¾</string>
    <string name="weather_type_12">à¬à­à¬à¬ªà¬¥à¬° à¬¬à¬°à­à¬·à¬¾</string>
    <string name="weather_type_13">à¬¤à­à¬·à¬¾à¬° à¬à¬¡à¬¼</string>
    <string name="weather_type_14">à¬à¬¾à¬à¬¾à¬ à¬à¬¾à¬à¬¾à¬ à¬¤à­à¬·à¬¾à¬°à¬ªà¬¾à¬¤</string>
    <string name="weather_type_15">à¬­à¬¾à¬°à¬¿ à¬¤à­à¬·à¬¾à¬°à¬ªà¬¾à¬¤</string>
    <string name="weather_type_16">à¬¤à­à¬·à¬¾à¬°à¬ªà¬¾à¬¤</string>
    <string name="weather_type_17">à¬¹à¬¾à¬²à­à¬à¬¾ à¬¤à­à¬·à¬¾à¬°à¬ªà¬¾à¬¤</string>
    <string name="weather_type_18">à¬­à¬¾à¬°à¬¿ à¬§à­à¬³à¬¿à¬à¬¡à¬¼</string>
    <string name="weather_type_19">à¬§à­à¬³à¬¿à¬à¬¡à¬¼</string>
    <string name="weather_type_20">à¬¹à¬¾à¬²à­à¬à¬¾ à¬§à­à¬³à¬¿à¬à¬¡à¬¼</string>
    <string name="weather_type_21">à¬§à­à¬³à¬¿à¬à¬¡à¬¼</string>
    <string name="weather_type_22">à¬à¬°à¬à¬¾</string>
    <string name="weather_type_23">à¬­à¬¾à¬¸à¬®à¬¾à¬¨ à¬§à­à¬³à¬¿</string>
    <string name="weather_type_24">à¬à­à¬¹à­à¬¡à¬¼à¬¿</string>
    <string name="weather_type_25">à¬¹à¬¿à¬® à¬¬à¬°à­à¬·à¬¾</string>
</resources>
PK
     8Nóqïè       strings/strings_az_AZ.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">dd MMMM, EEE</string>
    <string name="date_time_12">dd MMMM, EEE</string>
    <string name="desc_date_format">dd MMM, EEEE</string>
    <string name="desc_date_format_12">dd MMM, EEEE</string>
    <string name="desc_time">'cari vaxt\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', saat tÉtbiqini aÃ§maq Ã¼Ã§Ã¼n iki dÉfÉ toxunun'</string>
    <string name="weather_type_null">'MÉlumat yoxdur'</string>
    <string name="weather_type_0">TÉmiz</string>
    <string name="weather_type_1">Buludlu</string>
    <string name="weather_type_2">ÃÉnli</string>
    <string name="weather_type_3">DumanlÄ±</string>
    <string name="weather_type_4">SÉrt yaÄÄ±Å fÄ±rtÄ±nasÄ±</string>
    <string name="weather_type_5">YaÄÄ±Å fÄ±rtÄ±nasÄ±</string>
    <string name="weather_type_6">Ãox ÅiddÉtli yaÄÄ±ntÄ±</string>
    <string name="weather_type_7">GÃ¶y gurultulu yaÄÄ±Å</string>
    <string name="weather_type_8">YÃ¼ngÃ¼l yaÄÄ±ÅlÄ±</string>
    <string name="weather_type_9">ÅiddÉtli yaÄÄ±ntÄ±</string>
    <string name="weather_type_10">YaÄÄ±Å</string>
    <string name="weather_type_11">Ãiskin</string>
    <string name="weather_type_12">Sulu qar</string>
    <string name="weather_type_13">Qar fÄ±rtÄ±nasÄ±</string>
    <string name="weather_type_14">Qar qalÄ±ntÄ±larÄ±</string>
    <string name="weather_type_15">ÅiddÉtli qar yaÄÄ±ÅÄ±</string>
    <string name="weather_type_16">Qar yaÄÄ±ÅÄ±</string>
    <string name="weather_type_17">YÃ¼ngÃ¼l qar yaÄÄ±ÅÄ±</string>
    <string name="weather_type_18">GÃ¼clÃ¼ qum fÄ±rtÄ±nasÄ±</string>
    <string name="weather_type_19">Qum fÄ±rtÄ±nasÄ±</string>
    <string name="weather_type_20">YÃ¼ngÃ¼l qum fÄ±rtÄ±nasÄ±</string>
    <string name="weather_type_21">Qum tufanÄ±</string>
    <string name="weather_type_22">Dolu</string>
    <string name="weather_type_23">Tozlu</string>
    <string name="weather_type_24">Sisli</string>
    <string name="weather_type_25">DonmuÅ yaÄÄ±Å</string>
</resources>
PK
     8N©Òm*  *     strings/strings_en_US.xml<?xml version="1.0" encoding="utf-8"?>
<resources> 
    <string name="date_time">EEE, MMMM dd</string>
    <string name="date_time_12">EEE, MMMM dd</string>
    <string name="desc_date_format">EEEE, MMM dd</string>
    <string name="desc_date_format_12">EEEE, MMM dd</string>
    <string name="desc_time">'current time' + #hour12+' '+ifelse(#minute,#minute,'oclock')+', double tap to enter clock app'</string>
	<string name="weather_type_null">'No data'</string>
	<string name="weather_type_0">Clear</string>
    <string name="weather_type_1">Cloudy</string>
    <string name="weather_type_2">Hazy</string>
    <string name="weather_type_3">Foggy</string>
    <string name="weather_type_4">Severe rainstorm</string>
    <string name="weather_type_5">Rainstorm</string>
    <string name="weather_type_6">Very heavy rainfall</string>
    <string name="weather_type_7">Thunderstorm</string>
    <string name="weather_type_8">Shower</string>
    <string name="weather_type_9">Heavy rainfall</string>
    <string name="weather_type_10">Rain</string>
    <string name="weather_type_11">Drizzle</string>
    <string name="weather_type_12">Sleet</string>
    <string name="weather_type_13">Snowstorm</string>
    <string name="weather_type_14">Patches of snowfall</string>
    <string name="weather_type_15">Heavy snowfall</string>
    <string name="weather_type_16">Snowfall</string>
    <string name="weather_type_17">Light snowfall</string>
    <string name="weather_type_18">Strong sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Light sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hail</string>
    <string name="weather_type_23">Floating Dust</string>
    <string name="weather_type_24">Haze</string>
</resources>
PK
     8NN§(ç       strings/strings_ru_RU.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, d MMMM</string>
    <string name="date_time_12">EEE, d MMMM</string>
    <string name="desc_date_format">EEEE, d MMMM</string>
    <string name="desc_date_format_12">EEEE, d MMMM</string>
    <string name="desc_time">'ÑÐµÐºÑÑÐµÐµ Ð²ÑÐµÐ¼Ñ\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', Ð½Ð°Ð¶Ð¼Ð¸ÑÐµ Ð´Ð²Ð°Ð¶Ð´Ñ Ð´Ð»Ñ Ð²ÑÐ¾Ð´Ð° Ð² Ð¿ÑÐ¸Ð»Ð¾Ð¶ÐµÐ½Ð¸Ðµ "Ð§Ð°ÑÑ"'</string>
    <string name="weather_type_null">'ÐÐ°Ð½Ð½ÑÑ Ð½ÐµÑ'</string>
    <string name="weather_type_0">Ð¯ÑÐ½Ð¾</string>
    <string name="weather_type_1">ÐÐ±Ð»Ð°ÑÐ½Ð¾</string>
    <string name="weather_type_2">ÐÐ°ÑÐ¼ÑÑÐ½Ð¾</string>
    <string name="weather_type_3">Ð¢ÑÐ¼Ð°Ð½</string>
    <string name="weather_type_4">Ð¡Ð¸Ð»ÑÐ½ÑÐ¹ Ð»Ð¸Ð²ÐµÐ½Ñ</string>
    <string name="weather_type_5">ÐÐ¸Ð²ÐµÐ½Ñ</string>
    <string name="weather_type_6">Ð¡Ð¸Ð»ÑÐ½ÑÐ¹ Ð»Ð¸Ð²ÐµÐ½Ñ</string>
    <string name="weather_type_7">ÐÑÐ¾Ð·Ð°</string>
    <string name="weather_type_8">ÐÐ¾Ð¶Ð´Ñ</string>
    <string name="weather_type_9">Ð¡Ð¸Ð»ÑÐ½ÑÐ¹ Ð´Ð¾Ð¶Ð´Ñ</string>
    <string name="weather_type_10">ÐÐ¾Ð¶Ð´Ñ</string>
    <string name="weather_type_11">ÐÐ·Ð¼Ð¾ÑÐ¾ÑÑ</string>
    <string name="weather_type_12">ÐÐ¾ÐºÑÑÐ¹ ÑÐ½ÐµÐ³</string>
    <string name="weather_type_13">ÐÐµÑÐµÐ»Ñ</string>
    <string name="weather_type_14">ÐÐµÑÑÐ°Ð¼Ð¸ ÑÐ½ÐµÐ³</string>
    <string name="weather_type_15">Ð¡Ð¸Ð»ÑÐ½ÑÐ¹ ÑÐ½ÐµÐ³</string>
    <string name="weather_type_16">Ð¡Ð½ÐµÐ³</string>
    <string name="weather_type_17">ÐÐµÐ±Ð¾Ð»ÑÑÐ¾Ð¹ ÑÐ½ÐµÐ³</string>
    <string name="weather_type_18">Ð¡Ð¸Ð»ÑÐ½Ð°Ñ Ð¿ÑÐ»ÑÐ½Ð°Ñ Ð±ÑÑÑ</string>
    <string name="weather_type_19">ÐÑÐ»ÑÐ½Ð°Ñ Ð±ÑÑÑ</string>
    <string name="weather_type_20">ÐÐµÐ±Ð¾Ð»ÑÑÐ°Ñ Ð¿ÑÐ»ÑÐ½Ð°Ñ Ð±ÑÑÑ</string>
    <string name="weather_type_21">ÐÑÐ»ÑÐ½Ð°Ñ Ð±ÑÑÑ</string>
    <string name="weather_type_22">ÐÑÐ°Ð´</string>
    <string name="weather_type_23">ÐÑÐ»Ñ</string>
    <string name="weather_type_24">Ð¡Ð¼Ð¾Ð³</string>
    <string name="weather_type_25">ÐÐ·Ð¼Ð¾ÑÐ¾Ð·Ñ</string>
</resources>
PK
     68Nõö²¹  ¹     strings/strings_zh_TW.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">Mædæ¥ EEEE</string>
    <string name="date_time_12">Mædæ¥ Eaa</string>
    <string name="desc_date_format">Mædæ¥ EEEE</string>
    <string name="desc_date_format_12">Mædæ¥ Eaa</string>
    <string name="desc_time">ifelse(eq(#time_format,0),#hour12,eq(#time_format,1),#hour24,#hour24)+\'é»\'+ifelse(gt(#minute,0)*le(#minute,9),0,\'\')+ifelse(#minute,#minute+\'å\',\'æ´\')+\', æå©ä¸é²å¥æéApp\'</string>
    <string name="desc_weather">\'ä»å¤©\'+\', \'+@weather_location+\', \'+int(#month+1)+\'æ\'+#date+\'æ¥\'+\', \'+\'é±\'+int(#day_of_week-1)+\',\'+#weather_temperature+\'åº¦\'+\',\'+@weather_description+\',\'+@weather_aqi</string>
    <string name="desc_weather_null">'é»æç²åå¤©æ°£æ¸æ'</string>
    <string name="weather_type_null">'é»æç²åå¤©æ°£æ¸æ'</string>
    <string name="weather_type_0">æ´</string>
    <string name="weather_type_1">å¤é²</string>
    <string name="weather_type_2">é°</string>
    <string name="weather_type_3">é§</string>
    <string name="weather_type_4">ç¹å¤§æ´é¨</string>
    <string name="weather_type_5">å¤§æ´é¨</string>
    <string name="weather_type_6">æ´é¨</string>
    <string name="weather_type_7">é·é£é¨</string>
    <string name="weather_type_8">é£é¨</string>
    <string name="weather_type_9">å¤§é¨</string>
    <string name="weather_type_10">ä¸­é¨</string>
    <string name="weather_type_11">å°é¨</string>
    <string name="weather_type_12">é¨å¤¾å¸¶éª</string>
    <string name="weather_type_13">æ´éª</string>
    <string name="weather_type_14">é£éª</string>
    <string name="weather_type_15">å¤§éª</string>
    <string name="weather_type_16">ä¸­éª</string>
    <string name="weather_type_17">å°éª</string>
    <string name="weather_type_18">å¼·æ²å¡µæ´</string>
    <string name="weather_type_19">æ²å¡µæ´</string>
    <string name="weather_type_20">æ²å¡µ</string>
    <string name="weather_type_21">ææ²</string>
    <string name="weather_type_22">å°é¹</string>
    <string name="weather_type_23">æµ®å¡µ</string>
    <string name="weather_type_24">é¾</string>
    <string name="weather_type_25">åé¨</string>
</resources>
PK
     8NÙÆÃs  s     strings/strings_et_EE.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMM</string>
    <string name="desc_time">'praegune aeg\' + #hour12+âifelse(#minute,#minute,\'\')+\', topelttokse kellarakendusse sisenemiseks'</string>
    <string name="weather_type_null">'Andmed puuduvad'</string>
    <string name="weather_type_0">Selge</string>
    <string name="weather_type_1">Pilvine</string>
    <string name="weather_type_2">HÃ¤gune</string>
    <string name="weather_type_3">Udune</string>
    <string name="weather_type_4">TÃµsine vihmatorm</string>
    <string name="weather_type_5">Vihmatorm</string>
    <string name="weather_type_6">VÃ¤ga tugev sadu</string>
    <string name="weather_type_7">Ãikesetorm</string>
    <string name="weather_type_8">Sadu</string>
    <string name="weather_type_9">Tugev sadu</string>
    <string name="weather_type_10">Vihm</string>
    <string name="weather_type_11">Tibutamine</string>
    <string name="weather_type_12">LÃ¶rts</string>
    <string name="weather_type_13">Lumetorm</string>
    <string name="weather_type_14">Hootine lumesadu</string>
    <string name="weather_type_15">Tugev lumesadu</string>
    <string name="weather_type_16">Lumesadu</string>
    <string name="weather_type_17">Kerge lumesadu</string>
    <string name="weather_type_18">Tugev liivatorm</string>
    <string name="weather_type_19">Liivatorm</string>
    <string name="weather_type_20">Kerge liivatorm</string>
    <string name="weather_type_21">Liivatorm</string>
    <string name="weather_type_22">Rahe</string>
    <string name="weather_type_23">HÃµljuv udu</string>
    <string name="weather_type_24">HÃ¤gu</string>
    <string name="weather_type_25">KÃ¼lm vihm</string>
</resources>
PK
     8N	hÈ	  È	     strings/strings_kn_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE dd MMMM</string>
    <string name="date_time_12">EEE dd MMMM</string>
    <string name="desc_date_format">EEEE dd MMM</string>
    <string name="desc_date_format_12">EEEE dd MMM</string>
    <string name="desc_time">'à²ªà³à²°à²¸à³à²¤à³à²¤ à²¸à²®à²¯\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', à²à²¡à²¿à²¯à²¾à²° à²à³à²¯à²ªà³ââ à²ªà³à²°à²µà³à²¶à²¿à²¸à²²à³ à²¡à²¬à²²à³â à²à³à²¯à²¾à²ªà³â à²®à²¾à²¡à²¿'</string>
    <string name="weather_type_null">'à²¡à³à²à²¾ à²à²²à³à²²'</string>
    <string name="weather_type_0">à²¨à²¿à²à³à²à²³</string>
    <string name="weather_type_1">à²®à³à²¡ à²à²µà²¿à²¦à²¿à²¦à³</string>
    <string name="weather_type_2">à²®à²¬à³à²¬à³ à²à²µà²¿à²¦à²¿à²¦à³</string>
    <string name="weather_type_3">à²®à²à²à³ à²®à³à²¸à³à²à²¿à²¦à³</string>
    <string name="weather_type_4">à²¤à³à²µà³à²° à²®à²³à³-à²à²¾à²³à²¿</string>
    <string name="weather_type_5">à²®à²³à³-à²à²¾à²³à²¿</string>
    <string name="weather_type_6">à²¤à³à²µà³à²° à²®à²³à³-à²à²¾à²³à²¿</string>
    <string name="weather_type_7">à²¬à²¿à²°à³à²à²¾à²³à²¿</string>
    <string name="weather_type_8">à²¤à³à²à²¤à³à²°à³ à²®à²³à³</string>
    <string name="weather_type_9">à²­à²¾à²°à³ à²®à²³à³</string>
    <string name="weather_type_10">à²®à²³à³</string>
    <string name="weather_type_11">à²¤à³à²à²¤à³à²°à³ à²®à²³à³</string>
    <string name="weather_type_12">à²à²²à²¿à²à²²à³à²²à³ à²®à²³à³</string>
    <string name="weather_type_13">à²®à²à²à³-à²à²¾à²³à²¿</string>
    <string name="weather_type_14">à²¤à³à²à²¤à³à²°à³ à²¹à²¿à²®à²®à²³à³</string>
    <string name="weather_type_15">à²¤à³à²µà³à²° à²¹à²¿à²®à²®à²³à³</string>
    <string name="weather_type_16">à²¹à²¿à²®à²®à²³à³</string>
    <string name="weather_type_17">à²¹à²à³à²° à²¹à²¿à²®à²®à²³à³</string>
    <string name="weather_type_18">à²¤à³à²µà³à²° à²®à²°à²³à³-à²à²¾à²³à²¿</string>
    <string name="weather_type_19">à²®à²°à²³à³-à²à²¾à²³à²¿</string>
    <string name="weather_type_20">à²¹à²à³à²° à²®à²°à²³à³-à²à²¾à²³à²¿</string>
    <string name="weather_type_21">à²®à²°à²³à³-à²à²¾à²³à²¿</string>
    <string name="weather_type_22">à²à²²à²¿à²à²²à³à²²à³</string>
    <string name="weather_type_23">à²§à³à²³à³</string>
    <string name="weather_type_24">à²®à²¬à³à²¬à³à²®à³à²¸à³à²à³</string>
    <string name="weather_type_25">à²à²³à²¿-à²®à²³à³</string>
</resources>
PK
     8N¸É¹  ¹     strings/strings_be_BY.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, d MMMM</string>
    <string name="date_time_12">EEE, d MMMM</string>
    <string name="desc_date_format">EEEE, d MMMM</string>
    <string name="desc_date_format_12">EEEE, d MMMM</string>
    <string name="desc_time">'ÑÑÐ¿ÐµÑÐ°ÑÐ½Ñ ÑÐ°Ñ\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', Ð½Ð°ÑÑÑÐ½ÑÑÐµ Ð´Ð²Ð¾Ð¹ÑÑ, ÐºÐ°Ð± Ð·Ð°Ð¹ÑÑÑ Ñ Ð¿ÑÐ°Ð³ÑÐ°Ð¼Ñ Â«ÐÐ°Ð´Ð·ÑÐ½Ð½ÑÐºÂ»'</string>
    <string name="weather_type_null">'ÐÑÐ¼Ð° Ð´Ð°Ð´Ð·ÐµÐ½ÑÑ'</string>
    <string name="weather_type_0">Ð¯ÑÐ½Ð°</string>
    <string name="weather_type_1">Ð¥Ð¼Ð°ÑÐ½Ð°</string>
    <string name="weather_type_2">ÐÐ°ÑÐ¼ÑÑÐ½Ð°</string>
    <string name="weather_type_3">Ð¢ÑÐ¼Ð°Ð½</string>
    <string name="weather_type_4">ÐÐ¾ÑÐ½Ð°Ñ Ð·Ð°Ð»ÐµÐ²Ð°</string>
    <string name="weather_type_5">ÐÐ°Ð»ÐµÐ²Ð°</string>
    <string name="weather_type_6">ÐÐ¾ÑÐ½Ð°Ñ Ð·Ð°Ð»ÐµÐ²Ð°</string>
    <string name="weather_type_7">ÐÐ°Ð²Ð°Ð»ÑÐ½ÑÑÐ°</string>
    <string name="weather_type_8">ÐÐ¾Ð¶Ð´Ð¶</string>
    <string name="weather_type_9">ÐÐ¾ÑÐ½Ñ Ð´Ð¾Ð¶Ð´Ð¶</string>
    <string name="weather_type_10">ÐÐ¾Ð¶Ð´Ð¶</string>
    <string name="weather_type_11">ÐÑÐ¾Ð±Ð½Ñ Ð´Ð¾Ð¶Ð´Ð¶</string>
    <string name="weather_type_12">ÐÐ¾Ð¶Ð´Ð¶ ÑÐ° ÑÐ½ÐµÐ³Ð°Ð¼</string>
    <string name="weather_type_13">ÐÐ°Ð²ÑÑÑÑÐ°</string>
    <string name="weather_type_14">ÐÐµÑÑÐ°Ð¼Ñ ÑÐ½ÐµÐ³</string>
    <string name="weather_type_15">ÐÐ¾ÑÐ½Ñ ÑÐ½ÐµÐ³Ð°Ð¿Ð°Ð´</string>
    <string name="weather_type_16">Ð¡Ð½ÐµÐ³Ð°Ð¿Ð°Ð´</string>
    <string name="weather_type_17">ÐÐµÐ²ÑÐ»ÑÐºÑ ÑÐ½ÐµÐ³</string>
    <string name="weather_type_18">ÐÐ¾ÑÐ½Ð°Ñ Ð¿ÑÑÑÐ°Ð½Ð°Ñ Ð±ÑÑÐ°</string>
    <string name="weather_type_19">ÐÑÑÑÐ°Ð½Ð°Ñ Ð±ÑÑÐ°</string>
    <string name="weather_type_20">CÐ»Ð°Ð±Ð°Ñ Ð¿ÑÑÑÐ°Ð½Ð°Ñ Ð±ÑÑÐ°</string>
    <string name="weather_type_21">ÐÑÑÑÐ°Ð½Ð°Ñ Ð±ÑÑÐ°</string>
    <string name="weather_type_22">ÐÑÐ°Ð´</string>
    <string name="weather_type_23">ÐÑÐ»ÑÐ½Ð°</string>
    <string name="weather_type_24">Ð¡Ð¼ÑÐ³Ð°</string>
    <string name="weather_type_25">Ð¨ÑÑÐ°Ð½Ñ</string>
</resources>
PK
     8N­ñ\ÉA
  A
     strings/strings_gu_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'àªàª¡àª¿àª¯àª¾àª³ àªàªªà«àª²àª¿àªà«àª¶àª¨àª®àª¾àª àª¦àª¾àªàª² àª¥àªµàª¾ àª®àª¾àªà« àªµàª°à«àª¤àª®àª¾àª¨ àª¸àª®àª¯\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', àª¨à« àª¬à«àªµàª¾àª° àªà«àªª àªàª°à«'</string>
    <string name="weather_type_null">'àªà«àª àª¡à«àªàª¾ àª¨àª¥à«'</string>
    <string name="weather_type_0">àª¸àª¾àª«</string>
    <string name="weather_type_1">àªµàª¾àª¦àª³àªàª¾àª¯à«àª</string>
    <string name="weather_type_2">àª§à«àªàª§àª³à«àª</string>
    <string name="weather_type_3">àª§à«àª®à«àª®àª¸àª­àª°à«àª¯à«àª</string>
    <string name="weather_type_4">àªàª¤àª¿àª¥à« àªàª¤àª¿ àª­àª¾àª°à« àªµàª¾àªµàª¾àªà«àª¡à«àª</string>
    <string name="weather_type_5">àªµàª°àª¸àª¾àª¦ àª¸àª¾àª¥à« àªµàª¾àªµàª¾àªà«àª¡à«àª</string>
    <string name="weather_type_6">àª¬àª¹à« àª­àª¾àª°à« àªµàª°àª¸àª¾àª¦</string>
    <string name="weather_type_7">àªàª¾àªàªµà«àª àª¸àª¾àª¥à« àªµàª¾àªµàª¾àªà«àª¡à«àª</string>
    <string name="weather_type_8">àª¨àª¾àª¨à«àª àªàª¾àªªàªà«àª</string>
    <string name="weather_type_9">àª­àª¾àª°à« àªµàª°àª¸àª¾àª¦</string>
    <string name="weather_type_10">àªµàª°àª¸àª¾àª¦</string>
    <string name="weather_type_11">àªàª°àª®àª° àªµàª°àª¸àª¾àª¦</string>
    <string name="weather_type_12">àªàª°àª¾ àª¸àª¾àª¥à« àªµàª°àª¸àª¾àª¦</string>
    <string name="weather_type_13">àª¬àª°àª«à«àª²à«àª àª¤à«àª«àª¾àª¨</string>
    <string name="weather_type_14">àªà«àª¯àª¾àªàª-àªà«àª¯àª¾àªàª àª¹àª¿àª®àªµàª°à«àª·àª¾</string>
    <string name="weather_type_15">àª­àª¾àª°à« àª¹àª¿àª®àªµàª°à«àª·àª¾</string>
    <string name="weather_type_16">àª¹àª¿àª®àªµàª°à«àª·àª¾</string>
    <string name="weather_type_17">àª¹àª³àªµà« àª¹àª¿àª®àªµàª°à«àª·àª¾</string>
    <string name="weather_type_18">àªà«àª°àª¦àª¾àª° àªàªàª§à«</string>
    <string name="weather_type_19">àªàªàª§à«</string>
    <string name="weather_type_20">àª¹àª³àªµà« àªàªàª§à«</string>
    <string name="weather_type_21">àªàªàª§à«</string>
    <string name="weather_type_22">àªàª°àª¾</string>
    <string name="weather_type_23">àªàª¡àª¤à« àª§à«àª³</string>
    <string name="weather_type_24">àª§à«àª®à«àª®àª¸</string>
    <string name="weather_type_25">àª¥à«àªàªµà« àª¨àª¾àªàªà« àªàªµà« àªµàª°àª¸àª¾àª¦</string>
</resources>
PK
     8N)E
  E
     strings/strings_bn_BD.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'à¦à¦à¦¨à¦à¦¾à¦° à¦¸à¦®à§\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', à¦à¦¡à¦¼à¦¿à¦° à¦à§à¦¯à¦¾à¦ªà§ à¦ªà§à¦°à¦¬à§à¦¶ à¦à¦°à¦¾à¦° à¦à¦¨à§à¦¯ à¦¦à§à¦¬à¦¾à¦° à¦à§à¦¯à¦¾à¦ª à¦à¦°à§à¦¨'</string>
    <string name="weather_type_null">'à¦à§à¦¨à§ à¦¡à§à¦à¦¾ à¦¨à§à¦'</string>
    <string name="weather_type_0">à¦ªà¦°à¦¿à¦·à§à¦à¦¾à¦° à¦à¦à¦¾à¦¶</string>
    <string name="weather_type_1">à¦®à§à¦à¦²à¦¾</string>
    <string name="weather_type_2">à¦à¦¸à§à¦ªà¦·à§à¦</string>
    <string name="weather_type_3">à¦à§à¦¯à¦¼à¦¾à¦¶à¦¾à¦à§à¦à¦¨à§à¦¨</string>
    <string name="weather_type_4">à¦®à¦¾à¦°à¦¾à¦¤à§à¦®à¦ à¦à§à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_5">à¦à§à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_6">à¦ªà§à¦°à¦à¦¨à§à¦¡ à¦¬à§à¦·à§à¦à¦¿à¦ªà¦¾à¦¤</string>
    <string name="weather_type_7">à¦¬à¦à§à¦°à¦¬à¦¿à¦¦à§à¦¯à§à¦¤à¦¸à¦¹ à¦à§</string>
    <string name="weather_type_8">à¦¬à¦°à§à¦·à¦£</string>
    <string name="weather_type_9">à¦­à¦¾à¦°à§ à¦¬à§à¦·à§à¦à¦¿à¦ªà¦¾à¦¤</string>
    <string name="weather_type_10">à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_11">à¦à§à¦à¦¡à¦¼à¦¿ à¦à§à¦à¦¡à¦¼à¦¿ à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_12">à¦¶à¦¿à¦²à¦¾à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_13">à¦¤à§à¦·à¦¾à¦°à¦à§</string>
    <string name="weather_type_14">à¦¹à¦¾à¦²à¦à¦¾ à¦¤à§à¦·à¦¾à¦°à¦ªà¦¾à¦¤</string>
    <string name="weather_type_15">à¦ªà§à¦°à¦à¦¨à§à¦¡ à¦¤à§à¦·à¦¾à¦°à¦ªà¦¾à¦¤</string>
    <string name="weather_type_16">à¦¤à§à¦·à¦¾à¦°à¦ªà¦¾à¦¤</string>
    <string name="weather_type_17">à¦¹à¦¾à¦²à¦à¦¾ à¦¤à§à¦·à¦¾à¦°à¦ªà¦¾à¦¤</string>
    <string name="weather_type_18">à¦ªà§à¦°à¦à¦¨à§à¦¡ à¦¬à¦¾à¦²à¦¿à¦à¦¡à¦¼</string>
    <string name="weather_type_19">à¦¬à¦¾à¦²à§à¦à¦¡à¦¼</string>
    <string name="weather_type_20">à¦¹à¦¾à¦²à¦à¦¾ à¦¬à¦¾à¦²à§à¦à¦¡à¦¼</string>
    <string name="weather_type_21">à¦¬à¦¾à¦²à§à¦à¦¡à¦¼</string>
    <string name="weather_type_22">à¦¶à¦¿à¦²à¦¾à¦¬à§à¦·à§à¦à¦¿</string>
    <string name="weather_type_23">à¦­à¦¾à¦¸à¦®à¦¾à¦¨ à¦§à§à¦²à§</string>
    <string name="weather_type_24">à¦à§à¦¯à¦¼à¦¾à¦¶à¦¾</string>
    <string name="weather_type_25">à¦¤à§à¦·à¦¾à¦° à¦ à¦¬à§à¦·à§à¦à¦¿</string>
</resources>
PK
     8Né1Ù<       strings/strings_sl_SI.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMM</string>
    <string name="desc_time">'trenutni Äas\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dvakrat tapnite odprtje aplikacije za uro'</string>
    <string name="weather_type_null">'Ni podatkov'</string>
    <string name="weather_type_0">Jasno</string>
    <string name="weather_type_1">OblaÄno</string>
    <string name="weather_type_2">Megleno</string>
    <string name="weather_type_3">Megla</string>
    <string name="weather_type_4">MoÄan deÅ¾</string>
    <string name="weather_type_5">Nevihta z deÅ¾jem</string>
    <string name="weather_type_6">Zelo huda ploha</string>
    <string name="weather_type_7">Nevihta</string>
    <string name="weather_type_8">Ploha</string>
    <string name="weather_type_9">Huda ploha</string>
    <string name="weather_type_10">DeÅ¾</string>
    <string name="weather_type_11">Rahel deÅ¾</string>
    <string name="weather_type_12">Sodra</string>
    <string name="weather_type_13">SneÅ¾na nevihta</string>
    <string name="weather_type_14">Nanosi snega</string>
    <string name="weather_type_15">MoÄno sneÅ¾enje</string>
    <string name="weather_type_16">SneÅ¾enje</string>
    <string name="weather_type_17">Rahlo sneÅ¾enje</string>
    <string name="weather_type_18">Huda peÅ¡Äena nevihta</string>
    <string name="weather_type_19">PeÅ¡Äena nevihta</string>
    <string name="weather_type_20">Rahla peÅ¡Äena nevihta</string>
    <string name="weather_type_21">PeÅ¡Äena nevihta</string>
    <string name="weather_type_22">ToÄa</string>
    <string name="weather_type_23">PlavajoÄ prah</string>
    <string name="weather_type_24">Meglica</string>
    <string name="weather_type_25">Leden deÅ¾</string>
</resources>
PK
     8N·Í½Â  Â     strings/strings_sr_RS.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM.</string>
    <string name="desc_date_format_12">EEEE, dd. MMM.</string>
    <string name="desc_time">'Ð²ÑÐµÐ¼Ðµ\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', Ð´Ð²Ð°Ð¿ÑÑ Ð´Ð¾Ð´Ð¸ÑÐ½Ð¸ÑÐµ Ð´Ð° ÑÑÐµÑÐµ Ñ Ð°Ð¿Ð»Ð¸ÐºÐ°ÑÐ¸ÑÑ Ð·Ð° ÑÐ°Ñ'</string>
    <string name="weather_type_null">'ÐÐµÐ¼Ð° Ð¿Ð¾Ð´Ð°ÑÐ°ÐºÐ°'</string>
    <string name="weather_type_0">ÐÐµÐ´ÑÐ¾</string>
    <string name="weather_type_1">ÐÐ±Ð»Ð°ÑÐ½Ð¾</string>
    <string name="weather_type_2">ÐÐ·Ð¼Ð°Ð³Ð»Ð¸ÑÐ°</string>
    <string name="weather_type_3">ÐÐ°Ð³Ð»Ð¾Ð²Ð¸ÑÐ¾</string>
    <string name="weather_type_4">ÐÐ°ÐºÐ° ÐºÐ¸ÑÐ½Ð° Ð¾Ð»ÑÑÐ°</string>
    <string name="weather_type_5">ÐÐµÐ²ÑÐµÐ¼Ðµ</string>
    <string name="weather_type_6">ÐÐµÐ¾Ð¼Ð° ÑÐ°ÐºÐ¸ Ð¿ÑÑÑÐ°Ðº</string>
    <string name="weather_type_7">ÐÐ»ÑÑÐ° ÑÐ° Ð³ÑÐ¼ÑÐ°Ð²Ð¸Ð½Ð¾Ð¼</string>
    <string name="weather_type_8">ÐÑÑÑÐ°Ðº</string>
    <string name="weather_type_9">Ð¡Ð½Ð°Ð¶Ð½Ð¸ Ð¿ÑÑÑÐ°Ðº</string>
    <string name="weather_type_10">ÐÐ¸ÑÐ°</string>
    <string name="weather_type_11">Ð¡Ð»Ð°Ð±Ð° ÐºÐ¸ÑÐ°</string>
    <string name="weather_type_12">ÐÐ¾Ð»ÐµÐ´Ð¸ÑÐ°</string>
    <string name="weather_type_13">Ð¡Ð½ÐµÐ¶Ð½Ð° Ð¾Ð»ÑÑÐ°</string>
    <string name="weather_type_14">ÐÐ°Ð½Ð¾ÑÐ¸ ÑÐ½ÐµÐ³Ð°</string>
    <string name="weather_type_15">Ð¡Ð½Ð°Ð¶aÐ½ ÑÐ½ÐµÐ³</string>
    <string name="weather_type_16">Ð¡Ð½ÐµÐ³</string>
    <string name="weather_type_17">Ð¡Ð»Ð°Ð± ÑÐ½ÐµÐ³</string>
    <string name="weather_type_18">Ð¡Ð½Ð°Ð¶Ð½Ð° Ð¿ÐµÑÑÐ°Ð½Ð° Ð¾Ð»ÑÑÐ°</string>
    <string name="weather_type_19">ÐÐµÑÑÐ°Ð½Ð° Ð¾Ð»ÑÑÐ°</string>
    <string name="weather_type_20">Ð¡Ð»Ð°Ð±Ð° Ð¿ÐµÑÑÐ°Ð½Ð° Ð¾Ð»ÑÑÐ°</string>
    <string name="weather_type_21">ÐÐµÑÑÐ°Ð½Ð° Ð¾Ð»ÑÑÐ°</string>
    <string name="weather_type_22">ÐÑÐ°Ð´</string>
    <string name="weather_type_23">ÐÑÐ°ÑÐ¸Ð½Ð°</string>
    <string name="weather_type_24">Ð¡ÑÐ¼Ð°Ð³Ð»Ð¸ÑÐ°</string>
    <string name="weather_type_25">ÐÐµÐ´ÐµÐ½Ð° ÐºÐ¸ÑÐ°</string>
</resources>
PK
     8Nká_öm  m     strings/strings_da_DK.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, d. MMMM</string>
    <string name="date_time_12">EEE, d. MMMM</string>
    <string name="desc_date_format">EEEE, d. MMM</string>
    <string name="desc_date_format_12">EEEE, d. MMM</string>
    <string name="desc_time">'aktuel\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', dobbeltklik for at indtaste ur-app'</string>
    <string name="weather_type_null">'Ingen data'</string>
    <string name="weather_type_0">Klart</string>
    <string name="weather_type_1">Skyet</string>
    <string name="weather_type_2">Diset</string>
    <string name="weather_type_3">TÃ¥get</string>
    <string name="weather_type_4">Alvorligt regnvejr</string>
    <string name="weather_type_5">Regnvejr</string>
    <string name="weather_type_6">Meget kraftigt regnvejr</string>
    <string name="weather_type_7">Tordenvejr</string>
    <string name="weather_type_8">Byge</string>
    <string name="weather_type_9">Kraftig nedbÃ¸r</string>
    <string name="weather_type_10">Regn</string>
    <string name="weather_type_11">StÃ¸vregn</string>
    <string name="weather_type_12">Slud</string>
    <string name="weather_type_13">Snestorm</string>
    <string name="weather_type_14">Pletvis snevejr</string>
    <string name="weather_type_15">Kraftigt snevejr</string>
    <string name="weather_type_16">Snefald</string>
    <string name="weather_type_17">Let snefald</string>
    <string name="weather_type_18">Kraftig sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Let sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hagl</string>
    <string name="weather_type_23">Flydende stÃ¸v</string>
    <string name="weather_type_24">Dis</string>
    <string name="weather_type_25">Frysende regn</string>
</resources>
PK
     8NvyÌíõ  õ     strings/strings_pl_PL.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'aktualna godzina\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dotknij dwukrotnie, aby przejÅÄ do aplikacji Zegar'</string>
    <string name="weather_type_null">'Brak danych'</string>
    <string name="weather_type_0">Pogodnie</string>
    <string name="weather_type_1">Pochmurno</string>
    <string name="weather_type_2">Zamglenia</string>
    <string name="weather_type_3">MgÅa</string>
    <string name="weather_type_4">Ulewne deszcze</string>
    <string name="weather_type_5">Ulewa</string>
    <string name="weather_type_6">Bardzo intensywne opady deszczu</string>
    <string name="weather_type_7">Burza z piorunami</string>
    <string name="weather_type_8">MÅ¼awka</string>
    <string name="weather_type_9">Intensywne opady deszczu</string>
    <string name="weather_type_10">Deszczowo</string>
    <string name="weather_type_11">Przelotne opady</string>
    <string name="weather_type_12">Deszcz ze Åniegiem</string>
    <string name="weather_type_13">ZamieÄ ÅnieÅ¼na</string>
    <string name="weather_type_14">Ånieg</string>
    <string name="weather_type_15">Intensywne opady Åniegu</string>
    <string name="weather_type_16">Opady Åniegu</string>
    <string name="weather_type_17">Lekkie opady Åniegu</string>
    <string name="weather_type_18">Silna burza piaskowa</string>
    <string name="weather_type_19">Burza piaskowa</string>
    <string name="weather_type_20">Lekka burza piaskowa</string>
    <string name="weather_type_21">Burza piaskowa</string>
    <string name="weather_type_22">Grad</string>
    <string name="weather_type_23">UnoszÄcy siÄ pyÅ</string>
    <string name="weather_type_24">Zamglenia</string>
    <string name="weather_type_25">MarznÄcy deszcz</string>
</resources>
PK
     8NGt´ÿ  ÿ     strings/strings_mk_MK.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ÑÐµÐºÐ¾Ð²Ð½Ð¾ Ð²ÑÐµÐ¼Ðµ\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', Ð´Ð²Ð°Ð¿Ð°ÑÐ¸ Ð´Ð¾Ð¿ÑÐµÑÐµ Ð·Ð° Ð´Ð° Ð²Ð»ÐµÐ·ÐµÑÐµ Ð²Ð¾ Ð°Ð¿Ð»Ð¸ÐºÐ°ÑÐ¸ÑÐ°ÑÐ° ÑÐ°ÑÐ¾Ð²Ð½Ð¸Ðº'</string>
    <string name="weather_type_null">'ÐÐµÐ¼Ð° Ð¿Ð¾Ð´Ð°ÑÐ¾ÑÐ¸'</string>
    <string name="weather_type_0">ÐÐµÐ´ÑÐ¾</string>
    <string name="weather_type_1">ÐÐ±Ð»Ð°ÑÐ½Ð¾</string>
    <string name="weather_type_2">ÐÐ°ÑÐ½Ð¾</string>
    <string name="weather_type_3">ÐÐ°Ð³Ð»Ð¸Ð²Ð¾</string>
    <string name="weather_type_4">Ð¢ÐµÑÐºÐ° Ð±ÑÑÐ°</string>
    <string name="weather_type_5">ÐÑÑÐ°</string>
    <string name="weather_type_6">ÐÐ½Ð¾Ð³Ñ Ð¾Ð±Ð¸Ð»Ð½Ð¸ Ð²ÑÐ½ÐµÐ¶Ð¸</string>
    <string name="weather_type_7">ÐÑÐ¼Ð¾ÑÐµÐ²Ð¸ÑÐ¸</string>
    <string name="weather_type_8">ÐÑÐ°ÑÐ¾Ðº Ð´Ð¾Ð¶Ð´</string>
    <string name="weather_type_9">ÐÐ±Ð¸Ð»Ð½Ð¸ Ð²ÑÐ½ÐµÐ¶Ð¸</string>
    <string name="weather_type_10">ÐÐ¾Ð¶Ð´</string>
    <string name="weather_type_11">Ð¡Ð¸ÑÐµÐ½ Ð´Ð¾Ð¶Ð´</string>
    <string name="weather_type_12">ÐÐ°Ð¿Ð°Ð²Ð¸ÑÐ°</string>
    <string name="weather_type_13">Ð¡Ð½ÐµÐ¶Ð½Ð° Ð²Ð¸ÐµÐ»Ð¸ÑÐ°</string>
    <string name="weather_type_14">ÐÐ°ÑÑÐ¸ÑÐ° Ð¾Ð´ ÑÐ½ÐµÐ¶Ð½Ð¸ÑÐµ Ð²ÑÐ½ÐµÐ¶Ð¸</string>
    <string name="weather_type_15">ÐÐ±Ð¸Ð»Ð½Ð¸ ÑÐ½ÐµÐ¶Ð½Ð¸ Ð²ÑÐ½ÐµÐ¶Ð¸</string>
    <string name="weather_type_16">Ð¡Ð½ÐµÐ¶Ð½Ð¸ÑÐµ Ð²ÑÐ½ÐµÐ¶Ð¸</string>
    <string name="weather_type_17">ÐÐµÑÐ½Ð¸ Ð²ÑÐ½ÐµÐ¶Ð¸ Ð¾Ð´ ÑÐ½ÐµÐ³</string>
    <string name="weather_type_18">Ð¡Ð¸Ð»Ð½Ð° Ð¿ÐµÑÐ¾ÑÐ½Ð° Ð±ÑÑÐ°</string>
    <string name="weather_type_19">ÐÐµÑÐ¾ÑÐ½Ð° Ð±ÑÑÐ°</string>
    <string name="weather_type_20">ÐÐµÑÐ¾ÑÐ½Ð° Ð±ÑÑÐ°</string>
    <string name="weather_type_21">ÐÐµÑÐ¾ÑÐ½Ð° Ð±ÑÑÐ°</string>
    <string name="weather_type_22">ÐÑÐ°Ð´</string>
    <string name="weather_type_23">ÐÐµÐ±Ð´ÐµÑÑÐ¸</string>
    <string name="weather_type_24">ÐÐ°Ð³Ð»Ð°</string>
    <string name="weather_type_25">ÐÐµÐ´ÐµÐ½ Ð´Ð¾Ð¶Ð´</string>
</resources>
PK
     8N.\ðx«  «     strings/strings_de_DE.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMM</string>
    <string name="desc_time">'Aktuelle Uhrzeit\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', doppeltippen, um die Uhr zu Ã¶ffnen'</string>
    <string name="weather_type_null">'Keine Daten'</string>
    <string name="weather_type_0">Sonnig</string>
    <string name="weather_type_1">BewÃ¶lkt</string>
    <string name="weather_type_2">Dunstig</string>
    <string name="weather_type_3">Neblig</string>
    <string name="weather_type_4">Schwere Gewitter</string>
    <string name="weather_type_5">Regensturm</string>
    <string name="weather_type_6">Sehr starke RegenfÃ¤lle</string>
    <string name="weather_type_7">Gewitter</string>
    <string name="weather_type_8">Schauer</string>
    <string name="weather_type_9">Starker Regen</string>
    <string name="weather_type_10">Regen</string>
    <string name="weather_type_11">Nieselregen</string>
    <string name="weather_type_12">Schneeregen</string>
    <string name="weather_type_13">Schneesturm</string>
    <string name="weather_type_14">Vereinzelt Schneefall</string>
    <string name="weather_type_15">Starker Schneefall</string>
    <string name="weather_type_16">Schneefall</string>
    <string name="weather_type_17">Leichter Schneefall</string>
    <string name="weather_type_18">Starker Sandsturm</string>
    <string name="weather_type_19">Sandsturm</string>
    <string name="weather_type_20">Leichter Sandsturm</string>
    <string name="weather_type_21">Sandsturm</string>
    <string name="weather_type_22">Hagel</string>
    <string name="weather_type_23">Schwebender Staub</string>
    <string name="weather_type_24">Nebel</string>
    <string name="weather_type_25">Schneeregen</string>
</resources>
PK
     8N=
ø  ø     strings/strings_lv_LV.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMMM</string>
    <string name="desc_time">'current time\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', pieskarieties divreiz, lai ieietu pulksteÅa lietotnÄ'</string>
    <string name="weather_type_null">'Nav datu'</string>
    <string name="weather_type_0">Skaidrs</string>
    <string name="weather_type_1">MÄkoÅains</string>
    <string name="weather_type_2">Neskaidrs</string>
    <string name="weather_type_3">Miglains</string>
    <string name="weather_type_4">Stipra vÄtra ar lietu</string>
    <string name="weather_type_5">VÄtra ar lietu</string>
    <string name="weather_type_6">Ä»oti spÄcÄ«gas lietusgÄzes</string>
    <string name="weather_type_7">PÄrkona negaiss</string>
    <string name="weather_type_8">Stiprs lietus</string>
    <string name="weather_type_9">SpÄcÄ«gas lietusgÄzes</string>
    <string name="weather_type_10">Lietus</string>
    <string name="weather_type_11">Smidzina</string>
    <string name="weather_type_12">SlapjdraÅÄ·is</string>
    <string name="weather_type_13">Sniega vÄtra</string>
    <string name="weather_type_14">VietÄm sniegs</string>
    <string name="weather_type_15">SpÄcÄ«gs sniegputenis</string>
    <string name="weather_type_16">Sniegputenis</string>
    <string name="weather_type_17">Viegls sniegputenis</string>
    <string name="weather_type_18">SpÄcÄ«ga smilÅ¡u vÄtra</string>
    <string name="weather_type_19">SmilÅ¡u vÄtra</string>
    <string name="weather_type_20">Neliela smilÅ¡u vÄtra</string>
    <string name="weather_type_21">SmilÅ¡u vÄtra</string>
    <string name="weather_type_22">Krusa</string>
    <string name="weather_type_23">PutekÄ¼ains gaiss</string>
    <string name="weather_type_24">DÅ«maka</string>
    <string name="weather_type_25">Atkala</string>
</resources>
PK
     8NÉé9       strings/strings_bo_CN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">à½à¾³ M à½à½ºà½¦ d E</string>
    <string name="date_time_12">à½à¾³à¼ M à½à½ºà½¦à¼ d à½à½²à½à¼ Eaa</string>
    <string name="desc_date_format">à½à¾³à¼ M à½à½ºà½¦à¼ d E</string>
    <string name="desc_date_format_12">à½à¾³à¼ M à½à½ºà½¦à¼ d à½à½²à½à¼ Eaa</string>
    <string name="desc_time">ifelse(eq(#time_format,0),#hour12,eq(#time_format,1),#hour24,#hour24)+\'ç¹\'+ifelse(gt(#minute,0)*le(#minute,9),0,\'\')+ifelse(#minute,#minute+\'à½¦à¾à½¢à¼à½à¼\',\'à½à½à¼à½à½\')+\', à½à½²à½¦à¼à½¢à½ºà½à¼à½à¾±à½¦à¼à½à½¦à¼à½à½´à¼à½à½¼à½à¼App\'à½£à¼à½ à½à½´à½£à¼à½à¼</string>
    <string name="desc_weather">\@weather_description+\', \'+#weather_temperature+\'à½à½´à½ à½´à¼\'</string>
    <string name="desc_weather_null">'à½à½à½¦à¼à½¦à¾à½à½¦à¼à½¦à½´à¼à½à½à½²à¼à½à¾²à½à½¦à¼à½à½²à¼à½ à½à½´à½'</string>
    <string name="weather_type_null">'à½à½à½¦à¼à½¦à¾à½à½¦à¼à½à½à½²à¼à½à¾²à½à½¦à¼à½à½²à¼à½ à½à½´à½'</string>
    <string name="weather_type_0">à½à½à½à¼à½à¾­à½à½¦à¼</string>
    <string name="weather_type_1">à½¦à¾¤à¾²à½²à½à¼à½à½à¼à¼</string>
    <string name="weather_type_2">à½à½à½à¼à½ à½à½²à½à½¦à¼</string>
    <string name="weather_type_3">à½¦à¾¨à½´à½à¼à½à¼</string>
    <string name="weather_type_4">à½à¾²à½à¼à½à½¢à¼à½¤à½²à½à¼à½à½´à¼à½à½ºà½à¼à½à½¼à¼</string>
    <string name="weather_type_5">à½à¾²à½à¼à½à½¢à¼à½à½ºà½à¼à½à½¼à¼</string>
    <string name="weather_type_6">à½à¾²à½à¼à½à½¢à¼</string>
    <string name="weather_type_7">à½ à½à¾²à½´à½à¼à½à½¢à¼</string>
    <string name="weather_type_8">à½à½¼à½£à¼à½à½¢à¼</string>
    <string name="weather_type_9">à½à½¢à¼à½à½ºà½à¼</string>
    <string name="weather_type_10">à½à½¢à¼à½ à½à¾²à½²à½à¼à¼</string>
    <string name="weather_type_11">à½à½¢à¼à½à½´à½à¼à¼</string>
    <string name="weather_type_12">à½à¼à½à½¢à¼à½ à½à¾²à½ºà½¦à¼à½à¼</string>
    <string name="weather_type_13">à½à¼à½à¼à½à¾²à½à¼à½à½¼à¼</string>
    <string name="weather_type_14">à½à¼à½à¼à½¡à½´à½à¼à½à½à¼à½ à½à½à¼à½à¼</string>
    <string name="weather_type_15">à½à¼à½à¼à½à½ºà½à¼à½à½¼à¼</string>
    <string name="weather_type_16">à½à¼à½à¼à½ à½à¾²à½²à½à¼à½à½à¼</string>
    <string name="weather_type_17">à½à¼à½à¼à½à½´à½à¼à½à½´à½à¼à¼</string>
    <string name="weather_type_18">à½à¾±à½ºà¼à½¢à¾³à½´à½à¼à½ à½à½´à½à¼à½à¼à½à¾²à½à¼à½à½¼à¼</string>
    <string name="weather_type_19">à½à¾±à½ºà¼à½¢à¾³à½´à½à¼à½ à½à½´à½à¼à½à¼</string>
    <string name="weather_type_20">à½à¾±à½ºà¼à½¢à¾¡à½´à½£à¼</string>
    <string name="weather_type_21">à½à¾±à½ºà¼à½¢à¾³à½´à½à¼à¼</string>
    <string name="weather_type_22">à½¦à½ºà½¢à¼à½à¼</string>
    <string name="weather_type_23">à½à½£à¼à½¢à¾¡à½´à½£à¼</string>
    <string name="weather_type_24">à½¢à¾¡à½´à½£à¼à½à½</string>
    <string name="weather_type_25">à½ à½à¾±à½à½¦à¼à½à½¢à¼</string>
</resources>
PK
     8N+
  
     strings/strings_ne_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'à¤¹à¤¾à¤²à¤à¥ à¤¸à¤®à¤¯\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', à¤à¤¡à¥ à¤à¤ª à¤­à¤¿à¤¤à¥à¤° à¤à¤¾à¤¨ à¤¦à¥à¤à¤ªà¤à¤ à¤à¥à¤¯à¤¾à¤ª à¤à¤°à¥à¤¨à¥à¤¹à¥à¤¸à¥'</string>
    <string name="weather_type_null">'à¤¡à¤¾à¤à¤¾ à¤à¥à¤¨'</string>
    <string name="weather_type_0">à¤à¤¾à¤²à¥ à¤à¤°à¥à¤¨à¥à¤¹à¥à¤¸à¥</string>
    <string name="weather_type_1">à¤¬à¤¾à¤¦à¤² à¤²à¤¾à¤à¥à¤à¥</string>
    <string name="weather_type_2">à¤§à¤®à¤¿à¤²à¥</string>
    <string name="weather_type_3">à¤¤à¥à¤µà¤¾à¤à¤²à¥ à¤²à¤¾à¤à¥à¤à¥</string>
    <string name="weather_type_4">à¤¤à¥à¤ à¤¤à¥à¤«à¤¾à¤¨</string>
    <string name="weather_type_5">à¤à¤à¤§à¥</string>
    <string name="weather_type_6">à¤ à¥à¤²à¥ à¤­à¤¾à¤°à¥ à¤¬à¤°à¥à¤·à¤¾</string>
    <string name="weather_type_7">à¤à¤à¥à¤¯à¤¾à¤à¥</string>
    <string name="weather_type_8">à¤¬à¤°à¥à¤¸à¤¾</string>
    <string name="weather_type_9">à¤­à¤¾à¤°à¥ à¤¬à¤°à¥à¤·à¤¾</string>
    <string name="weather_type_10">à¤¬à¤°à¥à¤·à¤¾</string>
    <string name="weather_type_11">à¤¹à¤²à¥à¤à¤¾ à¤¬à¤°à¥à¤·à¤¾</string>
    <string name="weather_type_12">à¤à¤¸à¤¿à¤¨à¤¾ à¤¸à¤¹à¤¿à¤¤à¤à¥ à¤¬à¤°à¥à¤·à¤¾</string>
    <string name="weather_type_13">à¤¹à¤¿à¤®à¤ªà¤¾à¤¤</string>
    <string name="weather_type_14">à¤¹à¤¿à¤®à¤ªà¤¾à¤¤à¤à¥ à¤à¤£à¥à¤¡à¤¹à¤°à¥</string>
    <string name="weather_type_15">à¤­à¤¾à¤°à¥ à¤¹à¤¿à¤®à¤ªà¤¾à¤¤</string>
    <string name="weather_type_16">à¤¹à¤¿à¤®à¤ªà¤¾à¤¤</string>
    <string name="weather_type_17">à¤¹à¤²à¥à¤à¤¾ à¤¹à¤¿à¤®à¤ªà¤¾à¤¤</string>
    <string name="weather_type_18">à¤¬à¤²à¤¿à¤¯à¥ à¤¬à¤¾à¤²à¥à¤µà¤¾à¤à¥ à¤à¤à¤§à¥</string>
    <string name="weather_type_19">à¤§à¥à¤²à¥ à¤¸à¤¹à¤¿à¤¤à¤à¥ à¤¤à¥à¤«à¤¾à¤¨</string>
    <string name="weather_type_20">à¤¹à¤²à¥à¤à¤¾ à¤§à¥à¤²à¥ à¤¸à¤¹à¤¿à¤¤à¤à¥ à¤¤à¥à¤«à¤¾à¤¨</string>
    <string name="weather_type_21">à¤¤à¥à¤«à¤¾à¤¨</string>
    <string name="weather_type_22">à¤à¤¸à¤¿à¤¨à¤¾</string>
    <string name="weather_type_23">à¤¤à¥à¤°à¤¿à¤°à¤¹à¥à¤à¥ à¤«à¥à¤¹à¥à¤°</string>
    <string name="weather_type_24">à¤¤à¥à¤µà¤¾à¤à¤²à¥</string>
    <string name="weather_type_25">à¤à¤ à¥à¤¯à¤¾à¤à¤à¥à¤°à¤¿à¤¨à¥ à¤µà¤°à¥à¤·à¤¾</string>
</resources>
PK
     8Nè:Go  o     strings/strings_en_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'current time\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', double tap to enter clock app'</string>
    <string name="weather_type_null">'No data'</string>
    <string name="weather_type_0">Clear</string>
    <string name="weather_type_1">Cloudy</string>
    <string name="weather_type_2">Hazy</string>
    <string name="weather_type_3">Foggy</string>
    <string name="weather_type_4">Severe rainstorm</string>
    <string name="weather_type_5">Rainstorm</string>
    <string name="weather_type_6">Very heavy rainfall</string>
    <string name="weather_type_7">Thunderstorm</string>
    <string name="weather_type_8">Shower</string>
    <string name="weather_type_9">Heavy rainfall</string>
    <string name="weather_type_10">Rain</string>
    <string name="weather_type_11">Drizzle</string>
    <string name="weather_type_12">Sleet</string>
    <string name="weather_type_13">Snowstorm</string>
    <string name="weather_type_14">Patches of snowfall</string>
    <string name="weather_type_15">Heavy snowfall</string>
    <string name="weather_type_16">Snowfall</string>
    <string name="weather_type_17">Light snowfall</string>
    <string name="weather_type_18">Strong sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Light sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hail</string>
    <string name="weather_type_23">Floating Dust</string>
    <string name="weather_type_24">Haze</string>
    <string name="weather_type_25">Freezing rain</string>
</resources>
PK
     8N¥"âøÁ  Á     strings/strings_bs_BA.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM.</string>
    <string name="desc_date_format_12">EEEE, dd. MMM.</string>
    <string name="desc_time">'trenutno vrijeme\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dodirnite dva puta za ulazak u aplikaciju sata'</string>
    <string name="weather_type_null">'Nema podataka'</string>
    <string name="weather_type_0">Vedro</string>
    <string name="weather_type_1">OblaÄno</string>
    <string name="weather_type_2">Izmaglica</string>
    <string name="weather_type_3">Maglovito</string>
    <string name="weather_type_4">Jaka kiÅ¡na oluja</string>
    <string name="weather_type_5">KiÅ¡na oluja</string>
    <string name="weather_type_6">Vrlo jake padavine</string>
    <string name="weather_type_7">Oluja sa grmljavinom</string>
    <string name="weather_type_8">Pljusak</string>
    <string name="weather_type_9">Jake padavine</string>
    <string name="weather_type_10">KiÅ¡a</string>
    <string name="weather_type_11">Rosulja</string>
    <string name="weather_type_12">SusnjeÅ¾ica</string>
    <string name="weather_type_13">SnjeÅ¾na oluja</string>
    <string name="weather_type_14">Nanosi snijega</string>
    <string name="weather_type_15">Jak snijeg</string>
    <string name="weather_type_16">Snijeg</string>
    <string name="weather_type_17">Slab snijeg</string>
    <string name="weather_type_18">Jaka pjeÅ¡Äana oluja</string>
    <string name="weather_type_19">PjeÅ¡Äana oluja</string>
    <string name="weather_type_20">Blaga pjeÅ¡Äana oluja</string>
    <string name="weather_type_21">PjeÅ¡Äana oluja</string>
    <string name="weather_type_22">Grad</string>
    <string name="weather_type_23">PraÅ¡ina u vazduhu</string>
    <string name="weather_type_24">Izmaglica</string>
    <string name="weather_type_25">Ledena kiÅ¡a</string>
</resources>
PK
     8NïÀ3°  °     strings/strings_sk_SK.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMM</string>
    <string name="desc_time">'aktuÃ¡lny Äas\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dvojitÃ½ dotyk pre spustenie hodÃ­n'</string>
    <string name="weather_type_null">'Å½iadne Ãºdaje'</string>
    <string name="weather_type_0">Jasno</string>
    <string name="weather_type_1">OblaÄno</string>
    <string name="weather_type_2">Hmlisto</string>
    <string name="weather_type_3">Hmlisto</string>
    <string name="weather_type_4">SilnÃ¡ bÃºrka</string>
    <string name="weather_type_5">BÃºrka</string>
    <string name="weather_type_6">VeÄ¾mi silnÃ½ lejak</string>
    <string name="weather_type_7">BÃºrka</string>
    <string name="weather_type_8">PrehÃ¡nky</string>
    <string name="weather_type_9">SilnÃ½ dÃ¡Å¾Ä</string>
    <string name="weather_type_10">DÃ¡Å¾Ä</string>
    <string name="weather_type_11">Mrholenie</string>
    <string name="weather_type_12">DÃ¡Å¾Ä so snehom</string>
    <string name="weather_type_13">SnehovÃ¡ bÃºrka</string>
    <string name="weather_type_14">SneÅ¾enie</string>
    <string name="weather_type_15">HustÃ© sneÅ¾enie</string>
    <string name="weather_type_16">SneÅ¾enie</string>
    <string name="weather_type_17">SlabÃ© sneÅ¾enie</string>
    <string name="weather_type_18">SilnÃ¡ piesoÄnÃ¡ bÃºrka</string>
    <string name="weather_type_19">PiesoÄnÃ¡ bÃºrka</string>
    <string name="weather_type_20">SlabÃ¡ piesoÄnÃ¡ bÃºrka</string>
    <string name="weather_type_21">PiesoÄnÃ¡ bÃºrka</string>
    <string name="weather_type_22">Krupobitie</string>
    <string name="weather_type_23">PraÅ¡no</string>
    <string name="weather_type_24">Hmla</string>
    <string name="weather_type_25">MrznÃºci dÃ¡Å¾Ä</string>
</resources>
PK
     8NW3fp       strings/strings_ha_NG.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'loakaci na yanzu\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', taÉa sau biyu ka shiga manhajar agogo'</string>
    <string name="weather_type_null">'Babu bayanai'</string>
    <string name="weather_type_0">Sama ta washe</string>
    <string name="weather_type_1">Akwai girgije</string>
    <string name="weather_type_2">Hazo</string>
    <string name="weather_type_3">Hazo so sai</string>
    <string name="weather_type_4">Ruwa da iska mai tsanani</string>
    <string name="weather_type_5">Ruwa da iska</string>
    <string name="weather_type_6">Ruwa mai yawan gaske</string>
    <string name="weather_type_7">Tsawa da iska</string>
    <string name="weather_type_8">Ruwan sama mai tsanani</string>
    <string name="weather_type_9">Ruwa mai yawa</string>
    <string name="weather_type_10">Ruwan sama</string>
    <string name="weather_type_11">Yayyafi</string>
    <string name="weather_type_12">Garin kankara da ruwa</string>
    <string name="weather_type_13">Garin kankara da iska</string>
    <string name="weather_type_14">Faduwar garin kankara</string>
    <string name="weather_type_15">Garin kankara mai yawa</string>
    <string name="weather_type_16">Garin kankara</string>
    <string name="weather_type_17">Yayyafin garin kankara</string>
    <string name="weather_type_18">Iska da rairai mai tsanani</string>
    <string name="weather_type_19">Iska da rairai</string>
    <string name="weather_type_20">Yayyafin rairai</string>
    <string name="weather_type_21">Iska da rairai</string>
    <string name="weather_type_22">ÆanÆara</string>
    <string name="weather_type_23">Bambarowar Kura</string>
    <string name="weather_type_24">Hazo</string>
    <string name="weather_type_25">Ruwan sama mai daskarewa</string>
</resources>
PK
     8NÎâBK       strings/strings_zh_CN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">Mædæ¥ E</string>
    <string name="date_time_12">Mædæ¥ Eaa</string>
    <string name="desc_date_format">Mædæ¥ E</string>
    <string name="desc_date_format_12">Mædæ¥ Eaa</string>
    <string name="desc_time">ifelse(eq(#time_format,0),#hour12,eq(#time_format,1),#hour24,#hour24)+'ç¹'+ifelse(gt(#minute,0)*le(#minute,9),0,'')+ifelse(#minute,#minute+'å','æ´')+', åå»è¿å¥æ¶éApp'</string>
	<string name="desc_weather">@weather_description+', '+#weather_temperature+'åº¦'</string>
    <string name="desc_weather_null">'ç¹å»è·åå¤©æ°æ°æ®'</string>
	<string name="weather_type_null">'ç¹å»è·åå¤©æ°æ°æ®'</string>
	<string name="weather_type_0">æ´</string>
    <string name="weather_type_1">å¤äº</string>
    <string name="weather_type_2">é´</string>
    <string name="weather_type_3">é¾</string>
    <string name="weather_type_4">ç¹å¤§æ´é¨</string>
    <string name="weather_type_5">å¤§æ´é¨</string>
    <string name="weather_type_6">æ´é¨</string>
    <string name="weather_type_7">é·éµé¨</string>
    <string name="weather_type_8">éµé¨</string>
    <string name="weather_type_9">å¤§é¨</string>
    <string name="weather_type_10">ä¸­é¨</string>
    <string name="weather_type_11">å°é¨</string>
    <string name="weather_type_12">é¨å¤¹éª</string>
    <string name="weather_type_13">æ´éª</string>
    <string name="weather_type_14">éµéª</string>
    <string name="weather_type_15">å¤§éª</string>
    <string name="weather_type_16">ä¸­éª</string>
    <string name="weather_type_17">å°éª</string>
    <string name="weather_type_18">å¼ºæ²å°æ´</string>
    <string name="weather_type_19">æ²å°æ´</string>
    <string name="weather_type_20">æ²å°</string>
    <string name="weather_type_21">æ¬æ²</string>
    <string name="weather_type_22">å°é¹</string>
    <string name="weather_type_23">æµ®å°</string>
    <string name="weather_type_24">é¾</string>
    <string name="weather_type_25">å»é¨</string>
</resources>
PK
     8NZï$Úª
  ª
     strings/strings_te_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'à°ªà±à°°à°¸à±à°¤à±à°¤ à°¸à°®à°¯à°\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', à°à°¡à°¿à°¯à°¾à°° à°à°ªà±à°²à°¿à°à±à°·à°¨à±âà°²à± à°ªà±à°°à°µà±à°¶à°¿à°à°à±à°à°¦à±à°à± à°°à±à°à°¡à±à°¸à°¾à°°à±à°²à± à°¨à±à°à±à°à°à°¡à°¿'</string>
    <string name="weather_type_null">'à°¡à±à°à°¾ à°²à±à°¦à±'</string>
    <string name="weather_type_0">à°¨à°¿à°°à±à°®à°²à°à°à°¾ à°à°à°¦à°¿</string>
    <string name="weather_type_1">à°®à±à°à°¾à°µà±à°¤à°à°à°¾ à°à°à°à±à°à°¦à°¿</string>
    <string name="weather_type_2">à°®à°¸à°</string>
    <string name="weather_type_3">à°ªà±à°à°®à°à°à±</string>
    <string name="weather_type_4">à°¤à±à°µà±à°°à°®à±à±à°¨ à°à°¾à°²à°¿à°µà°¾à°¨</string>
    <string name="weather_type_5">à°à°¾à°²à°¿à°µà°¾à°¨</string>
    <string name="weather_type_6">à°à°¤à±à°¯à°à°¤ à°­à°¾à°°à± à°µà°°à±à°·à°ªà°¾à°¤à°</string>
    <string name="weather_type_7">à°à°°à±à°®à±à°²à°¤à± à°à±à°¡à°¿à°¨ à°à°¾à°²à°¿à°µà°¾à°¨</string>
    <string name="weather_type_8">à°µà°¾à°¨à°à°²à±à°²à±</string>
    <string name="weather_type_9">à°­à°¾à°°à± à°µà°°à±à°·à°ªà°¾à°¤à°</string>
    <string name="weather_type_10">à°µà°°à±à°·à°</string>
    <string name="weather_type_11">à°à°¿à°¨à±à°à±à°²à±</string>
    <string name="weather_type_12">à°®à°à°à± à°µà°¾à°¨</string>
    <string name="weather_type_13">à°®à°à°à± à°¤à±à°«à°¾à°¨à±</string>
    <string name="weather_type_14">à°¹à°¿à°®à°ªà°¾à°¤à° à°ªà±à°à°®à°à°à±</string>
    <string name="weather_type_15">à°­à°¾à°°à± à°¹à°¿à°®à°ªà°¾à°¤à°</string>
    <string name="weather_type_16">à°¹à°¿à°®à°ªà°¾à°¤à°</string>
    <string name="weather_type_17">à°¤à±à°²à°¿à°à°ªà°¾à°à°¿ à°¹à°¿à°®à°ªà°¾à°¤à°</string>
    <string name="weather_type_18">à°­à°¾à°°à± à°à°¸à±à° à°¤à±à°«à°¾à°¨à±</string>
    <string name="weather_type_19">à°à°¸à±à° à°¤à±à°«à°¾à°¨à±</string>
    <string name="weather_type_20">à°¤à±à°²à°¿à°à°ªà°¾à°à°¿ à°à°¸à±à° à°¤à±à°«à°¾à°¨à±</string>
    <string name="weather_type_21">à°à°¸à±à° à°¤à±à°«à°¾à°¨à±</string>
    <string name="weather_type_22">à°µà°¡à°à°³à±à°²à±</string>
    <string name="weather_type_23">à°¤à±à°²à°¿à°¯à°¾à°¡à± à°¦à±à°®à±à°®à±à°§à±à°³à°¿</string>
    <string name="weather_type_24">à°ªà±à°à°®à°à°à±</string>
    <string name="weather_type_25">à°®à°à°à±à°à°¡à±à°¡à°² à°µà°°à±à°·à°</string>
</resources>
PK
     8N{E d  d     strings/strings.xml<?xml version="1.0" encoding="utf-8"?>
<resources> 
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, MMM dd</string>
    <string name="desc_date_format_12">EEEE, MMM dd</string>
    <string name="desc_time">'current time' + #hour12+' '+ifelse(#minute,#minute,'oclock')+', double tap to enter clock app'</string>
	<string name="weather_type_null">'No data'</string>
	<string name="weather_type_0">Clear</string>
    <string name="weather_type_1">Cloudy</string>
    <string name="weather_type_2">Hazy</string>
    <string name="weather_type_3">Foggy</string>
    <string name="weather_type_4">Severe rainstorm</string>
    <string name="weather_type_5">Rainstorm</string>
    <string name="weather_type_6">Very heavy rainfall</string>
    <string name="weather_type_7">Thunderstorm</string>
    <string name="weather_type_8">Shower</string>
    <string name="weather_type_9">Heavy rainfall</string>
    <string name="weather_type_10">Rain</string>
    <string name="weather_type_11">Drizzle</string>
    <string name="weather_type_12">Sleet</string>
    <string name="weather_type_13">Snowstorm</string>
    <string name="weather_type_14">Patches of snowfall</string>
    <string name="weather_type_15">Heavy snowfall</string>
    <string name="weather_type_16">Snowfall</string>
    <string name="weather_type_17">Light snowfall</string>
    <string name="weather_type_18">Strong sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Light sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hail</string>
    <string name="weather_type_23">Floating Dust</string>
    <string name="weather_type_24">Haze</string>
    <string name="weather_type_25">Freezing rain</string>
</resources>
PK
     8N]4Èlx  x     strings/strings_sv_SE.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'nuvarande tid\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dubbeltryck fÃ¶r att starta klockappen'</string>
    <string name="weather_type_null">'Ingen data'</string>
    <string name="weather_type_0">Klar</string>
    <string name="weather_type_1">Molnigt</string>
    <string name="weather_type_2">Disigt</string>
    <string name="weather_type_3">Dimmigt</string>
    <string name="weather_type_4">Kraftig regnstorm</string>
    <string name="weather_type_5">Regnstorm</string>
    <string name="weather_type_6">VÃ¤ldigt kraftigt regn</string>
    <string name="weather_type_7">ÃskvÃ¤der</string>
    <string name="weather_type_8">Skur</string>
    <string name="weather_type_9">Kraftigt regn</string>
    <string name="weather_type_10">Regn</string>
    <string name="weather_type_11">Duggregn</string>
    <string name="weather_type_12">Slask</string>
    <string name="weather_type_13">SnÃ¶storm</string>
    <string name="weather_type_14">Bitvis snÃ¶fall</string>
    <string name="weather_type_15">Kraftigt snÃ¶fall</string>
    <string name="weather_type_16">SnÃ¶fall</string>
    <string name="weather_type_17">LÃ¤tt snÃ¶fall</string>
    <string name="weather_type_18">Kraftig sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Mild sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hagel</string>
    <string name="weather_type_23">Flygande damm</string>
    <string name="weather_type_24">Dis</string>
    <string name="weather_type_25">Nedkylt regn</string>
</resources>
PK
     8NvW½  ½     strings/strings_me_ME.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'trenutno vrijeme\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dodirnite dva puta za ulazak u aplikaciju sata'</string>
    <string name="weather_type_null">'Nema podataka'</string>
    <string name="weather_type_0">Vedro</string>
    <string name="weather_type_1">OblaÄno</string>
    <string name="weather_type_2">Izmaglica</string>
    <string name="weather_type_3">Maglovito</string>
    <string name="weather_type_4">Jako nevrijeme</string>
    <string name="weather_type_5">KiÅ¡no nevrijeme</string>
    <string name="weather_type_6">Veoma jak pljusak</string>
    <string name="weather_type_7">Oluja sa grmljavinom</string>
    <string name="weather_type_8">Pljusak</string>
    <string name="weather_type_9">Jak pljusak</string>
    <string name="weather_type_10">KiÅ¡a</string>
    <string name="weather_type_11">Lagana kiÅ¡a</string>
    <string name="weather_type_12">Poledica</string>
    <string name="weather_type_13">SnjeÅ¾na oluja</string>
    <string name="weather_type_14">Nanosi snijega</string>
    <string name="weather_type_15">Jak snijeg</string>
    <string name="weather_type_16">Snijeg</string>
    <string name="weather_type_17">Lagan snijeg</string>
    <string name="weather_type_18">Jaka pjeÅ¡Äana oluja</string>
    <string name="weather_type_19">PjeÅ¡Äana oluja</string>
    <string name="weather_type_20">Lagana pjeÅ¡Äana oluja</string>
    <string name="weather_type_21">PjeÅ¡Äana oluja</string>
    <string name="weather_type_22">Grad</string>
    <string name="weather_type_23">PraÅ¡ina u vazduhu</string>
    <string name="weather_type_24">Izmaglica</string>
    <string name="weather_type_25">Ledena kiÅ¡a</string>
</resources>
PK
     8Nù£çWs
  s
     strings/strings_ug_CN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">M -Ø¦Ø§ÙÙÙÚ­ d -ÙÛÙÙ E</string>
    <string name="date_time_12">M-Ø¦Ø§ÙÙÙÚ­ d-ÙÛÙÙ Eaa</string>
    <string name="desc_date_format">M Ù Ø¦Ø§ÙÙÙÚ­ d Ù ÙÛÙÙ EEEE</string>
    <string name="desc_date_format_12">M-Ø¦Ø§ÙÙÙÚ­ d-ÙÛÙÙ Eaa</string>
    <string name="desc_time">#hour+\'Ø¯ÙÙ\'+ifelse(#minute,#minute+\'ÙÙÙÛØª\',\'Ø¦ÛØªØªÙ\')+\', \'+int(#month+1)+\'-Ø¦Ø§ÙÙÙÚ­\'+#date+\'-ÙÛÙÙ\'+\', \'+\'Ú¾ÛÙ¾ØªÙÚ¯Û\'+int(#day_of_week-1)+\', \'+#weather_temperature+\'Ø³ÛÙØ³ÙÙÛ Ú¯Ø±Ø§Ø¯ÛØ³\'+\', \'+@weather_description</string>
    <string name="desc_weather">\@weather_description+\', \'+#weather_temperature+\' Ú¯Ø±Ø§Ø¯ÛØ³\'</string>
    <string name="desc_weather_null">'Ø³Ø§ÙÙÙÙ ÙÛÙÛÙØ§Øª ÙÙÙ'</string>
    <string name="weather_type_null">'Ø³Ø§ÙÙÙÙ ÙÛÙÛÙØ§Øª ÙÙÙ'</string>
    <string name="weather_type_0">Ø¦ÙÚÛÙ</string>
    <string name="weather_type_1">Ø¨ÛÙÛØªÙÛÙ</string>
    <string name="weather_type_2">ØªÛØªÛÙ</string>
    <string name="weather_type_3">ØªÛÙØ§ÙÙÙÙ</string>
    <string name="weather_type_4">Ø¦Ø§ÙØ§Ú¾ÙØ¯Û ÚÙÚ­ ÙØ§Ø±Ø§ ÙØ§ÙØºÛØ±</string>
    <string name="weather_type_5">ÚÙÚ­ ÙØ§Ø±Ø§ ÙØ§ÙØºÛØ±</string>
    <string name="weather_type_6">ÙØ§ØªØªÙÙ ÙØ§ÙØºÛØ±</string>
    <string name="weather_type_7">Ú¯ÛÙØ¯ÛØ±ÙØ§ÙÙÙÙ Ø¦ÛØªÙÛÙÚÙ ÙØ§ÙØºÛØ±</string>
    <string name="weather_type_8">ÙÛØ²Ú¯ÙÙÙÙÙ ÙØ§ÙØºÛØ±</string>
    <string name="weather_type_9">ÚÙÚ­ ÙØ§ÙØºÛØ±</string>
    <string name="weather_type_10">Ø¦ÙØªØªÛØ± Ú¾Ø§Ù ÙØ§ÙØºÛØ±</string>
    <string name="weather_type_11">Ø¦Ø§Ø²Ø±Ø§Ù ÙØ§ÙØºÛØ±</string>
    <string name="weather_type_12">ÙØ§ÙØºÛØ± Ø¦Ø§Ø±ÙÙØ§Ø´ ÙØ§Ø±</string>
    <string name="weather_type_13">Ø¯ÛÚ¾Ø´ÛØª ÙØ§Ø±</string>
    <string name="weather_type_14">Ø¦ÛØªÙÛÙÚÙ ÙØ§Ø±</string>
    <string name="weather_type_15">ÚÙÚ­ ÙØ§Ø±</string>
    <string name="weather_type_16">Ø¦ÙØªØªÛØ±Ø§ Ú¾Ø§Ù ÙØ§Ø±</string>
    <string name="weather_type_17">Ø¦Ø§Ø²Ø±Ø§Ù ÙØ§Ø±</string>
    <string name="weather_type_18">ÙÛÚÙÛÙ ÙÛÙ Ø¨ÙØ±Ø§Ù</string>
    <string name="weather_type_19">ÙÛÙ Ø¨ÙØ±Ø§Ù</string>
    <string name="weather_type_20">ÙÛÙ</string>
    <string name="weather_type_21">ÙÛÙ Ø¦ÛÚÛØ´</string>
    <string name="weather_type_22">ÙÛÙØ¯ÛØ±</string>
    <string name="weather_type_23">ÚØ§Ú­ ØªÙØ²Ø§Ù</string>
    <string name="weather_type_24">ØªÛØªÛÙ</string>
    <string name="weather_type_25">ØªÙÚ­ ÙØ§ÙØºÛØ±</string>
</resources>
PK
     8NßÍïwD	  D	     strings/strings_el_GR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ÏÏÎ­ÏÎ¿ÏÏÎ± ÏÏÎ±\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', Î´Î¹ÏÎ»Ï Î¬Î³Î³Î¹Î³Î¼Î± Î³Î¹Î± Î¬Î½Î¿Î¹Î³Î¼Î± ÎµÏÎ±ÏÎ¼Î¿Î³Î®Ï ÏÎ¿Î»Î¿Î³Î¹Î¿Ï'</string>
    <string name="weather_type_null">'ÎÎµÎ½ ÏÏÎ¬ÏÏÎ¿ÏÎ½ Î´ÎµÎ´Î¿Î¼Î­Î½Î±'</string>
    <string name="weather_type_0">ÎÎ¯Î¸ÏÎ¹Î¿Ï</string>
    <string name="weather_type_1">Î£ÏÎ½vÎµÏÎ¹Î±ÏÎ¼Î­Î½Î¿Ï</string>
    <string name="weather_type_2">ÎÎ¹Î¸Î±Î»Î¿Î¼Î¯ÏÎ»Î·</string>
    <string name="weather_type_3">ÎÎ¼Î¹ÏÎ»ÏÎ´Î·Ï</string>
    <string name="weather_type_4">ÎÎ½ÏÎ¿Î½Î· Î½ÎµÏÎ¿ÏÎ¿Î½ÏÎ®</string>
    <string name="weather_type_5">ÎÎ±ÏÎ±Î¹Î³Î¯Î´Î±</string>
    <string name="weather_type_6">Î Î¿Î»Ï Î­Î½ÏÎ¿Î½Î· Î²ÏÎ¿ÏÏÏÏÏÏÎ·</string>
    <string name="weather_type_7">ÎÎ±ÏÎ±Î¹Î³Î¯Î´Î± Î¼Îµ ÎºÎµÏÎ±ÏÎ½Î¿ÏÏ</string>
    <string name="weather_type_8">ÎÏÏÏÎ±</string>
    <string name="weather_type_9">ÎÎ½ÏÎ¿Î½Î· Î²ÏÎ¿ÏÏÏÏÏÏÎ·</string>
    <string name="weather_type_10">ÎÏÎ¿ÏÎ®</string>
    <string name="weather_type_11">Î¨Î¹Î»ÏÎ²ÏÎ¿ÏÎ¿</string>
    <string name="weather_type_12">Î§Î¹Î¿Î½ÏÎ½ÎµÏÎ¿</string>
    <string name="weather_type_13">Î§Î¹Î¿Î½Î¿Î¸ÏÎµÎ»Î»Î±</string>
    <string name="weather_type_14">ÎÎ¹ÏÎ¬Î´ÎµÏ ÏÎ¹Î¿Î½Î¹Î¿Ï</string>
    <string name="weather_type_15">ÎÎ½ÏÎ¿Î½Î· ÏÎ¹Î¿Î½ÏÏÏÏÏÎ·</string>
    <string name="weather_type_16">Î§Î¹Î¿Î½ÏÏÏÏÏÎ·</string>
    <string name="weather_type_17">ÎÏÎ¸ÎµÎ½Î®Ï ÏÎ¹Î¿Î½ÏÏÏÏÏÎ·</string>
    <string name="weather_type_18">ÎÎ½ÏÎ¿Î½Î· Î±Î¼Î¼Î¿Î¸ÏÎµÎ»Î»Î±</string>
    <string name="weather_type_19">ÎÎ¼Î¼Î¿Î¸ÏÎµÎ»Î»Î±</string>
    <string name="weather_type_20">ÎÏÎ¸ÎµÎ½Î®Ï Î±Î¼Î¼Î¿Î¸ÏÎµÎ»Î»Î±</string>
    <string name="weather_type_21">ÎÎ¼Î¼Î¿Î¸ÏÎµÎ»Î»Î±</string>
    <string name="weather_type_22">Î§Î±Î»Î¬Î¶Î¹</string>
    <string name="weather_type_23">ÎÎ¹ÏÏÎ¿ÏÎ¼ÎµÎ½Î· ÏÎºÏÎ½Î·</string>
    <string name="weather_type_24">ÎÎ±ÏÎ±ÏÎ½Î¹Î¬</string>
    <string name="weather_type_25">Î Î±Î³ÏÎ¼Î­Î½Î· Î²ÏÎ¿ÏÎ®</string>
</resources>
PK
     8Nÿ±>x  x     strings/strings_hr_HR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd. MMMM</string>
    <string name="date_time_12">EEE, dd. MMMM</string>
    <string name="desc_date_format">EEEE, dd. MMM</string>
    <string name="desc_date_format_12">EEEE, dd. MMM</string>
    <string name="desc_time">'trenutno vrijeme\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', dodirnite dva puta za prikaz sata'</string>
    <string name="weather_type_null">'Nema podataka'</string>
    <string name="weather_type_0">Vedro</string>
    <string name="weather_type_1">OblaÄno</string>
    <string name="weather_type_2">Maglovito</string>
    <string name="weather_type_3">Maglovito</string>
    <string name="weather_type_4">Jaka kiÅ¡a</string>
    <string name="weather_type_5">KiÅ¡na oluja</string>
    <string name="weather_type_6">Pljusak</string>
    <string name="weather_type_7">Oluja</string>
    <string name="weather_type_8">Pljusak</string>
    <string name="weather_type_9">TeÅ¡ka kiÅ¡a</string>
    <string name="weather_type_10">KiÅ¡a</string>
    <string name="weather_type_11">Slaba kiÅ¡a</string>
    <string name="weather_type_12">KiÅ¡a s snijegom</string>
    <string name="weather_type_13">MeÄava</string>
    <string name="weather_type_14">Nanosi snijega</string>
    <string name="weather_type_15">Snijeg</string>
    <string name="weather_type_16">Snijeg</string>
    <string name="weather_type_17">Snijeg</string>
    <string name="weather_type_18">PjeÅ¡Äana oluja</string>
    <string name="weather_type_19">PjeÅ¡Äana oluja</string>
    <string name="weather_type_20">PjeÅ¡Äana oluja</string>
    <string name="weather_type_21">PjeÅ¡Äana oluja</string>
    <string name="weather_type_22">TuÄa</string>
    <string name="weather_type_23">PraÅ¡ina</string>
    <string name="weather_type_24">Ledena kiÅ¡a</string>
    <string name="weather_type_25">Ledena kiÅ¡a</string>
</resources>
PK
     8N2k_  _     strings/strings_nb_NO.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE d. MMMM</string>
    <string name="date_time_12">EEE d. MMMM</string>
    <string name="desc_date_format">EEEE d. MMM</string>
    <string name="desc_date_format_12">EEEE d. MMM</string>
    <string name="desc_time">'nÃ¥vÃ¦rende tid\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', trykk dobbelt for Ã¥ gÃ¥ til klokke-appen'</string>
    <string name="weather_type_null">'Ingen data'</string>
    <string name="weather_type_0">Klart</string>
    <string name="weather_type_1">Skyet</string>
    <string name="weather_type_2">Disig</string>
    <string name="weather_type_3">TÃ¥ke</string>
    <string name="weather_type_4">Regnstorm</string>
    <string name="weather_type_5">RegnvÃ¦r</string>
    <string name="weather_type_6">Tungt regnvÃ¦r</string>
    <string name="weather_type_7">Torden</string>
    <string name="weather_type_8">Regn</string>
    <string name="weather_type_9">Kraftig nedbÃ¸r</string>
    <string name="weather_type_10">Regn</string>
    <string name="weather_type_11">Yr</string>
    <string name="weather_type_12">Slaps</string>
    <string name="weather_type_13">SnÃ¸storm</string>
    <string name="weather_type_14">Noe snÃ¸fall</string>
    <string name="weather_type_15">Tungt snÃ¸fall</string>
    <string name="weather_type_16">SnÃ¸fall</string>
    <string name="weather_type_17">Lett snÃ¸fall</string>
    <string name="weather_type_18">Kraftig sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Lett sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hagl</string>
    <string name="weather_type_23">Flytende stÃ¸v</string>
    <string name="weather_type_24">Dis</string>
    <string name="weather_type_25">UnderkjÃ¸lt regn</string>
</resources>
PK
     8NøÚÞ  Þ     strings/strings_pt_PT.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd \'de\' MMMM</string>
    <string name="date_time_12">EEE, dd \'de\' MMMM</string>
    <string name="desc_date_format">EEEE, d \'de\' MMMM</string>
    <string name="desc_date_format_12">EEEE, d \'de\' MMMM</string>
    <string name="desc_time">'hora atual\' + #hour24+\' \'+ifelse(#minute,#minute,\'\')+\', toque duas vezes para abrir o relÃ³gio'</string>
    <string name="weather_type_null">'Sem dados'</string>
    <string name="weather_type_0">CÃ©u limpo</string>
    <string name="weather_type_1">Nublado</string>
    <string name="weather_type_2">Nebuloso</string>
    <string name="weather_type_3">Nebuloso</string>
    <string name="weather_type_4">Tempestade severa</string>
    <string name="weather_type_5">Tempestade chuvosa</string>
    <string name="weather_type_6">Chuva muito forte</string>
    <string name="weather_type_7">Trovoada</string>
    <string name="weather_type_8">Aguaceiros</string>
    <string name="weather_type_9">Chuvas fortes</string>
    <string name="weather_type_10">Chuva</string>
    <string name="weather_type_11">Chuviscos</string>
    <string name="weather_type_12">Chuva com neve</string>
    <string name="weather_type_13">NevÃ£o</string>
    <string name="weather_type_14">PerÃ­odos de queda de neve</string>
    <string name="weather_type_15">NevÃ£o</string>
    <string name="weather_type_16">Queda de neve</string>
    <string name="weather_type_17">Ligeira queda de neve</string>
    <string name="weather_type_18">Forte tempestade de areia</string>
    <string name="weather_type_19">Tempestade de areia</string>
    <string name="weather_type_20">Ligeira tempestade de areia</string>
    <string name="weather_type_21">Tempestade de areia</string>
    <string name="weather_type_22">Granizo</string>
    <string name="weather_type_23">Poeiras</string>
    <string name="weather_type_24">Neblina</string>
    <string name="weather_type_25">Chuva gelada</string>
</resources>
PK
     8N÷ñ÷       strings/strings_fi_FI.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEEE d. MMMM</string>
    <string name="date_time_12">EEEE d. MMMM</string>
    <string name="desc_date_format">EEEE d. MMMM</string>
    <string name="desc_date_format_12">EEEE d. MMMM</string>
    <string name="desc_time">'nykyinen aika\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', tupla-napauta kello-sovellukseen'</string>
    <string name="weather_type_null">'Ei dataa'</string>
    <string name="weather_type_0">SelkeÃ¤Ã¤</string>
    <string name="weather_type_1">Pilvinen</string>
    <string name="weather_type_2">Usvainen</string>
    <string name="weather_type_3">Sumuinen</string>
    <string name="weather_type_4">Kova rankkasade</string>
    <string name="weather_type_5">Rankkasade</string>
    <string name="weather_type_6">Kova sade</string>
    <string name="weather_type_7">Ukonilma</string>
    <string name="weather_type_8">Sataa</string>
    <string name="weather_type_9">Kova sade</string>
    <string name="weather_type_10">Sateinen</string>
    <string name="weather_type_11">Tihkusade</string>
    <string name="weather_type_12">RÃ¤ntÃ¤</string>
    <string name="weather_type_13">Lumimyrsky</string>
    <string name="weather_type_14">Lumisadekuuro</string>
    <string name="weather_type_15">Rankka lumisade</string>
    <string name="weather_type_16">Lumisade</string>
    <string name="weather_type_17">Kevyt lumisade</string>
    <string name="weather_type_18">Kova hiekkamyrsky</string>
    <string name="weather_type_19">Hiekkamyrsky</string>
    <string name="weather_type_20">Kevyt hiekkamyrsky</string>
    <string name="weather_type_21">Hiekkamyrsky</string>
    <string name="weather_type_22">Raekuuro</string>
    <string name="weather_type_23">Leijailevaa pÃ¶lyÃ¤</string>
    <string name="weather_type_24">Usva</string>
    <string name="weather_type_25">JÃ¤Ã¤tÃ¤vÃ¤ sade</string>
</resources>
PK
     8N¹vY±Þ  Þ     strings/strings_pt_BR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd \'de\' MMMM</string>
    <string name="date_time_12">EEE, dd \'de\' MMMM</string>
    <string name="desc_date_format">EEEE, d \'de\' MMMM</string>
    <string name="desc_date_format_12">EEEE, d \'de\' MMMM</string>
    <string name="desc_time">'hora atual\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', toque duas vezes para abrir o app relÃ³gio'</string>
    <string name="weather_type_null">'Nenhum dado'</string>
    <string name="weather_type_0">Limpo</string>
    <string name="weather_type_1">Nublado</string>
    <string name="weather_type_2">Nublado</string>
    <string name="weather_type_3">NÃ©voa</string>
    <string name="weather_type_4">Chuva forte</string>
    <string name="weather_type_5">Tempestade chuvosa</string>
    <string name="weather_type_6">Chuva muito intensa</string>
    <string name="weather_type_7">Tempestade</string>
    <string name="weather_type_8">Chuva</string>
    <string name="weather_type_9">Chuva intensa</string>
    <string name="weather_type_10">Chuva</string>
    <string name="weather_type_11">Garoa</string>
    <string name="weather_type_12">Granizo</string>
    <string name="weather_type_13">Tempestade de neve</string>
    <string name="weather_type_14">Queda de neve esparsa</string>
    <string name="weather_type_15">Queda de neve intensa</string>
    <string name="weather_type_16">Queda de neve</string>
    <string name="weather_type_17">Queda de neve fraca</string>
    <string name="weather_type_18">Forte tempestade de areia</string>
    <string name="weather_type_19">Tempestade de areia</string>
    <string name="weather_type_20">Leve tempestade de areia</string>
    <string name="weather_type_21">Tempestade de areia</string>
    <string name="weather_type_22">Granizo</string>
    <string name="weather_type_23">Poeira</string>
    <string name="weather_type_24">Nevoeiro</string>
    <string name="weather_type_25">Chuva congelada</string>
</resources>
PK
     8Nè:Go  o     strings/strings_en_GB.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'current time\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', double tap to enter clock app'</string>
    <string name="weather_type_null">'No data'</string>
    <string name="weather_type_0">Clear</string>
    <string name="weather_type_1">Cloudy</string>
    <string name="weather_type_2">Hazy</string>
    <string name="weather_type_3">Foggy</string>
    <string name="weather_type_4">Severe rainstorm</string>
    <string name="weather_type_5">Rainstorm</string>
    <string name="weather_type_6">Very heavy rainfall</string>
    <string name="weather_type_7">Thunderstorm</string>
    <string name="weather_type_8">Shower</string>
    <string name="weather_type_9">Heavy rainfall</string>
    <string name="weather_type_10">Rain</string>
    <string name="weather_type_11">Drizzle</string>
    <string name="weather_type_12">Sleet</string>
    <string name="weather_type_13">Snowstorm</string>
    <string name="weather_type_14">Patches of snowfall</string>
    <string name="weather_type_15">Heavy snowfall</string>
    <string name="weather_type_16">Snowfall</string>
    <string name="weather_type_17">Light snowfall</string>
    <string name="weather_type_18">Strong sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Light sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hail</string>
    <string name="weather_type_23">Floating Dust</string>
    <string name="weather_type_24">Haze</string>
    <string name="weather_type_25">Freezing rain</string>
</resources>
PK
     8Nñ¸É  É     strings/strings_es_US.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd \'de\' MMMM</string>
    <string name="date_time_12">EEE, dd \'de\' MMMM</string>
    <string name="desc_date_format">EEEE, MMM dd</string>
    <string name="desc_date_format_12">EEEE, MMM dd</string>
    <string name="desc_time">'hora actual\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', toque dos veces para abrir la aplicaciÃ³n del reloj'</string>
    <string name="weather_type_null">'Sin datos'</string>
    <string name="weather_type_0">Despejado</string>
    <string name="weather_type_1">Nublado</string>
    <string name="weather_type_2">Bruma</string>
    <string name="weather_type_3">Niebla</string>
    <string name="weather_type_4">Tormenta severa</string>
    <string name="weather_type_5">Tormenta</string>
    <string name="weather_type_6">Lluvia muy intensa</string>
    <string name="weather_type_7">Tormenta elÃ©ctrica</string>
    <string name="weather_type_8">Chubascos</string>
    <string name="weather_type_9">Lluvia intensa</string>
    <string name="weather_type_10">Lluvia</string>
    <string name="weather_type_11">Llovizna</string>
    <string name="weather_type_12">Aguanieve</string>
    <string name="weather_type_13">Tormenta de nieve</string>
    <string name="weather_type_14">Nevada intermitente</string>
    <string name="weather_type_15">Nevada intensa</string>
    <string name="weather_type_16">Nevada</string>
    <string name="weather_type_17">Nevada ligera</string>
    <string name="weather_type_18">Tormenta de arena intensa</string>
    <string name="weather_type_19">Tormenta de arena</string>
    <string name="weather_type_20">Tormenta de arena ligera</string>
    <string name="weather_type_21">Tormenta de arena</string>
    <string name="weather_type_22">Granizo</string>
    <string name="weather_type_23">Polvo</string>
    <string name="weather_type_24">Neblina</string>
    <string name="weather_type_25">Lluvia gÃ©lida</string>
</resources>
PK
     8NÀJíG1
  1
     strings/strings_ka_GE.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, MMMM dd</string>
    <string name="date_time_12">EEE, MMMM dd</string>
    <string name="desc_date_format">EEEE, MMM dd</string>
    <string name="desc_date_format_12">EEEE, MMM dd</string>
    <string name="desc_time">'áááááááá á áá á\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', áá á¯áá  á¨ááá®áá á¡ááááá¡ áááááááªááá¨á á¨áá¡áá¡áááááá'</string>
    <string name="weather_type_null">'áááááªááááá áá  áá áá¡'</string>
    <string name="weather_type_0">ááá¬ááááááá</string>
    <string name="weather_type_1">ááá¦á á£ááá£áá</string>
    <string name="weather_type_2">ááá¡ááááá</string>
    <string name="weather_type_3">ááá¡ááááá</string>
    <string name="weather_type_4">á¬ááááááá á¨á¢áá áá</string>
    <string name="weather_type_5">áááá¡á®áá á¬áááá á¨á¢áá ááá</string>
    <string name="weather_type_6">ááááá¡ááá á£áá á¬áááá</string>
    <string name="weather_type_7">á­áá¥á-á¥á£á®ááá</string>
    <string name="weather_type_8">á¨á®ááá£áá á¬áááá</string>
    <string name="weather_type_9">á«áááá á á¬áááá</string>
    <string name="weather_type_10">á¬áááá</string>
    <string name="weather_type_11">ááááááá</string>
    <string name="weather_type_12">ááááá­á§ááá</string>
    <string name="weather_type_13">á¥áá áá£á¥á</string>
    <string name="weather_type_14">áááá</string>
    <string name="weather_type_15">á«áááá á ááááá</string>
    <string name="weather_type_16">ááááá</string>
    <string name="weather_type_17">ááªáá á ááááá</string>
    <string name="weather_type_18">á«áááá á á¥áá ááá áááá</string>
    <string name="weather_type_19">á¥áá ááá áááá</string>
    <string name="weather_type_20">ááªáá á á¥áá ááá áááá</string>
    <string name="weather_type_21">á¥áá ááá áááá</string>
    <string name="weather_type_22">á¡áá¢á§áá</string>
    <string name="weather_type_23">ááá¤áá á¤áá¢á áá¢ááá á</string>
    <string name="weather_type_24">ááá¡áá</string>
    <string name="weather_type_25">á¬áááá á§ááááá</string>
</resources>
PK
     8Nt»D       strings/strings_ko_KR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">Mìdì¼ EEE</string>
    <string name="date_time_12">Mìdì¼ EEE</string>
    <string name="desc_date_format">Mìdì¼ EEEE</string>
    <string name="desc_date_format_12">Mìdì¼ EEEE</string>
    <string name="desc_time">'íì¬ ìê°\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', ìê³ ì±ì ì¤ííë ¤ë©´ ë ë² í­íì­ìì¤.'</string>
    <string name="weather_type_null">'ë°ì´í° ìì'</string>
    <string name="weather_type_0">ë§ì</string>
    <string name="weather_type_1">íë¦¼</string>
    <string name="weather_type_2">ì°ë¬´</string>
    <string name="weather_type_3">ìê°</string>
    <string name="weather_type_4">ì§ì¤ í¸ì°</string>
    <string name="weather_type_5">í­íì°</string>
    <string name="weather_type_6">ì§ì¤ í­ì°</string>
    <string name="weather_type_7">ëì°</string>
    <string name="weather_type_8">ìëê¸°</string>
    <string name="weather_type_9">ì§ì¤ í¸ì°</string>
    <string name="weather_type_10">ë¹</string>
    <string name="weather_type_11">ì´ì¬ë¹</string>
    <string name="weather_type_12">ì§ëê¹¨ë¹</string>
    <string name="weather_type_13">ëë³´ë¼</string>
    <string name="weather_type_14">ê³³ì ë°ë¼ ê°ì¤</string>
    <string name="weather_type_15">í­ì¤</string>
    <string name="weather_type_16">ê°ì¤</string>
    <string name="weather_type_17">ì½í ê°ì¤</string>
    <string name="weather_type_18">ê°í ëª¨ëí­í</string>
    <string name="weather_type_19">ëª¨ëí­í</string>
    <string name="weather_type_20">ì½í ëª¨ëí­í</string>
    <string name="weather_type_21">ëª¨ëí­í</string>
    <string name="weather_type_22">ì°ë°</string>
    <string name="weather_type_23">ë¯¸ì¸ë¨¼ì§</string>
    <string name="weather_type_24">ì¤ìê°</string>
    <string name="weather_type_25">ì¼ìë¹</string>
</resources>
PK
     8NùeØÂÌ  Ì     strings/strings_vi_VN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'thá»i gian hiá»n táº¡i\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', nháº¥p ÄÃºp Äá» vÃ o á»©ng dá»¥ng Äá»ng há»'</string>
    <string name="weather_type_null">'KhÃ´ng cÃ³ dá»¯ liá»u'</string>
    <string name="weather_type_0">Quang</string>
    <string name="weather_type_1">Nhiá»u mÃ¢y</string>
    <string name="weather_type_2">Ãm u</string>
    <string name="weather_type_3">SÆ°Æ¡ng mÃ¹</string>
    <string name="weather_type_4">MÆ°a bÃ£o dá»¯ dá»i</string>
    <string name="weather_type_5">MÆ°a bÃ£o</string>
    <string name="weather_type_6">MÆ°a ráº¥t lá»n</string>
    <string name="weather_type_7">DÃ´ng</string>
    <string name="weather_type_8">MÆ°a náº·ng háº¡t</string>
    <string name="weather_type_9">MÆ°a lá»n</string>
    <string name="weather_type_10">MÆ°a vá»«a</string>
    <string name="weather_type_11">MÆ°a phÃ¹n</string>
    <string name="weather_type_12">MÆ°a tuyáº¿t</string>
    <string name="weather_type_13">BÃ£o tuyáº¿t</string>
    <string name="weather_type_14">Tuyáº¿t rÆ¡i dá»¯ dá»i</string>
    <string name="weather_type_15">Tuyáº¿t rÆ¡i dÃ y</string>
    <string name="weather_type_16">Tuyáº¿t rÆ¡i</string>
    <string name="weather_type_17">Tuyáº¿t rÆ¡i nháº¹</string>
    <string name="weather_type_18">BÃ£o cÃ¡t máº¡nh</string>
    <string name="weather_type_19">BÃ£o cÃ¡t</string>
    <string name="weather_type_20">BÃ£o cÃ¡t nháº¹</string>
    <string name="weather_type_21">BÃ£o cÃ¡t</string>
    <string name="weather_type_22">MÆ°a ÄÃ¡</string>
    <string name="weather_type_23">Bá»¥i</string>
    <string name="weather_type_24">SÆ°Æ¡ng mÃ¹</string>
    <string name="weather_type_25">BÄng tuyáº¿t</string>
</resources>
PK
     8NJC½o  o     strings/strings_my_MM.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, MMMM dd</string>
    <string name="date_time_12">EEE, MMMM dd</string>
    <string name="desc_date_format">EEEE, MMM dd</string>
    <string name="desc_date_format_12">EEEE, MMM dd</string>
    <string name="desc_time">'áááºáá¾á­á¡áá»á­ááº\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', áá¬áá®á¡ááºááºáá­á¯á· áááºáááº áá¾ááºáá»ááºáá­áá¾á­ááºáá«'</string>
    <string name="weather_type_null">'áá±áá¬ ááá¾á­áá«'</string>
    <string name="weather_type_0">áá±áá¬áá±á¬</string>
    <string name="weather_type_1">áá­ááºáá°áá±á¬</string>
    <string name="weather_type_2">áá¼á°áá­á¯ááºá¸áá±á¬</string>
    <string name="weather_type_3">áá¼á°áá­á¯ááºá¸áá±á¬</string>
    <string name="weather_type_4">áá¼ááºá¸áááºáá±á¬ áá­á¯á¸áá±áá¯ááºáá­á¯ááºá¸</string>
    <string name="weather_type_5">áá­á¯á¸áá±áá¯ááºáá­á¯ááºá¸</string>
    <string name="weather_type_6">áá­á¯á¸áá±áá»á­ááºá¡áá½ááºáá¼ááºá·áááº</string>
    <string name="weather_type_7">áá­á¯á¸áááºáá¯ááºáá­á¯ááºá¸</string>
    <string name="weather_type_8">áá¼ááºáá±á¬ááºá¸áá­á¯á¸</string>
    <string name="weather_type_9">á¡á¬á¸áá¼ááºá¸áá±á¬ áá­á¯á¸áá±áá¯ááºáá­á¯ááºá¸</string>
    <string name="weather_type_10">áá­á¯á¸</string>
    <string name="weather_type_11">áá­á¯á¸áá½á²</string>
    <string name="weather_type_12">áá­á¯á¸áá¾ááºá¸</string>
    <string name="weather_type_13">áá¾ááºá¸áá¯ááºáá­á¯ááºá¸</string>
    <string name="weather_type_14">áá½ááºáá»á¬á¸ áá®á¸áá¾ááºá¸áá»áá¼ááºá¸</string>
    <string name="weather_type_15">áá®á¸áá¾ááºá¸á¡áá½ááºáá»áá¼ááºá¸</string>
    <string name="weather_type_16">áá®á¸áá¾ááºá¸áá»áá¼ááºá¸</string>
    <string name="weather_type_17">áá®á¸áá¾ááºá¸áá«á¸áá«á¸áá»áá¼ááºá¸</string>
    <string name="weather_type_18">á¡á¬á¸áá¼ááºá¸áá±á¬ áá²áá¯ááºáá­á¯ááºá¸</string>
    <string name="weather_type_19">áá²áá¯ááºáá­á¯ááºá¸</string>
    <string name="weather_type_20">á¡á¬á¸áááºá¸áá±á¬ áá²áá¯ááºáá­á¯ááºá¸</string>
    <string name="weather_type_21">áá²áá¯ááºáá­á¯ááºá¸</string>
    <string name="weather_type_22">áá­á¯á¸áá®á¸áá¼á½á±áá¼ááºá¸</string>
    <string name="weather_type_23">áá¯ááºáá¾á¯ááºá·</string>
    <string name="weather_type_24">áá¼á°</string>
    <string name="weather_type_25">áá±áá²áá­á¯á¸</string>
</resources>
PK
     8NêZlÔ  Ô     strings/strings_fr_FR.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'heure actuelle\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', appuyez deux fois pour ouvrir l\'horloge'</string>
    <string name="weather_type_null">'Aucune donnÃ©e'</string>
    <string name="weather_type_0">DÃ©gagÃ©</string>
    <string name="weather_type_1">Nuageux</string>
    <string name="weather_type_2">Brumeux</string>
    <string name="weather_type_3">TrÃ¨s brumeux</string>
    <string name="weather_type_4">Fortes pluies</string>
    <string name="weather_type_5">Pluie torrentielle</string>
    <string name="weather_type_6">Orages</string>
    <string name="weather_type_7">Orage</string>
    <string name="weather_type_8">Averses</string>
    <string name="weather_type_9">Fortes pluies</string>
    <string name="weather_type_10">Pluie</string>
    <string name="weather_type_11">Bruine</string>
    <string name="weather_type_12">GiboulÃ©e</string>
    <string name="weather_type_13">TempÃªte de neige</string>
    <string name="weather_type_14">Chutes de neige</string>
    <string name="weather_type_15">Fortes chutes de neige</string>
    <string name="weather_type_16">Chutes de neige</string>
    <string name="weather_type_17">Faibles chutes de neige</string>
    <string name="weather_type_18">Forte tempÃªte de sable</string>
    <string name="weather_type_19">TempÃªte de sable</string>
    <string name="weather_type_20">Petite tempÃªte de sable</string>
    <string name="weather_type_21">TempÃªte de sable</string>
    <string name="weather_type_22">GrÃªle</string>
    <string name="weather_type_23">PoussiÃ¨re dans l\'air</string>
    <string name="weather_type_24">Brouillard</string>
    <string name="weather_type_25">Pluie verglaÃ§ante</string>
</resources>
PK
     8N.co\  \     strings/strings_uk_UA.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEEE, d MMMM</string>
    <string name="date_time_12">EEEE, d MMMM</string>
    <string name="desc_date_format">EEEE, d MMMM</string>
    <string name="desc_date_format_12">EEEE, d MMMM</string>
    <string name="desc_time">'Ð¿Ð¾ÑÐ¾ÑÐ½Ð¸Ð¹ ÑÐ°Ñ\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', Ð½Ð°ÑÐ¸ÑÐ½ÑÑÑ Ð´Ð²ÑÑÑ Ð´Ð»Ñ Ð²ÑÐ¾Ð´Ñ Ñ Ð¿ÑÐ¾Ð³ÑÐ°Ð¼Ñ "ÐÐ¾Ð´Ð¸Ð½Ð½Ð¸Ðº"'</string>
    <string name="weather_type_null">'ÐÐµÐ¼Ð°Ñ Ð´Ð°Ð½Ð¸Ñ'</string>
    <string name="weather_type_0">Ð¯ÑÐ½Ð¾</string>
    <string name="weather_type_1">Ð¥Ð¼Ð°ÑÐ½Ð¾</string>
    <string name="weather_type_2">Ð¡ÐµÑÐ¿Ð°Ð½Ð¾Ðº</string>
    <string name="weather_type_3">Ð¢ÑÐ¼Ð°Ð½</string>
    <string name="weather_type_4">Ð¡Ð¸Ð»ÑÐ½Ð¸Ð¹ Ð´Ð¾Ñ</string>
    <string name="weather_type_5">ÐÐ»Ð¸Ð²Ð°</string>
    <string name="weather_type_6">ÐÑÑÐµÐ²ÑÐ¹</string>
    <string name="weather_type_7">ÐÑÐ¾Ð·Ð°</string>
    <string name="weather_type_8">ÐÐ»Ð¸Ð²Ð°</string>
    <string name="weather_type_9">Ð¡Ð¸Ð»ÑÐ½Ð¸Ð¹ Ð´Ð¾Ñ</string>
    <string name="weather_type_10">ÐÐ¾Ñ</string>
    <string name="weather_type_11">ÐÑÑÐºÐ°</string>
    <string name="weather_type_12">ÐÐ¾ÐºÑÐ¸Ð¹ ÑÐ½ÑÐ³</string>
    <string name="weather_type_13">ÐÐ°Ð¼ÐµÑÑÐ»Ñ</string>
    <string name="weather_type_14">ÐÐ»Ð¸Ð²Ð¸ Ð·Ñ ÑÐ½ÑÐ³Ð¾Ð¼</string>
    <string name="weather_type_15">Ð¡Ð¸Ð»ÑÐ½Ð¸Ð¹ ÑÐ½ÑÐ³Ð¾Ð¿Ð°Ð´</string>
    <string name="weather_type_16">Ð¡Ð½ÑÐ³Ð¾Ð¿Ð°Ð´</string>
    <string name="weather_type_17">ÐÐµÐ²ÐµÐ»Ð¸ÐºÐ¸Ð¹ ÑÐ½ÑÐ³</string>
    <string name="weather_type_18">Ð¡Ð¸Ð»ÑÐ½Ð° Ð¿ÑÑÐ°Ð½Ð° Ð±ÑÑÑ</string>
    <string name="weather_type_19">ÐÑÑÐ°Ð½Ð° Ð±ÑÑÑ</string>
    <string name="weather_type_20">ÐÐµÐ²ÐµÐ»Ð¸ÐºÐ¸Ð¹ Ð¿Ð¸Ð»</string>
    <string name="weather_type_21">ÐÐ¸Ð»</string>
    <string name="weather_type_22">ÐÑÐ°Ð´</string>
    <string name="weather_type_23">ÐÑÑÐ´</string>
    <string name="weather_type_24">ÐÐ¼Ð»Ð°</string>
    <string name="weather_type_25">ÐÑÐ¸Ð¶Ð°Ð½Ð¸Ð¹ Ð´Ð¾Ñ</string>
</resources>
PK
     8NûÑÐna
  a
     strings/strings_ta_IN.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM </string>
    <string name="desc_date_format_12">EEEE, dd MMM </string>
    <string name="desc_time">'current time\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', à®à®à®¿à®à®¾à®° à®ªà®¯à®©à¯à®ªà®¾à®à¯à®à®¿à®²à¯ à®¨à¯à®´à¯à®¯ à®à®°à¯à®®à¯à®±à¯ à®¤à®à¯à®à®µà¯à®®à¯'</string>
    <string name="weather_type_null">'à®¤à®°à®µà¯ à®à®²à¯à®²à¯'</string>
    <string name="weather_type_0">à®¤à¯à®³à®¿à®µà®¾à®© à®µà®¾à®©à®¿à®²à¯</string>
    <string name="weather_type_1">à®®à¯à® à®®à¯à®à¯à®à®®à¯</string>
    <string name="weather_type_2">à®¤à¯à®³à®¿à®µà®±à¯à®± à®µà®¾à®©à®¿à®²à¯</string>
    <string name="weather_type_3">à®®à¯à®à¯à®ªà®©à®¿</string>
    <string name="weather_type_4">à®à®à¯à®®à¯à®¯à®¾à®© à®ªà¯à®¯à®²à¯à®®à®´à¯</string>
    <string name="weather_type_5">à®ªà¯à®¯à®²à¯à®®à®´à¯</string>
    <string name="weather_type_6">à®®à®¿à®à®µà¯à®®à¯ à®ªà®²à®¤à¯à®¤ à®®à®´à¯</string>
    <string name="weather_type_7">à®à®à®¿à®¯à¯à®à®©à¯ à®à¯à®à®¿à®¯ à®®à®´à¯</string>
    <string name="weather_type_8">à®®à®´à¯à®¤à¯ à®¤à¯à®±à®²à¯</string>
    <string name="weather_type_9">à®à®© à®®à®´à¯</string>
    <string name="weather_type_10">à®®à®´à¯</string>
    <string name="weather_type_11">à®¤à¯à®±à®²à¯</string>
    <string name="weather_type_12">à®ªà®©à®¿ à®®à®´à¯</string>
    <string name="weather_type_13">à®ªà®©à®¿à®ªà¯à®ªà¯à®¯à®²à¯</string>
    <string name="weather_type_14">à®à®µà¯à®µà®ªà¯à®ªà¯à®¤à¯ à®ªà®©à®¿à®ªà¯à®ªà¯à®´à®¿à®µà¯</string>
    <string name="weather_type_15">à®à®à¯à®®à¯ à®ªà®©à®¿à®ªà¯à®ªà¯à®¾à®´à®¿à®µà¯</string>
    <string name="weather_type_16">à®ªà®©à®¿à®ªà¯à®ªà¯à®¾à®´à®¿à®µà¯</string>
    <string name="weather_type_17">à®²à¯à®à®¾à®© à®ªà®©à®¿à®ªà¯à®ªà¯à®¾à®´à®¿à®µà¯</string>
    <string name="weather_type_18">à®µà®²à¯à®µà®¾à®© à®®à®£à®±à¯à®ªà¯à®¯à®²à¯</string>
    <string name="weather_type_19">à®®à®£à®±à¯à®ªà¯à®¯à®²à¯</string>
    <string name="weather_type_20">à®²à¯à®à®¾à®© à®®à®£à®±à¯à®ªà¯à®¯à®²à¯</string>
    <string name="weather_type_21">à®®à®£à®±à¯à®ªà¯à®¯à®²à¯</string>
    <string name="weather_type_22">à®à®²à®à¯à®à®à¯à®à®¿ à®®à®´à¯</string>
    <string name="weather_type_23">à®®à®¿à®¤à®à¯à®à¯à®®à¯ à®¤à¯à®à¯</string>
    <string name="weather_type_24">à®®à¯à®à®®à¯à®à¯à®à®®à¯</string>
    <string name="weather_type_25">à®à®±à¯à®ªà®©à®¿ à®®à®´à¯</string>
</resources>
PK
     8N.¢r¤  ¤     strings/strings_eu_ES.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'ordua\' + #hour12+\' \'+ifelse(#minute,#minute,\'puntuan\')+\', ukitu bi aldiz ordulari aplikazioan sartzeko'</string>
    <string name="weather_type_null">'Daturik ez'</string>
    <string name="weather_type_0">Garbitu</string>
    <string name="weather_type_1">Lainotsua</string>
    <string name="weather_type_2">Nahastua</string>
    <string name="weather_type_3">Behe-lainoa</string>
    <string name="weather_type_4">Ekaitz gogorra</string>
    <string name="weather_type_5">Ekaitza</string>
    <string name="weather_type_6">Zaparrada bortitza</string>
    <string name="weather_type_7">Ekaitza</string>
    <string name="weather_type_8">Euria</string>
    <string name="weather_type_9">Euri asko</string>
    <string name="weather_type_10">Euria</string>
    <string name="weather_type_11">Zirimiria</string>
    <string name="weather_type_12">Elur bustia</string>
    <string name="weather_type_13">Elurtea</string>
    <string name="weather_type_14">Elur-estalkiak</string>
    <string name="weather_type_15">Elurte gogorra</string>
    <string name="weather_type_16">Elurtea</string>
    <string name="weather_type_17">Elurte arina</string>
    <string name="weather_type_18">Hondar erauntsi gogorra</string>
    <string name="weather_type_19">Hondar erauntsia</string>
    <string name="weather_type_20">Hondar erauntsi arina</string>
    <string name="weather_type_21">Hondar erauntsia</string>
    <string name="weather_type_22">Kazkabarra</string>
    <string name="weather_type_23">Flotatzen duen hautsa</string>
    <string name="weather_type_24">Lanbroa</string>
    <string name="weather_type_25">Euri izoztea</string>
</resources>
PK
     8N7Ê(       strings/strings_ca_ES.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'hora actual\' + #hour12+\' \'+ifelse(#minute,#minute,\'\')+\', pulseu dues vegades per obrir el rellotge'</string>
    <string name="weather_type_null">'Sense dades'</string>
    <string name="weather_type_0">Clar</string>
    <string name="weather_type_1">Ennuvolat</string>
    <string name="weather_type_2">CalitjÃ³s</string>
    <string name="weather_type_3">Emboirat</string>
    <string name="weather_type_4">Temporal fort</string>
    <string name="weather_type_5">Aiguat</string>
    <string name="weather_type_6">Pluja molt forta</string>
    <string name="weather_type_7">Tempesta</string>
    <string name="weather_type_8">Ruixat</string>
    <string name="weather_type_9">Diluvi</string>
    <string name="weather_type_10">Pluja</string>
    <string name="weather_type_11">Plugim</string>
    <string name="weather_type_12">Aiguaneu</string>
    <string name="weather_type_13">Temporal de neu</string>
    <string name="weather_type_14">Flocs de neu</string>
    <string name="weather_type_15">Neu forta</string>
    <string name="weather_type_16">Neu</string>
    <string name="weather_type_17">Neu feble</string>
    <string name="weather_type_18">Fuerte tormenta de arena</string>
    <string name="weather_type_19">Tormenta de arena</string>
    <string name="weather_type_20">Ligera tormenta de arena</string>
    <string name="weather_type_21">Tormenta de arena</string>
    <string name="weather_type_22">Calamarsa</string>
    <string name="weather_type_23">Calima</string>
    <string name="weather_type_24">Boirina</string>
    <string name="weather_type_25">Pluja gelant</string>
</resources>
PK
     8Nè:Go  o     strings/strings_lo_LA.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEE, dd MMMM</string>
    <string name="date_time_12">EEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'current time\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', double tap to enter clock app'</string>
    <string name="weather_type_null">'No data'</string>
    <string name="weather_type_0">Clear</string>
    <string name="weather_type_1">Cloudy</string>
    <string name="weather_type_2">Hazy</string>
    <string name="weather_type_3">Foggy</string>
    <string name="weather_type_4">Severe rainstorm</string>
    <string name="weather_type_5">Rainstorm</string>
    <string name="weather_type_6">Very heavy rainfall</string>
    <string name="weather_type_7">Thunderstorm</string>
    <string name="weather_type_8">Shower</string>
    <string name="weather_type_9">Heavy rainfall</string>
    <string name="weather_type_10">Rain</string>
    <string name="weather_type_11">Drizzle</string>
    <string name="weather_type_12">Sleet</string>
    <string name="weather_type_13">Snowstorm</string>
    <string name="weather_type_14">Patches of snowfall</string>
    <string name="weather_type_15">Heavy snowfall</string>
    <string name="weather_type_16">Snowfall</string>
    <string name="weather_type_17">Light snowfall</string>
    <string name="weather_type_18">Strong sandstorm</string>
    <string name="weather_type_19">Sandstorm</string>
    <string name="weather_type_20">Light sandstorm</string>
    <string name="weather_type_21">Sandstorm</string>
    <string name="weather_type_22">Hail</string>
    <string name="weather_type_23">Floating Dust</string>
    <string name="weather_type_24">Haze</string>
    <string name="weather_type_25">Freezing rain</string>
</resources>
PK
     8Nógº÷  ÷     strings/strings_mt_MT.xml<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="date_time">EEEE, dd MMMM</string>
    <string name="date_time_12">EEEE, dd MMMM</string>
    <string name="desc_date_format">EEEE, dd MMM</string>
    <string name="desc_date_format_12">EEEE, dd MMM</string>
    <string name="desc_time">'Ä§in bÄ§alissa\' + #hour12+\' \'+ifelse(#minute,#minute,\'oclock\')+\', taptap biex tidÄ§ol fl-app tal-arloÄ¡Ä¡'</string>
    <string name="weather_type_null">'L-ebda dejta'</string>
    <string name="weather_type_0">Äar</string>
    <string name="weather_type_1">ImsaÄ§Ä§ab</string>
    <string name="weather_type_2">ImÄajpar</string>
    <string name="weather_type_3">ImÄajpar</string>
    <string name="weather_type_4">Tempesta tax-xita</string>
    <string name="weather_type_5">Maltempata tax-xita</string>
    <string name="weather_type_6">Xita qalila Ä§afna</string>
    <string name="weather_type_7">Maltempata bir-ragÄ§ad</string>
    <string name="weather_type_8">Xita rxiex</string>
    <string name="weather_type_9">Xita qalila</string>
    <string name="weather_type_10">Xita</string>
    <string name="weather_type_11">Irxiex</string>
    <string name="weather_type_12">Xita bis-silÄ¡</string>
    <string name="weather_type_13">Maltempata bis-silÄ¡</string>
    <string name="weather_type_14">Dbabar bis-silÄ¡</string>
    <string name="weather_type_15">Maltempata qalila tas-silÄ¡</string>
    <string name="weather_type_16">Borra</string>
    <string name="weather_type_17">Borra Ä§afifa</string>
    <string name="weather_type_18">Maltempata tar-ramel qalila</string>
    <string name="weather_type_19">Maltempata tar-ramel</string>
    <string name="weather_type_20">Maltempata Ä§afifa tar-ramel</string>
    <string name="weather_type_21">Maltempata tar-ramel</string>
    <string name="weather_type_22">SilÄ¡</string>
    <string name="weather_type_23">Trab li jvarju</string>
    <string name="weather_type_24">Arja maÄ§muÄ¡a</string>
    <string name="weather_type_25">Xita ffriÅ¼ata</string>
</resources>
PK
     8N               weather/PK
     8Nð9¿Ð       weather/weather_0.pngPNG

   IHDR         çà   tEXtSoftware Adobe ImageReadyqÉe<  &iTXtXML:com.adobe.xmp     <?xpacket begin="ï»¿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:9D37EFA9474E11E7A2E38C21EC31C084" xmpMM:InstanceID="xmp.iid:9D37EFA8474E11E7A2E38C21EC31C084" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>Ì¡º?  IDATxÚì	xTÕÇï}ïÍL&3L2Ù  (KXÒÒ©ZeiùldikZÑRi©ÐR­KÑ*Z¿RVP«"tQ´X	 dLfKÏ6Ô@2Lòîäü?.	É$¼9ÿß;w}÷
B¦u»>T_	áC!|(BøP
ð¡>
áC!|(ÂBøP(ð¡P
áC¡>ÂBøP(ð¡P
áC¡>ÂBE/	CÐ£¢á^,b¸áBÛ&­]QÃE	¹]Ñ>J+/é;ÒËPF(&V&±%þtÉàyÙ	#ì61Çl4Kh(J¨R"B±®]#­Ph­BUkµ¯_9ÓìRªNóX»ñLå¾÷]x¹?\ðU¯?¦¶â2ÓEØî70cáeJlâ$Dó")r MÍ¢~s²U$YB
É%)rPÖNº<ÊÛgëüe[v×½×PwF ÑÏs5¯sàð!15I²íZ7zB~NÂ´$TYmt´UÈGZÜrÙñ*ßéwÙïl]ðuÄ"Øë3_c7¦A÷âc§&Ï4ªÐ¾î$ôcÒìVn©{µ¸îB«²ëÍípÍïÁ÷ÝP¼ ¢îÛù:ÎZ8ÒºãÞ³r2MMFa±xðtoKéÊÊ**ÝNbÌÛQd>ïÿ ý%GÖo~0laÃ°²\&1Kmmcpó]|¸yÇóð¥ÖeB/jð¬×Û3¶Ü3bñ ñ{@Rã¡é ªÄy¾1ðÛkNlz­¼¹bÕðé>Îl6	©ïn7:+!ÓeÇcû2á9èÜ{õü;½~Õ	1ób£ï:¬j{fíÈÂY_H} Á(ç÷ËnªQCÌ;_°ðå7+àý/»úz¼Pèà%~jXâ óÿÓÒii¯Æ;xíÅÞëMSÓ^÷¾ÅÅáë=ð¶®Qt`Û¸Yã)%~wóÁ{÷þ¾º©@ÇÞ§åè³EFæ$~.£ûæõ¯mû1Äg+i1óõ,xf¨b6¾6a]Áó£Þ%Y0ÅÅÅÅ
áë9ð,·}ÀÐo»=5IZ¸u,#+3¬v£Ï¶~ù°ÑßùjÖÓá	Ô;#~½lè.hÌØ*Øðu¼§_½Ù¢@³­®	nÒaßõRJT
1¬5R<÷ÂãgNqìHE&v³Îþ§ÄaÄ²< 
quÛüq Þ³^P@ìf|Î±Õ,¦ùºÐ¹xbEÞ¹×¦±ç@¢ÐÍí.·2b{2 3_ÇàÏÈ´dFæf¨6 :=V¸nb±Å0àI#-Ð³Ýh4ÐD¦Ç;!,¶,ÆáÁz¯,¯=>ægfP¨ÄF,¶,Æ,Ößÿtì¹¢q 9öb1>þ§¢{r.gø·®qU~ù>D£w4|ù>óZÃ+|´AÒK§¥?sµ½Ø¾XCÌ×³Ø×DöKølydôíle"Ñ»ØyÐá3³È©ÆÛ¾ý{GE;üÂ|ì¶ôª #bÐgÕ¯aÆÔÒ~õÝmãfõ§¥ïzxðæó¤?ÀG¯ð´^b^0Oh7ÓOðY7üdø">ÓÌîf?^àJ§¥`t£åúx²yÉOWø,ë]/;	ÄÀðÍ0Yâ>Ê6íÉtp
M§o1"mûñ í¥­ÉPoûeG3IÛrq%7+a!Z¬oG"­zõáÅ®Âi4ýyÄ¼×/ð%N)LÖò!¶{+ó,.àc{ '[Åh+²[¥éÌ³®ö;ôm¾~$$<HÚvëç¾!æëÑR¾]Ç¼ã>óÙÅÏ£|	<ûïO|bEÞ0D£|íóäóò Ý'ò
iZ±}"ZÉ§¦·OèJöÓ+|Æô®ÙãTà]1!/öÕ-|	BÚÈ§À»B^á£ìôFlïqÝî~M±ÝÚÙB=Â'­Z2m{çÂñ+éÎ¹ó;óPðËNþñ­°üÁg·Ð>¾Å»æ>Ñl }|<dðÜÁÇGûøx8GøQ )hßíñ¥OøD|P{øÄÐÖÄÜÁG)¡Ihßm¤#uõ	åÿà~±Å%|V´{ø,<Âê'Ò#|¦V´oìÜGø4´{øT>á#ZÚÇ9|Dsñª(Äöñ-ð°yÉ|ªÖöqª5ój5hßÏ3/¹ÏëWN£}|<¬â>¹Ù¥AûøxÈà¹ïÔ9ß	´o=¼"|z|NB¾ëÙÊ¯¤ÈÝ¹>5!(I%D±|ht¢IvBØ®]¡» ÐB7¡ÁFBýgØúZÞô"1=Øtzøêã<Â§½QÑâÊÚì¬×.'¥9óD±M Ø®´KExJ
!æáD±4ÞDrî&RóëNbÞ½VÞÜª±éÎàu<>µ"Ù*^>ÕIo,WªÛ¢QG `æbbhxH/"EÝxwyØÙëôº° Pß,¿RXJ|#~OëøèÀûÿ´kpÀï¾xó7ÕÑuGaï¸Ïÿú;Íû;Îv DvÌ·ãbT÷³oØÃ$± iPaïüV8:~½÷²]>ÏrñåÞ·¥W/Dtí'¦ÓkH'ö¨¶öÞ)ãä½ ¹WÇkæe?GùçÇàYoÈÚ^/Ôuoè¯.ì\àÙ?ºõôïØGÞ¿À¶/g5äé¾;åe]î*¤«=óñú]Gö©ÔÚàÏý9\©©Ï/H±M6à7°ËÝ *©cÅCæ#Î9èú;4&§6Mú¢&àZ©¹UÞ¹:Þã>ËÛï¼XF9tuUT"þÁ+´´ï°ë9øàéêëõ_âÈQË5Bá¨èéÂ4Ó`"§\´µS ¨¾áÎ#ïBÖòùÀ¡£s$IÊµ%ÔÛÓç!qítºÆ·>¸#ù½N¯YrrÌý8Ó	àBCÓÍ¸¤Æ¦ö2o-H ªP½G¡Wâêwà)ªVWº²ò%øÔË;|Âò+ÆQô¤¨´ IOLûÉ&a°îÄÐð|'û|µÁÍn§ÖÕá3/úÖwØykNØRCh²QOÙ¯ÃhpÅ>Êà9FÕÆ-xªJV¬ÿhs¤U®^Û|&#ígp°{e?~l¡¡2¾¼Çâz~ø|cà·Oýµ¾ð!§Ã¬B ûQ¯	V*|ó?w5·é9hëÕ,½ÿ$ËzÝÚaB§ûóÛSÁÏ¥Q¶ àÏâ
¾U¾_¾ü³6Ò¶ácÇ7\¶c¡QÖÛ¸_$ ÆKì¨ÿ.­¸ív÷^·']±KÜ>pL¿¨	¹\y.ïG^¿êìfÒÓ5|+¿yª©Ïê-e«°yV­3ðXéÊÊZyITI@§»Ti>Ò¶ÉÌeK¸óÁeõ«Z>zþGÚ¡¯,;òh4Õ­áSEi$îpÔÑçªJL¶k¯B:ÇêÖ³cOý­îzÈzj<Â'üþªv iùþ¢*¯í?¶87}pÖ{÷Õ'xø}z/ÐèlÜÛÕ4¢) ÉÏ[öS\çl·äÏ>ð ¯ÇöNÔ#|Þ-7ü´m2Ó5 ©É£iéí®".b7àA¯¶ì[ß_Mº1Æ]ïÁûï=ç÷ûDJTÁìêH·D.ÀÊÚÛ<µÚyuõäxÉSuú£g"«Ë¨ªP3ë©\T½þ§©U;¿í/u7oz¹öl´Ã*<Áç½zìèçeY>£¬ÐÄ< He}o;­ª¤ñÙ=s¬ýà0çÅÿ¡çn÷Ñ#ÿY×R$®  åËzOð¤gðv½é3oÕq6³c)ô§dBÑnÛ]yZ `3 ¨ÛAhÑU®×ª¶vûúÙ³ÝàÅtY¶Þ×ø¸}éÝPýÖç¤ª`k Ø7½à+¶? Ôüª;§~÷bí¬o¬:^kðx/°ýOùó®w¨ªêWÁ].@Úð1 §*WjðTYWöÔ}+8=séý'÷x<Àª~çÏûzù;û÷- }»MEHrjÔèÖEG#XOõOém ùYð^éCO;«Î¯ð1µ~yêWþù×oU¥¹®«¬=áðÏöxjÎ>W£'A¡à=qÆ{ãýwüç§:Ã)ñ _À¯N¿þ_¿{òñ@àÔE¨:\2ài´`¯·ó4Ï?Ao¥>Ú3AíÐÓ«¿6ö- Ý@îx<T9!%55­üÀáÛÒÒÒo¡;;DRAmM4¯­7b@5?1V¯'"Ûx¼ï³]°®)¸~êÒ÷l×õ"ñoõÌ÷qÛ¸Éé¬1${íÆOÎuµ´üÚÁH«aU°6Ë½F#bL;#¢ï$1}¸\à±¥ïÏÿ½áº¬ëÊ× xg{juJÊ|íÅ²^âÊU«.ùö-óíSDQÌxÌú-¢ÚjgûÚò Äö!ÒÂÿÖÚ}Ok÷ÿ}_ðWsÿ®±»êãU¾_^=ÿàÎÐÒ÷lÛEùx´ú5b5QÁÙ¥¦¶LþìçJìÉö1Á0Ð`0°'áLÒNhT"¨=IDS#õ§loÕKèÉRv¤Â7u±[{ =WËo|ùgMLf+¢O"q  u,ØØ@dV³"RàFJ§¥%­[6tqÃ¸HHñ`4Ö46ßõÈvìi`ðµxº;@ûÌAíÙ²èÄ16Ç¶5ù_ËÉ2-0èXb=Ø÷ªjü[çßsü}ï»Ø£îXîÕn/Á×B3qçC£Æ}v\Ò»UºQoÙe9¶#è[[¶ÏüáÑ¤mÁ§·×2Âãê¡¸,Ô±nLzî¾âü/'Y¤È£ú`Ä@w¬Å-¿=7Ý}lu}­Ïò@,zôº¿·ùzpf*['x@dçKìa;çÌXtcæäìc-QhèpÒóKvË£ì;W(Û¼»vïÃ¬f×À[öÃµùy+f¾èÛlw¶½iJaåGåçe'äÛmb®Ù$ì%
Ô!$j¡¡C×®Aõ¨F4·¢&EÕÙ)ë^¿ræB«RõÁY_å[Ïg!^5íbÞÃjÛYjWÄpÂ¶+!þÈ¥S¬(á"·+noþ(¶ËÀj·½T'ÂóP
áC¡>ÂB!|(BøP
ð¡>
áC!|(ÂBøP(Õ÷ú¯  V«zWÝd[    IEND®B`PK
     8Nb¬lõP  P     weather/weather_13.pngPNG

   IHDR         çà   tEXtSoftware Adobe ImageReadyqÉe<  &iTXtXML:com.adobe.xmp     <?xpacket begin="ï»¿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:DC379EAE474E11E78D96877FDF53257F" xmpMM:InstanceID="xmp.iid:DC379EAD474E11E78D96877FDF53257F" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>T7H,  ÀIDATxÚì]pTå¾û~tIBiP	¥j©E+j¬ÓÖ3Z±P°<¨(­(Òú RÛfx eKÑjxGA,Iöìí9æ_»ÝÞçîÝìÝóÍü³»÷þïÿÛsÎÿ6sB
ày>ig¦ê#d
D>@ä#|"@ä#ù"ÈG ùD>ÈG òD>@ ò|"@ä#ù"ÈG ùD>!uX©
ÃÎÎÆêÍÂþ¼&æbàã>£àzÁõÅ½'òe:xlnÙf2!Ù\H¸Ù³gç-Y²¤ª  `Çã)µÙlÅe¨Ùlv?{\yháh4êíí½DÚ»ºº?þCßüÎ;ït0"Àoh ÿ|ÿK8lrÍÍÍÕcÇý¦ÛíbµZ¯gÒ.ôöôô\èîîþàèÑ£ïVUUíaÒ°ê!Bo þM&pîÍ7å;îxxÐ AÓáÙ± sss§Nú- âÕk×®íihhXiý0@oH>F:ÏÁo7nÜ#£<±h8n=räÈK@Ê÷
	,ùæÙ¹sçtPOÙíö/ë >x áÇ î9sæ^FÂ0µKÅæÌ7o´ßïµººúu Þ=ü1ÈÓFÌæóJÏ /&íÚÚÚ~PRRò3ø=HÏuÓyòäÉ£GÞ`D)8`$ÍSQQQ å×#G\¤wâÅ$4æóyÇ2ù²x¶lÙ2¹¥¥å=ÇsNT¬âìc!ïÂ2dÃÔnñn^äóÙ.9 ®º Wþø´iÓÞï×Hòé\â>|xneeå:#¨,,Ëd	h5:ñÆ÷ÁÊiÇ2AÙ°ñûï\2vLlªÈ×ßÄÛ»wï-ÐHËZF+mEooï/ÙïJÃï+8ÜÑÑñá={þÈfMÂN§ïgó¡jBÃ|îÜ¹[Ö;T\ØÐÕÕµo×®]¯Í3çÎfNE>\2{öìâ7ÞxcÅb¹#|QÍápø#Ï·:+;	D>mÉßÙÙYïr¹¦ß«;
Ú°aÃ=öX+üîä38¹nò¡wâÄG½^ïÄ1YÚÛÛ_1bÄZ&3²®ÐC-¨n.]:ª¸¸ø§Ä+EpÍ-ñÛB¨?7I>R·ýã,¸íÚµ§p»_»ìzî¦¦¦¯ñªJIÀj-]¹råÐ+¾êò°$rò]ÿl³ÙFR'n¿ýöo766í/0«m>\|èÐ¡YD<M$àÈíÛ·¯¯¨WO²²²u´.gÎù1|Í!òIK=[}}}¹Ýn/#ÚháÃ?ºiÓ¦	P¿N²ùÄÉwùòåçóòò¾MÑ¡Pè°Ûí¾Úæ3|ÂpäääTUÒP±Çø[ØÎ>"_Ôs@åÔX,|¢Jzªxüøñ8`ï!ò	ØÆcÆMIpô~'²|ñu6É$¢Hz¥ß3~NéUäÃõyà555UÊýñ#½ ú¦J¾d&i
k¶.??H[[ÛÜâââZ­Öá¬§Î|Æ÷äy^=ð^,<'\<@#
biDâåú*·ÜH/ê=wÖ¬Y[;;;ÿº|ùò'á÷qNÃeXºjmòÎÅm@Ú'y±v
´··¿XRRò"§Ñ2,³¥üëý~ÿkS¦LY'C¼øã'"Ô>ãEÒò'W©4åÒJ[.¯¼DDã°h ëîºë.¯[¬:%Þ ;vÜTSS³&Î¶ãU6*§!9äÒD@¥axyUMÀÏ\®iõõõ¿_µjU-´Ó'x¤aÈÄóù|sn¸áçÚM´§Äì.NÄ¶â$ì41{PÈ4á%$ÒË¿m(d×dÊÇ'aFñ2iælîùóç¿YXXø ´/ÙuV½ïO>y¨´´ôÉ¼ñH+5Q­tTóO2>Ii¨F¢*Îh¤!÷Þ{ïk/^¼Úíh24ëxº·£S³@ÀëæÍ·	lóëÑEo×wß}÷F(ÄÆt'Ò®®®¦ÜÜÜïÂ×+jFa2.ùÐ®ÃÎ­·ÞºO£ãT>{§u^¤z·bÏø~(X§äóOÇSuòäÉG8ë õ v=[·n]ÁzµÉÚvLñIÄÎ?I¦G*±4£
HZá%Þs	q(®
Äÿ,**zdáÂ¥ñ×Bè]íâæÛ+++_â²ëÌ<°úÝê÷ z¯è¾·<yòSðé.52©©*Nát8òßdëFI}HÆêwh1\	³_É¾T»îÌaó´¼èOFý*URaRIG¼'ã7Ù<óäÅö;îQ4ûIÉçöz½ßçè.2CÁívW.]ºtH??H¿^=J>û®]»n²ÙlÃÓÜ»%×ÏHg~è¡DêUíº+**î!9aL<x:×wC§.Õ.®Dªç'	Éï[²dIHÁËÐÆQ=I>{ccãT³ÙCjÊ°ÎT[[;>z|ö±cÇN£±?ë»[Wä³åææéò%;&NÍ¸ Ø²w©åþBñË-ÑO×x Ò%ú¢õær¹Jäø	µk^n'<w¨fLJn1dTÅ8ØÜj|¨ÂqÁx?]MùÍ	¤É¤/5m(5­'äWÉsT$±ï_ÄÉöTõ&ùL`ïQANÂ/¯¢1¤£¤RÉ#¯0JË+WÆTó®¦Îÿç7;íÀ¤;ò±ChÈæ36ddJòY|ÆkcÝI>g|D£Ñ\;g¢ÃÁCÆÂ2LOóIíB	=üAÎÛ×ËëMòñìÐé\	C6ÕÝøj*5~è!*¾Ú2Éè&.µm©,£ß T¥ÁÚXwäööö~]ñ\²	¶CLþøAËÇÂ'Æ+Ïÿ½Ç8òÁ'çÅÂ
Å§ÒbþcõÁËÕCÂw>±lþeóÿNOOÏE¹á©L¯7Ã¨Ú¿+#äG*¬\<réJO6n¥ùúlYÃëîî>Ôù"ÿr»Ýtañé§~m­·GøÈ#-M¾ÙõÖÕÕíÏÃ³¿1,
ýÅWµ¤K8|2''ç;Ðé¸¬Çq¾ßï?WCMe<\¹re×wÃ9§7µ¼ÿþû¿'õdHY·nÝ[ØçP:Þ	àMÛìv»dqpíÚµ}Cý¨Ü½J¾Ï{ãmmmõ$)ÕÑØ¾}ûoàSÑU=%Àår^ºti#H¿"Ù½Ã[ RÏ¯ÄFÏj	577¯fLËbF;~úé_)±õt!ùrAú-ËÍÍýZì¦ÍØ®6üÍPû¿çñ¿ãÅÇ
'v«gâºÄxó_bbåG,obyÊ`#¼Gª~ê;öL¨5åååñàp¥oÑùz|>_ë=÷Ü3Ãl6Ó¸_Âï÷ï-))Y¥ötÒG*466{ûí·!rÅºÒóõ8°pRûäÒS²L^ªLbG¸Éí©_ª^ämãÔÖi$9uß}÷=§FÝfz9Aã,¹ùæáú¶Ü	v-V)QNü0kN%99%îÒOOhÙÔ>
©ÃÂÊ_|úRD4IË$RÞø<EEÌ´/üñ.,_¾ü	g¡{²| àÎ0aÂ|7È?VìF ¹cÖÄnñ"r¢ä1H±µqQ¼JmJ2	C¨ÑlàóoR!ê'V7¸,îâË/¿üógyæ_É^£«·QíßÚ¿pÒ¤I?Ð¥P½É©A5ïåÂñI¦Ç+L3ÕûBÔ¦¡zu(:¹xñâ'V¯^}µV²í­»Sßÿðúë¯¿ûî»²ÙldÒëj,oßý÷ß¿©Ú®ÀÒíÝkx8xMMMa]]ÝcC)o%ÄÈSñ+xÅbÁcÛÃ ~ºØ ªÔ0rÒ(ÍÚ_¾½@ÊÙùñÇ¿:qâÄ7¸¾»×zSm{½_ü½qOCCÃ´éÓ§?êp8Fd(V X.vìW-ï1¤C]½zuï¢E^Y¿~ý)5ãxYM¾8Ú].×°Ý»wWÝ$ÙY4±£{åÎÏrÙÊH÷×mÛ¶Õ?þøãÿÄ¡-¤]Ö/^ÃI8+//oÀÑâGU{¿ >F£þ,æ\4¸páÂÞ+Vü$ÝÙtN·¢¢âbÅÐöÚ°aÃªªªÉ`t: ¥aÜ±àÓ"ùrJ3ôäëÈª|v¤öG"óÝÝÝç GW­Zõ7øc_âú¿¥vpä#!ÚV×¹Âff]©ÞÙÙ¹YE=ErrrÌjäúÆíÐ¡dÃÍ>a¾Í8ùÄ&øU '~¾*Õ·oò
¥PÛ©pÕÌ$N)õ
ÚùD¾noooVêù'JdÏx=ðÀ»@¢V õÎ _Nf¯ª
õpî:æ³g¸§È'-ø>úèÜ³Ï>»
ÈuJx§ÁÏJô«ÁãåååÅ­­­ß»zõê+ úÐáw|ïÔÜîHÈNòÅTµ´´Ôëóù¾wéÒ¥õ~¿¿~Çgøý¤ªYXûÂÇCüo©9|~Ðo¦Õn*¦]3ª¢'Çóµsÿ]ÞË'õàM(Õ×8R5¼ººú'@þÓ(m3¥©·Æax@ùÙPÊö=(à/Y8·mÛö9â!ÐO]]Ý,Næ¢²ùJá(,,üRÏÌ¯ÈGÐV§Ó9Z±t:GqY:KEäË~4«pùô`0Ø¦Ô3þé!ò´@èÜ¹s»zf~CD>ÖÖÖîÀaRïúe=p"!e÷ù|ç-[¶Xøü,B¿<ÝMÐ|_Ìr{[[[õûý¿-èð;>Ãw\ÜìÍp4iÈØâ'sñ3*¨f/g8¬ÔäúUÁð`Î òéY)EäËÕ3ÐGäK¿ÃùV[­Iõx	"AtæÒÒÒ¢¦¦¦J¯×;Ñår]Ï¡§záôéÓ5jTËñãÇÛÓ½%1[@ã|ïáþòþýûTVV6ÛãñxÍf³~Çgøý°c@¨Î¨
´±ù@ªy\N§s¸ß`0xþÆo|áØ±c§`óÑPl< ÞT9â!ðTÍ7O0ÿè6 m`1bDRÏÌ¯l>°à6J=3¿"! S|Ú)Uê^D>­Áq<¥ß Åp«ÑÃ(r~Ñú¥Ù"fÀÅo r"úA¿Tc4È¬äë«L6½¶eË¯z½ÞIN§s#Ý%Pµjkk$N¯äAf"_z ¸°ËâÍ>é Íp¤!#l>@ ò|@ä#|"@ä#ù"ÈG òD>@ òÿ0 Æ&î¢ëªL    IEND®B`PK
     8N_@èæE  E     weather/weather_4.pngPNG

   IHDR         çà   tEXtSoftware Adobe ImageReadyqÉe<  &iTXtXML:com.adobe.xmp     <?xpacket begin="ï»¿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:D53E8C814B2C11E7827DEACBEB1DBF30" xmpMM:InstanceID="xmp.iid:D53E8C804B2C11E7827DEACBEB1DBF30" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:F04902ED474E11E79AD1D1248EDC18DE" stRef:documentID="xmp.did:F04902EE474E11E79AD1D1248EDC18DE"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>ñã³  µIDATxÚì]	p×~=§4#.pèdÉ
(°b¥äCeã%6`p­w\[EÖc«6)ãJX{©u#7l(Äì*dÀ&°,&`¬2`ÃCh¤Ñ\Ýû?Ñ¡Ï94==ÿWõjzºßñ¿×_ÿÿ»ÃqA RÉ@ò!H>@ò!|äC |$äC ù$É@ ùH>@ò!|äC |$äC ù$É@ ùúa,u eg¥åÎÌ¼ï"à¿,¸0¸¸ 8¿àyF@n4K9Û-nÎ9y+W®¬+..ät:ÇZ­ÖR³Ù\d2àÏ&È%ZeY8¾Ïy<ÿ=þüg¾ëÝwßíãè¿þ´ÿ"ãP^ï¦Â¤ÍIµ\WWWÃøñãÿÎápL³X,£xmÂ¡Pè×ë=tòäÉ÷êêêöòÚÐå4"ùt­ùtTTÃ9^{íµ[xàÊÍÍ	÷
H<Æår©­­ýñjÿÞ;v¼iàIèË¤zLFk>tÎÞ7iÒ¤%v»}b
bl øÓ±cÇ~¤ü HæËXòñõ4ç={fù{Æf³ýµÊsÿowÝu×>£/#»Z Àr.]:Îív¿ÒÐÐ°W¥Ê@e^¥²Q©¬hv ù"Ú®»»ûGOÂÿ\wSôôô¬7n\«^µ j>uä¬©©)ò?×;ñ"ÊJe¦²Ó<é2x¹[¶lzàÀNç=:1±ªÅ§2ìÿEó]ñ:;;ïVä¯Ó]s@Yy U¾¬¾¾þ¸îG³«swôèÑÓ§Oo1É¢y y¡y2´x&MzÞ`ù´Ñ<AÞhwùf,6Lù¡>$ßpoß¾}÷ÀKú¥Aóh¼5Ãá_ñÿ´Sþ÷Ò±ä¾¾¾ÏöîÝû>?j :¾3\&Z1_°`ÁV£µµNlðx<û;::6Ì;÷HFNpã°Ï3§ôÍ7ßÜe6GÄõbÇ9²+{x"ùK¾Â¶ìììzäxqûýþÃ­­­?{üñÇÿÿ¸8_ ¯ç>}úÇeee+cð;wî7åååëy-èOùÑÕBÍíªU«þª´´t9òJì%%%Ox½±±qhn¡PèÏMMMÖ¯_ÿ%íÄNÍöÝô«íìì¼WTÒÅ2vÍ5oA«øA(Ë³@/j>õä188ø«Õ:©<={öìÚÛÛ¿ÒRÌØ:|øðáYH¼hÀÊíÛ··À¥¦%éÞàpN0á:­º={ö'pä×zÖ¶¶¶6mÒ&q=zô7mÚ4Ê7ë|ÒäË»råÊ¯óòòBÊ$~¿ÿ¨ÃáxÞÍe¬óÃÓTIBÁÚíÕ¸_Ùf7êk³Cá4ÍæB¤Jr¸ººvØ;|"uãªªª9Èä®¢Öï~$°l Nò¤HrµßwÜñX2µ_ZÎÏ7²³³³Lî-ÈäêÔ·ïØ±c:¾ä7MJ(,éBºÂÂÂîîî¥¥¥Y,Ñ|Kù¶ä9V=õ\*<K)"GtsP*MF"^¢Ò¿X¾z:8¹0Pî®Y³fmøhõêÕ+àÿI¦a¥EWKd74.î«©©ù9h»Ñ¨Rö|çÎ{±¢¢âE"eÈ®ªíà«+u»Ý¦MÖ¢@<áBG$´Ö{DZrþdKS)}¹´dådd¼O»]Àê4Ü<oÞ¼²D,Q°èx¹»víº½±±ñAÝÓøRI	HT$jÃpdÕLÀ¡nììú¶¶¶ß¯]»öxO_P3l³KwäÈ¹·ÝvÛó?¨úX½HÔ­L=Mª>(VFÌ=F&]NB~¹º!§o¥tT¿B2Óro¼ñÆ£#Ô§½Ù¥Äûâ/WWW7·1+R¦ñËÉh1NAã)XNAF©k¢ R^ò«äð¢2E*xøá7477µ;Æ¤'â>|øÁ±cÇ>MpÇÔ´ pÄÒ¥K7AÝ®ÔÜ£³K+¯ï½÷Þw!¯&£?	\x<NËõ÷pÙVfWúåÜ{ï½/ðÄãèÆû±³XeQcÒIy%OR¡_§ÓY×ÓÓ³h¨³ëÜºuk3ßª¥uªÔâã¤
ME7IdÿXZ¤rrH¥Éª %«ÐµÂÉ<'Qq¨í®aEâe¿%%%K~úé±piK³KÿÌ>}úoIzí7¿ûÁüþHh~ukvS§N}Ü<¼³ÁÉh#%S¯YUöXüÆ*3W0¿õ`Å¦¨Õ~©$ãO>ËÓr
ª?ó«Ö],ZÒIì±øUf.² þþµ]/)%_YYÙÜÀ@7ÌÎápL_µjU9QqZSªÈgëèè¸ÝjµÆf,Ç0iñâÅRå¢Wò9jjj~Utc"??¦Nçi>PÏµ´%Îx/·råÊ%~¥|¶öööZÉfÊ°yäGî_Ùµ¿©Cµ?¾dØ¡ÇÂÂÂjrí`l]Ïêr¹ª|4§«/zjG§ÂËÝ~&×ÝK^¢<E_²Ü²³³+ø
³kVn1QÊ¤Ô'¥4ÕÐO¥Ô-TB'.c£âá$þ49ôååõQ?%º¾'¿¦Ú¤7ÍÇ@}¯ A¯¡µ#SV9rªÍ¯Rã]KßðßíÑùøMh°Îgl(±¥JóY|Æÿu§ùÏø`Y6¨ôSÑàà@° Q^Ó0ÜÄçü1i(¡4føu½Þ4Ço:í©ÈÆ»_K¡
»Xôµ¾(F¡Îøaªé6ÑÒ"7KÙóïXwäcÃáðeh»@*¾H¨;DÔøÐ}ú_,ð~T"Fø¡9W&Ó8£äà¢ÂsRaÅâ´ÿHypJåuÍEçMÄ¿¢¬ÂßètB¡Ð_º§RA¾p øn@­²î û_ì¾Ú0b~äÂ*Å£®\øXãV+¯Øu¬y/Îëõ¦Ôù}}};<°ÅÀ¸téÒgô]ë­Á8vìØïFváÍ7¿~5ÏáÆH¿ß¿ÛGµ#D´K Ðó}¸¼¢Çã¯ün·û¼¼¼F|UÆCooï~rís¢7³KáûôÓOæÉ.ØÒÒò6ms¨íïIèIÛl6[ê
ã ¿¿QQÑpÙÇ÷÷éNóµÆ»»»ÛPS«¡±}ûöß-Óô¢ùèÃ1/^|´_	êôG__ß¾#G6Á¥;rO·;ø|¾Ë]]]ëø¦ÓÆySu¨é¾q,Ë<ûì³ÿ¡¦®§ÍÇÃÚï.ëÎÈæÒ¯þç·P»é~ôW%Ü:FøNj#kRo'l2g_5ê©yløc}Ñ2
ÓÊGô½hÙÕÈ$&èKx&\ùwäT¡^8qâ«T§ÈÉ®ÍÇÃ³páÂæ`0HæZ0r-v?Z[
V,¢¿èüC÷1¦1üGË¸áåÜÅÒËR÷ÄâÊ§¥xäÊW¬¼éµÛíÞÄk&^»Z_F¸½½ýëwÞyç_%XW»¿KT[çpÝyLæ,ÃX®/ÐkzO"!Ê[íªÙ°í»ìËmù&)Ù2¥ñ%(çµÛTw2GpÊ¡âââ3fÌx\[r'¶ÙµT¡°Dz3k¢bÓal_{"XOFïeæÍ_còþÏrå%:>FàG±ü
eb%ªi×ýñ.¬^½úg <¾"
tK>> àæO<ù)^6Fâ:HlwuNÄoÐ<&ó-½³NcàÙ·òÙÐ"ñDË*·(!ØKW³GÊ?£A+O¤lè´¸¿¼ôÒKÿòÜsÏ}NÆpõ\çÐ[[[ûö¡CVAëÉGÔn¢ewuµ¦øZÏdL.)¹áY.õC4l%«`Õ¹¡f=9³Kª0¢qûýþ+V,kjj:>¤ücîv}§¸sãÆççÏÿÕjj|fs>§ì§ 7:}yû-Z´Z:U^éø+]wµÈtØÇlÞ¼ùñ»$ä;ÄSOÙVèÅ%íVºÿlA2$4"8ÁHy¹iTÉB´ü¢ö¹â2`fN:õÊ)SÞ$×Î^Gwqiy¿º3»QBûáëê5jÔ/vïÞýSPõ_JÔKÔvÆÁñzY©?:Lí³j[óJyg+[¢äêííÝóÄO,â½ÿÝâÅ]¶¤Ü~øº:²³³?ûðÃ&L0ßn·WÉ©ÁoNv'¼#ÔdAløÒpv]½zõ£mÛ¶µ-[¶ìíJIéÒ| sÃ¾¾¿ïÓM§gÎ9+//oÈÖ%arÔ.ÙG6(Ä¦Ïýy¨Þk&¬ÏÎ±$f§/\¸°¯¹¹ù/¿üòWÉ ]ZOhi³HH'+gkmm­ª««
õÂÊ¬¬¬bÅRtDN2_s<i5¾¶gÂÖÛrcê3[*"õ1·ÙR>"<Á\³qEÍ²¬'
¹Áày¯×û5àäÚµkÿöE¾ëd?ãO@Bª^úyr#|^Ì|=IPcÊºÜÍÔlÂð:WÖl¢°pF-¹üïYÍÛ`ïÀ[Ê~bäûíØkßÍÌD"ä§©~½.Þu [¹Ù4øÒ²Ëû¹¸êfërûý^¯âý0úÜûÙ¶mÙùè>tü0zyª¡ÛÖ®Nàú¼©þ
»µ*à¨¼oöSDü8så½÷ÓgÎt/\$<¼½§>ß ÖóS'_!*gñÊh=Ë¬W¶ÜfËÉ-Yp8gf¬¦~|µÁ-3¦î
z=ï+¶t½Ý[nÿÎN&^­W~÷=ê¬ïÇä36<MË|¾NIsëóu¥	ÐzLÑùP¯¯ä×?ïÉ5ù4Ï¸ÚÏüµÖ3m³°ÿì_ÿæ¶:¸>JïÁ³©a ÖÖõÍëk©H±a`2ÞýÂKõDº'¯>Ð0gwkùøÛ"(7ÚÊ¦(½à']¶oWÕ©õW^ù·ð³Ä8¥	É>äx³Ì{V~A­j5éÌ©!
g] ÙE¨VfmZÏà·"OgïÑ0V~G¤ó;DòéGT|D U#*H>£ZÈNê4ö$1·øøée÷,§×*[Ô©QAòx9ówîipU<ë*+_ùý]wÒ{*Û
ÏxÄ³|û{óK¾;óEÂÏ1S?ã7UóV3`GTR
é"KÌí3³

Þì½ÒÚRVô$ÄÙ§2ún¼SQIÔ|¾DC{2UëÑI 5r@ÁÏÇj4Ö0¨ Ù52b(Ou½LäÓ¡ÖËI H>}i½äÓ2j(O_e¨ÉH2j(O_È¨I H>c&MEòé°Þ§Á¯É(dÔ$P$¾Q@|:B¦MEòé3	4a]X	Ó~þu¹Ì,|è­]ÿèøÖ¨ÌVk}OyÿïÂÛïÌ»ãåÇ/¦û$ÐD'&§L%'nÀÉ¤Ã\ÞÄà@±Î@ò!H>@ò!|äC |$É@ ùÿ` £ùÞ"Y+    IEND®B`PK
     8NØAZþl  l     weather/weather_12.pngPNG

   IHDR         çà   tEXtSoftware Adobe ImageReadyqÉe<  &iTXtXML:com.adobe.xmp     <?xpacket begin="ï»¿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:D098696D474E11E7ACBDC6EA836CA91A" xmpMM:InstanceID="xmp.iid:D098696C474E11E7ACBDC6EA836CA91A" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>}Z  ÜIDATxÚì]pTÕ¾ûÎî&¤MÈ&$!4Ð ¸À@åiFE,U¢`ë§SZ¡"LË #2G-ÖV@XP4¢DÐ²c1B(!Ï}foÿCîÚe½ÏÝ»Ù»7ÿ7sf÷Þûß{Î=ç»ÿÿ·B ¢ MÓ-f"^@ò!|$äC ù$É@ ùH>É@ò!H>@ò!|äC ù$É@ ùH>É@ò!ÑCY &&ßtÌÇ«aBtÈo B'?OÈu$_¼@MP,Û4B63!ÜäÉS,YR9ØjµælN×[«ÕZ@Îò>hÞ@ àéìì¼êóùÚÛÛÿsáÂ/áþwß}·!¢d==ýkFòÝH8¢Ù¬DËÕÔÔ8pàÏ-Ë½^Áh»hÐé÷û/vtt|~òäÉ÷0Ú°òÁ¯§~Ñp7Þxã§÷ÜsÏ¯SRRÆÀ¹4£Ñ³l6[ÖÈ#D¼ÖÚÚz ¢¢âUë+.Ô|=Dó1¤³=zô®ÁÏ6LEq¨¼^ïãÇÿHùaO!a%ã§Y÷ïß?Ìß3F£ñ'
ÈHx
Ìýó&L8ÈÐM-ê2±ÉsæÌ)hiiymìØ±xJøIHZ M¯´4´¢æSæj»ºººÇrssã%äM[}}ýêjÔ=FóÑ¬#4ÊßòòòU:ñ¤¤¤¼/ñ²mÛ¶áGùÐjµÞ¡+:ù$ÍöwHÍnñª««ïZä®9 ¯Ú¡V>·¤¤äCøßOáï/¾>jÔ¨j0YäÈ»wRÔ«x~Aeïi$ïïFÞ±"T1RÿïK&7ÓÕäënâ<xð(¤*}G=¼ÛªÎÎÎ?1Ç>Ò(ÇM¤/¹¹¹ùË|Àôx)vß©Îç#¦8æÓ§Oß®¶Ú¡Tíííªªª6M2åßÂzNTE>2
eòäÉÙo¿ýö^NA!¾Ïf¯×[ët:×Bee?CB7O^ò¥·µµÍæä{v{<c7n\øÄOã6:ëª!ñóÎ=ûÛ§cð444¼Ô¯_¿õË¸BU4µs»|ùòþÙÙÙóW¢`²ÛíóÁJ¼YZZùgAÍæ¶Ûá÷ûÏ,X°`Æúõë¿!ØÝZeWÖ³TWWßÄ+F*E@ ½>õêÕ;¡V|/äåy `j>ñä»Éívd0
JQiÀ³&Mº¯²²òÛîòÚç#£;6'ÌÛ½{÷øk|Õ ùa4hÐï:ò¸.çÏÿ=üMFòñk=CyyyÑh´}ûöýí-[Bþ&¡ÏÇM¾Ô«W¯¾zRF^x</,Ë½P6WPó±Ã<©59räff/Lë sJu:]:R%6Y<dÈÒ`oEò±øÆ#±Eµß[|¡y>É0¤Hlµß¸qã¥öK(òñyúTWWû#äGl>õm£H÷%³h¬Ð'
éÒÓÓÓêêê¦ggg?®×ëû25uå7´&O³Ôêé°ë\÷S,ÏzÅòð®85Ï¥DÊ³½·PKÍwä»mâÄÛÛÚÚ>Y¹råÓp|q¢Z¼¡rqÃáx´]_ÔGq+'WCCÃË¹¹¹/S2ÃÒ*YÛÁWÝÒÒ²iÄº ch 8´Ôs4G\|rBiåS(~¾¸ÒJó¤ó<iv«³ ´àÖ²²²9¦(èJ¼½{÷ÞVZZº.Ä·£%*%#)¤bD@±÷ÐÒ*×Ìæòòò=kÖ¬	åt,é¡òâ9Î)7ß|óÙ÷§¸ü.Ã·¢xü4.Í5¡yÎixâåJ?oÈæ×iÞÀ¢â`M3øÜóçÏßõ+(#g¤ã õJ#ÞéÓ§gåçç?6Zm%E#JÕRéã¡#ÔR4ªè´EJ{à6]ºté(·P«$â;vì^ Þ"
WLM o3gÎðÍ3"iQDm8¯ï½÷Þ­ð¯Ç¢=	[´··WÛl¶_Âß&)­0q×|Ä¯#_ÎwÞ¹!Ã@I</tMî´ðÕn¹ÎÑÝðN\ë¿V«µ¸¾¾~6%q Ì®uûöí«Zm¤¾%AtÍ$ÁõO"©ò¥+ÎRVhëTØ3Ä6×XýµÛí³-Zº-ÒÍ.ü3iÔ¨Q¡kÍ<»ù=æ÷10½M¯í¦þÅÞE%¦»KÊGÆ×UElb%CÚ#4oÄäïsÁü##aYÂ7f×òé§NaúiiÕùkùî&9Òl¤i¦eHüw2DTïG<5%''çQ
÷"S,Ë¨åË÷í×Ú¯SÏXUUuÁ`èãÚ-n@:í¬Y³~Ex¨T³kq8÷£P'zõê5êÚ¡SfD©ä'ì/·dÉ;hÁ«PÆ%i>ceeåH­VfJµA3sæÌqð¤4Íg8p`	V4Ôôôô!T×ÆØ"Áf³vù"mOãºOJ» ×°w¾áþlÏ¢«ö@±Cô9óÍl6ç
ñ+fWµÜL½ïPJÐ`Èv*®¾ÕÐ{"ÛCChwY ì94Ç1Å'Í?_·!_·¬>ç Gúÿ¿&3§Z«4Í§/M1(YZBaGL!EFZd:Å¾¯Ð;Fv)y~Ã1³ÚFqäc¡AOÝ`/Í§Gò©L+NóQH<õ#øÊ9æ¨<Äøt?&©%ðFf^/­4ÍG3NÛxÙhgãKÉÔÐ¦@üRJ#à k¨è¦aF3Jèù0Å )¦G¾@ggç¨Û@
$øA5~ý<9f»/ô|Ø=×=¡qÑÈÁ{éàýáÏåyÎ®g¥»æºíÙ!&-(ÌZ(ÂþÓáïÆ"/ÖÐßðxü~ÿ%¡æ©x¯Óëõ6¨Eú¼ÇlçÅÞÃ&Ãw¯Ðsâå»?ÒgM/ÛÿHß5ü~¶û:::Î*|¾æææ¯-nØ¢b|÷Ýw_²VZÃ{üøñ#v¾«9tnÝºõ0üzÄ8Ý>g¶jG°h¯·>99yT:®*±ÏÓÒÒòijjj)úÐÔÔtêÚáRÙ%p}öÙg{Ð<©2ø6lØð©smïÈN;Fcê
õ µµõPïÞ½Û¬TÍw½6^WWWB]Ý»wÿ~E­X×UÌfsÖåË_ígGøhnn>Ø§O õZÄÈÇu­Ëu¥¦¦f-³À4@ méÒ¥ãë)Bó1°ö[a³ÙÆwÚÎj#ÇÌj?8zz.x>ô^¶û¸võQþð4?/<N®÷`{WÚ¸ÒÄ>ÖBæ¸Æö¾üeËïà9p¡Ö½N[ð:Ïït:OÜÿýã´Z-¶û% ZZZæææ®º:iÜH#K*TVV6îÚµë9-ÖÅ®¯GqÜK¸oP|bÉó½×nBs*¸Ï/BË¶QRóÔçó}óà¾ ÅÜÆ»9nPãgff.=zô2ªkÊÛb×\ ¸³¦$mSø,­ÐøØñÍ£à[,í]Â?5<ÄÒp¼ohnÚ÷²@¼+W®\Êã[(CB! ¸ÿèÑ£½:IãåÚHh5®]|Ø®y4kl\%­|4,Ä`+t1x¸ä5´2[þó»ôÊ+¯üaÙ²e_Gº!¢Þ&føÎáÃÝÃûøfæMÈJ¹.ta|´È8£Ý/DjGX{<úÅ/\»víÕ´¼·ê;CÀ÷7oÞ|aêÔ©Ï,téÕwhÆ«SÕXÝ{,^ZZµuëÖ'ÒÒÒ&p¤[Ì1BïÍ+l>¯Ê·!Ø´HÝøEìuÁdÀÌ¶:uêµ[n¹åmªkïµÎhË^±{¯¯
¾®úÅûöíû#¨úo8ü§H	ÔZÅ¬
/v{¾Ú¹PUÊ
õRV{ST$ö?ùä³xoÞ9§H³F@âà¶¬2Í_~üñÇc4Õd2åuCôdr»M§Ó%^kÍy@´3ÝGªþIvíÚµOvìØQ>wîÜ¯HS\¤S¼Ùå2Åðc!N3fbjjê¥7ä`N¯×gPÜzü~ÿE¹Cx½Þ³/^<¸jÕª^}õÕocAº$_9Æ&5aãÆ_	¤é´w2"Dúxf¹Þ$9·ÏçkLPHúbÛájw¸ÐÑÑÑ8¹fÍÁ}êþîæ[ØQõf°¤A³!×Qøq2ï¢cüXM¤Óé4`ÀÄÈ>}z«Ãáx?Q-+ÕÕnGÑld²îÆåbãN>®~	ðSSô$Àf·ÛÅ
3²» ´P*Ôò«Z
qÃÇ~bA6Â2{ÙUwÞ5CZ63Á ùâ¿Ëåú4Z1Â§ñbaþ4L¥ÇRNþÊ@Â7õ Ù½Þ±Â¬7Ä3e8qâk×®ý>
Èr\²»#/1àyè¡ª@£¡õÎYJ`V~$Ä[´hÑÀuýû÷ÿhád	ä?9G®D' ïF®­­m|þùç×uçïÈ¬&²r?bjA«e,\¸ð9ÉÏ%G®Ã©IDg/ø¾H¹:ü¤;??¿ïÎ;'Øíö(ì¾éÁÔVí?sæLcp ¥åoB?\PP0[p]]Ýà¼xq0o+ìJHu
ôðKfß{IHåÂÍ6²²²ÆfdI]ÏH>þæ
7º«YCT Vdû'r¢Ïø:aO&ÌkÜ÷Yò½&õ»Ýî:R«U5ïª%,QóÅ@,+	"Å=}6#ëAò!Ø:«öìÜYµõóÈ·¸gÎ¹4ÚZï,eóI|H¼ä©ïïkËÉ]jËé·dÚÞªñäG;Î+V¬XÌG@rd%²ÜÍ>_l§ð²Lû­c^æqVÉè
Ë¦OkgÀ?ôóÐµé{öìùý[o½uÝno0®¯aèóùÎ544TM6­¢¶¶¤ö&r>a#s*ÄÄÎ>weURZúã7ØÔ¦«7äô~
dÙ*añÚÎx½ù'\ã%b#3]ùµéîMo:x_sOÚ²c8Q¨.M¾cBsN|òÃw×¤ùû
`º¼;ï&×Xk¿D{E|¨õô_Ûv³19eÁbqíéùäYëõ»ý¾´±"ùri=MïAE½À¯*$kJíUö£¡^ä$BÆ¯ZïÐhµ½´ÚôÛ×½Bö3"ùrÀ6 Pô´ËÔ~y?£¸WD@ò!$ÁÔ+m¤h5iMvP]+°"ùQC¯3EÅÙ\ª÷0!ùdÌKE@ö¦ÿH>ý>	²ºÿµ"_dÇçêøD¬°ßíÉ_$_ÏDGÓ©¯7¾zêäkÈò|^Ìk¥ÝÛFßëëhÿ@Hdöm»mØûä$B.´W-;ÏïrUs[«dæôt­GQ8TníçY¢9wñó#Þ·sï#gÜ§3
ÉµNïTÇ/¾³«ìîÍW¾ª½Ld{z~á`ÒØå«	¡+Lu0A5ã
,Æ¬¶cV Ï@ò!H>äC |$äC ù$É@ ùH>É@ò!H>ñ? GÏ.Àî    IEND®B`PK
     8NR ¹Ýk  k     weather/weather_2.pngPNG

   IHDR         çà   tEXtSoftware Adobe ImageReadyqÉe<  &iTXtXML:com.adobe.xmp     <?xpacket begin="ï»¿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:E5C72E86474E11E783E3F35E868F32F4" xmpMM:InstanceID="xmp.iid:E5C72E85474E11E783E3F35E868F32F4" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>p:>  ÛIDATxÚì	p×ÇW²,YOË1àá2MÉ`hÁ$`$à&4	)Ð&M2@)¡-	I	LÊ$a Á(§¹uK¦58`Àµ9dllÛ²eÙÚ~/Tq¤ÕµVÒÿ?óF×î¾}ïýô½÷½kåù ç½rd,>ðA ø ðA ø ðA ø ðA ø ÀA|ø ÀA|ø ÀA|äZ
dÁþJ
Ñ¶¼²}'³ûâí^Y°Rè¤`±vde àc[]ªd$z¡ bÀ½üòËºEý899ùQFÓ?::Z(Ë5t¨Ú.Í´v«Õj¦÷­ííí×ïÞ½[Q^^þUnnîùÆÆÆ6mt`tÿ$MvvvÂºuë²{õêõ¤Z­~L¡PlÖÎWµY,«MMM§Ï;W8qâÄ¯è;3åØE|³òN_\\öJ¥úÍêùUdo577öÙgfÍu¾jað9|k¿i_ýõ^Ë-[ô}¤ÛáÉ"VVWWo2dÈN-/Ìà#ÀXõ©]²dIß¥Kþ>..îé@X9¬áÍÓÓÓ?¶Ah|a §>|øCG}£G3è+µT £££¦´´tåèÑ£ÿaÐI]áóOÉKJJÿòË/ÿEàýBÊà}×Ý P¤9òCjn¥¦A:Ý,,_Y>fí²²²ô«mUlÈý±(/ÊËËÿQ`³aíå#ðâvîÜ9²¨¨è(79TÓÅÒ1xðà5wîÜy?%%%>kÂ>ECÇ Ó^¼xqö AVH½u7Yôz¦ªªjÐ+æP«ÂÕ#V0xßõÛÆ7õzýk8ÃQttô+Wî8pàÏ)­ßÍO:àiëëëÿ¢ÓérÅh»JQQQQÏ;· 99ùUJó	Ö&|Á¦mhhøkbbâaïÊd	&MÚrèÐ¡¹ôþíf?¡¡ÃØ²ðùWq×®]û÷BÄtIÈdjð#³Ù|Y}64gµZÙÛ­­­Õ·oß.Û´iÓqúí&×5Á
Bª«yÕÕÕóSSSrø¢ kM&Ó¹Ó§OoÍÎÎ.ar]]6<àó¼Ø'NL5jÔFó]@4ÖÕÕdeem$Ï¹Qõ ðb.\ùÀsÛY1~SQQQLÍ¥äõZ¿¡ä-­//ª=*j8°òNlj7ÇÜÖ&ìås--ýsß x>z
Eê¸qã>®¯¯_CV0Ù~f6àslõTo¿ýv:U¯ qjcoæõë×fÌÑõ!u«Gm½Õ\xIFJ¥rØÖ­[yä\°2XÃw5KKK§ªÕêLàâ$eñâÅ»[ZZ§¼¾É¬u8(C6ÍÇY[¨øÕ¹òì³Ï>WTTtÊ²-âÛ|Ìê]ºt)àÄI+,,ü5ql=ïphû÷ï'#@b=	F£qË÷y¸'O|þýEà¤×ëyäÈ±ì\¯knnÞFÆOD`e±Xþ3ÊôVÄY>6]*''GGà=/6õÊ+¯jÔª]ÍºuëØ=PRRR~¥Óé#¾={NÁSTTÔCgÎÑ¹Äþuò¼ Ã,Vù;Ép0/·¤¤d¡´ K¡PôËÏÏDerÏ;(($ Ûá¢->}úþùo©|np]QE_´®ûÐ½÷Þ{çÌ³X«Õ>Åuí
IDl­H}}}~FFÆºÆÆÆÛbO@åc®ü3R6nÜøA7Ãìdi?L­×ëçÆ©'O\Jÿ)¦¨åcí:fí._¾üJZZ3éq(âQG]]Ý&Á°Ê Ïäüisrrú477ïè×¯ßrz~³&éÓ¬¬,Ãpò »~ýú]»vT«Õ£Q¡+JõÄ±cÇöÌ?¿¯¯} ·wïÞÓ¦MÛLïP|¡/6·víÚ=mmmÏQÖx»¿´_Û|Ìâmß¾ýñ^zéïÁ^/ ¯öööròVUUuÓþ@¿U»6ªjx[^xJ©T:þü®k"ªLð1¯6;;»ç¼yó¶Øv~çÂ3P~ì·ß~»ÞÇJÅòiöìÙó®B¡H}õîÝ{Á¾}û2=õ~°z±eee³µZm÷ÿgAaîL<y½N¤ò7¹Û÷+<öü²^éééyàyd÷í9úÞÓ¸]sãÞÍûuç7¡Ï¼@úyÎq÷½.3òûUWW¿êIõ+ª·ËÚwër`"Ow233<{öl;;bfùØ¦Ë-ë?É³Ë¹¸¶»ßy§;×å|L§iáDó5o¢¢¢8ÀVjjùÕkhhXøl@D[¿J¥rqQõñdeeé¨º}NßÄs!°ñ9Y?ý©S§"$ö¹êxËÛÕäççÏd8>¿(yedd°E`Ç¸®gû¾½^?àAßÁÃöRt91ØgøX;eÊDªçÓd«zãvìØ1ÐhÚUË§Z½zõxÛómy'N;PÊ oøhìØ±éå4fvµ(Ã"´S ^)>>~«ªWË§P«Õ¤þ¸{(°6p.'|QëzS÷*ÔQUjÿ£÷ÞT¿ÎÎ9±ªëÞáèÎE<Î,¹;÷Ñý=çä7O*îæ©P¾É¤K¨lelçW5«ð1#ÞÉº?ôdÖ*ÛÕ¸)çâ8wÇdÝÇûðæú¼ùân~x÷øär¹sÑ/)
|m6¨;999qdêóúêpÈóòòæÇþ¬«ãÝSº¦Õk[½[û÷ô>~·:yõ6_ÅH?fÌx!Æ|µ|2½^ïÕã}üÝÓªÃÝêB,¯á<OïÓ©T¼Èy)¨Ð¹¾ÂÇµ ÊéàÁwØc ºgGGG	¦Oû¼ÕjíP*£f·ápðlmÙÃwû~÷_àë$Ëw[¡P >èÚ@Àg¥®|d9t_­­­×þÏrïÞ½ÇåÐ}ÝºuëÆÐ1bL,h¯¨¨(á°Á®opçÎÿá\L&eG=zÆÃR{:´ö^F£yØhðwµË5666µ´´|;ûþ`´£ÁzWäÎå9×äãþgâä8×	Ü¯³AzWiú]æ$]øòG(/\Mºxp<ñpÊÕ«Úej«¬¬<bwV;OÇ~øã?:;ã\/g´:¹¦£á7Îîúçz9¤µç&´àwpmÎ4tµ:ù]hsr³øè8ÎùPùuìe>+hD[:If¶WCCÃ§äõêPñD®L&Ó×ó;²|Ìµ¾sóæÍhlGv(--ÝÆt1Ë²³³û8p`»\.O<Íæñññ¯·Ý9^´]ªØ-â¯öêÕ«;úöí;EyN.õôêö³:Dßu»ÔÔÔ|ò{È`0¬$Ü=Gî¨?|øð;ô¶s<ÔÑÄÇîï]çë1¾/ÞÍ´ñÞ#¯Ý´ùzï¥Ñb±gÏý¾'VOÔj×Î©úýâòåËÛúôé3W Mh9}{Îúå<YãÉÂ#g}[¼ëðn¤]Æ	O9éjqt2ùé,~Wý¯âyÐDåmÙ¿ÿnxúd"¿íFoÛµjMlll&*¥°_YYù·aÃm#LìÏÀ´÷ûVkkk9º Â3Æ]ÞvoÀó+|l³gÏgÎ¹\ð*VxºººýiiiïzÚÎHµkWý*srrR·lÙòGµZ*ô«Úk×®mKOOÿëz  /Yøl Fgdd??å²Z­meeeï1b·Um Ú|öZ.\¸p]¯×ÿ¡ªªj£íqb¬¿uÔm ô»ÐùBxÝî^wÑÕäîzY«@|B÷(ÔE$ööö«ùùùox^À,_7+¨Þ°aÃ£¹¹¹¿¦jx(ìäe©­­Ý?uêÔd@j©¼ÛÅºpPsÏªazÑL<xp®m£!HbµlSSÓ²vóòòÊè³y+² Àg¡¬ßCÅÅÅO0à§**edoç;îÞ½ûÅîÝ»,XpÉæTtú#® Âg!ÛH<fóæÍC'L01))iYÃ@!`Àµ·¶¶VÆ/V­ZõïO>ùäÍÒuú3^DÏ6-Dúrùòå©Ó§OL§ÓõÕh4)d{ÊåòX¶8Ý¶/äE>ÇÚJÎCÙl®mnn¾Q^^~qÉ%¨=Ç¶¶`í¹6>@;}Jyæ³M¢ìÌ.@^ðg6/½²åûíøÂ©BÂÅ2§¼¯äÈðA ø ðA ø ðA ø ðA ø ÀA|ø ÀA|ø ÀA|ø ÀA|ø À>|à À¡þ'À f0Ø}ñ    IEND®B`PK
     8NØ´EÒ  Ò     weather/weather_7.pngPNG

   IHDR         çà   tEXtSoftware Adobe ImageReadyqÉe<  &iTXtXML:com.adobe.xmp     <?xpacket begin="ï»¿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:EB117C34474E11E7BF4FB206D8B66F7C" xmpMM:InstanceID="xmp.iid:EB117C33474E11E7BF4FB206D8B66F7C" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>g¹S  BIDATxÚì]tU¾UýHº;tHH42H#,9a°°¸EPYqö,
¨ëxÐ=ËcG\WAÅq!Cx9dy,²0ÃHèN:I¿êî¡Úmª®ª~¤+ÕÿwNî®®ªûß{¿úÿÿÞûß{y@ÄJiÌÅH|$É@ ùH>É@ò!H>@ò!|äC |$äC ùH>É@ò!H>@ò!|äC |$¡3jppdÀaËÍ$¾¼x@Ã>8pàðÃáûÉjØRYºeÇ1²Ùájjj²/^\UXXXîp8Y,ÉÔçy;\gË#Oo0lõûýMçlssó	¸ÿ'|âØ×zÓýmFòÝH8¦ÙLËíß¿¿zèÐ¡c·ÛGÍæQÛÅ` ¸ØÙÙùå©S§>­ªªÚ-jC5_º¾Ç4}ýúõ·ßwß}ß§Oqp.'ÁÉÄÅN§³xÌ1? "^mooß½}ûö·!­¯Dv¡æKÍ'ÎqèÐ¡Éååås222§ !&ø|¾ÇHùyº0mÉ'úi;wó÷¢Õjý®Ê	O¹eÂ	{Dú°«ÅX&6kÞ¼yÝn÷»ÕÕÕïñèáEd20Y@¦÷lLF&+j>h¾¶khhx¼¬¬ìÇð»+Ê¦£±±qÅàÁ×Q¦æ¢9***
A£üûÀªwâ44ÉÌdgy@òõ>âõùðÃG<xðsÃ1I'&VµøLfý·,½á¥A³F¼ºººÉÐ|½·k(+´Êç;ösøÞOçïèÑ£3*++×Ád±<°¼°<AN¼òòòWO+Ëäåq{¸b$ÿ?Ì&ÝâP¯§·gÏIPI?7hÍ·åÁ`ð_Äß~Ö)¿ÛØX²Ëå:±{÷îß£&>¢Óá;Ãù|Ì41Ç|ÆÖ:Ô
ØàñxöîÚµkÝ´iÓ|,
¥¦¦¦dË-L¦ø¶}>ßÿÔ××¯ÆÊNÝH¾Ä/·££c£Íf|.n¯×{díÚµÏÏ;÷$üî )\7ùwîÜ¹'KKK_@)ÂÛÔÔôÆVZ0%qèjaævéÒ¥·<¼Rþýû/ +ñË'CùÙQó¡¹íq?.\¸ðÕ«WgØ=Úd7Ö³×ÕÕ}WT fó +V|­âû¡,¿v¢æSO¾¼îîîßY,ÁH¥¸4à¹©S§>P[[{¡§|À^íó±(ä#GLAâ%DÜ¶mÛøêrå|Êp6ì)¤NbÀ\¯¿þúiøä®õ,7nnµZ!m¢¢¢'?øàP¾èóÉ/»µµõõììì2×ë=j·Ûïº¹OYYYÕH$lFÆNgö!ù"´^ÎDÉTIN1uØ;|¾ñ!Cj#ÉE­ß;Å|áe>É]Häj¿ñãÇ?Lí×«ÈÇâóàÈ¯«««{ò#¹ úîíÛ·W²áKqÑ¤ÂÜ[HÓÐÐ0£¤¤ä	³Ù\$¶Ô©ÄgxKJ´êiÄÿr÷g)=H<#²GA.MNæ¹DåõRùVêé ÑîrwN2eSGGÇï-[öüþ#I`®»ZB¼¡q1¹¢¢â§ íP¥¬º~QVVö 0,^ÏÚÞº·Û½nôèÑk¾ cøAd´ÖsT&­h×)É-M¥ô£¥­$+"ìyÖíVg!hÁ>ø`i"¦(uJ¼>}öÙÝ'N|-Ì·£+$D%I¨öªAVÍ¼ÖÍ`³Ý¸qãÇ+W®õt-éaò1âÕ××O»ã;^Ín¤?%çwßDñÓäüA)×F9ÇEIWNþh¾¡_Ç)äÆàFQ4$e»pÁ?uTk YoÄ;sæÌìA½!M¶Ò¢µjG-¿iéÐµ¡ªZ6°H93gÎ\wéÒ¥Po§b! ¯'â9rä~ Þ"+¦ö
 óæÍ÷øæ±tÅè¢µË×O?ýô{÷ÑH.<OÓé|¾¶iéI¹æc~{sî½÷Þ×DâÑ$Dãy¥ÿ-K´Ö­Ü9Úyk\ût8UsÆ8@=]Ç¦M­ÚX};¢P@4ÆnÐú'±´H£É!¦ B×
ò?xÚîAâ¹Bøgÿþýç,Z´hPø¶z7»lòÏÔÊÊÊ7IïZ3!m~÷ù}Loî[»¹Q£F½H¤¨ÔwiyÉ¢U],ZÒ!	=kc-5åõ¹`~Çc0ûÔ,áJ³k?pàÀ4q*¨þXÌ¯ZsíxÒIì±\«Ì4²ðà¿³9 ªF?R©ùì¥¥¥Gp/2CÁn·W.]ºt h?7h¿ 5u×®]w[,¢$·nñèáHÇÏ=û1ÆC½]{EEÅtÔÆDß¾}Çë;têÒì²Hä1zÞq;Øþr/îZ°êXÐæ³ÖÖÖáy>ÍanÖ¬Yãá3SoÏ:tèÐ±ØÐ06rssGëcë|§Ó9¤ÈkÜ}ZúåÂÞ£ûK=_)D?YýjCôeËÍf³)ñ+f×­ÜB"=v¨¥OJ)RÐÐO%7¶~ ²_0ü."Ce~4©LúÑ£ëI]«fÌY/ôýÛgsªy½i>ü½Ä Q®¥*CM:j*)©J9ÕæW)ñÊ®¥Ìoø-®vÀé|â"4èó©Ò|f$±!Ö±î4Aâ øê9
ù© >MòË¤5PB/hÌ2óz©Þ4vFqdã¯¥PÃ»ôµV§à s$¾iñQ)=PÒëXwäÁàh;A*V$ø!5~í<û-u_øù{Ü=áiÁ5L#î¥¡û#å97ýÏ!¸ÊÝ+õì0º>TT©"¾ÓÈ¼I\¯(køgd:@àR÷T*Èôù|ß°¨UúQKW{Ô5ÑîUzRºÑîõÙjåúk^#ïº¯³³óã ÞÈçw¹\§ív;nØb`\¾|ù«k½58|Ç?@pðÝÈGpÃûàÓ«Æñìiä{½ÞFØª]+L¤+§®<VGX»>§<· ònUcVVÖßB££UoÁëv»ÓNûñ\ÐÌ	Wó(x¨P¯®Üb´|¶µµí%×w8'z$_×áÃ?N/òQÂ/ß
.9ãi_¦Áòê_³fÍ¯XCmO*ÀvÜlµZKÓÁÜòB[>O<}¥þ	ðEgÏööö½ýúõû1hv^5ßµÖxCCÃÆ´0·¤ËÁ¾2KjhlÛ¶íøTµbUJW	°ÙlÅ---ïöëoXG3½8 ¾¤{¸­]AþÖ?!«.kO~~þBÐznUÖ Âvuu]Ù¿ÿ*qi#ÄD/g»Ïy¡ãå_þW5¾.4'h¿;Î¿í´ÕÆ~K¨Ýt>üwø¹Ðùð{¥îÛÕ3rF]äs"e|^ø5&r5ÜyQG.ø¾.»UêYJ2IÉ'YÉ2ÿI='ZùJwè¸P¯>ü}¶p¸ún§Ô#P__rúôéãy7L¿G»ì&ÚZ¨ô³³¯7çÕívï)++[©uuÒ/ÆT¨­­ýfëÖ­?Ùb]íúzDæ^¢â¾hóÒ»é>ôÛb6_^,ÑìRSdx<K¥-W^D&_(¯l¯X¦~¿ÿüÃ?üªs.Òuÿ²°°pñ=÷Ü³\r'µØµ\¡D~1k¢RaN³´ÂÓ»)ìÈD[84«RÎâHKÈ{d QjÂÏ"óHe^&ûL ÞÅeË=ÊãÔa WO$`pç¡Cú9r('óÆÊí¤´ÌÜ.>RDÔ<Æ¸AF^Íåhguyfæ$ò$E8-[È]¯?(·È²aaqÞzë­ç,Yò¿±n£«·Ùþjß¾}ÝwÝu×sàÚ¢7ÿ
î±¬/[ùíÎ4Ñ¶é¿oK¹|=­A¥±,!§uFdº^¯·ñ¥^z~ÕªUgÕµ¾u·ê»HÀ_¿÷Þ{Í=ôÐ¥¸wôçyp©t?/¢>yK7éeóY\.×ÞGydhjãÚK[&øË6<ÇÜ	2]Dj6QêRgoÏñÀÏókZIZ¹^·@N­¿¨ý_q0³§O~÷Î;ïÜB®ï½w$n÷^co¼]/íØ±ã' êÏËø%4J+(´ZÕ¬
¯¸=OÝ}yâÉÑÚ7Ké·OË
õZVWû¿ìu¬!ÑÖÖ¶ógÄû%½Hñt«ùÂÈÜvÐ»l6Û/¾ø¢zØ°aeddÔóóZc±ËÐ­Ùe»zõêï7oÞ¼qþüù_±®D®W/¬ c~Hø|þ-:=nÜ¸)ÙÙÙ£%Þè10;e¦K¯i3¸`¨¢¯5
ÏwîâÅ{/_þ»·ß~ûB2H×«ÈnáÃ$dÁ_Âa]»víªªªQàÌÌÌ,4ÍýöÐNFð´Qýs1G|öòBRÚØ`c±@ àöûýÍß N­\¹òðb·ëáïÝÑvL;òuh¶ä:õb^L¢Ë$[Þ<têÈ¡¶u±Ö«#¸=ì±y©,F±ßL³±É>>ÚËÅ¦|rü 
SôbïXäyëzÛ²Å·ßñ]ÛªxîéØñÝNÌûÕ,)¯x¸»;j«l¾0ß7gfÞj'qù-­3ðág:Uj)v°6`òDòiCÌÏÌà«â}3ÙrÚõfíÂÌ!éºÚÜ2ùGg aàÞ^?ãG>©ÖzYÿµî;ß/È³<Ûó®	±¦ÍÎÍ6Íþõ¿þG¢r$1ñô£·[áx¤8²_¶yQ±Á
ÏÄãl|Þâ¹«L<WúÚ5âqH¾ôóøÇÃwØø¿Ò0Â'¬ä3¾Ösl]=¨²¤Ðú¢äñè¹øÙ^ *§&"ùz/ñ¬Lì[4é{Î7Ãjy µëßQ×>ç??oûZº>$±áxgÉ¶¹Ûô LÓEß+÷Ï={ Ni$_ïAf¯Ñ .aGyÍWïÂW·
ÉÍÒQí3² @¿ÑülW¸Z"ùÒ×FRÍ½CÇ:ç½¶þÒy ×häbí&ÿèÌ+­®à»@\ {|<õÏW¯W?vºÖH~^88ä4Ø¸+´xÙØ7Ê
í#¦ª¼o:ÝÆ~·W80ä¯ONonñ_ Y¹.|XÑ	È´K<TççÇ.hÚ¶5ÿqy.ï²ñÐì"$_h29~ºëÙ¬¸p×eäBò%|.fÍ>æº¿~j¯ÝèäKù¬>¦iøÁSgÙZ5t(($_Á"~ô~<Orµ;îÄ³å·mO<æ¹dHe$_k½©ÕÙ1Ü3ç½~¸èüQ ^gº/Áä+)°h6¹íaKyÍÉõ@<w:/Áäsö1ijé²0©'þéü¢tñó|I$=ÿ?ïZÔÖÚ«ÍF	Bò¥´¥Ë©Ö|FBò¥¦¥ËÝ~[f¦ÙÄ©¹Þ¨aRH¾ÔÀôÜì[pò¥Ã¤|)2¹ÃÛÔ´tûÿÛcØ0)$_È§& IMøáÚtõó|I"R@3ý[`¨ÉPòE(H0)$_ÈgµðräK0)$_jÀ¶³HýÑê
®M0)$ÊSz¤áð¯çàëö	¸ÁÖ¦a/5ð¼³åÊ.¯°-äÈaRü,"\íZÛZCáì5ý dù24»$äC ù$É@ ùH>ÉÐ5þO wîG'F    IEND®B`PK
     8NÑBçûä  ä     weather/weather_1.pngPNG

   IHDR         çà   tEXtSoftware Adobe ImageReadyqÉe<  &iTXtXML:com.adobe.xmp     <?xpacket begin="ï»¿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:A0ACFAE8474E11E7A3E9BE6F79A280EE" xmpMM:InstanceID="xmp.iid:A0ACFAE7474E11E7A3E9BE6F79A280EE" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>hx®  TIDATxÚì	tTÕÇï{ófl3YH !$!JJiR+ ukQQA<¶bYÒ`ÊÚµZjÁrR«UªM¡PdK@LÌúæ½~wE¶Lf&oÞ{óýÏ¹g&Ã0óî½¿ùûîÂ*
¢ñÿe±ùPñÂBøP
ð¡>
áC!|(ÂBøP(ð¡P
áC¡>ÂB!|(ð¡P
áC¡>ÂB!|(BøP
ð¡$@öý£M°PÁ}.@>÷7XxO¡«®ì»k÷PPôPt+.¾ºÄ2$=+1èÙ|Çä°,Æ²ÄÄÆI@ÚE":àØâáÅÓ.·p¢©?ôÉ¡Ï~Tvø0|ê#È¥mÄ+¾ðpL8ã33ûô91k\M{ÉÀÞ a¬h?ß'ðAÝûï·*_¨8u
^vA£®À>¥Á´ræQlëÝÒ·þ.ASÊ0=çDðïÝz÷k³ÙýÑv;¼Ü5Dø@Gã6ó¬IYÙKÎ¦îÓ&u½ÀM7iñ?ûÚW_ÝÑPÐð©> /iÆeõ{8#U;Ælñ®[½O­<¾fó®ÆÓPßvOEðtFx0Ü~Õ=Åy2å2åVOÏ®u=7hÊÞmð§êíìiøp¯ç3Øä5ó:Þý|ã+r^½>zôzéuc¶«PËGó¾-Ã&)4/¬:+>{àXçÜ¡Ó÷ý)òhùcíÃ{Û+G.Úß¼^Iàù¡ë½²È\N¯Ö#6Äþ{g<Ö»§üÊÖdn¦ëB¯ê±å»²ó¡^æX>Þá-xæ'¦çä¿øhþf¦:õìõËè÷º-õ;.¸á!xóïíS°ä¡¼?k9¦HMuRÉÂÙ¹¯CF|'Ôóh¬ D·ð³&eõYü`ÞvµÔ«°ìþ¼m´±¾èÁã (Ï\=¯`=Xj®+­­'­o0Gøâ,så+Ëhl¥õ¤õ¥õFøâkõ÷ov·Ò³ÚH²àÿm>%Úh/8oÍüÂAÌ/'bý¯(0½LëÏ0á^¦û&f.SÚ r¬D'E@ýéÏðIkõn¿jj¢Äyÿ®£í Ö/¢Ù9qçëp~EÏÐÖEÐúÖFÖEZh}}Ä	ÅyãÏÚÐ àQ»5Q;| ËnîSó3ïöÃQLFS?­NËqÏÅôL:»×êBâ¸y·{=Ç³óÎ}á[ÀÆïêÌñUÏB;Mxø 8.8 _±jMÁ·NHMMm0JXM.Ü¡Ñx]à)<ç[ë:J4û¦í=ÂzN'|Ð²uµ×-Yò@w¬ªàèhðk^¹zmÑï~ÀtXµXÆ¶à³|Ü¥zõ!ö*Â5nK(½+{}¯j!À×0ðÝª);;'u÷;ÿÚ»OîµZmaO%S`õÀ%L8æu$Zû³¿Õ+º&düêU­Ç@QÕð +;.cýÍ¥§gÐ¬+µe.eõ.×È¾Â5ÿè6ÂG¸Uàç'sJ¦ì-öªÀ³¥KÛSµ÷InF¤©~÷­OØ¢2>XÁ7®¾BÐéönüð6ÏÎû5ÎÐ Ø>úxÿÔÏÖ~ù°Tàw£ª½Dx3§Ç íO¹Iuðõì¨EäåB°ª K7ÿâÆVÇW²²ÖSºµÈ¥wß2â*\Ï­jâO3cBÆ8ØAùn £ÃæOöÞ¿xÀbøUYâqÑºÜK»b'Ñ^I¸Ýª ¯ÓéÛe¹é£àz»z¯¬g2Ó¡4«Õzèðåfeb|-µØ#?TQc$î>ó/i$Ñ×.%±m%»^Íhp¿F0¤«¤1x¹OÍ/<ZS·ÀðÄóÐQ|j)qNU4|,KRËcØXT^±ixÙâ¥okµÚâø_(Ix"òÀW ÏS4ÃXÀ-JeÁGÁÛ±s÷S¦N3x+,î20¦ÏU´¦ÅÂÂT|!ðÆÞ¼%^E<-ß7q ¸
^ ¯P$|=Ûf
)>ãmÜ²í o3a"³ö|T@dÄÕïàû)>½ÍULÌG³Úg.*ºíÉÔâå×b\¤h&ì*PÞX FCÒÂaKéÒ¬ÖLÈjwBr1@B%ÆíûY×	b<|?QÊ0ÝóO3jO±(õr·|æCO¬+xAßÎ,Ø·@1aüw»4lñ/¹úðñÍËê²âSÇ>ý¥ÀÇÉ>Ó²å«æææ=MpÀ°äéõ"èzÉþ:éÆãá¸xvzºý¬ëï:n°ìÉqù¾e-_ãbÌ>;tä>%' ïÜ5ö'¼õV7RAmø4×eËëÿr#Êéj<½fCÏieÛZ>i'5|æí¯ïÇ²lÂ-YÁ'rÉÄu¿lËíjIg¾I¦tì¸t«Í6UY¡¾¼,?ûµNÞÓË²µ\n¡±N@jøÌ·>.¯û¶
3{¡kÒÁúÝ'Ëöjjã?'/e1Íj½Kyù#|Ú÷dÙZû¾è8 7øì?8b=2á"BøÔqçteüoX	iýü#áÄ|RóÙ[1#ÕSk8¢ÿYøüW'1"$ô5ÁØÊÃSOçÂ}°Î£=~=r\ÃÁü`â¤4 o(Q¨DF~oEFsÞßp´°)~ËHïäQÄ5Ã¿nu~A¸æk}ôÄÚáz»÷só^©à3¾øÒ¯n'¢)QöÊ¤ê³÷Oï¹DÓö>ÑÕ¯Ù«¯ðmÞÕX.|R¹]êr·å»AÉ'W×­ÛÖ´ÿèN-B¹îXÀétºA·DùÖïbn·ì¸xr~5unÿq©á¾_
ø4Ë¯ê«°;j.A®Ã.QCÈê7ýâ°1¢©ûtª-;ö·p]®Tðéo?á¢iS¬ª÷:ô9ÄU´ðéÝmlõnª¬jmw{4©àÓÙléW©ÆB¨Ðõ^hµÄó'ðFã×ê*ºãr%s»:½ÂWA_£i|$Ä[ÇwþÒ.ß×Ôê­X²þäñîn.	|Çe©Ê2ø]¯:c¿ LíßQë2±}ÁÚÚÕð´Û'QJÉFê\Êc¿orñôsÑ;~ÚõËuoÔÕ]«'|Ñ$ïÌ@¯õ¶sî#äòÿ2íÓ-ð´=¢>Utt¿AÃO' Ë	¹ÛöoyÂé»àJ?ãUiÐ=çy Y=ÄýÏ«9|èÅ£Õánþ}©Ô­§Ýîèt
j n>M¢@èûjû)?ÔáÌQ),<>J½Áï~%þzfO+¼vä(Kð;YÃGåQ½K"^ýÃ/4ÌÐð,Ë¦þáµ7~J¢<m\*ËçI Î«^ ýà}íÁÒÓ3¦(ÎÚ>A:I(  Ú\p¼oRºkìÇûªoûIã>çëI)àÕ +-úÿÒ7¿ß"óÆ}·»$ *ý°Æ¨ÇÅ¥×ëdgçÐseÇnoÚKP4&"Js³þOW·éöÅxÐérz¹ÂçÞý÷]y®½ÈmivïzJIÇ]]¸4Êjsðû Hµ=2H24þ»5Ý¯t¹\g¤&»nCjËGÅ{<C$á
ÞåäýóùH³tã²Iw¯¤ÏY_wz'Â÷u,H!ô¸LÓïõCç£	4MR¤IßÓóæ¾IàNGz¥ñÇt|à{còoÛeÈGz®/Ãødcú÷DýßcÞåB-¯N®ÊQ[sb+Ö-`üÉ°L!«¨ñ}3yÕÓEl}=ôÀøÜ9á£ÛC¶¢¶f½*s§*Ô%äËW,wËçýZÿý¥¢@AÝ$Â1\©áëyïôpÁØmêÏç;K"<Kjø|ÿ|§²©Ùnÿ#v:ÄóüW$Â½Öâ±°§sÊäI/	Ð]§|9:;0¶À|¾ªÿ|dÌwvòuüø±wáÁ­l÷\)æø+Ô%GßÞC <ÉòÉx®§ulúý«F³ô_¹Ýî½ Sîëv/
ßãs9xêÔÉHÂN·R¶ª|VN"Ø£En7$kCsÇfÉt3v§r	cCV¯!ÒÏÃ6cnù¤ì5Ø¥ÊQCCýï£±z²¯Ã-º¬¶¿ô¦àðb¬^ãÈ«¯\-|* vZôÌÑK¦Ý~ç]¯3cÆ.¯jkN¬D£ú-ªXx_? vìÜ}ãÒ·ÐÅ)ØÍòÇã9`K6§û´Ð¿å¾WKw@lôý[Þ÷ÿø!Þÿè¸Þï~»æAÒÍ½aùÎµåÝ}Ï´m8ýJ>¡ÞÁês Öû#5¡£±|kI+ ~
¿ lñ´ZmìûøÊÞÔTàm;<UZ¾s, );;Çöég¯0[,ß[(êìèØÙ+=y<=ýõ­,ªù.¦£®îtTüþ/1ãÀ¸·+^çùàE+Ù[¨°JËUWlX²ha©Ëåª"x;N¯µ¥e373^ÌWÊÚí^ÄÓmÌï«Ü¿xÀÏ!É@Fz$«uÕ8þü¢uAð.¹YjÝîE@uA±_3ì­óF76Y®8¶òz½G¶lÚ0Àû-´uÛåÀK(Ëw¤[4JÇË¨Ø¸õ1«Í6aTÄ'bkçhjjÜpõÐAËZ[è]§pþ_4O±ð¡²âÊ÷öLÇ{µZmfÆaËIEåóË¬^µî£èèNbÐð"½'lZ¹zmÑï~À4&¸x¡¥kkkmÝ±tÉ¢_­]óëºH
ïBéà9Q¿bÕ[o¿ãöääïètºº:IcÎK_¡Õårí?Y[óçï½ñ-p¯í]%_ônNR ÍÄ=³pQ6XÅk!F,1Mý´:].XGÈ fÓ\¥èBÓCÏ=¡Ë|>nIÜv¶mïÛ;ÿööc?}è	¬4sB»Çdù¢á¨Ö!¦	¶ZÚCºG"\_ÛûFøPq£²(TÜ\
ð¡>
áC!|(ÂBøP(ð¡P
áC¡>ÂB!|(BøP
áC¡>ÂB!|(­þ/À æÎ¯xÿïãO    IEND®B`PK
     8N/¤ã  ã     weather/weather_3.pngPNG

   IHDR         çà   tEXtSoftware Adobe ImageReadyqÉe<  &iTXtXML:com.adobe.xmp     <?xpacket begin="ï»¿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:F733D381474E11E784089FACD3D27037" xmpMM:InstanceID="xmp.iid:F733D380474E11E784089FACD3D27037" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>àQ  SIDATxÚìleÇ§ûÕv·í.õúm±P)\{õN.ÈnèarxR°&ÕI¬)À$©m¬§½;ï"b@X/G8{x¸VÄ@k¯ßÛÏ{zµtwgvg·³Ûÿ?´ÝÎ¾3ó¾¿yÞçyæ}ßÑ	DQô{Ó¡ú à ø ðA ø ðA ø ðA ø ðA|ø ÀA|ø ÀA|ø ÀA¾e@Üv3h3Ju£>¶£~òæ¦m¶Ai@U >^ê*\E¢1´E3p¥¥¥¶Í7ÿ,)))Ïl6Ï4wèõúxNg¦]cG]36àv»ûéw×ððpÛÀÀÀµ~úéÙ5kÖü»­­­O°ö°|ßAÇ ÇÔ:RSSÄÆÆþÈ`0$²tãÞk£ %0¿Ù¾}·ÕjÓÒÒ¢ZZZú¯vuu}xîÜ¹c´ûYÚ­¶^qØIí0Y,À7Ùf³MihhXñ03O²zAYÆÖîîîwÞy§º¨¨ÈIõ°Å|AÇþ¥¼¼<uçÎ Ï¦NÐéÔ=_ºråJí9sþ,AØø">óöíÛ3vìØ±}Ê)Ë$+'ºvqÔÏ±u"Ê¨+ÑC9>ûî;do\½zõÅ¬¬¬%{_ÀGàYòóó§½ýöÛON6m5ý£Õú¢±±qÏÂOJ>aÿdJ-DR a¤-þÌ3ÒVøÁ	VæÏÿBggç+ädÑùÆÁòåck·xñâ;;¶¢Îej\[ÈBQìºpáBå¼yó^ºâ#ÂòxÖººº{N<yÀ+GðF®}íííHIII[DÂ:¾y,N§³(;;»Bë]¬ÜË¢èÏ>ûlvEEE)]SS¤FÄ0£YKssóäääõ#¥aL&Ó¯gffÐµ' »6Àû&a|ëÖ­½v»}M¸v³¾¤×ëï(--­KMM]O×ü÷HÐà1hæßÙl¶G|õHõ@ëòåË«ßzë-îÿ5êzÇhàçÌnÀ\Å}ùåOx>¬åØä±¯ï23¾ëé! ô÷÷·ÑF~4çv»]CCCÿíëëû¼µµõbuuõ{´ßM	ÄÞpÌV©/_¾üùAÛ#µ«¤)Æ½½½çÎ=[·lÙ2ÌÐ+(¾ÀÀ³:ujÙ¢Eª¤`ò"ñú7þ¶téÒ¦¦&¶=Z0,à#Ø¢7lØ0óÀGÉ²-ùî¸yóæ+yyy/µ´ôYóðIFBww÷bccóâñÏ8Óès
'
06ñ`ÏQQ6Ñh¾dÉ#·nÝª¤`-Y	yMÃGdª¨¨ÈJNN.1ÂwCô5¾+«l~"d·Ûinn~¹°°p:ýmF·ë¾ÎÎÎÅ²§úÉîÝ»¯¬¬¼4Q~ fó|üPýÌ3¿0Í /o0¤ìÚµëET×'bX¿f-UÈ4Ëu|t Ô@äóGN>}=ÔY5éó±Õs:+	¼ü"OõXßIôâO2Ê<íëørÊÇñcE{+Wïè±|ªãÌ'NâÀNÊ,LúÃùóå´{Æ=æn?õtl·`Ü>@÷/ÐÆ».QIù111?¦ ¤Ô>G¸ï¾ûî½&if"@Q¥F¤,÷³	óÍ7OSý¿OÝoß¤ôùxF{{ûqqqdVøx3Ä<í3v°@ ¥`%ç6v¹@®à­¤6ýzÒu»ìs8UÀ=¼ä© Ó/ë³
+(Ü_É¹	2}F9eÊÞ¨·uéÒ¥âPåÿ´ÖíÆ>ÿüó¿ÔétF!ÇèiY3fÌ(¶Ùl<©wRY>R4ù	:¶äýÃB<zú>øU(&/iÊòÑg¡Èë®	lX HJOOçâu´¹&|<lî¸RãÅ¡÷58ÊCPàÍá|3¹Á¯ HðL\xÚÜe8¼ÏÛÿ¿·gÈýEmÒÌ¹Ã:@gà{JKK3rrròÇãl^Að¤¸õ'¼KNp!È²ÇóöÿÛnØ¢¢¢ß¬^½:ñ+ù<a©ieÿþýw®]»vÕj]*Fäv»{¿úê«×òóó«ÛÚÚ¾Vûù¯a¬yÅ)555Û:Aåy5(^555u]sssÁ©S§vS»Vs{H-ßÈZyN§suVVÖF¬¦¢ÃÆ
]¿~½&##«2;.d>îc:¯Cý[oÆa³Ô§¥¥­ã§O,Há 1,º]îf÷ìÙ3»¼¼üÁ`H£»¦$LÅOêëë_(++ÛLíúE Ï¡ ¯¶¶öîU«V¤»ÇæL¦ìÃ¿èr¹ÖRû^õw`P}>¯ªª*¯¤¤çÚNA³E¹¹¹x êfàãÙQÔÕÞµuëÖÈâ% ©"S]]]ïÙíö-ÄA&ÎáSD>Þï^dËjµþüâÅ¼ü°â¨Áòù,ÇßIÁÅ£S"^éééeä×7òËnøª[>N©466>HwÄ}#=³ ìq¯}ä>ZR2®Nî1ý''ÞoÉ=?¥ÇU(KÖqxôùÊ+Ã×©®°°0-''g³pûÜOåç÷±s!ÆÎµp{ø¯
s{©XOó;ÆÎÃpØðÞÎÛ lnewã%wFÈr:«ÅRÛòY:ôùy\(]m@ôRIöo?%exÛGTx\¹çäW¬@9rfÔùúÎmÇ9sæcsçÎM;A§¦ÕÛ´iÓtÍV àÀ¤Üôz½ý7ÞàI²¬j©~yÉµk×v%&&>äãX¢Ìóò5îltYãió·l9ç%çþ/x¸¹åËý<Ja[ÈjO^Ãl6?,gN%«µ`Áiv»½@AH"'ðfw%çþ/Ç/Ä5Pz~¢öäe8êëërªTKLuuõròõbZrssÓ^p ðE§¤¤Üð ÕjåE<}Z¾»]îr/^;Õ±(ðH¨ªªåkíl5,iß¾}<ÉÛ.o¯ûï¿¶ûHð2ÿWøÓ§OÏEV||ül_|©!...ðAß¢£¹ªÏÇePxýRþ¤%üM3(ÝGôãä¤(B½r¿©"%On¾íÆD_ðT/^FL 
 N§ã7¦G¾(i2	º]è{\8+±ÑêéÍGv»ºõë×ÛýèZüµ$cË÷ôCôçi(ã|äZ¹õ×ò)Yå5úæÏïÕú
ûðáÃ_Þ×¯eë+YO|?j;nOíÿÂðõ]5Æøy±¢´lAéyµ¶¶ý	È¯ßø o­Û=P__Ï9>w0át¹\,Kª1ñISSS·j¤Zz?~­ÊÑ®èÃTêc
ÿ#Z¬ú¤Ô7ýÜ×ë¡vÔ,ûfBð±ºiÀï­åW«çååµdggl0ð>ÜIÛÕö÷ôô?zôè¾âââ}M&ReT/EÀý~=OQÀ[À'«Ø
òb=r&«6uR:Xê+ª |à À>
Bµ2)çýxfÒ0á¯tKÅaMÃÇó7÷îÝ;·¸¸xÕj+M¯ÂTüô¢««ËY[[ûj[g ~ÿþýóÊÊÊáeõÑtà§ñ:uêO6nÜ£×ë¥6þÈ_ìeqy	§ùdÑl§¦¦¦î!ºµp¹«E3E¦¨m(ùñv¡0ëÂ\þ ;§¨æÈµíy)òÕ$|®ººº¿òäÐTõörÛ
¼7¨Ñ.GAt§}öÑGý5ùó0Ü>ì¡ë#÷ñ«¯¾úú¶mÛ>$×ÿ!ÉQ
$ó¤Ýh7Ñ.ø ÀA|ø ÈAË'Ço5¢¼üç	TW¯ãX?OüKød¾fK~üÿFºòòò9ëÖ­»7>>>]§ÓÀzâ|ÚÛÛ¿8räÈûT×ÿa ýiË@×¤åcðzê©-[¶éõúh nfÍ6këÖ­3¨_£:ÿDð²¢Ôdòù¢KJJ¼àëëZropppW4B#ªëAE£íBáÓõkô¼ÙFóFT×W¤Èðqø_SSÓ0<<Ü4|Ss]súØv¥°£¯×ØFªE}¤Z¼ç{îS-Hë[$xK]-[<w "²,ßèT`  ø ðA|ø ÀA|ø ÀA|ø ÀA|ø À>|à À>|à À>òSÿ` þÿ¸_)    IEND®B`PK
     8NòxzÍì  ì     weather/weather_22.pngPNG

   IHDR         çà   tEXtSoftware Adobe ImageReadyqÉe<  viTXtXML:com.adobe.xmp     <?xpacket begin="ï»¿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:OriginalDocumentID="xmp.did:b4aeaf45-2b51-724e-a5a2-43b8b182f6d2" xmpMM:DocumentID="xmp.did:8C245E9D3F9011E78D0AEAA6D391801A" xmpMM:InstanceID="xmp.iid:8C245E9C3F9011E78D0AEAA6D391801A" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:b4aeaf45-2b51-724e-a5a2-43b8b182f6d2" stRef:documentID="xmp.did:b4aeaf45-2b51-724e-a5a2-43b8b182f6d2"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>å«ç  IDATxÚìpõÇ÷îöîÌ]C1!Ob¦H(Cxh`xd@m-MaZ;>ÆN5Öic:C[#XÚ%Á[¶Dv1"X"	!1b ËóÛßöèå¼ÇÞsÿ·÷ûÎüçöv÷¿û|ö÷ÿÿ÷ÿÛ]9Bù ã¼r,>XBøP
áC¡>ÂB!|(BøP
ð¡>
áC!|(ÂBøP(ð¡>
áC!|(ÂBøP(ð¡P
áC¡>ÂB¹E X2jJ¾ÜüÅ+ãUÍ¯	Þf;Â'vÈ«²¨¥M&#°Eà


b^}õÕùÙZ­6C©T¦(Ér¹\û©lòC@3X,½Ùl0=###_õõõ}ñOÕÖÖò Á¾úp¿¾ÀË¦%VîÔ©S²²²~¤Ñhæ°,À[;_d6LßþçÂÎ?ÿoG hùÂõ*ÉÓTUUÝýðÃ?ë&ùù4
8):::iîÜ¹ 7NÔÕÕýÎup-_X>:í3gVdggÿJ­Vß#Â@Ìb0¾hooßPÃ>¾¦mhhÈæoJ¥úåÁÿæ¾tÉ%M<¼Õ"­&6ò^ÈÔét{-Zô.7¤¤Ò´¤¤¤-,ÕÚutt<þ[øEså@ÙwuueffVHÑ
åÐ´999`Qþ2mÚ´iÏj¡IZIIÚI¾Ð/ê½÷ÞûaKKËq­VOI+8ù$ÍöHBá¢Áf×¼æææ0|3Ô-ÕÊ½`Áã°<r×ÖÖVû¶,')X@VêàeggoX>U$O7Ç:[ÃÈü.LÆù©>/Øà555åC%ý^¢yd!o¯Íæü#¹)ÿ¿#sÉ8qâ?kb`(¾\4M¤c^XXø¾ÔF86lll|ç±Çû¡læDRð/>øà¨B¡H`P·Ù`0;{öì0Xià!Gøü_ìððpuDDÄäÍqqëõúÖß}ÿ9'×%éçuvv>ºs+}OOÏ[iiiå¼Å¯P·ZHs»eË»RRR~\	:99¹ZË-KòÓ åÃæ6è2LÖ­[·¶¼¼ü2¹Ô!»¬¦¹¹y)7Qò Í(++;£âG¡,¯ £hùÃ7>>þ¥R(ùd;zè¡Uõõõ½Áêtx!·¶¶®Dðüb§>|ømXÔB¹Ê>÷ÒÎ1ãyDÇ?"]+W®¼k«§¬®®¾G¥RÍ@lü§©S§>WYYyïØçs_ÌÀÀÀ111«ÿJ¯×·i4G¡n®£ås,uddä"D% «VÏliiÉçìCøì¬
gB¡ETSÄ3gÎ$7ìµ¾ñôéÓÀ<E£ßYü>Û²>ÉlD$°ÖoñâÅÏÒú|Ä?ÂæææEÐäÆ#ô©ï¯««Ë%ÓüKü*6T ÔÑÑQòyß	¢r^¹råûÃÃÃlÛ¶m#ü¿ÄøÑê[-üÕ¦ÁÅÊÁÚME$D«§Ñ]ééé»?¹aÉ)¾ê´?þxªN§Û7gÎ·<ÑëC­Îzâ=DêÅ(°f4êØ±c,]º´ UOÑm¨-++[õt¼ÒC2ðð>ýôÓß{ï½ÛàïXÝô	BRqqñ¡äääC}õ@6ð.^¼øLFFF	/®¤ÀØÂÂÂ}ýýý?!hzã*§	¼ÖÖÖU^HWTT´¿   Ñ[1TvIçõÈ#¬X±¢ÚÐÓØØXsddäZXüÎÛ0¢[>þYÛÄåË¿àî ¤««øUzäHC³«­®®þÎX¶`ðñ|III'Í¯Øði[ZZVÀó V_hÜ|é¥¶0Ì
2ËÉÉy	­5¢7¿÷:t(G¨õ>òù5ÐÜ&bµIFrè»¯jýÄL×<õ%9ë7wëÖ­i`ý´Â§jjjÊcYÌ×r$O?ý´ ?@±næjgÍµÁ/0JR111yÌ­/tR	ñDðISÄßÞdhz83ÓÔìªçó.9ØLI30«W¯^æÎúaùÔYYY[/¯FIT'O¾£4ÁÇjµÚ,lr¥-µZÎ¸ù>±ð)JeZ>i¦ZN|rHXÍ·Gù.~CF|2¹\®FË'mA³4Âg=/Â'ñ;.>ï !xÅb1ºT	ÓYVaIWüGfè<l íÜ :¹×6/çrí{éô%íoFø,f³ù:Ë²ÑVí:¦#Ì¿Ï6c27V&àØÓaWøîâ3|ûe¡ù	ÜÇ}¦ÓïÅñ ïßÛu|Õ]÷JøLããã=iN@bÏo@slç<8ç§sq~Ê§Çä¼ØÆù£GGGÉ{]LÔÁ§Óé¾øæaÏHºúöÛoÛáÇågVÅp,0´µµáM²u"Úb÷ß~Ån£õ®âºópN¶qNÒÃ¹Y¶¸ÈÐ<	7ù±¸Içä|Îö³O·¹ªªê4üº|XÏNÄÏFñ#rGüö¯QÊ­óÛmgHlãØÃ>££	i³O£»õîí(Îá.->]½õ|àq²¿Á`èíg°ÿ mÍ.~pp°yÒ¤IËm2(³\ Ý~¶[û(2ûü_]Ýöâãl õÜöI´Ùî.'½£|¹<5/ÖDx8M)s0P»gWéµÙh[îÓÜßßÒÕ«Ù%oii9bg²Í|°8Xïè¿ÐýÅstN³øî¶yÌ.ò%4¾·çuW&îâ]Å »víúÇ\	bi<Þå]o!C§¿ÒEEþ E;¿	 ÔÑjùnÆÏ?ÿ¾,I ­E¨¤Kôüùý°<"ôjMIW¯^}K¥R¥áÍÐ×7>NHHx ²¿¨o,oCCÃ.þ!Ð Á6ìjõD·|¼"{{{7ÅÆÆ.AÛº.TùìÙ³ÿÎ;0Ô[>kßoÍ5{Fc7eW3MX@sÛ àö<*à[z+++wð¯V¥åñ?@º-½^iÕªUò¤¹û&³=LÖ¼5??##àiwø2L½%%%¥§Oî%F$$áã ?illücnn.ùÚµ«jðúvìØQZ^^ÞugôæT½xðøÑ£Gõyyy/Êår-V3}ûjýúõ[+**:I«åíq¨{ë;`ÃÎ;û|òÉÕju*Mé3ÊÙ©&~³ðÌ¦.¥Åôu8wýúõW¯^ý4µ=PW&_Eí·×Èw^çÍTSS³6>>~9#ÜÖó#/egåàÌù1ÈÙB1áê5/©,¦+nÒÆØ¥ÅQÙ»òèvçllWõÍ¹É·Ãrfv¨½½}ßÂ?bn}{Íç©<Ú?üGÒ§©ªªýàþ""""C¬tx© Þ]³ñ+ °[Îb±¯]»öqqqñß<ØíþQÛìÚIÈOxjkkgÑjµw¼4gàÝ´
ü6 ð² 3t'÷îÝûáæÍ;`Õ(çç×LÄ~ø¾E/@Ø¿'wïÞ}w~~~^\\Üe'´ÇªR]w{?ØjS¡lÍd0ÑÙÙù¯ÒÒÒÓp±÷ñ7·Q$ddEî	þ~?#Æfûöí/¾{Ê))`T*U#ùWrøG«Jð2ïOöEi6öÒ^`ÙFã ÀÖ7<<üMwwwåúúúkÌ-GPàêPÝç[/fù@å|¾|Íêæ/ery´µª[£N*v Î¡$¹ ¾ÁItËçg¬ç·pýÇ,×¸ys+ÁÄc Øe	iz}øÂªA9ÓHßåÎmF8¯1^Ìs£ðÓ¢Î­ßX=5_öDÅMMÚ$$Îµ¯{7?13ó¯$®­yÂÏ:Ó3âÏc-´|®¥ûéôä×ªR!àÁ¾e$ AÙ®³úçH ËdÙðIßúqB ´ã3xðVw]Bjúk0è%,Ãºb²M
 "|>Hð5÷°®D* "|xµûòFÎb áî®ÁOj âÃ3 ¡²Ëá·"@ Þzk£»y eä éBøÂd?~qÔÑ0 ø¥ðl ÜTùYÊ!]ºP+KlvéæÎäÔFJLFgöùP¾Ê¤8jÂnFá£¨/ùÄÌÌ=Bnh[/|%Ú
ÂÖO%@©ð Q[xn =£ð¡\ Ì¨ |@>z¡»é²ÿ\çsw&§®#ë®öt¿ëwK¥¯Áº(ÂG1xRwEøB<á¤¬N nrã$}Áhå«ÕóÖ	ôYáCù¢°sEøèRX9"|ô_«ð£ptEøèRX9"|tY¿°rEøB@áRvõp1pàRÅHÔ'Ï7¢KUà$Y'PlvQ
ð¡>
áC!|(ÂBøP(ð¡>*èú  âBÿ8O    IEND®B`PK
     8NZa>G%  %     weather/weather_24.pngPNG

   IHDR         çà   tEXtSoftware Adobe ImageReadyqÉe<  &iTXtXML:com.adobe.xmp     <?xpacket begin="ï»¿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:FD41037F474E11E78700D7B2426494D9" xmpMM:InstanceID="xmp.iid:FD41037E474E11E78700D7B2426494D9" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>$D!i  IDATxÚìpÕÇÏI&Ã#$ ºÇD5ò¸*Zº§xR]Ù«(U(è²ÍÑ%<§AWW(á^ÁgH!$DHBIfz¿3éÎ=99ýîà÷¯êJÏLÏtçôï|¯sºÛIP¨$IRÐ)!|(ð¡P
áC¡>ÂB!|(BøP
ð¡>
áC!|(ÂBøP
ð¡>
áC!|(ÂBøP(ð¡P
áC¡>ÂB!|¨(RLì,±òqw_ÓÅÁl#ÉfyñÊï]r0íÁ¶	aÚm¼4Ë¯»ðh~FÔE¡5kVß'¦÷ìÙsÛíNM¥³Ãá¼I¤F¿ßßØÜÜ\YWWWréÒ¥ëÖ­;zøðá«ðy#,°Ï A¬¨¨8mÃsÈ0nÈ!)3gÎìÚ·K.©qqqÝcbbºBÄ9NÚ.Ïçó@Ôz½Þ_¡MJ+++/~õÕW¿¼÷Þ{¿Ð6£óèÑ£¾Hô¨ ?ñO?ýtÿI&KJJær¹Riïu(=¤üNxÛ)æ`×H?4|qyyùsss?Û½{w¼_ûnîHðt8jÔ¨çÍ7»:ahÁ9UûKZ8*®^½zâË/¿üfÍ5§hç½fièÐ¡×| íÑ	ùùùÿpûí·ßp«a¡SÀTÖè®yßÉ|×[SSóí
.]z\°)áèèqÇ/Z´hð	2»ví:Î¡²Þ<~{Çs¶¸¸ø ìãHccc9@Øô £ðÆoÜ5bÄ©`åú*ñCû9·³eTÖi¼.è»¢¢¢Ü_~öú:8_´ÁàÅO6­ÿã?> »Sþ?ÛA¥gñþö5Íí¨5,;~üx@xvLÐ]ÃG]ì)Sú/\¸pzbbâPj±PXË¥X³6P299ÛX´`¼ªªjÿÛo¿½¾  à¡iø¨µØúäååíÓ§Ï¥ÅlXybóæÍ[
Ok¹âµvpÒ'¤§§?tCÙZ±)T÷ëd¶q0q¡Àúøg)øöÛo/õÀ]°`A:tÈÇä8 .$'ú¶ÉéÓ§?={ö °îz/Ð³·lÙ2%99ùnÞ*À0 µÂÈ»Yås>ÆãÜ/oýX[¬°ÀÛµ­ººúWXo°> ÏIÑxèS:uêä/Ã/ðÚ¼íp2êMð¿òYq(ðEªÈÜ)##£ß®]»~àý£ÜËZëQRË©ÍÞo÷Óf[ö3u¶F)ízÓM7=uøðámO ;,ñ6¹Z÷Æ³ò(Ã,x-¤î{Ô%%%ÙºuëâÌÌÌ[àÃVås3æòßWî¡m\¡b¹8³~"åYEæµQ÷ëä­#dg9òÇ3fÐ ¼Îl)Âx;vìÞ³gÏL&©0ãêjÛ1ÉZà¯×ë½¸fÍ×>ùäbhæfùÔâ­X±bA\\\bmK¤(`KFäj|«Õ¡$qÕ{u$Ì~Øß÷³Öÿò:ÈÀÑ£G¿yìØ±|hø I×pö~%£Ý¶m[¤À$<ºÐs¶dÉeãÇ¿E®9vË1^ôî'2M.DûQK>DV/±8Ôþ1#oé¦Øë×¯ÿÈÏÉÐ"x.È(î×¯ßäPÁ"«UuµZV²±±±xÎ9¯_Íð¹æ¦¤¤ÜÅæàjwÁIçÝ/ýêÖþ8÷ÛLAò!ú\aÃIð*++?Z¾|ù[û÷ï/SËdµk×®Í>|øå -§+¹ÐOY¿víÚ×'N|Ú¢6ÚÝn\~~þï ¼Öj$ü{D°NøïÈë~A"Áÿ&»Î»_?çªÛý ¸Èì¼¼¼<øô=÷Ü %­ãM>}ü}D<barÑ.y¡`<ºtîÜ9©ò¸zÔÂç;wîízXå¶Ë8µ²XÁBT²W?ýúxQ¥Êk[û ¬Î	/üæo>þì³Ïr ¤d8Aú<ñÄAX`²rÙ`­»Þ·oß©Ï=÷uJø\.Wï) 8ÀXEáVÛ%­ÛÊ AÉÄ/JT Y??/{lF:GLLLÏ[o½õ'OÜýþûïß v§±V÷æoÞ±o?p(ÜàN.®»î½÷Þ'¡#ÝØ6\øârssGºÝî~üÉçÜ¯Èºù9÷HTÀ"&jm¬
ô¬ûmçòU W:Ú#Gæ8qb3Är Y7×	Üí@°¿S©ãYiñÚ}xïÆÇÇß!Õ$xMð9 N0`À$0IÍú	â85÷Kq0VT+>3¿ã×Ú¯ã~ÛÁmØ>øþ÷ßÿÖâÅï àº0¥	÷£>z?¸Û¸`p¹ÚPÁSÖ!ôxt3¬E>Ä÷p1á, à÷«ÔþTG,øQT"+©WûÓyQY3¸£qO>ùäîï¾ûîUÈûË-»õ;MSÚdµ!GÂ¬Ü0oÞ¼©´cÄªÌÌÌÌ´^½zá£VH®§IÌ?Å@KìgÔU:÷èç ÷DþM>hRéK%Ï;jÙ!$8Öuæ·èã¤qrrò?Cø1±¼¼|Kuuµ×¡ ©Åg¡dµ§¬wëÖíîìììð¯ýÈHX>×üùó3à@ãD2îÖ¼åáÜ(ký\ò!ÌX÷	çÎùßºoAFËý¶U}Ã7ÒíTëxAZ<b!xl©Æ5cÆÌX?Kà gïÞ½Gk¹[äh¸G5«Wû%-çsÀäCÍýò}ªuúúú..2\9dfI§ %%%eöèÑ£»ÑÌ×
øb.]z;ôôÎÛðÉG; ôÏg¤öç7PûÓ6|¨ÕKûmª­­-·©â°ÃÕòïÁv] Ë¿´\ðøâ8ÂÈ¼ûå¬ï~%îWÒq¿¯0ý~Ý¯ýÒÊäß´£â°ÃÕÞKMM|Q£FõJHHd`[QáWRzÓs¿!Ôþ$·d°ö§¶ÿ6ÿX½6S]®ÿÛí¾í¡êm¤ìnøbgÎy´Ñé6FkDÅý$ÒÑy u§d©½½Ú_SSÓXê;r9Ecÿ~ì#<2z@»á³;Øì úÖ¨ú: ªÍVuÁ*µ?Ñ01Pûêêê.×\\Ømñû¤c8i¹¨Ý^øüVö«æTx­Â2[Qz#ZUÚìÞ=²Ü+F@Òâ9,.§²¾ôøåk­mÏJoÕÌõjzëÁ&<0¥ãQh iÄ­ÉWÆÃYN±tÈ&íç::uê<kÖ¬T½¸/ðuºë®»Rü®Ä (µ¸½²R#óþ¸Y¹zÉÐýr^~ÉÂ²11 ^«Æ®gýÂjùRRRzð}Þý÷'ÓÔþDÙ¯ÚjòÑØØxÅçó5Yhñ¬ÏAL¸Z~»äääÎðmXáx/9ÔÑÊ~ySDÌÍû´ÞHp³5'È.·£Y<G¨àÑÅårõÑã+¬n×ív
îÐÀúµ÷§â~Õ?Q÷GØÑQòÁ×þõæææzÇS£ D#x$Tðè
ÀBZîh|H6ºáw$=ëÇpá×q¿¼EKÉï~ÕvCoÊo744\
cVkG9êdø¼Ñ¹@-¬ðÁ?KÂ/5ë§6ô¦Uû#|ÂâEGDÅý6ËýU­Å³cÈ,W«!êl§ÛL«	p*ÖO¯öGþ´{#µ?BÄk×f_ànÈ;	DC'Qw®hXÌ¡\Fû53ïÏhíO
²ö§Ôö*D®6
G.qµjòcö¹Ý`®`2ázµ5÷¨ëBMÔþ$µ?SSS,bÑM{"ìjYfAòh9|Ô24:£îWç¢#aí×ÌûÔþÀåVt!3£±¥Oh¡ô ÷Øn¨µj1wÍ¯fLÈ[`µÚ0
Ynu\­m3µË«åßk§åóÓÚ.õ¬Sû3ë~ÃVû£#ÊoÕZmñIðºÚ6ÿ´×NËG§¶×Xô¨ý÷GÔjí)a¡ãÞZ]2$U!fµ­¯ÍÞ;%O<£®¶ÍöÀB5ÑyÈLX-ôü«&Fæý©½÷§w¿?¿åôz½×qÜ]­Uå-ðt/¤ë²ðùjjj¬¼a±¤±LíOmþÚ´{B4æýAÇ«¸¨½Ø'äBË¶®CìK'Ðúl³|Åb¬_'ùKÂUûcÁ¤²Üº(¼ØGïB%³dÃw¹ºrå
}ÀJ³mï/¾(±=Iå5?ïOkÚ-7DVSµöÇ[½(b¶lævjZ0K{÷î=¦Wý«åÛ¹sg)d¼ÕVDíÏ/º¨¨ÜÕÀÌýþ@>°z×Èõ1;ÅpOk<ÁåÂÂÂR½Ûf»Î×\[[{Ø óþü¢x.\µ?¬k}DËÅ>fc<£O÷¡¿ñ'=k	|/^<m{fæý`jjÏíà­4t­ÉäDÀâ0Y<#:©¬¬<fw9`6mÚô# ÍÖOÆÄ¾öÇ½ùUFLÚ@L©àbM$Ê'ñþöFËû}"-Ï6¶>éÐ¡Cêëë²Ëú	.:R-
ÈF¦Ý«&'^¯·tÜ«Ì´²Z#u¾6Û(¿	É×_÷ìÙSnä	VÜ«Å{öìÙ£ÄéÝrCRv¯wÍ¯yôÒQ\¨Y¢`Á3sÓpvâDà%]{á¯ÇÈÉ³¾¦U«V wTk!%Dûv»ª÷û£S§äm"y¼`G.Â\ðÿ}hâ%KD>úÝrÐ7°~ÄdòAÁk~ùi÷`õj¢ÈÕ/äBèj÷®^½ºÎý¯FJdÕIß}÷ÝCòÌ[ T¹ß!ï÷Ç¼ç':CpÓþõÌ3ÛeënõãÆxÁeñxð Ý¼6lØ«FOUðItë÷%±Qûý©]t$ºÉ£Ñg}ø!©z?''g÷üùóÿýòåËÿK¥åmñôÊ)«,UUUÕ¾>øà¼Ñû1[	_Àúåææ ëÐ`õÓH>ø(#Vu¿ìö×®];ºxñâ#Gm<uêÔù¬¬¬¯¿þúÀå|AZÒíúnÄâ9¬²xr§¯_½zõ{°jj>§ðI<ÿóÏ?ïõÓ»ßè_"rÉõó@ïÞëý,EEE?=ðÀ¹;vìXYWW÷}kãFð6eÀÅ£ëeeeìß¿¿ÄÕS3Ýa}ÌéöíÛO³?åÑ¥­Î>ÍR>±"x¸4û²ûÔÉÒÒÒ] Ù
hÇò^Ü+W®6zôèløû[ãiZD;ÁÄ«øþûï_T]]]böé§?{ªt×®][­¸¸Èdò!ºÚ_`ñx<çfÏýx²%ôÁR»|ùò/Ç÷ü±cÇþNNyÅxFóa<ÚPûöí{Îqy0Ýµã©þ¼¼¼~-îWm]Êq`ýÆs!*3²oúxXj,X°wâÄËÏ;·Y¾Ä tk^sa<¹ üß/¾øâQéå¢lä!a÷îÝsþ>Ü/÷sáÓÇöÖ9söx+*ÌOÖ¦±2dÈ/½ôÒä=züÛ«%F ·«åÊ3íÀ«­­ý3X÷ð¾nÇi#|õO=õÔõõõg"lý´õáç]ôùóç·xû)xÁXAÏñãÇyøáÖ®]»´ªªê ë¸ZÝë:¬ñ´Àkll<³ZI¼:|täãÂ/¼°â 2v'¼èHPf!¢¬./_Þ3eÊmpÜPFÉwîÜyú¾ûîûÏ-[¶,xDÃZåju-«swbÚ6¹DcÜ\±_ÎÌÌÌþÏ?ÿüÈSmØ÷«tFgeeåç'OÎFnS»
ÆíjdÆ	«V­ñÛíDÂ?-*¬®À»ðÚk¯ýKQQÑ9Zç¤o:´CÁ8¹£Fê·bÅVÃÇWZ­=Z»øïÂM:u;^8ác ¤wsJÈÏÏwÛm·=ÛG¤®öÇ+W.ß³gÏ/
x¾À¾!øN[¿~ý)))6(ªý.Ò¦÷ùá¶Ì;w«7|q]»ví	í1>--m|W[,NVKjjjöÏ9ó²«mûvTø¹sssÇ¦§§?ÄdV»_ÅúµÂ.¥äÃ?,\·nÝI­äÂ*øØÌ,`¯Õ«WgA§Çb/èr
tÆú³gÏ®6mÚ.\ xíF0:4|p¢é#Rc³³³Î1ãÁÎ;ßa§û¥Ygiié>jíª««Ëàx4h«á¤ÇèÎÊÊº	ëÑnÝºÝ¯c´«mhhøKaaáë?iÖ;<|T  Áýê«¯1bÄ½qqq½-¶~tþÙ_¶nÝúÉ¦Mf´vÀÇ@HÛ$áÙgòôÄÄÄl¬j«¥àäÉoÏ7ï -x×Þ^ð)c\.W¯5kÖÜ1xðà1ösíÞÖãÈ§~ú§¼¼<z¥Áð¸ðññ²eËþnÂ	Se]atµôÂ÷3àbwäääü]£c»®àc ¤·Uu-Z´èÖ1cÆïÞ½{:XÃA×nä,ìëØ;ï¼sìë¯¿¾dºHÂÇC8~üø.\8bÂ1ÐQÈ· 5eñhYÓçó]¤SÄ>ÿüóÿyåW~¤ÞÖ(t×5|´ÁiãÆBàÛwôèÑ}{õêÕbÃ> cwúDshÌ8úU¬^º®ã*]hw´aÃs§Nª$-·oh}JÁo$áãbBzÿë¸áÃw_°`ÁÐNéà%nM¡I¼)ÖÑÓÜÜ\°]õx<%W®\9µoß¾ï!£ï¡ª`ÜÑ³]SõAÒò`eq¶#ìu·tñ1D®O9ÎÉ´h¶2Û&Í2tþPwÌlE1¬¡l"¨Öó/ä%Ð P
áC¡>ÂB!|(BøP
ð¡>
áC!|(ÂBøP(ð¡>
áC!|(ÂBøP(ð¡P
áC¡>ÂB!|(BøP
áC¡>ÂB!|(BøP
ð¡>
áC!|(ÂBøP(ð¡P
áC!|(ÂúÍèÿ LØP?Hé;    IEND®B`PK
     8Nã?»'  '     weather/weather_18.pngPNG

   IHDR         çà   tEXtSoftware Adobe ImageReadyqÉe<  &iTXtXML:com.adobe.xmp     <?xpacket begin="ï»¿" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="Adobe XMP Core 5.6-c138 79.159824, 2016/09/14-01:09:01        "> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:0236C5D4474F11E7BA6FD70D91EA4C93" xmpMM:InstanceID="xmp.iid:0236C5D3474F11E7BA6FD70D91EA4C93" xmp:CreatorTool="Adobe Photoshop CC 2017 (Windows)"> <xmpMM:DerivedFrom stRef:instanceID="xmp.iid:BFAAA713474D11E7A36DF4B7D635BCE0" stRef:documentID="xmp.did:BFAAA714474D11E7A36DF4B7D635BCE0"/> </rdf:Description> </rdf:RDF> </x:xmpmeta> <?xpacket end="r"?>Gf  #IDATxÚì	åÇ«ú{f9EAt/L1cÖx%ã]]×¬FMBÙU³FôI<²&&FE%Dw ¢æ¾§ï:÷}»¿êùº¦º»úiïõ)»©©®îªúÕÿ=¾£x³LUÕ´?ka§ÙX333f>f>fÌ|Ì|Ì1ø1ø1cð1cð1cÆàcÆàcÆÁÇÁÇÁÇ333f>f>fÌ|ÌF×Ü°TW³ÜÐõQx+Ý»õ=7¿¹yÃ32Ù7¤ fcgêEÞõÓëë~¡1	Ûvìj|èôó¯yMUUY.Àsx7Ñài¦(J¿«fñ\¯#}ÛØéÍùÅããÜì|QH4ýª7¨£Cp×N®þÑïDésxÒÝ1/»ñ<|Ë9qÁüY¶ê	¶ò2[yY±Õ]à²:vKAËât8¬ÏÛlðoð?EUTXÏ¢Äá{Ü$ÉJx%Ö+ODQ	D¥·Pîèìgü5|ÁPe6Àôïü¬iÕ¢ç>«ÿC($41øÆ´ð2©¦jÒòsNsÔO­uTU;ËJí° cöðù·¤"H\R¦Æ*Õj¡ÿmqw#ûÀÏð<ÇÓõùµ¯OèìêÚ:ºÅæ­BéÔ%2d*0Â¶~8Þ¿ÚüËéXDÿÍëõøò5¶£a5«9çÅÎys)¨\SPQ^â,).t2qhFûPLR`Àíx0£íqh!GJ`Æ ±Ê¯ð[,°Øk'UtÂðßARûªÛ;ºC{÷5ÆP0ú ¹xðä{\m(Þç>ÿÚõo¯¿ÆE¶Oðàð*[NY8¿vÉ)êk&M¬,$x¸Xxh´÷Fi°ÆI¶­¼Êjïõê@võô¶´6nþØ·»ñV¡à|ÃK!Q:m	À×Ë¾,wñeõ§-^PZ?uRLK<Su éAÑ:ÖDÛA;âwéþªÚÓØ<ôêëïyAÛp7f]³½j!ÇàË:ÎºbùÓÎ^zryÃÔÚ²·ËïbÉò06/.r;.ÏaÛn³¹À5Ú-V«tGÄW;¨»a¢a%ûF$CD¥Dø·(ËJHe!üª*AH,ð??ôA@'¨âA«WXLz"Ç¥(]½¾Í[·¾¼þf¡2náCàðØ­³Õ|ÿÚoNø¨ª¸¨ÐïBBFj/-)*lµ²Ñ2ÓQ
dIÊ"	cÁ%¸À ÛaÀïöy}ÁÞþ~QÄDJkFeV8Vn`ÐÜòñ®¾?üù¯ÛãAÈàKºÓÿå¤)Wýëú©«  a	 ¢M E«Ð& h%&ÀáMB¤¨å6¼/ÜÞP(Ô=äñuõôtRí'Yh p~ôi÷ê5ÏïCqÔ»c_
ÐA¦:õÛßº°n@GÃ×@x7Ñé°WCöèÈJ¥ ¢ÙmãBq'(I½~ ­»g µ§o 78P¿Þëõ^ëýç^|­	®Ìà3îû×^Z?¥®&
¨[IiqQ]Ak2¨_þs  Æe³¡2Úáßøjkl¼ëo(ê|Z)Hd*ÑÄu2ü_"".d5
àJEx/ÐÅál¹iÜâ9ÇëmîìîkeÒo@Ç±ú#aËáöU«mk>Øz]1/A"1©¦ªögw~¿nîìéÓÂÂÂ²¢).«Í"`NT; Ë	4¹`[¼×O*ªe
¸î"& p­ #,á×¼¹7«/öy¿hmï>ÐI´«5O¯Á@H\÷·÷Z~n]Ó\jqÅô,g¿óÖkçÿå¥ÇK- Z[\T4Ê h. ­ =ìdË²Òd{_2f~¸Ð~Hü #vL÷P{¼¾¦öÎÆ@ pLuçgM·¯\µ<'%|ØMç{µ«¯øåiç]½Öù Â@¦j×0­¶î¡ÿ`ÖºòòÒî9ÁtX v ¬¶Ó«YÞVH¼ Z^xã!®;íË;o_kG×A¤D­/zÛ:ºúnûÑ/ûú§zÎø1/nÿ0 Ð&xÎë®þzÄvKê&O<b¹9 lÅpé8L5¸|&dÔTaEO AD9Ý}£¢y¼»Û:zöØIÁÓÚ»ºûnºý¾}©8ð%íðu¤ îÃ%7_yâôãfÏ¸Òa·ÏÀuq@Kô~´,pÕ$×K%! §`ô¹©àkÉUô=dÉý Ô6 q A,£¦mí]ý×þûOÁP«Ùcø*=7¿át8NÔÿÔokÉÓ¾ðõÕÌ¾bùu·Þpåü}Ëé8ÄoTNÍ´¬1°X	öCédÐØþIÉ®®ÞÏÕ°Þ~aLã]ûÝ|ÇÛÌ&!cÑ«%£þa:Ç½wß8ë+ç¾²ÙEÅEîÅËUèn*úÎ4RZ,ßbÑÞ¿k¯¤Û_.²E[´ÈÔßÒWûAñUw9ìZø1 d=B3ûæªee%Çc½½£û#Qi§S>µ`þ¬i7\sé ü¶FìE¯1_åÐ¡Í¯ëûµ¶uÝÛ°àAù¼F¼8ïÿé-s.øÒÒÅHLDbÓaËG2V.Êiï5À`+\?í=e'¡H]½OÊÊb1(a'@HU¼~H,>¤õþ¯^vóV3îw¬úóîFb:Ç~pÝì½ø¼%p7NµZ-EîlVëD`É­sôÝk#YÉ±òYr¼,Ñ÷ðÔïÂØTë£×	b®Üð7g( %&+Ê ÀÔmPªáãíßn·UÔNª>££³gSHq'l%ÅE+øoïúÙ¯:¸á"{ÞZûÑM7X«;çÅSî½û¦Sk'UÍÃ»Ã^nv!¸«ÕZ¬;	aÈ(ØRU-Ë/S!Q4QÛ3¥Ø@x\±^ÕdçK¤A ð}ø¬¯ÛAÿy_ÿþædê-Dí/=óÐÒóf-UpbÝÉårNWN*xzØ,)ÂÛmS)],ÎïQ$YîW<Êqjv¶¶wnÑo«OHÖ<óò?õBÂØ/ïcB±üÓ¦ò÷?]µð9gxØÌ¥ºÝõ ÞIx \,øñ^¼¦0K>JL¿u»©.æv<n8'åRãæÒü8ÕØâCýÍ¢[F|¶¯©¬(;®ôF¸`;¸¶à¿zâÄd|Ùò<ûêï^tî²SÏ²Ûlníî*,t7¸'`»k¤Y,ì®ùîX>%ãs¤n|ÕAtSÍ	5L9&ZÊyÍ

Øl[ôÈ/**E ~«ÅbXÿRWSI<÷ðaëÄº?þjÙü9Ç,&wLø @ñ¦¹\KH§ðÝ§lÉåã¬KWköPí "B  4}N )µZ9EåîÛY¢»´Ïêééßïüº]ÅÉ~C^ÀW3kYÝ¦×ZR7iâìh¦jµàLðNÑ2Bídg!kåãdlê()WF	C¼ka@Ýðq'îoBÄ6^wÈ'OTëpØ÷A2NUR÷ðM;þü)^z|YEYI}ø$Ø¬p\ÉOÁë±4x¤.Ç§	¤lïój+ï2³Oå,ÅØ-ô~QÍ~>X%(JÐ Äcô»P¦x<Þ/ô®ÝÖT·ðáÝóÊï>³¼¬x*F¬Ø©Ú	x`ø
«Jt'Î¦<t
Fm.Ësùërã¶P`DÄ§Ç¤³}N,kO%©5Îïù>j¯?C¤+,«b>ÃçøË~½xBEi½Óé¬©%=#YÍVgà-zðôÍL¸Þ LÞdy# ù,o®¸Î+ÆÁ$û Ðû:Âöþdç»©Áö6âiU:òùþduÉ±ÏöÔê{Ï¨¯;Ô®»°GZ½HPg·UQeúÀ-úÏ(Ô¿×AÈ'¹pj Í*ÑX¨e¢ÌØ7v Fü~ÿÊËN¼ tA¦Ò_2f$ïàã/^±¬áì¥ÎLv:¹sèÇ©"&t¦Ï~
.:Oó·ª¹NL©áKöûúÙMtRÅ8Ñþ·oùèS|°yÍ:ð¹!Î»²¤¤h.v³¤ó,c)ìvû4êdðTc§î0>Õ¥4ÝY.ZxãÍzÑ[ðÃ¹í_tm
	­¤é/º.y/ÿÞ]o(óCù0ÁxãåÇ,wçÃW@õÝÃ§ P#ö/^4Eí/ãl( lPÖÕþx\O²cÄ&?""ÑUíÝ¿KÜ)"ò£u¦*ÊKê^zvÕ	õSkOÕ»YúB¢ò%8¹J'%¥HCyîÝþ½ZHÑH8D7¹Ø³hY%j ¾Û~ü©I#m£¥xO­þù¼Úª:Èb+óhñ¢¸íÎâ(&Î\OTH  Ã'QÂl×õrxãm `Y¹á&ÃcTÕKYÛÛ·nÁÉÌÄ×£í7¬<fÒÄÊ*·Û5Açæ´QöÑ¾x8±dÚ:ò^»P
¿ÊN["@ÕDJ?=0¥jÚIEALàzFQ,T[{gÏç7ßñÀ?ó¥½õÞ»o7£aÊüÓé,KP£S©¸NïÒTíDàáOYR>I¹$î~ãÄGgÀð³e.~ßÆD	©"biuÂÌ½×ÝrÏ&x+V¥\ÛéÿrÒÔ³.ID{ëºÉuRH<N§dª.Ã¢ÇXÐSPØ\ Ñö¦Gñp­	dc*²mY®i'ÅÒ².Ð«^'D|áxOeÿªG¿awãÕ~X.á³ýÇO·Z¬áïÈ/Sáj.Õ#óuððú8K:õãÔÙ2¡"YVn5·ª-ØU\Ñ n9ò) t	x'zñ/kY»ÏÌ ¡ÑÏrÝÕ_1±zB¥ñíp:Y.v¸ÝcN¹È<Úeã)õ³üýÉÐLgTÝs¾cÌ2 Æft µê <ï£kþ¼nÕ£ÏîN¼\Â½kõ.UQ	 ´À}/I²7R;6¯©F Ø/iPAj¦ÖO[²3}Vó+\oÄoÅëóöòu¯¼ÿ±õ/¼òFS:àå
>'Ð®ª¬(£2ÚðÉÃi^-¶0|Ñ©tYoÄõ*Ê Äe±Äý:¸ìt_â3P9³ÛdêþAJÖÆëkïxâ¸\ÀÛÑ×?øùå×Ý1Þ!5à3ðY¾zþåDb&,%iÈn³êNÔrÞðUPµð$7$þãMÆbébø,*\®Üpº1nLÿ¡W±êçôú;>Þ¾{ýW/»å]øw0Ó§åDùê§L.¥ÁÒú\.Wù6;÷×ëír:ì(ýF¶ÁÍ&ÌÍw§¦ 2(l>%Eº^YuI:èñ¾óË_ýn5Äw /Í	|%%E8Ó¥Õj%OÈ	+ çñú{KKxèc8EKí±7Hÿv$ª¦ê\*Iä¤Yâ£l6R³¤yWò#ª4¨ï]Ý}ÏÏ=õâßàcèqÕy	drÑVP4Y	 ~cqØ;GaM;¾R|Õû%(
Dó&?Ijæi	@z§X©±¿ù@ëÇ/½ôw\dîÄ¬9éXÖ$1°¸·°n&Óg¼tÖÛNªïNEè1¦Fâ*QAÅà3©tQ2ÛÍIÿÑÇò"!Î²D½Q??ðk ï);'OµÌ	|,¢M§
¯Ïwû!Ä)ºÀu÷fCºZE'ì/]Hsù¹\.ÚEx~±J®]OH÷nßÙøè¢³/ÿc¶§+Î5|j0(áÃ¸OÓVÂ¾þ¡C(êï@*mo+JRË0¤j(Zªê"Óê;&[2&Ï`SìöÊÒëó?yïÛVùkÿàG#ËÉ*|½}^z"§Ü¨Ý=}{pÚ.Xv½>H<¨ÝHÛo¼eIpaÎôb³ë4!M&Ë(B&à, Ý ÞØ vÍ}}oÿîë¿äêüÀåÚåç¤ý1SJfÎ6ÄR9íÅA,,tã`!+Ù£2Òªç£ÖÉZ9#äâÆÄä»²2ïJªm2yþlq³jnêð4iø¸5¯Ïÿqÿà§+ïì}v7gz@káä¼O=p¨ÝyÑgOÄgc&A,?L öìl tTvDªê¹68Íj@z8ÓWI$ÙgãÚbì+qÉýH»\,ÔÍ¦)?Noææ°ÏüØîo>ØºyÅe·üí­;=è/ðå$áhïèn?x¨­g8Þ#údÀ ÷C]Ý½ÿëøð£º`X|$#6ê
ÎëT%.(TÌ©¦§©;Uéis¥ãhJ£spÈû,ø|þÖ½õÂéç_óêÁO_?vÔÝ.hWwõìÓOHÒ÷¨ënnãøÈzÛ¥`0Ôét:Ü ráæ·XÈp.P?A3VZÈg¬zWA¬u"ÛqXZóÁDâß ßu¢´o`È»â<¿,Éû~òùûW=¹+|s»akmïòÌs{rMU©ÖÕ:\,æÃã4hùÈGÎïtÃª Ãa¯ 1GZ?ðÞý&qñûî)BìÔE(Rm	I»ÁÄ÷«qâÍ#ç²Xå°(É-$uùüO!ï×¿ùã«×<¿7U7{DÀ'éýÿi9ÿËK!¦sQn0÷EBAmMde($øA¡Ëá´»¬$-ùù¨PT	IV,ïµ+PfÒg0H¹]|`7ÄtûÑÅb&J±Ýn±±Þÿ=³öÅÿýÕÓe
^>Ãî·oÿAù¬¥ðyµV],Æø¸"#Â(üÁYìv{!º[T?ÎÕê¬«D£ÊæR,g£¸m<¸;âsðâóÝ*§(Ê 9^¬µx}=¨xè{éõzÿc;³^^ÃÖÑÕ;40äQN>ñ¸*àÏj÷iÊ_ñÉë¢(	pËvªêµÙlNK/°Ê$ðèzO@Hk<ì±øL\îX´J(¤ÞéÇK&¨p¬ta³mÑî'òÎÆ-ëo¾ã³Ù9 ¯áCÛ×t°²ZeÁ¼Y@nØËjðÑþ8"OT@ÁmÀ	°à,8ìv,ãpK&×¡ÅZÑZk¦|hÉ¨l>^aá°Eb@Q^|ÜªþÇ¡P§¶î³½ûß½ôÛÿµ1[Ý¡øÐvïÝß×ÖÞ%,^8¿Ün·ÙùØPïzQÃ¹	À,uØaäl 0Q>3	Foä¢KÜð´NÙì :"¹Â[¤«S(Ü¦ÈCø,5ò¼
7jºY3:ËTGgÏö³V|w}.Z-øÐ¶¼¿e{à´Å'ÇjjEèh¦|¬k¶HÀ4Ö®ôZüLÊAñY¦2è2@ %DK­Ó õ9?Q0Æh.?ÁÑ*]pZ3P¸p·*qÆÏÄÚ5ÚµrÔPÈÁAÏ/]týë-ï÷å¤Vw¤À60èüó+o®::¥çå³iðÈûxªÁ#¦ Yq_A«2bKX" `«¢í'K
HMJ5eÝ«D!S¾+v1òtqÅÀà3uÕa *'xCÛ5ÁMÓ@Ä¡[ïþßvînjùÉí×sG=|ÚE{wÓ¶î¦/ù?n¦«¸È]HÅ}QÊ,±Çé\5ïóZÝÇRãÃU}¢@¬×²\TFKïyfë#Ç\o5ÔêªG¡|?ÐaB±O¤A£bÃ³Ï¯ñÿY»/[íx/|þZ·>¿vC×hV[är9ºz)÷EÕqØ#{Gw¸ÝÇRÇB_ À(S@t±|

hô^ë§(Ñi ëÆcKfxqXr$`MbäéA`íØÕøîõÿqï©tmøòâñWä¶ýàº9g.YT_Q^2ÏÒ9@+AÔjáuåe¥sA=Ï§@izyz²Gb2}´©LµÇôMÔ½þîy¦Û£;Ú"° t(â3t£ýkýÅ_zéÓpn¹¾~öªG6|iÞpÍ¥3.¼à¬UðYW>Âh>B­³TUVér:æ¦	_<ãuóýøDÐþ @×
ÝåúèýhO¢×E§Êën¹ç·7nmã>=§,?ùúï\R;{fÃ4P¶Rª<ökXÑLª©úÀ:)|ô#Ý³ Mú b¼SkíXÎÃwRtû0ð­÷>\{ÍM+sînÇ-|<å¬ß¹üÂúóV;mÊäI b ÍfuÔTW^
ïKã!q`Ts¨1ÀàäH Ü -^-x×eK`gWÏ§Î¾ü¹\w?*à3PÃ°ÂsÆâÚË.Y^3½¾XípØÝ×[V9¡üb|Bj2õ3LÃc!§æâ9c HÍ ÎC,jI
i !ñ\uÃÜôÁ'F³_^&ðåÕS'@­©ÍÓ´h0^zÑ¹SÎ=ûÔÊ)u5e¥©¬P^z1ûÌ6S¦SA£Áçúñ¼:nôW"Åæ@¸~§_µìVÑ-Gfì
»]Ábgppx
~²mìoæÕ­;ö¼àí¡Ù* æµò%QEÍ=kêhóå'Î9eÑü;- Þd6â¦µBóñÔ/
)n ÜºÃÍsáf:øl¨¨BttH(;ÅoTÍ´LÙ*tVíñøZf/¾hu.9ÕÊ`­¦¦YÜð¿=í?wæ¿G»Qéu +%-GÇyèLAH! ëF EaQTºøU3JY£ëçL* ¼ÖùéçÖmÀc>Ò®Û¸P¾X°õí?|cÖÌúxCÄt]ÒÕD(: U]-üMá²¡ÝÝ}ÛO8ýÏFM/ÛÊgáÆ±áY|Î/~¾ÿàfìêF±%ìòDÜvÜ±·ÚènäOÖþU:Ò1rüðwbYïáÇ~ÿw.ÒþË1åËCDÜöÎsß<öißK4Éuª
h³Zk¬VK-d¬ûEIêMâ³®­m]O^vùF³´Â/ôç]»V}FD2ððÙÀ³qLÃa_Pàr.²Ù¬¸3X(ä3PÀMï[µæý#Uõø4 ,ÿöËoßýþtñ<r< ±À;VW¢)uØíó8ã©/4 -. î5ö³==ý¾¼þ#ª´rÔÂG .»ð{ý`Û©9_NWa (\MWí×©%Ðb `tv©ç_Þ°ùHV½£>ÀåÜøÖ;·ÞC
MÄ}# Eéñö?IÈÓ	 Þ[<^oÓÿ<´¦)ýô|9ðâ+ÿsã¯¼ùDõF ]Ú!Qðè·'OòæMhI7Þµgÿ'\
ÊW³qG©!rðPÛ]·ÝtõO KÚ+µ)~[ìv~Vd\í´~²[ Â:`¼.]ä¡ß*]Ö£$*Dã67þ×}{²=
Á7ú  À=»¿¸ë±~|Ûí:Î, Á ¶`èÎ4tE< 9x£p"½½;Û;º{ÆÃù·pG¹dÍsO½èg}}ïf£ÃÅ/Dxpr$ÄÏoßÙ¸3ñoß Ô×?ÔZÂ÷78ü´Z`-!10 ÈeÁød ;îyäÑê(Êà= UuÛIß~oË½Ø¹3Ç
È§Z	ÀåösÎà	aàëWß¶ñ<uG($È' Û:º÷ËàK<ðÈo÷,>ç;=òÀ­ìjâF gðC Åæ­§Î;ï¿÷5XC·ä8	1,Dcïç?øD[6gbðå7
,óâ«oþH¥¶&!	Ñ¢$õCR44Î/ÏÁïÞ|Ï¶®¸õvpÃuÌR<Â!»l)¾£@aÓ7ü³½û%3F&cxUßQîOùÒ/þæé~ö)³°¾}åª³í®¶ö®µdÄZN³`lh¼G_ÙpGã;g/¾èÑWÿúî!iÏ%r¤§Á¸r»6QÆúÕ>\0ÖÁ~÷Ðw*+Ë¿¬'B÷á×Án³9¹#çÒLùF3Ù¾³±eÆI+~ùÚV
¶f[ív[Áx)_ö DUó
þ£aZmÓk»¬ºjÂ
ÎÄ9hÆX0åË
6n{µeæÂW?¿vÃ8]t¹\øØW+}×ßzïGÕ3Ï¾ùóý+ËáÉÓÜnS>f)eÄ°,<ë[¿¿}åÃ7z>7(ÉãîZ1øFÂàgÖî:ï¼{Þ~oËOC!¡%U %IêçÆY%£ ãä½ò=o¾üÄòéõuß°Z­%fþ¡qÓ})ßºb,N£+þÖwxSWwïk\dðw\Äq<òÛuÜ8Z";*&
ÊW#Zºo»ñªÿ¼éªkKOåtá$[>ÞùÈòKn|3ÏNËÔè9fø(Ñnzý©ógÏl¸Èá°×b[®?ÜûÊúw»éöûþ93Qð1ã°	[2¬Dù°Ãhò¶÷²Éi|Ìò>p0cÙ.33f>f>fÌ|Ì|Ì1ø1ø1cð1cð1cÆàcÆàcÆÁÇÁÇ333f>f>fÌ²oÿ/À ÕÖ5e6½"    IEND®B`PK
     8NAk                 í    description.xmlPK
     8Nr©¤               í½   manifest.xmlPK
     68N                      íA  strings/PK
     8NIÑ49~  ~             í*  strings/strings_km_KH.xmlPK
     8Nþ¢ø	  ø	             íß  strings/strings_pa_IN.xmlPK
     8N+
  
             í'  strings/strings_ne_NP.xmlPK
     8NëH¸  ¸             íM1  strings/strings_ur_IN.xmlPK
     8Näâ               í<:  strings/strings_ms_MY.xmlPK
     8Nz)N7û  û             íB  strings/strings_iw_IL.xmlPK
     8NH<e¦ª  ª             íCJ  strings/strings_uz_UZ.xmlPK
     8N]ïi°w  w             í$R  strings/strings_ar_EG.xmlPK
     8NÔÜqÃ  Ã             íÒZ  strings/strings_es_ES.xmlPK
     8N.P^Þ  Þ             íÌb  strings/strings_tr_TR.xmlPK
     8N¢éZ  Z             íáj  strings/strings_kk_KZ.xmlPK
     8N&q9s  s             írs  strings/strings_ja_JP.xmlPK
     8N¦Ãp¶  ¶             í{  strings/strings_ur_PK.xmlPK
     8N!6Oå	  å	             í	  strings/strings_hi_IN.xmlPK
     8NÖ½UUÊ  Ê             í%  strings/strings_sq_AL.xmlPK
     8N1               í&  strings/strings_fa_IR.xmlPK
     8NÛÛöU
  U
             íè  strings/strings_as_IN.xmlPK
     8N Ô"Å  Å             ít©  strings/strings_it_IT.xmlPK
     8N4Tfkõ  õ             íp±  strings/strings_hy_AM.xmlPK
     8NÊÑ´	  ´	             íº  strings/strings_mr_IN.xmlPK
     8N¤ø°               íÄ  strings/strings_lt_LT.xmlPK
     38Nåæ`-  -             íUÌ  strings/strings_zh_HK.xmlPK
     8Nß=²|  |             í¹Ô  strings/strings_ml_IN.xmlPK
     8NPDù»t  t             ílà  strings/strings_nl_NL.xmlPK
     8N\XIÖ  Ö             íè  strings/strings_bg_BG.xmlPK
     8NûjeÅ	  Å	             í$ñ  strings/strings_th_TH.xmlPK
     8N)E
  E
             í û  strings/strings_bn_IN.xmlPK
     8N÷.áÐ  Ð             í strings/strings_ro_RO.xmlPK
     8N<H½]               í£ strings/strings_in_ID.xmlPK
     8N	¡ °               ís strings/strings_gl_ES.xmlPK
     8N"!¤dÎ  Î             í3 strings/strings_cs_CZ.xmlPK
     8N¢9¤  ¤             í8% strings/strings_hu_HU.xmlPK
     8NA 8ý	  ý	             í- strings/strings_or_IN.xmlPK
     8Nóqïè               íG7 strings/strings_az_AZ.xmlPK
     8N©Òm*  *             í? strings/strings_en_US.xmlPK
     8NN§(ç               íåF strings/strings_ru_RU.xmlPK
     68Nõö²¹  ¹             íO strings/strings_zh_TW.xmlPK
     8NÙÆÃs  s             íX strings/strings_et_EE.xmlPK
     8N	hÈ	  È	             í7` strings/strings_kn_IN.xmlPK
     8N¸É¹  ¹             í6j strings/strings_be_BY.xmlPK
     8N­ñ\ÉA
  A
             í&s strings/strings_gu_IN.xmlPK
     8N)E
  E
             í} strings/strings_bn_BD.xmlPK
     8Né1Ù<               í strings/strings_sl_SI.xmlPK
     8N·Í½Â  Â             íï strings/strings_sr_RS.xmlPK
     8Nká_öm  m             íè strings/strings_da_DK.xmlPK
     8NvyÌíõ  õ             í  strings/strings_pl_PL.xmlPK
     8NGt´ÿ  ÿ             í¸¨ strings/strings_mk_MK.xmlPK
     8N.\ðx«  «             íî± strings/strings_de_DE.xmlPK
     8N=
ø  ø             íÐ¹ strings/strings_lv_LV.xmlPK
     8NÉé9               íÿÁ strings/strings_bo_CN.xmlPK
     8N+
  
             íFÎ strings/strings_ne_IN.xmlPK
     8Nè:Go  o             íØ strings/strings_en_IN.xmlPK
     8N¥"âøÁ  Á             í+à strings/strings_bs_BA.xmlPK
     8NïÀ3°  °             í#è strings/strings_sk_SK.xmlPK
     8NW3fp               í
ð strings/strings_ha_NG.xmlPK
     8NÎâBK               íLø strings/strings_zh_CN.xmlPK
     8NZï$Úª
  ª
             í  strings/strings_te_IN.xmlPK
     8N{E d  d             íp strings/strings.xmlPK
     8N]4Èlx  x             í strings/strings_sv_SE.xmlPK
     8NvW½  ½             í´ strings/strings_me_ME.xmlPK
     8Nù£çWs
  s
             í¨" strings/strings_ug_CN.xmlPK
     8NßÍïwD	  D	             íR- strings/strings_el_GR.xmlPK
     8Nÿ±>x  x             íÍ6 strings/strings_hr_HR.xmlPK
     8N2k_  _             í|> strings/strings_nb_NO.xmlPK
     8NøÚÞ  Þ             íF strings/strings_pt_PT.xmlPK
     8N÷ñ÷               í'N strings/strings_fi_FI.xmlPK
     8N¹vY±Þ  Þ             íàU strings/strings_pt_BR.xmlPK
     8Nè:Go  o             íõ] strings/strings_en_GB.xmlPK
     8Nñ¸É  É             íe strings/strings_es_US.xmlPK
     8NÀJíG1
  1
             ím strings/strings_ka_GE.xmlPK
     8Nt»D               íx strings/strings_ko_KR.xmlPK
     8NùeØÂÌ  Ì             íÌ strings/strings_vi_VN.xmlPK
     8NJC½o  o             íÏ strings/strings_my_MM.xmlPK
     8NêZlÔ  Ô             íu strings/strings_fr_FR.xmlPK
     8N.co\  \             í strings/strings_uk_UA.xmlPK
     8NûÑÐna
  a
             í¤ strings/strings_ta_IN.xmlPK
     8N.¢r¤  ¤             í«® strings/strings_eu_ES.xmlPK
     8N7Ê(               í¶ strings/strings_ca_ES.xmlPK
     8Nè:Go  o             í>¾ strings/strings_lo_LA.xmlPK
     8Nógº÷  ÷             íäÅ strings/strings_mt_MT.xmlPK
     8N                      íAÎ weather/PK
     8Nð9¿Ð               í8Î weather/weather_0.pngPK
     8Nb¬lõP  P             íã weather/weather_13.pngPK
     8N_@èæE  E             íù weather/weather_4.pngPK
     8NØAZþl  l             í weather/weather_12.pngPK
     8NR ¹Ýk  k             í& weather/weather_2.pngPK
     8NØ´EÒ  Ò             í½8 weather/weather_7.pngPK
     8NÑBçûä  ä             íÂO weather/weather_1.pngPK
     8N/¤ã  ã             íÙd weather/weather_3.pngPK
     8NòxzÍì  ì             íïv weather/weather_22.pngPK
     8NZa>G%  %             í weather/weather_24.pngPK
     8Nã?»'  '             íh¥ weather/weather_18.pngPK    _ _ ó  ®Ì   