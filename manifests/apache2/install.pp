class php::apache2::install {
  package { $php::params::apache_package_name:
    ensure  => $php::params::ensure,
    notify  => Service[$php::params::apache_service_name],
  }
}
