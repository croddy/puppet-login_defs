# Default values for /etc/login.defs .
# These can be overridden or added to by passing a hash to the $options parameter in the main class.
#
class login_defs::params {

  $sles_char_clas_var='[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz_][ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.-]*[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_.$-]\?' # lint:ignore:140chars

  case $facts['os']['family'] {
    'RedHat': {
      case $facts['os']['release']['major'] {
        '7': {
          $default_options = {
            'CREATE_HOME'     => 'yes',
            'ENCRYPT_METHOD'  => 'SHA512',
            'GID_MAX'         => '60000',
            'GID_MIN'         => '1000',
            'MAIL_DIR'        => '/var/spool/mail',
            'PASS_MAX_DAYS'   => '99999',
            'PASS_MIN_DAYS'   => '0',
            'PASS_MIN_LEN'    => '5',
            'PASS_WARN_AGE'   => '7',
            'SYS_GID_MAX'     => '999',
            'SYS_GID_MIN'     => '201',
            'SYS_UID_MAX'     => '999',
            'SYS_UID_MIN'     => '201',
            'UID_MAX'         => '60000',
            'UID_MIN'         => '1000',
            'UMASK'           => '077',
            'USERGROUPS_ENAB' => 'yes',
          }
        }
        default: {
          $default_options = {
            'CREATE_HOME'     => 'yes',
            'ENCRYPT_METHOD'  => 'SHA512',
            'GID_MAX'         => '60000',
            'GID_MIN'         => '500',
            'MAIL_DIR'        => '/var/spool/mail',
            'PASS_MAX_DAYS'   => '99999',
            'PASS_MIN_LEN'    => '5',
            'PASS_WARN_AGE'   => '7',
            'UID_MAX'         => '60000',
            'UID_MIN'         => '500',
            'UMASK'           => '022',
            'USERGROUPS_ENAB' => 'yes',
          }
        }
      }
    }
    'Suse': {
      case $facts['os']['release']['major'] {
        '12': {
          $default_options = {
            'FAIL_DELAY'         => '3',
            'LOG_UNKFAIL_ENAB'   => 'no',
            'LOG_OK_LOGINS'      => 'no',
            'SYSLOG_SU_ENAB'     => 'yes',
            'SYSLOG_SG_ENAB'     => 'yes',
            'CONSOLE'            => '/etc/securetty',
            'MOTD_FILE'          => '/etc/motd',
            'HUSHLOGIN_FILE'     => '/etc/hushlogins',
            'ENV_SUPATH'         => 'PATH=/sbin:/bin:/usr/sbin:/usr/bin',
            'ENV_PATH'           => 'PATH=/usr/local/bin:/usr/bin:/bin',
            'ENV_ROOTPATH'       => '/sbin:/bin:/usr/sbin:/usr/bin',
            'TTYGROUP'           => 'tty',
            'TTYPERM'            => '0620',
            'ERASECHAR'          => '0177',
            'KILLCHAR'           => '025',
            'UMASK'              => '022',
            'PASS_MAX_DAYS'      => '99999',
            'PASS_MIN_DAYS'      => '0',
            'PASS_WARN_AGE'      => '7',
            'UID_MIN'            => '1000',
            'UID_MAX'            => '60000',
            'SYS_UID_MIN'        => '100',
            'SYS_UID_MAX'        => '499',
            'SUB_UID_MIN'        => '100000',
            'SUB_UID_MAX'        => '600100000',
            'SUB_UID_COUNT'      => '65536',
            'GID_MIN'            => '1000',
            'GID_MAX'            => '60000',
            'SYS_GID_MIN'        => '100',
            'SYS_GID_MAX'        => '499',
            'SUB_GID_MIN'        => '100000',
            'SUB_GID_MAX'        => '600100000',
            'SUB_GID_COUNT'      => '65536',
            'LOGIN_RETRIES'      => '3',
            'LOGIN_TIMEOUT'      => '60',
            'CHFN_RESTRICT'      => 'rwh',
            'ENCRYPT_METHOD'     => 'SHA512',
            'ENCRYPT_METHOD_NIS' => 'DES',
            'DEFAULT_HOME'       => 'yes',
            'USERGROUPS_ENAB'    => 'no',
            'CREATE_HOME'        => 'no',
            'CHARACTER_CLASS'    => $sles_char_clas_var,
            'GROUPADD_CMD'       => '/usr/sbin/groupadd.local',
            'USERADD_CMD'        => '/usr/sbin/useradd.local',
            'USERDEL_PRECMD'     => '/usr/sbin/userdel-pre.local',
            'USERDEL_POSTCMD'    => '/usr/sbin/userdel-post.local',
          }
        }
        default: {
          $default_options = {
            'DEFAULT_HOME'     => 'yes',
            'ENV_PATH'         => '/usr/local/bin:/usr/bin:/bin',
            'ENV_ROOTPATH'     => '/sbin:/bin:/usr/sbin:/usr/bin',
            'FAIL_DELAY'       => '3',
            'HUSHLOGIN_FILE'   => '/etc/hushlogins',
            'LASTLOG_ENAB'     => 'yes',
            'LOG_UNKFAIL_ENAB' => 'no',
            'LOGIN_RETRIES'    => '3',
            'LOGIN_TIMEOUT'    => '60',
            'MOTD_FILE'        => '/etc/motd',
            'TTYTYPE_FILE'     => '/etc/ttytype',
            'TTYGROUP'         => 'tty',
            'TTYPERM'          => '0620',
            'CHFN_AUTH'        => 'yes',
            'CHFN_RESTRICT'    => 'rwh',
            'PASS_MAX_DAYS'    => '99999',
            'PASS_MIN_DAYS'    => '0',
            'PASS_WARN_AGE'    => '7',
            'SYSTEM_UID_MIN'   => '100',
            'SYSTEM_UID_MAX'   => '499',
            'UID_MIN'          => '1000',
            'UID_MAX'          => '60000',
            'SYSTEM_GID_MIN'   => '100',
            'SYSTEM_GID_MAX'   => '499',
            'GID_MIN'          => '1000',
            'GID_MAX'          => '60000',
            'CHARACTER_CLASS'  => $sles_char_clas_var,
            'UMASK'            => '022',
            'GROUPADD_CMD'     => '/usr/sbin/groupadd.local',
            'USERADD_CMD'      => '/usr/sbin/useradd.local',
            'USERDEL_PRECMD'   => '/usr/sbin/userdel-pre.local',
            'USERDEL_POSTCMD'  => '/usr/sbin/userdel-post.local',
          }
        }
      }
    }
    'Debian': {
      $default_options = {
        'CHFN_RESTRICT'    => 'rwh',
        'CREATE_HOME'      => 'yes',
        'DEFAULT_HOME'     => 'yes',
        'ENCRYPT_METHOD'   => 'SHA512',
        'ENV_PATH'         => 'PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games',
        'ENV_SUPATH'       => 'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
        'ERASECHAR'        => '0177',
        'FAILLOG_ENAB'     => 'yes',
        'FTMP_FILE'        => '/var/log/btmp',
        'GID_MAX'          => '60000',
        'GID_MIN'          => '1000',
        'HUSHLOGIN_FILE'   => '.hushlogin',
        'KILLCHAR'         => '025',
        'LOG_OK_LOGINS'    => 'no',
        'LOG_UNKFAIL_ENAB' => 'no',
        'LOGIN_RETRIES'    => '5',
        'LOGIN_TIMEOUT'    => '60',
        'MAIL_DIR'         => '/var/mail',
        'MD5_CRYPT_ENAB'   => 'no',
        'PASS_MAX_DAYS'    => '99999',
        'PASS_MIN_DAYS'    => '0',
        'PASS_WARN_AGE'    => '7',
        'SU_NAME'          => 'su',
        'SYSLOG_SG_ENAB'   => 'yes',
        'SYSLOG_SU_ENAB'   => 'yes',
        'TTYGROUP'         => 'tty',
        'TTYPERM'          => '0600',
        'UID_MAX'          => '60000',
        'UID_MIN'          => '1000',
        'UMASK'            => '022',
        'USERGROUPS_ENAB'  => 'yes',
      }
    }
    'Gentoo': {
      $default_options = {
        'FAIL_DELAY'       => '3',
        'LOG_UNKFAIL_ENAB' => 'no',
        'LOG_OK_LOGINS'    => 'no',
        'SYSLOG_SU_ENAB'   => 'yes',
        'SYSLOG_SG_ENAB'   => 'yes',
        'CONSOLE'          => '/etc/securetty',
        'SU_NAME'          => 'su',
        'MAIL_DIR'         => '/var/spool/mail',
        'HUSHLOGIN_FILE'   => '.hushlogin',
        'ENV_SUPATH'       => 'PATH=/sbin:/bin:/usr/sbin:/usr/bin',
        'ENV_PATH'         => 'PATH=/bin:/usr/bin',
        'TTYGROUP'         => 'tty',
        'TTYPERM'          => '0600',
        'ERASECHAR'        => '0177',
        'KILLCHAR'         => '025',
        'UMASK'            => '022',
        'PASS_MAX_DAYS'    => '99999',
        'PASS_MIN_DAYS'    => '0',
        'PASS_WARN_AGE'    => '7',
        'UID_MIN'          => '1000',
        'UID_MAX'          => '60000',
        'SYS_UID_MIN'      => '101',
        'SYS_UID_MAX'      => '999',
        'GID_MIN'          => '1000',
        'GID_MAX'          => '60000',
        'SYS_GID_MIN'      => '101',
        'SYS_GID_MAX'      => '999',
        'LOGIN_RETRIES'    => '5',
        'LOGIN_TIMEOUT'    => '60',
        'CHFN_RESTRICT'    => 'rwh',
        'DEFAULT_HOME'     => 'yes',
        'USERGROUPS_ENAB'  => 'yes',
      }
    }
    default: {
      fail("${facts['os']['family']} not supported by ${module_name}")
    }
  }

}
