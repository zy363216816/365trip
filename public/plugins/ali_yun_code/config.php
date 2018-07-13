<?php
return array(
    'access_key_id' => array(// 在后台插件配置表单中的键名 ,会是config[text]
        'title' => 'AccessKeyId', // 表单的label标题
        'type' => 'text',// 表单的类型：text,password,textarea,checkbox,radio,select等
        'value' => '',// 表单的默认值
        'tip' => '阿里云AccessKeyId' //表单的帮助提示
    ),
    'access_key_secret' => array(// 在后台插件配置表单中的键名 ,会是config[text]
        'title' => 'AccessKeySecret', // 表单的label标题
        'type' => 'text',// 表单的类型：text,password,textarea,checkbox,radio,select等
        'value' => '',// 表单的默认值
        'tip' => '阿里云AccessKeySecret' //表单的帮助提示
    ),
    'sign_name' => array(// 在后台插件配置表单中的键名 ,会是config[text]
        'title' => '短信签名', // 表单的label标题
        'type' => 'text',// 表单的类型：text,password,textarea,checkbox,radio,select等
        'value' => '',// 表单的默认值
        'tip' => '阿里云审核通过的短信签名' //表单的帮助提示
    ),
    'template_code' => array(// 在后台插件配置表单中的键名 ,会是config[text]
        'title' => '短息验证码模板Code', // 表单的label标题
        'type' => 'text',// 表单的类型：text,password,textarea,checkbox,radio,select等
        'value' => '',// 表单的默认值
        'tip' => '阿里云审核通过的短信模板变量' //表单的帮助提示
    ),
    'expire_minute' => array(// 在后台插件配置表单中的键名 ,会是config[text]
        'title' => '有效期', // 表单的label标题
        'type' => 'text',// 表单的类型：text,password,textarea,checkbox,radio,select等
        'value' => '30',// 表单的默认值
        'tip' => '短信验证码过期时间，单位分钟' //表单的帮助提示
    ),
);
					