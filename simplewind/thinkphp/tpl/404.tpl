<?php
    if(!function_exists('parse_padding')){
        function parse_padding($source)
        {
            $length  = strlen(strval(count($source['source']) + $source['first']));
            return 40 + ($length - 1) * 8;
        }
    }

    if(!function_exists('parse_class')){
        function parse_class($name)
        {
            $names = explode('\\', $name);
            return '<abbr title="'.$name.'">'.end($names).'</abbr>';
}
}

if(!function_exists('parse_file')){
function parse_file($file, $line)
{
return '<a class="toggle" title="'."{$file} line {$line}".'">'.basename($file)." line {$line}".'</a>';
}
}

if(!function_exists('parse_args')){
function parse_args($args)
{
$result = [];

foreach ($args as $key => $item) {
switch (true) {
case is_object($item):
$value = sprintf('<em>object</em>(%s)', parse_class(get_class($item)));
break;
case is_array($item):
if(count($item) > 3){
$value = sprintf('[%s, ...]', parse_args(array_slice($item, 0, 3)));
} else {
$value = sprintf('[%s]', parse_args($item));
}
break;
case is_string($item):
if(strlen($item) > 20){
$value = sprintf(
'\'<a class="toggle" title="%s">%s...</a>\'',
htmlentities($item),
htmlentities(substr($item, 0, 20))
);
} else {
$value = sprintf("'%s'", htmlentities($item));
}
break;
case is_int($item):
case is_float($item):
$value = $item;
break;
case is_null($item):
$value = '<em>null</em>';
break;
case is_bool($item):
$value = '<em>' . ($item ? 'true' : 'false') . '</em>';
break;
case is_resource($item):
$value = '<em>resource</em>';
break;
default:
$value = htmlentities(str_replace("\n", '', var_export(strval($item), true)));
break;
}

$result[] = is_int($key) ? $value : "'{$key}' => {$value}";
}

return implode(', ', $result);
}
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo \think\Lang::get('System Error'); ?></title>
    <meta name="robots" content="noindex,nofollow"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <style>
        /* Base */
        body {
            color: #333;
            font: 14px Verdana, "Helvetica Neue", helvetica, Arial, 'Microsoft YaHei', sans-serif;
            margin: 0;
            padding: 0 20px 20px;
            word-break: break-word;
        }

        h1 {
            margin: 10px 0 0;
            font-size: 28px;
            font-weight: 500;
            line-height: 32px;
        }

        h2 {
            color: #4288ce;
            font-weight: 400;
            padding: 6px 0;
            margin: 6px 0 0;
            font-size: 18px;
            border-bottom: 1px solid #eee;
        }

        h3.subheading {
            color: #4288ce;
            margin: 6px 0 0;
            font-weight: 400;
        }

        h3 {
            margin: 12px;
            font-size: 16px;
            font-weight: bold;
        }

        abbr {
            cursor: help;
            text-decoration: underline;
            text-decoration-style: dotted;
        }

        a {
            color: #868686;
            cursor: pointer;
        }

        a:hover {
            text-decoration: underline;
        }

        .line-error {
            background: #f8cbcb;
        }

        .echo table {
            width: 100%;
        }

        .echo pre {
            padding: 16px;
            overflow: auto;
            font-size: 85%;
            line-height: 1.45;
            background-color: #f7f7f7;
            border: 0;
            border-radius: 3px;
            font-family: Consolas, "Liberation Mono", Menlo, Courier, monospace;
        }

        .echo pre > pre {
            padding: 0;
            margin: 0;
        }

        /* Layout */
        .col-md-3 {
            width: 25%;
        }

        .col-md-9 {
            width: 75%;
        }

        [class^="col-md-"] {
            float: left;
        }

        .clearfix {
            clear: both;
        }

        @media only screen
        and (min-device-width: 375px)
        and (max-device-width: 667px) {
            .col-md-3,
            .col-md-9 {
                width: 100%;
            }
        }

        /* Exception Info */
        .exception {
            margin-top: 20px;
        }

        .exception .message {
            padding: 12px;
            border: 1px solid #ddd;
            border-bottom: 0 none;
            line-height: 18px;
            font-size: 16px;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
            font-family: Consolas, "Liberation Mono", Courier, Verdana, "微软雅黑";
        }

        .exception .code {
            float: left;
            text-align: center;
            color: #fff;
            margin-right: 12px;
            padding: 16px;
            border-radius: 4px;
            background: #999;
        }

        .exception .source-code {
            padding: 6px;
            border: 1px solid #ddd;

            background: #f9f9f9;
            overflow-x: auto;

        }

        .exception .source-code pre {
            margin: 0;
        }

        .exception .source-code pre ol {
            margin: 0;
            color: #4288ce;
            display: inline-block;
            min-width: 100%;
            box-sizing: border-box;
            font-size: 14px;
            font-family: "Century Gothic", Consolas, "Liberation Mono", Courier, Verdana;
            padding-left: < ? php echo (isset($ source) & & ! empty($ source)) ? parse_padding($ source): 40;
            ? > px;
        }

        .exception .source-code pre li {
            border-left: 1px solid #ddd;
            height: 18px;
            line-height: 18px;
        }

        .exception .source-code pre code {
            color: #333;
            height: 100%;
            display: inline-block;
            border-left: 1px solid #fff;
            font-size: 14px;
            font-family: Consolas, "Liberation Mono", Courier, Verdana, "微软雅黑";
        }

        .exception .trace {
            padding: 6px;
            border: 1px solid #ddd;
            border-top: 0 none;
            line-height: 16px;
            font-size: 14px;
            font-family: Consolas, "Liberation Mono", Courier, Verdana, "微软雅黑";
        }

        .exception .trace ol {
            margin: 12px;
        }

        .exception .trace ol li {
            padding: 2px 4px;
        }

        .exception div:last-child {
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
        }

        /* Exception Variables */
        .exception-var table {
            width: 100%;
            margin: 12px 0;
            box-sizing: border-box;
            table-layout: fixed;
            word-wrap: break-word;
        }

        .exception-var table caption {
            text-align: left;
            font-size: 16px;
            font-weight: bold;
            padding: 6px 0;
        }

        .exception-var table caption small {
            font-weight: 300;
            display: inline-block;
            margin-left: 10px;
            color: #ccc;
        }

        .exception-var table tbody {
            font-size: 13px;
            font-family: Consolas, "Liberation Mono", Courier, "微软雅黑";
        }

        .exception-var table td {
            padding: 0 6px;
            vertical-align: top;
            word-break: break-all;
        }

        .exception-var table td:first-child {
            width: 28%;
            font-weight: bold;
            white-space: nowrap;
        }

        .exception-var table td pre {
            margin: 0;
        }

        /* Copyright Info */
        .copyright {
            margin-top: 24px;
            padding: 12px 0;
            border-top: 1px solid #eee;
        }

        /* SPAN elements with the classes below are added by prettyprint. */
        pre.prettyprint .pln {
            color: #000
        }

        /* plain text */
        pre.prettyprint .str {
            color: #080
        }

        /* string content */
        pre.prettyprint .kwd {
            color: #008
        }

        /* a keyword */
        pre.prettyprint .com {
            color: #800
        }

        /* a comment */
        pre.prettyprint .typ {
            color: #606
        }

        /* a type name */
        pre.prettyprint .lit {
            color: #066
        }

        /* a literal value */
        /* punctuation, lisp open bracket, lisp close bracket */
        pre.prettyprint .pun, pre.prettyprint .opn, pre.prettyprint .clo {
            color: #660
        }

        pre.prettyprint .tag {
            color: #008
        }

        /* a markup tag name */
        pre.prettyprint .atn {
            color: #606
        }

        /* a markup attribute name */
        pre.prettyprint .atv {
            color: #080
        }

        /* a markup attribute value */
        pre.prettyprint .dec, pre.prettyprint .var {
            color: #606
        }

        /* a declaration; a variable name */
        pre.prettyprint .fun {
            color: red
        }

        /* a function name */

        .error-container {
            text-align: center;
            font-size: 106px;
            font-family: "Catamaran", sans-serif;
            font-weight: 800;
            margin: 70px 15px;
        }
        .error-container > span {
            display: inline-block;
            position: relative;
        }
        .error-container > span.four {
            width: 136px;
            height: 43px;
            border-radius: 999px;
            background: linear-gradient(
                    140deg,
                    rgba(0, 0, 0, 0.1) 0%,
                    rgba(0, 0, 0, 0.07) 43%,
                    transparent 44%,
                    transparent 100%
            ),
            linear-gradient(
                    105deg,
                    transparent 0%,
                    transparent 40%,
                    rgba(0, 0, 0, 0.06) 41%,
                    rgba(0, 0, 0, 0.07) 76%,
                    transparent 77%,
                    transparent 100%
            ),
            linear-gradient(to right, #d89ca4, #e27b7e);
        }
        .error-container > span.four:before,
        .error-container > span.four:after {
            content: "";
            display: block;
            position: absolute;
            border-radius: 999px;
        }
        .error-container > span.four:before {
            width: 43px;
            height: 156px;
            left: 60px;
            bottom: -43px;
            background: linear-gradient(
                    128deg,
                    rgba(0, 0, 0, 0.1) 0%,
                    rgba(0, 0, 0, 0.07) 40%,
                    transparent 41%,
                    transparent 100%
            ),
            linear-gradient(
                    116deg,
                    rgba(0, 0, 0, 0.1) 0%,
                    rgba(0, 0, 0, 0.07) 50%,
                    transparent 51%,
                    transparent 100%
            ),
            linear-gradient(to top, #99749d, #b895ab, #cc9aa6, #d7969e, #e0787f);
        }
        .error-container > span.four:after {
            width: 137px;
            height: 43px;
            transform: rotate(-49.5deg);
            left: -18px;
            bottom: 36px;
            background: linear-gradient(
                    to right,
                    #99749d,
                    #b895ab,
                    #cc9aa6,
                    #d7969e,
                    #e0787f
            );
        }

        .error-container > span.zero {
            vertical-align: text-top;
            width: 156px;
            height: 156px;
            border-radius: 999px;
            background: linear-gradient(
                    -45deg,
                    transparent 0%,
                    rgba(0, 0, 0, 0.06) 50%,
                    transparent 51%,
                    transparent 100%
            ),
            linear-gradient(
                    to top right,
                    #99749d,
                    #99749d,
                    #b895ab,
                    #cc9aa6,
                    #d7969e,
                    #ed8687,
                    #ed8687
            );
            overflow: hidden;
            animation: bgshadow 5s infinite;
        }
        .error-container > span.zero:before {
            content: "";
            display: block;
            position: absolute;
            transform: rotate(45deg);
            width: 90px;
            height: 90px;
            background-color: transparent;
            left: 0;
            bottom: 0;
            background: linear-gradient(
                    95deg,
                    transparent 0%,
                    transparent 8%,
                    rgba(0, 0, 0, 0.07) 9%,
                    transparent 50%,
                    transparent 100%
            ),
            linear-gradient(
                    85deg,
                    transparent 0%,
                    transparent 19%,
                    rgba(0, 0, 0, 0.05) 20%,
                    rgba(0, 0, 0, 0.07) 91%,
                    transparent 92%,
                    transparent 100%
            );
        }
        .error-container > span.zero:after {
            content: "";
            display: block;
            position: absolute;
            border-radius: 999px;
            width: 70px;
            height: 70px;
            left: 43px;
            bottom: 43px;
            background: #fdfaf5;
            box-shadow: -2px 2px 2px 0 rgba(0, 0, 0, 0.1);
        }

        .screen-reader-text {
            position: absolute;
            top: -9999em;
            left: -9999em;
        }

        @keyframes bgshadow {
            0% {
                box-shadow: inset -160px 160px 0 5px rgba(0, 0, 0, 0.4);
            }
            45% {
                box-shadow: inset 0 0 0 0 rgba(0, 0, 0, 0.1);
            }
            55% {
                box-shadow: inset 0 0 0 0 rgba(0, 0, 0, 0.1);
            }
            100% {
                box-shadow: inset 160px -160px 0 5px rgba(0, 0, 0, 0.4);
            }
        }

        /* demo stuff */
        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .error-404 {
            text-align: center;
            margin: 30px 15px;
        }
        .zoom-area {
            max-width: 490px;
            margin: 30px auto 30px;
            font-size: 19px;
            text-align: center;
        }
        .link-container {
            text-align: center;
        }
        a.more-link {
            text-transform: uppercase;
            font-size: 13px;
            background-color: #de7e85;
            padding: 10px 15px;
            border-radius: 0;
            color: #fff;
            display: inline-block;
            margin-right: 5px;
            margin-bottom: 5px;
            line-height: 1.5;
            text-decoration: none;
            margin-top: 50px;
            letter-spacing: 1px;
        }

    </style>
</head>
<body>
<div class="echo">
    <?php echo $echo;?>
</div>
<?php if(\think\App::$debug) { ?>
<div class="exception">
    <div class="message">

        <div class="info">
            <div>
                <h2>[<?php echo $code; ?>
                    ]&nbsp;<?php echo sprintf('%s in %s', parse_class($name), parse_file($file, $line)); ?></h2>
            </div>
            <h1><?php echo nl2br(htmlentities($message)); ?></h1>
    </div>
    <?php if(!empty($source)){?>
    <div class="source-code">
    <pre class="prettyprint lang-php"><ol start="<?php echo $source['first']; ?>"><?php foreach ((array) $source['source'] as $key => $value) { ?><li class="line-<?php echo $key + $source['first']; ?>"><code><?php echo htmlentities($value); ?></code></li><?php } ?></ol></pre>
</div>
<?php }?>
<div class="trace">
    <h2>Call Stack</h2>
    <ol>
        <li><?php echo sprintf('in %s', parse_file($file, $line)); ?></li>
        <?php foreach ((array) $trace as $value) { ?>
        <li>
            <?php
                    // Show Function
                    if($value['function']){
                        echo sprintf(
                            'at %s%s%s(%s)', 
                            isset($value['class']) ? parse_class($value['class']) : '',
                            isset($value['type'])  ? $value['type'] : '', 
                            $value['function'], 
                            isset($value['args'])?parse_args($value['args']):''
                        );
                    }

                    // Show line
                    if (isset($value['file']) && isset($value['line'])) {
                        echo sprintf(' in %s', parse_file($value['file'], $value['line']));
                    }
                ?>
        </li>
        <?php } ?>
    </ol>
</div>
</div>
<?php } else { ?>
<div class="exception">

    <div class="info"><h1 class="error-404"><?php echo htmlentities($message); ?></h1></div>
    <div class="error-container">
        <span class="four"><span class="screen-reader-text">4</span></span>
        <span class="zero"><span class="screen-reader-text">0</span></span>
        <span class="four"><span class="screen-reader-text">4</span></span>
    </div>
    <div style="text-align: center"><a href="/">返回首页</a></div>
</div>
</div>
<?php } ?>

<?php if(!empty($datas)){ ?>
<div class="exception-var">
    <h2>Exception Datas</h2>
    <?php foreach ((array) $datas as $label => $value) { ?>
    <table>
        <?php if(empty($value)){ ?>
        <caption><?php echo $label; ?>
            <small>empty</small>
        </caption>
        <?php } else { ?>
        <caption><?php echo $label; ?></caption>
        <tbody>
        <?php foreach ((array) $value as $key => $val) { ?>
        <tr>
            <td><?php echo htmlentities($key); ?></td>
            <td>
                <?php
                            if(is_array($val) || is_object($val)){ 
                                echo htmlentities(json_encode($val, JSON_PRETTY_PRINT));
                            } else if(is_bool($val)) { 
                                echo $val ? 'true' : 'false';
                            } else if(is_scalar($val)) {
                                echo htmlentities($val);
                            } else {
                                echo 'Resource';
                            }
                        ?>
            </td>
        </tr>
        <?php } ?>
        </tbody>
        <?php } ?>
    </table>
    <?php } ?>
</div>
<?php } ?>

<?php if(!empty($tables)){ ?>
<div class="exception-var">
    <h2>Environment Variables</h2>
    <?php foreach ((array) $tables as $label => $value) { ?>
    <div>
        <?php if(empty($value)){ ?>
        <div class="clearfix">
            <div class="col-md-3"><strong><?php echo $label; ?></strong></div>
            <div class="col-md-9">
                <small>empty</small>
            </div>
        </div>
        <?php } else { ?>
        <h3 class="subheading"><?php echo $label; ?></h3>
        <div>
            <?php foreach ((array) $value as $key => $val) { ?>
            <div class="clearfix">
                <div class="col-md-3"><strong><?php echo htmlentities($key); ?></strong></div>
                <div class="col-md-9">
                    <small>
                        <?php 
                            if(is_array($val) || is_object($val)){ 
                                echo htmlentities(json_encode($val, JSON_PRETTY_PRINT));
                            } else if(is_bool($val)) { 
                                echo $val ? 'true' : 'false';
                            } else if(is_scalar($val)) {
                                echo htmlentities($val);
                            } else {
                                echo 'Resource';
                            }
                        ?>
                    </small>
                </div>
            </div>
            <?php } ?>
        </div>
        <?php } ?>
    </div>
    <?php } ?>
</div>
<?php } ?>
<?php if(\think\App::$debug) { ?>
<script>
    var LINE =
    <
        ? php echo
    $line;
        ?
    >
    ;

    function $(selector, node) {
        var elements;

        node = node || document;
        if (document.querySelectorAll) {
            elements = node.querySelectorAll(selector);
        } else {
            switch (selector.substr(0, 1)) {
                case '#':
                    elements = [node.getElementById(selector.substr(1))];
                    break;
                case '.':
                    if (document.getElementsByClassName) {
                        elements = node.getElementsByClassName(selector.substr(1));
                    } else {
                        elements = get_elements_by_class(selector.substr(1), node);
                    }
                    break;
                default:
                    elements = node.getElementsByTagName();
            }
        }
        return elements;

        function get_elements_by_class(search_class, node, tag) {
            var elements = [], eles,
                pattern = new RegExp('(^|\\s)' + search_class + '(\\s|$)');

            node = node || document;
            tag = tag || '*';

            eles = node.getElementsByTagName(tag);
            for (var i = 0; i < eles.length; i++) {
                if (pattern.test(eles[i].className)) {
                    elements.push(eles[i])
                }
            }

            return elements;
        }
    }

    $.getScript = function (src, func) {
        var script = document.createElement('script');

        script.async = 'async';
        script.src = src;
        script.onload = func || function (){};

        $('head')[0].appendChild(script);
    }

    ;(function () {
        var files = $('.toggle');
        var ol = $('ol', $('.prettyprint')[0]);
        var li = $('li', ol[0]);

        // 短路径和长路径变换
        for (var i = 0; i < files.length; i++) {
            files[i].ondblclick = function () {
                var title = this.title;

                this.title = this.innerHTML;
                this.innerHTML = title;
            }
        }

        // 设置出错行
        var err_line = $('.line-' + LINE, ol[0])[0];
        err_line.className = err_line.className + ' line-error';

        $.getScript('//cdn.bootcss.com/prettify/r298/prettify.min.js', function () {
            prettyPrint();

            // 解决Firefox浏览器一个很诡异的问题
            // 当代码高亮后，ol的行号莫名其妙的错位
            // 但是只要刷新li里面的html重新渲染就没有问题了
            if (window.navigator.userAgent.indexOf('Firefox') >= 0) {
                ol[0].innerHTML = ol[0].innerHTML;
            }
        });

    })();
</script>
<?php } ?>
</body>
</html>
