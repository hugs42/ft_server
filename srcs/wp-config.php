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
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         '{+?o24h@U&~?F]fXPhm|)r.OmM+M/(9U#g](w{#pd<Pb[=Xbe@DEl{d7Wm$mR-z|');
define('SECURE_AUTH_KEY',  'A|+c]->ncLYiBjVQ$wOO0Nh,dz+YiZ4ZUH~;/qP3Z>zNkQ#bUODljDE*&XW}[0<.');
define('LOGGED_IN_KEY',    'ACzMXW5kUse/NX_k72u!if|>SOYq)_.v5A5Y7_/8|1;J,Q=(-H(=3H*zGH|-X{sB');
define('NONCE_KEY',        'P(Z8?{:e3sG~aSsl!&*Ep{5wv;^Rc;Tb(JfL]+>1JU}7K~-c)x;=oX=5s10!GWmq');
define('AUTH_SALT',        '#{jWB1T2&:|+@ehZ?|qt-Oy;%&V(ZpkBa-ITnrB`ZcQ5l,R<+96m3a_*{#DDe3YC');
define('SECURE_AUTH_SALT', '>X?Ko$M0m|Av]m.|+66}+./:S 47uMZ.x`aZkk)a!SK`5XBTu^DE<O!}g6=<d3^[');
define('LOGGED_IN_SALT',   '1 |z6H9_sGxw+G4Rn&Q.Lp_$l{p%__hnmd:3]/A|Hh_8edRNb:E?A3,2EuoH,?|:');
define('NONCE_SALT',       '5,U:jSS(H5+aT9dG}o`!US1|rjoxTnSkR~~P9oC&n9(VO-:K#U!+U_+>uWv+<]jw');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

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
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );
