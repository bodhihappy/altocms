<?php
/**
 * Тема оформления Experience v.1.0  для Alto CMS
 * @licence     CC Attribution-ShareAlike
 */

/**
 * config.php
 * Файл конфигурационных параметров темы оформления Experience
 *
 * @author      Андрей Г. Воронов <andreyv@gladcode.ru>
 * @copyrights  Copyright © 2014, Андрей Г. Воронов
 *              Является частью темы оформления Experience
 * @version     0.0.1 от 29.05.2014 1:20
 */

$config['head']['default']['js'] = Config::Get('head.default.js');
//$config['head']['default']['js']["___path.skin.dir___/assets/js/experience/dropdown.min.js"] = array('name' => 'bootstrap');
//$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/experience/menu.min.js";
//$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/experience/menu-l2.min.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/selecter/jquery.fs.selecter.min.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/icheck/icheck.min.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/experience/script.min.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/experience/toolbar.min.js";
if (isset($config['view']['fix_menu']) && $config['view']['fix_menu']) {
    $config['head']['default']['js'][] = "___path.skin.dir___/assets/js/experience/fix-menu.min.js";
}

$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/experience/userinfo.min.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/experience/ch-datepicker.min.js";
//$config['head']['default']['js'][] = "___path.frontend.dir___/bootstrap-3/js/transition.min.js";
//$config['head']['default']['js'][] = "___path.frontend.dir___/bootstrap-3/js/";
//$config['head']['default']['js'][] = "___path.frontend.dir___/bootstrap-3/js/tab.min.js";
//$config['head']['default']['js'][] = "___path.frontend.dir___/bootstrap-3/js/tooltip.min.js";
//$config['head']['default']['js'][] = "___path.frontend.dir___/bootstrap-3/js/popover.min.js";
//$config['head']['default']['js'][] = "___path.frontend.dir___/bootstrap-3/js/carousel.min.js";
//$config['head']['default']['js'][] = "___path.frontend.dir___/bootstrap-3/js/collapse.min.js";
//$config['head']['default']['js'][] = "___path.frontend.dir___/bootstrap-3/js/modal.min.js";
//$config['head']['default']['js'][] = "___path.frontend.dir___/bootstrap-3/js/bootstrap.min.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/moment/moment.min.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/moment/moment.lang.ru.min.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/jasny/fileinput.min.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/experience/editor.js";
//$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/jquery/jquery.bootstrap-dropdown-on-hover.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/jquery/pulse/jquery.pulse.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/theme.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/experience/menu.min.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/bootstrap/dropdowns-enhancement.js";
$config['head']['default']['js'][] = "___path.skin.dir___/assets/js/hoverintent/jquery.hoverIntent.js";

$config['head']['default']['css'] = array(
    '___path.skin.dir___/assets/css/style.bootstrap.min.css',
    '___path.skin.dir___/assets/css/style.bootstrap.min.map',
    '___path.skin.dir___/assets/css/style.experience.min.css',
    '___path.skin.dir___/assets/css/style.experience.min.map',
    '___path.skin.dir___/assets/css/animate.min.css',
    '___path.skin.dir___/assets/css/hover.min.css',
    '___path.frontend.dir___/libs/vendor/prettyphoto/css/prettyphoto.css',
    '___path.frontend.dir___/libs/vendor/jcrop/jquery.Jcrop.css',

    /* tinyMCE */
    '___path.skin.dir___/assets/css/tinymce.css'       => array(
        'name'      => 'template-tinymce.css',
        'prepare'   => true,
        'merge'     => false,
    ),


    /* Theme */
    '___path.skin.dir___/themes/___view.theme___/css/theme.___view.theme___.css',
    '___path.skin.dir___/themes/___view.theme___/css/theme.___view.theme___.css.map',
    '___path.skin.dir___/themes/___view.theme___/css/custom.___view.theme___.css',
);

// EOF
