<?php
/*
 * Plugin name: FF Quiz
 * Plugin URI: https://www.fivebyfive.com.au/
 * Description: Quiz system
 * Version: 2.0
*/

namespace FFPlugin\Quiz;

define(__NAMESPACE__.'\PLUGIN_NAME', 'FF Quiz');
define(__NAMESPACE__.'\PLUGIN_SLUG', 'ff_quiz');

define(__NAMESPACE__.'\PLUGIN_URL', plugins_url('/', __FILE__));
define(__NAMESPACE__.'\PLUGIN_PATH', plugin_dir_path(__FILE__));

include 'vite/vite-wp.php';
include 'admin/admin.php';