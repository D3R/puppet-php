define php::utility::wget(
  $download_url = undef,
  $destination  = undef,
  $package_name = 'wget',
  $binary       = '/usr/bin/wget',
){
    # package { "wget_package_$rand":
    #     ensure => present,
    #     name   => $package_name,
    # }

    exec { "wget_$name":
        command => "$binary -q -O $destination $download_url",
        creates => $destination,
    }
}
