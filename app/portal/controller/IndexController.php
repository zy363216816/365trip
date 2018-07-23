<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <thinkcmf@126.com>
// +----------------------------------------------------------------------
namespace app\portal\controller;

use app\portal\model\PortalCategoryModel;
use cmf\controller\HomeBaseController;

class IndexController extends HomeBaseController
{
    public function index()
    {
        return $this->fetch(':index');
    }

    public function home()
    {
        $id = $this->request->param('id', 0, 'intval');
        $portalCategoryModel = new PortalCategoryModel();

        $category = $portalCategoryModel->where('id', $id)->where('status', 1)->find();

        $this->assign('category', $category);

        $tpl = empty($category['index_tpl']) ? empty($category['list_tpl']) ? 'list' : $category['list_tpl'] : $category['index_tpl'];

        return $this->fetch('/' . $tpl);
    }
}
