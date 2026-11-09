<?php

/**
 * @file
 * Implements custom mas4itmal Theme Settings.
 */

/**
 * Implements hook_form_system_theme_settings_alter().
 */
function mas4itmal_form_system_theme_settings_alter(&$form, $form_state) {
  // Google Fonts URL.
  $desc = t("If you are using <a href='@link' target='_blank'>Google Fonts</a>
    to webfonts, put google URL here.
    Ex.: http://fonts.googleapis.com/css?family=Open+Sans:400|Roboto:400",
    array('@link' => 'https://www.google.com/fonts'));
  $form['misc']['mas4itmal_gfonts_id'] = array(
    '#type' => 'textfield',
    '#title' => t('Google Fonts URL'),
    '#default_value' => theme_get_setting('mas4itmal_gfonts_id'),
    '#size' => 60,
    '#maxlength' => 256,
    '#description' => $desc,
  );

  // Typekit ID Field.
  $typekit_link = '';
  $desc = t("If you are using <a href='@link' target='_blank'>Typekit</a>
    to webfonts, put your ID here", array('@link' => 'https://typekit.com'));
  $form['misc']['mas4itmal_typekit_id'] = array(
    '#type' => 'textfield',
    '#title' => t('Typekit ID'),
    '#default_value' => theme_get_setting('mas4itmal_typekit_id'),
    '#size' => 7,
    '#maxlength' => 7,
    '#description' => $desc,
  );
}
