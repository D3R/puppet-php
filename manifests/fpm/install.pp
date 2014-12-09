class php::fpm::install {
  package { $php::params::fpm_package_name:
    ensure  => $php::params::ensure,
    require => Class['php'],
  }
}
