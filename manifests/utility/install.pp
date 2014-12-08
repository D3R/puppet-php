define php::utility::install(
    $ensure             = 'present',
    $destination        = undef,
    $download_url       = undef,
    $download_method    = 'wget',
    $mode               = '0755',
    $owner              = 'root',
    $group              = 'root',
){
    validate_string($ensure)
    validate_string($destination)
    validate_string($download_url)
    validate_string($download_method)
    validate_string($mode)
    validate_string($owner)
    validate_string($group)

    if 'absent' == $ensure {
        file { $destination:
            ensure  => 'absent',
        }
    } else {
        php::utility::wget { $destination:
            destination  => $destination,
            download_url => $download_url,
            before       => File[$destination],
        }

        file { $destination:
            ensure  => 'present',
            mode    => $mode,
            require => Php::Utility::Wget[$destination],
        }
    }

}
