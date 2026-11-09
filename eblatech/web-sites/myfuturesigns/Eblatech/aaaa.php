<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'eblatech_wpmstr');

/** MySQL database username */
define('DB_USER', 'eblatech_wpmstr');

/** MySQL database password */
define('DB_PASSWORD', 'Sp39I--61z');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'pzjxdl7legvyi0jl2iepjph5ymfvgyhyp2exeklwdbqldma62n697ogvdruf0rgl');
define('SECURE_AUTH_KEY',  '81mirkoguipgyg24wo2o3akdz17hzwkwxkc9rytacxj5nbrxoorc88ezqj4qsfrx');
define('LOGGED_IN_KEY',    'ylrhs9evjlvvix6mm6kp6wzhulrp5z7lcl1ygb2ewv4aigqc6jgnf3kjdv3xq6e6');
define('NONCE_KEY',        'gnbtpdx9xysyd9j5tizct4r3anweew3ays7vrfi2pxpogct46wfxatcaehsfpbdr');
define('AUTH_SALT',        'jzjttn53nsg8qbz555chbzverkqxibeijosm2gjdiplzlvoc9xky4xaze4xgp8f9');
define('SECURE_AUTH_SALT', '4uohobjtgtsdaet8zp6xzs5k8lwmxkktebjsfxlf2hpyw2aetme2etbzbhlingmr');
define('LOGGED_IN_SALT',   'u2aoqo1ltfpn5i5tjgfuulenx13oua4um9loybohyrt7ubabsuc6in0nylcmxaf7');
define('NONCE_SALT',       '87revx9delvji7jau9d00p5gowkhvny53ofd1m42js3kb2g9sjtpf1pv2hij0qjo');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wpg3_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
