define php::utility::wget(
  $download_url = undef,
  $destination  = undef,
  $package_name = 'wget',
  $binary       = '/usr/bin/wget',
){
    package { $package_name:
        ensure => present,
    }

    exec { "wget_$name":
        command => "$binary -q -O $destination $download_url",
        creates => $download_destination,
    }
}
