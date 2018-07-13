<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Author: Dean <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace plugins\ali_yun_code;//Demo插件英文名，改成你的插件英文就行了
use cmf\lib\Plugin;
use plugins\ali_yun_code\controller\SendSmsController;

/**
 * AliYunCodePlugin
 */
class AliYunCodePlugin extends Plugin
{

    public $info = [
        'name' => 'AliYunCode',
        'title' => '阿里云短信验证码',
        'description' => '阿里云短信验证码',
        'status' => 1,
        'author' => 'sunny',
        'version' => '1.0'
    ];

    public $has_admin = 0;//插件是否有后台管理界面

    public function install() //安装方法必须实现
    {
        return true;//安装成功返回true，失败false
    }

    public function uninstall() //卸载方法必须实现
    {
        return true;//卸载成功返回true，失败false
    }

    //实现的send_mobile_verification_code钩子方法
    public function sendMobileVerificationCode($param)
    {
        $mobile = $param['mobile'];//手机号
        $code = $param['code'];//验证码
        $config = $this->getConfig();
        $accessKeyId = trim($config['access_key_id']);
        $accessKeySecret = trim($config['access_key_secret']);
        $signName = trim($config['sign_name']);
        $templateCode = trim($config['template_code']);
        $expire_minute = intval($config['expire_minute']);
        $expire_minute = empty($expire_minute) ? 30 : $expire_minute;
        $expire_time = time() + $expire_minute * 60;
        $result = false;
        $res = SendSmsController::sendSms($mobile, $signName, $templateCode, $accessKeyId, $accessKeySecret, $code, $expire_time);
        if ($res->Code == 'OK') {
            $result = [
                'error' => 0,
                'message' => '短信已发送,请注意查收'
            ];
        }
        return $result;
    }

}