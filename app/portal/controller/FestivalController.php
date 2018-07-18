<?php
/**
 * Created by PhpStorm.
 * User: User
 * Date: 2018-7-18
 * Time: 14:22
 */

namespace app\portal\controller;


use cmf\controller\HomeBaseController;

class FestivalController extends HomeBaseController
{
    public function index()
    {
        return $this->fetch(':index');
    }
}