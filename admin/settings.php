<?php
namespace FFPlugin\Quiz;

vite_enqueue('admin', 'src/admin/admin.js');

echo '<h2>'. PLUGIN_NAME .' Settings</h2>';

$tabs = [
    [
        'slug' => 'tab-1',
        'label' => 'Tab 1',
    ],
    [
        'slug' => 'tab-2',
        'label' => 'Tab 2',
    ],
    [
        'slug' => 'tab-3',
        'label' => 'Tab 3',
    ],
];

if( function_exists('ff_admin_tabs') ) {
    ff_admin_tabs( $tabs, __DIR__, PLUGIN_SLUG );
}
else {
    pre_debug('Update fivebyfive plugin to latest');
}