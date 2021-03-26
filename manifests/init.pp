#
class login_defs (
  Pattern[/^\d{3,4}$/] $mode = '0644',
  String $owner = 'root',
  String $group = '0',
  Hash $options = {},
) inherits login_defs::params {

  $merged_options = merge($login_defs::params::default_options, $options)

  file { '/etc/login.defs':
    ensure  => 'file',
    owner   => $owner,
    group   => $group,
    mode    => $mode,
    content => template('login_defs/login.defs.erb'),
  }

}
