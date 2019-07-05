<?php
/* Template Name: Quiz Page */

add_action('wp_print_scripts', function(){
	wp_enqueue_script('quiz-scripts', get_stylesheet_directory_uri() .'/components/quiz/quiz.js', array('jquery'), null, true);
});

add_action('wp_print_styles', function(){
	wp_enqueue_style('quiz-styles', get_stylesheet_directory_uri() .'/components/quiz/quiz.css');
});

genesis();
